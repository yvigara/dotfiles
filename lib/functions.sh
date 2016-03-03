#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

brew_cask_install() {
  if brew_cask_is_installed "$1"; then
      brew install "Caskroom/cask/$1"
  else
    fancy_echo "Installing %s ..." "$1"
    brew cask install "$@"
  fi
}

brew_cask_is_installed() {
  brew cask list -1 | grep -Fqx "$1"
}

brew_tap() {
  brew tap "$1" 2> /dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_launchctl_restart() {
  local name="$(brew_expand_alias "$1")"
  local domain="homebrew.mxcl.$name"
  local plist="$domain.plist"

  fancy_echo "Restarting %s ..." "$1"
  mkdir -p "$HOME/Library/LaunchAgents"
  ln -sfv "/usr/local/opt/$name/$plist" "$HOME/Library/LaunchAgents"

  if launchctl list | grep -Fq "$domain"; then
    launchctl unload "$HOME/Library/LaunchAgents/$plist" >/dev/null
  fi
  launchctl load "$HOME/Library/LaunchAgents/$plist" >/dev/null
}


# Checkout the repo at the given revision
# arguments are:
# 1 directory to check out
# 2 revision to check out (optional - will default to origin/master)
# Note well the following:
# 1. What it currently has in the repo is irrelevent. All references are forced to update.
# This is because unfortunately we DO have to cope with forced pushes.
# Part of this is if someone deletes and recreates a repo, then you will have a different history...
# 2. 'checkout' is done by doing a 'reset' to the revision, rather than a checkout.
# As we don't care about the local history, only the history we are pulling in this makes more sense.
git_clone_or_update() {
  (( $# < 2 )) && {
    printf >&2 'wrong # args: should be: git_clone_or_update path url [revision]\n'
    return 2
  }
  local repo_path=$1
  local repo_url=$2
  local repo_revision="origin/master"

  if [ "$#" == 3 ]; then
    repo_revision=$3
  fi
  #look up the remote using 'git_remote'
  if [ -d $repo_path ] && [ -d $repo_path/.git ]; then
    pushd $repo_path >/dev/null
    fancy_echo "Updating: %s"  "${repo_path}"
    #Force the fetch of all references.
    #This is to handle people recreating repos, and moving tags, etc.
    git fetch --force --all 2>&1 > /dev/null
    if [ $? != 0 ]; then
      fancy_echo "ERROR updating: %s"  "${repo_path}"
      popd >/dev/null
      return
    fi
    popd >/dev/null
  else
    fancy_echo "Cloning: %s from %s" "${repo_path}" "${repo_url}"
    rm -fr $repo_path 2>&1
    git clone $repo_url $repo_path 2>&1 > /dev/null
    if [ $? != 0 ]; then
      fancy_echo "ERROR cloning: %s from %s" "${repo_path}" "${repo_url}"
      return
    fi
  fi
  if [ -d $repo_path/.git ]; then
    pushd $repo_path >/dev/null
    # Force a reset here, instead of performing a checkout.
    git reset $repo_revision --hard 2>&1 > /dev/null
    if [ $? != 0 ]; then
      fancy_echo "ERROR updating: %s to %s" "${repo_path}" "${repo_revision}"
    fi
    popd >/dev/null
  fi
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    fancy_echo "Updating %s ..." "$1"
    gem update "$@"
  else
    fancy_echo "Installing %s ..." "$1"
    gem install "$@"
    rbenv rehash
  fi
}

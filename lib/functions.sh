#!/bin/bash

end="\033[0m"
black="\033[0;30m"
blackb="\033[1;30m"
white="\033[0;37m"
whiteb="\033[1;37m"
red="\033[0;31m"
redb="\033[1;31m"
green="\033[0;32m"
greenb="\033[1;32m"
yellow="\033[0;33m"
yellowb="\033[1;33m"
blue="\033[0;34m"
blueb="\033[1;34m"
purple="\033[0;35m"
purpleb="\033[1;35m"
lightblue="\033[0;36m"
lightblueb="\033[1;36m"

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "${blueb}*** ${whiteb}$fmt${blueb} ***${end}\n" "$@"
}

function msg_run() {
  printf "${purpleb}➜${end} %b " "${1}"
}

function msg_done() {
  printf "${yellow}➜${end} %b ${greenb}✔${end}\n" "${1}"
}

function msg_nested_run() {
  printf "${purpleb}➜${end} %b " "${1}"
}

function msg_nested_done() {
  printf "${yellow}➜${end} %b ${greenb}✔${end}\n" "${1}"
}

function msg_ok() {
  printf "${greenb}✔${end}\n"
}

function msg_fail() {
  printf "${redb}✘${end}\n"
}

brew_cask_is_installed() {
  brew cask list -1 | grep -Fqx "$1"
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
    msg_run "Updating: ${repo_path}"
    #Force the fetch of all references.
    #This is to handle people recreating repos, and moving tags, etc.
    git fetch --force --all 2>&1 > /dev/null
    if [ $? != 0 ]; then
      msg_fail
      popd >/dev/null
      return
    fi
    popd >/dev/null
  else
    msg_run "Cloning: ${repo_path} from ${repo_url}"
    rm -fr $repo_path 2>&1
    git clone $repo_url $repo_path 2>&1 > /dev/null
    if [ $? != 0 ]; then
      msg_fail
      return
    fi
  fi
  if [ -d $repo_path/.git ]; then
    pushd $repo_path >/dev/null
    # Force a reset here, instead of performing a checkout.
    git reset $repo_revision --hard 2>&1 > /dev/null
    if [ $? != 0 ]; then
      msg_fail
    fi
    popd >/dev/null
  fi
  msg_ok
}

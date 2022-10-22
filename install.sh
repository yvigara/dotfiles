#!/bin/bash

set -e
OS="$(uname)"

if [[ "${OS}" == "Linux" ]]
then
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  if [[ -x "$(command -v apt-get)" ]]
  then
    sudo apt-get install build-essential procps curl file git -y
  fi
elif [[ "${OS}" == "Darwin" ]]
then
  UNAME_MACHINE="$(/usr/bin/uname -m)"

  if [[ "${UNAME_MACHINE}" == "arm64" ]]
  then
    # On ARM macOS, this script installs to /opt/homebrew only
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    # On Intel macOS, this script installs to /usr/local only
    HOMEBREW_PREFIX="/usr/local"
  fi

  # Close any open System Preferences panes, to prevent them from overriding
  # settings we’re about to change
  osascript -e 'tell application "System Preferences" to quit'
  if !( pkgutil --pkg-info=com.apple.pkg.CLTools_Executables > /dev/null 2>&1 )
  then
    xcode-select --install > /dev/null 2>&1
    sudo xcodebuild -license accept > /dev/null 2>&1
  fi
  softwareupdate -i -a > /dev/null 2>&1
fi
export PATH="${HOMEBREW_PREFIX}/bin:$PATH"

if !( command -v brew >/dev/null 2>&1 )
then
  export NONINTERACTIVE=1
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

eval "$(brew shellenv)"
brew install --ignore-dependencies chezmoi
chezmoi init --apply --verbose https://github.com/yvigara/dotfiles.git

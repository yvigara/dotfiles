#!/bin/bash

export BASEDIR=$(dirname $0)
export LIB_FUNCTIONS="${BASEDIR}/functions.sh"
source $LIB_FUNCTIONS

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

setup_neoivm_pyenv() {
  (( $# < 2 )) && {
    printf >&2 'wrong # args: should be: setup_neoivm_pyenv virtualenv_name python_version\n'
    return 2
  }
  local virtualenv_name=$1
  local python_version=$2
  neovim_versions=$(pyenv versions | grep ${virtualenv_name})
  if [ ! -z "${neovim_versions}" ]; then
    fancy_echo "Cleanup old $virtualenv_name virtualenv"
    for v in $neovim_versions; do
      if ! [[ $v =~ ^($virtualenv_name|$PYTHON2_VERSION) ]]; then
        pyenv uninstall -f $v
      fi
    done
  fi
  fancy_echo "Create $virtualenv_name virtualenv with python $python_version"
  pyenv virtualenv -f $python_version $virtualenv_name
  fancy_echo "Install dependencies in $virtualenv_name"
  pyenv activate $virtualenv_name
  pip install --quiet --upgrade pip pynvim 'python-language-server[all]' yapf jedi flake8 pylint
  pyenv deactivate
}

fancy_echo "Setup Neovim NPM dependencies"
npm install --silent -g yaml-language-server neovim

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Create Neovim Virtual Env
fancy_echo "Setup python2 venv for Neovim"
setup_neoivm_pyenv neovim2 $PYTHON2_VERSION

fancy_echo "Setup python3 venv for Neovim"
setup_neoivm_pyenv neovim3 $PYTHON3_VERSION

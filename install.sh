#!/usr/bin/env bash

set -e

cd `dirname $0`
export DOTFILES=`pwd`

source $DOTFILES/install_functions.sh
 
# git
link_with_backup .gitconfig

# ruby
link_with_backup .irbrc
link_with_backup .railsrc

# zsh
link_with_backup .zsh
link_with_backup .zshrc    

# emacs
link_with_backup .emacs.d
link_with_backup .emacs
install_elpa
install_org_mode
install solarized

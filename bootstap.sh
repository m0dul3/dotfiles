#!/usr/bin/env bash

###########################
# This script installs the dotfiles and runs all other system configuration scripts
# version 1.0 by @author Adam Eivy
###########################

# include my library helpers for colorized echo and require_brew, etc
source ./lib.sh

# make a backup directory for overwritten dotfiles
if [[ ! -e ~/.dotfiles_backup ]]; then
    mkdir ~/.dotfiles_backup
fi

pushd ~ > /dev/null 2>&1

bot "creating symlinks for project dotfiles..."

symlinkifne .gitconfig
symlinkifne .gitignore
symlinkifne .git_template
symlinkifne .gitshots
symlinkifne .vim
symlinkifne .vimrc

popd > /dev/null 2>&1

bot "Woot! All done."

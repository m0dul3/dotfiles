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

function symlinkifne {
    running "$1"

    if [[ -e $1 ]]; then
        # file exists
        if [[ -L $1 ]]; then
            # it's already a simlink (could have come from this project)
            echo -en '\tsimlink exists, skipped\t';ok
            return
        fi
        # backup file does not exist yet
        if [[ ! -e ~/.dotfiles_backup/$1 ]];then
            mv $1 ~/.dotfiles_backup/
            echo -en 'backed up saved...';
        fi
    fi
    # create the link
    ln -s ~/.dotfiles/$1 $1
    echo -en 'linked';ok
}

bot "creating symlinks for project dotfiles..."

symlinkifne .crontab
symlinkifne .gitconfig
symlinkifne .gitignore
symlinkifne .profile
symlinkifne .screenrc
symlinkifne .shellaliases
symlinkifne .shellfn
symlinkifne .shellpaths
symlinkifne .shellvars
symlinkifne .vim
symlinkifne .vimrc

popd > /dev/null 2>&1

./osx.sh

bot "Woot! All done."

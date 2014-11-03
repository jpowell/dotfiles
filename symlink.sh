#!/bin/bash

dir=~/dotfiles                    # dotfiles directory
backup=~/dotfiles.bak             # old dotfiles backup directory
files="bashrc vimrc vim zshrc oh-my-zsh "

echo -n "Creating $backup for backup of any existing dotfiles in ~ and switching into it"
mkdir -p $backup
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $backup"
    mv ~/.$file $backup
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

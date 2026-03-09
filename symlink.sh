#!/bin/bash

dir=~/dotfiles                    # dotfiles directory
backup=~/dotfiles.bak             # old dotfiles backup directory
files="vimrc vim bashrc zshrc oh-my-zsh gitconfig agrc"

# Neovim config (goes in ~/.config/nvim, not ~/.<name>)
mkdir -p ~/.config
if [ ! -L ~/.config/nvim ]; then
  if [ -e ~/.config/nvim ]; then
    echo "Backing up existing ~/.config/nvim to $backup"
    mv ~/.config/nvim "$backup/"
  fi
  echo "Creating symlink for nvim config"
  ln -s "$dir/nvim" ~/.config/nvim
else
  echo "~/.config/nvim is already a symlink. Keeping it."
fi

echo "Creating $backup for backup of any existing dotfiles in ~ and switching into it"
mkdir -p $backup
cd $dir
echo "done"

# move any existing dotfiles in ~ to dotfiles.bak directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
  filepath=~/.$file

  if [ -L $filepath ]; then
    echo "$filepath is a symlink. Keeping it."
    continue
  fi

  if [ ! -e $filepath]; then
    echo "$filepath does not exist"
  else
    echo "Moving $filepath to $backup"
    mv $filepath $backup
  fi

  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file $filepath
done

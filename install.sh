#!/bin/bash -ux

DOT_DIR="$HOME/dotfiles"

echo "start git clone..."
if [ ! -d ${DOT_DIR} ]; then
  git clone https://github.com/netooo/dotfiles.git ${DOT_DIR}  
else
  echo "dotfiles already exists"
fi

echo "start symbolic link..."
cd $HOME
for file in ".zsh/" ".zshenv" ".zshrc" ".zshrc.alias" ".zshrc.tracking"
do
  [ ! -e $file ] && ln -s ${DOT_DIR}/$file .
done

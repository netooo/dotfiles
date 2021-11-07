#!/bin/bash -ux

DOT_DIR="$HOME/dotfiles"

echo "start clone..."
if [ ! -d ${DOT_DIR} ]; then
  git clone https://github.com/netooo/dotfiles.git ${DOT_DIR}  
else
  echo "dotfiles already exists"
fi

echo "start setup..."
cd $HOME
for file in .zshenv .zshrc .zshrc.alias .zshrc.cd .zshrc.tracking do
	[ ! -e $file ] && ln -s ${DOT_DIR}/$file .
done

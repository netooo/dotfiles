#!/bin/bash

ZSHPATH=/usr/local/bin/zsh

has() {
    type "$1" > /dev/null 2>&1
}

# zsh
if has "zsh"; then
  echo 'zsh already installed'
else
  echo 'install zsh shell'
  brew install zsh
fi

if [ $(echo "$SHELL") == $ZSHPATH ]; then
  echo 'default shell already zsh'
else
  echo 'set default shell to zsh'
  where zsh
  sudo sh -c "echo '$ZSHPATH' >> /etc/shells"
  chsh -s $ZSHPATH
  echo 'open the new tab'
fi

# fzf
if has "fzf"; then
  echo 'fzf already installed'
else
  echo 'install fzf'
  brew install fzf
fi

# zoxide
if has "zoxide"; then
  echo 'zoxide already installed'
else
  echo 'install zoxide'
  brew install zoxide
  rm ~/.zcompdump*; compinit
fi

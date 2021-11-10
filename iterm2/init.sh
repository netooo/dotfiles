#!/bin/bash +ux

DOT_DIR="$HOME/dotfiles"
PLIST_FILE="com.googlecode.iterm2.plist"
CONFIG_PATH="$HOME/Library/Preferences"

set -ue

cd ${CONFIG_PATH}

[ ! -e ${PLIST_FILE} ] && ln -s ${DOT_DIR}/${PLIST_FILE} .


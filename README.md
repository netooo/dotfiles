# dotfiles
## Requirements
Set zsh as your login shell:
```
chsh -s $(which zsh)
```

## Install
Xcode:
```
https://developer.apple.com/jp/xcode/resources/
```

brew:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Setup dotfiles:
```
curl -L raw.github.com/netooo/dotfiles/main/setup_shell.sh | zsh
```

Install dotfiles:
```
curl -L raw.github.com/netooo/dotfiles/main/install.sh | zsh
```

## Settings
neovim:
```
ln -s ~/dotfiles/nvim/ ~/.config/nvim/
```

keymap for jetbrains:
```
cd ~/Library/Application Support/Jetbrains/${tool}/jba_config/mac.keymaps/
ln -s ~/dotfiles/jetbrains/keymap.xml ./keymap.xml
vim ./../mac.keymap.xml(change reference file)
```


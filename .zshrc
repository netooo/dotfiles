##############################################
#################### 設定 ####################
# 環境変数
export LANG=ja_JP.UTF-8
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
## fzf
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
## mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
## anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
## go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"
export GO111MODULE=on
export PATH="$GOROOT/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
## zoxide
eval "$(zoxide init zsh)"
## bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# 単語の区切り文字を指定
autoload -Uz select-word-style
select-word-style default

# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 色を使用可能に
autoload -Uz colors
colors

# 履歴の設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

##############################################
################# プロンプト #################
# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示
setopt PROMPT_SUBST ; PS1='%F{green}%n %F{white}in %F{cyan}%~%f %F{white}on %F{red}$(__git_ps1 "%s")%f [$(tracking_current)]
%F{yellow}\$ %f'

function precmd() {
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

## iTerm
export CLICOLOR=1
export TERM=xterm-256color

##############################################
#################### 補完 ####################
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

##############################################
################# オプション #################
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

##############################################
################ キーバインド ################
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

##############################################
################# エイリアス #################
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias

##############################################
#################### fzf ####################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##############################################
################ TimeTracking ################
[ -f ~/.zshrc.tracking ] && source ~/.zshrc.tracking


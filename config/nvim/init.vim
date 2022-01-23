let mapleader = "\<Space>"

set wrapscan
set number

" タブ欄
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set shiftround

" 検索するときに大文字小文字を区別しない
set ignorecase

" 検索時に大文字を含んでいたら大/小を区別
set smartcase

" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch

" 検索対象をハイライト
set hlsearch

" 対応する括弧やブレースを表示
set showmatch matchtime=1

" メッセージ表示欄を2行確保
set cmdheight=2

" ステータス行を常に表示
set laststatus=2

" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd

" 省略されずに表示
set display=lastline

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~

" 対応する括弧を強調表示
set showmatch

" クリップボードにコピー
nnoremap <S-y> "*yy
vnoremap <S-y> "*yy

" ファイルのスプリット
nnoremap <silent> <S-j> :split<CR>
nnoremap <silent> <S-l> :vsplit<CR>
nnoremap <Bar> $:let pos = getpos(".")<CR>:call setpos('.',pos)<CR>

" ウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-w> <C-w>w

" ノーマルモードへの移行と保存
inoremap <silent> jj <ESC>:<C-u>w<CR>

" 行の最初と最後に移動
noremap <S-h>   ^
noremap <S-l>   $

" 次、前の空白行に移動
noremap <S-j>   }
noremap <S-k>   {

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" NERDTree
map <S-n> <plug>NERDTreeTabsToggle<CR>

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


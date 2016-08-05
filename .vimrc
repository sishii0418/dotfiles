" --------------------- "
" vim settings ~/.vimrc "
" --------------------- "

" インデント
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab

" Makefile ではインデントを空白にしない
let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif

" 行番号
set number

" タイトルを表示
set title

" ルーラーを表示
set ruler

" 入力中のコマンドを表示
set showcmd

syntax on

" vi 互換を使わない
set nocompatible

" スクロール
set scrolloff=5

" backspace
set backspace=indent,eol,start

" clipboard
set clipboard+=unnamed
set clipboard=unnamed

" encoding
set encoding=utf8
set fileencoding=utf-8

" match
set showmatch
set matchtime=3

" 折り返し
set wrap

" 補完時
set infercase
set ignorecase
set smartcase

" 検索結果をハイライト
set hlsearch

" .md ファイルをハイライト適用
au BufRead,BufNewFile *.md set filetype=markdown

" jj で挿入モードから抜ける
inoremap jj <Esc>
inoremap JJ <Esc>

" 挿入モードで移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-0> <Home>
inoremap <C-\> <End>

" キーバインド
noremap ; :
noremap <C-u> :make<Enter>
noremap <S-h> ^
noremap <S-l> $


" --------- "
" NeoBundle "
" --------- "

" install
" curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
" sh ./install.sh
" rm -rf install.sh



if 0 | endif

	filetype off

if has('vim_starting')
	if &compatible
		set nocompatible
	endif

	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
	\'build' : {
		\'unix' : 'make -f make_unix.mak',
	\},
\}

" -------------------------------------

NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'itchyny/lightline.vim'

" -------------------------------------

call neobundle#end()

filetype plugin indent on
filetype indent on
syntax on

NeoBundleCheck

" for lightline.vim
set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'solarized'
	\}

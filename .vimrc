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


" -------- "
" dein.vim "
" -------- "

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('plasticboy/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('itchyny/lightline.vim')

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" lightline.vim 用
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'solarized'
    \ }

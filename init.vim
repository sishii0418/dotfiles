" ======================= "
" Neovim settings         "
" ~/.config/nvim/init.vim "
" ======================= "

" NOTES!!

" --雑多--
" {{{
" indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set expandtab

" for VimFiler
set modifiable
set write

" conceal を無効化
let g:markdown_syntax_conceal = 0
let g:tex_conceal=''
let g:haskell_conceal=0

" Makefile ではインデントを空白にしない
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

" markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Folding
set foldmethod=marker

" 行番号
set number

" タイトルを表示
set title

" ルーラーを表示
set ruler

" 入力中のコマンドを表示
set showcmd

" 色付け
syntax on

" vi 互換を使わない
set nocompatible

" スクロール
set scrolloff=5

" backspace
set backspace=indent,eol,start

" encoding
set fileencoding=utf-8

" match
set showmatch
set matchtime=3

" mouse-mode
set mouse=a

" 折り返し
set wrap

" 補完時
set infercase
set ignorecase
set smartcase

" 検索結果をハイライト
set hlsearch

" インクリメンタルサーチ
set incsearch

" 補完強化
set wildmenu

" .md ファイルをハイライト適用
au BufRead,BufNewFile *.md set filetype=markdown

" stack のパス
let $PATH = $PATH . ':' . expand('~/.local/bin')
" }}}

" --Keymaps--
" {{{

" 誤使用防止
nnoremap q <Nop>
nnoremap Q q

" open new terminal-tab
nnoremap <C-t> :tabnew<CR>:terminal<CR>

" escape insert/terminal mode
inoremap jj <Esc><Right>
tnoremap <Esc> <C-\><C-n>

" 挿入モードで移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-0> <Home>
inoremap <C-\> <End>

" " insert space
" nnoremap <C-s> i<Esc><Right>

" 便利
noremap ; :
noremap <S-h> ^
noremap <S-l> $

" Tab で対応の括弧にジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" ハイライト解除
nnoremap <F3> :noh<CR>

" Haskell で型を表示
nnoremap \t :GhcModType<CR>
" }}}

" --dein.vim--
" {{{

" プラグインのインストール場所
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

call dein#begin(expand('~/.cache/dein'))

" パッケージ管理
call dein#add('Shougo/dein.vim')
" vimproc
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" 補完
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neoinclude.vim')
" ウィンドウサイズ変更
call dein#add('simeji/winresizer')
" Colorsheme
call dein#add('altercation/vim-colors-solarized')
" Unite.vim
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/vimfiler.vim')
" Terminal
call dein#add('kassio/neoterm')
" Git
call dein#add('tpope/vim-fugitive')
" Snipet
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
" Markdown
call dein#add('tpope/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
" comment
call dein#add('tyru/caw.vim')
" fix whitespace
call dein#add('bronson/vim-trailing-whitespace')
" Interfaces
call dein#add('itchyny/lightline.vim')
" Indent を可視化
call dein#add('Yggdroot/indentLine')
" 変更行を可視化
call dein#add('airblade/vim-gitgutter')
" Quickrun
call dein#add('thinca/vim-quickrun')
" TeX
call dein#add('lervag/vimtex')
" Haskell
call dein#add('kana/vim-filetype-haskell')
call dein#add('eagletmt/ghcmod-vim')
call dein#add('ujihisa/neco-ghc')
call dein#add('dag/vim2hs')
call dein#add('thinca/vim-ref')
call dein#add('ujihisa/ref-hoogle')
" Syntax-check
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
" エラー箇所をハイライト
call dein#add('jceb/vim-hier')

call dein#end()

" 自動インストール
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
" }}}

" --deoplete--
" {{{
" Use deoplete
let g:deoplete#enable_at_startup = 1
" }}}

" --Solarized--
" {{{
syntax enable
set background=light
colorscheme solarized
let g:solarized_termcolors=256
" }}}

" --Snippet--
" {{{
" Plugin key-mappings
imap <C-,>     <Plug>(neosnippet_expand_or_jump)
smap <C-,>     <Plug>(neosnippet_expand_or_jump)
xmap <C-,>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}

" --lightline.vim--
" {{{
set laststatus=2
let g:lightline = {
\   'colorscheme': 'wombat',
\}
let g:lightline.component = {
    \ 'lineinfo': '%3l[%L]:%-2v'}
" }}}

" --indentLine--
" {{{
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'
" }}}

" --quickrun.vim--
" {{{
let g:quickrun_config = {
\ "_" :{
\   "runner" : "vimproc",
\   "runner/vimproc/updatetime" : 60,
\   "outputter/buffer/split" : ":botright",
\   "outputter/buffer/close_on_empty" : 1
\ },
\ "tex" : {
\   'command' : 'latexmk',
\   "outputter/buffer/split" : ":botright 8sp",
\   'outputter/error/error' : 'quickfix',
\   'hook/cd/directory': '%S:h',
\   'exec': '%c %s'
\ },
\ "watchdogs_checker/_" : {
\   "hook/copen/enable_exist_data" : 1,
\ },
\ "watchdogs_checker/ghc-mod" : {
\   "command" : "ghc-mod",
\ },
\ "haskell/watchdogs_checker" : {
\   "type" : "watchdogs_checker/ghc-mod"
\ },
\}
" vim-watchdogs を呼び出し
call watchdogs#setup(g:quickrun_config)
" \   "exec" : '%c %o --hlintOpt="--language=XmlSyntax" check %s:p',
" }}}

" --vim-watchdogs--
"{{{
" 関数に設定を渡す
call watchdogs#setup(g:quickrun_config)
" 書込後にシンタックスチェックする
let g:watchdogs_check_BufWritePost_enable = 1
"}}}

" --unite.vim--
" {{{

" insert モードで開始
let g:unite_enable_start_insert=1
" enable history/yank function
let g:unite_source_history_yank_enable = 1
" Prefix key
nmap <Space> [unite]

" buffer
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" show current directory
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" registers
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
" histories/yanks
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
" 最近開いたファイル
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" outline
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
" bookmark
nnoremap <silent> [unite]k :<C-u>Unite bookmark<CR>
" add bookmark
nnoremap <silent> [unite]d :<C-u>UniteBookmarkAdd<CR>
" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> [unite]f :VimFiler<CR>

" unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
	" insert モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
endfunction
" }}}

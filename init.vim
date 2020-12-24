" ======================= "
" Neovim settings         "
" ~/.config/nvim/init.vim "
" ======================= "

" NOTES!!
" WSLで使うためにSolarized無効化

" --雑多--
" {{{
"
let g:python3_host_prog= "/usr/bin/python3"


set foldmethod=marker             " Folding
set number                        " 行番号
set title                         " タイトルを表示
set ruler                         " ルーラーを表示
set showcmd                       " 入力中のコマンドを表示
syntax on                         " シンタックス
set nocompatible                  " vi互換を使わない
set scrolloff=5                   " スクロール
set backspace=indent,eol,start
set fileencoding=utf-8            " encoding
set mouse=a                       " マウスモード
set wrap                          " 折り返し
set ambiwidth=double
set hlsearch                      " 検索結果をハイライト
set incsearch                     " インクリメンタルサーチ
set wildmenu                      " 補完メニュー
set keywordprg=:help              " S-k でヘルプを開く
set helplang=ja                   " 日本語のヘルプを使用

hi MatchParen ctermfg=yellow ctermbg=green      " 括弧の色

" indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set expandtab

" Golang
set rtp+=~/go/src/github.com/nsf/gocode/nvim/

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

" match
set showmatch
set matchtime=3
" 自動でコメントを挿入しない
setlocal formatoptions-=r formatoptions-=o

" 補完時
set infercase
set ignorecase
set smartcase

" stack のパス
let $PATH = $PATH . ':' . expand('~/.local/bin')

" ファイルを閉じても undo が有効
if has('president_undo')
  set undodir=~/.cache/undo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif

let g:vimtex_view_general_viewer = 'evince'
" }}}

" --Keymaps--
" {{{

" 誤使用防止
nnoremap q <Nop>
nnoremap Q q

" Tab
nnoremap <C-t> :tabnew<CR>

" escape insert/terminal mode
inoremap jj <Esc><Right>
tnoremap <Esc> <C-\><C-n>

" window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" 挿入モードで移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-0> <Home>
inoremap <C-\> <End>

nnoremap j gj
nnoremap k gk

" " insert space
" nnoremap <C-s> i<Esc><Right>

" 便利
noremap ; :
noremap <S-h> ^
noremap <S-l> $

" Tab で対応の括弧にジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

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

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " toml の場所
  let s:toml = '$XDG_CONFIG_HOME/nvim/dein.toml'
  let s:lazy_toml = '$XDG_CONFIG_HOME/nvim/deinlazy.toml'

  " read toml
  call dein#load_toml(s:toml,{'lazy':0})
  call dein#load_toml(s:lazy_toml,{'lazy':1})

  call dein#end()
  call dein#save_state()
endif

" 自動インストール
if dein#check_install()
  call dein#install()
endif

" 自動で削除
function! s:deinClean()
  if len(dein#check_clean())
    call map(dein#check_clean(), 'delete(v:val, "rf")')
  else
    echo '[ERR] no disabled plugins'
  endif
endfunction
command! DeinClean :call s:deinClean()f

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
set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:solarized_termcolors=256
set background=light
colorscheme solarized
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
\   "outputter/buffer/split" : ":botright 7sp",
\   "outputter/buffer/close_on_empty" : 1
\ },
\ "python" :{
\   'command' : 'python3'
\ },
\ "tex" : {
\   'command' : 'latexmk',
\   "outputter/buffer/split" : ":botright 7sp",
\   'outputter/error/error' : 'quickfix',
\   'hook/cd/directory' : '%S:h',
\   'exec' : '%c %s',
\   'cmdopt': '-pv'
\ },
\ "plaintex" : {
\   'command' : 'latexmk',
\   "outputter/buffer/split" : ":botright 7sp",
\   'outputter/error/error' : 'quickfix',
\   'hook/cd/directory' : '%S:h',
\   'exec' : '%c %s',
\   'cmdopt': '-pv'
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
nnoremap <silent> [unite]f :VimFiler -split -simple -winwidth=30 -no-quit<CR>
" haskellimport
nnoremap <silent> [unite]i :<C-u>Unite haskellimport<CR>
" ag
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
	" insert モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
endfunction
" }}}

" --VimFiler--
" {{{
let g:vimfiler_as_default_explorer = 1 " デフォルトと置き換える
let g:vimfiler_safe_mode_by_default = 1
" }}}

" --Rust--
" {{{
" 自動整形
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$CARGO/bin/rustfmt'

" racer
set hidden
let g:racer_cmd = '$CARGO/bin/racer'
" }}}

" --ag--
" {{{
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
" }}}

" --supertab--
" {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

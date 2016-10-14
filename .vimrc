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

" 色付け
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

" インクリメンタルサーチ
set incsearch

" 補完強化
set wildmenu

" .md ファイルをハイライト適用
au BufRead,BufNewFile *.md set filetype=markdown

" jj で挿入モードから抜ける
inoremap jj <Esc><Right>
inoremap JJ <Esc><Right>

" 挿入モードで移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-0> <Home>
inoremap <C-\> <End>

" 便利
noremap ; :
noremap <S-h> ^
noremap <S-l> $

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" Tab で対応の括弧にジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" make
noremap <C-u> :make<Enter>
noremap <C-e> :make run<Enter>
noremap <C-t> :make clean<Enter>

" Python 用
if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

let b:current_after_syntax = 'python'

let &cpo = s:cpo_save
unlet s:cpo_save

" -------- "
" dein.vim "
" -------- "

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
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
" 補完
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neoinclude.vim')
" Unite.vim
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
" Snipet
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
" Markdown
call dein#add('tpope/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('tyru/caw.vim')
" comment
call dein#add('tomtom/tcomment_vim')
" fix whitespace
call dein#add('bronson/vim-trailing-whitespace')
" Interfaces
call dein#add('itchyny/lightline.vim')
" Indent を可視化
call dein#add('Yggdroot/indentLine')
call dein#add('airblade/vim-gitgutter')
call dein#add('thinca/vim-quickrun')
" TeX
call dein#add('lervag/vimtex')

call dein#end()

" 自動インストール
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on

" neocomplete--------------------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_overwrite_completefunc = 1
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" " For perlomni.vim setting.
" " https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_overwrite_completefunc = 1
" --------------------------------------------------------------------------------------------------

" Snippet
" Plugin key-mappings.
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


" gightline.vim
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" conceal を無効化
let g:markdown_syntax_conceal = 0


" indentLine
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'


" quickrun.vim
let g:quickrun_config = {
\   "_" :{
\         "runner" : "vimproc",
\         "runner/vimproc/updatetime" : 60
\         },
\   "tex" : {
\       'command' : 'latexmk',
\       "outputter/buffer/split" : ":botright 8sp",
\       'outputter/error/error' : 'quickfix',
\       'hook/cd/directory': '%S:h',
\       'exec': '%c %s'
\   },
\}


" tex の conceal を無効化
let g:tex_conceal=''


" unite.vim

" insert モードで開始する
let g:unite_enable_start_insert=1
" enable history/yank function
let g:unite_source_history_yank_enable = 1
" Prefix key
nmap <Space> [unite]

" カレントディレクトリを表示
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" register
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
" unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " ESCでuniteを終了
    nmap <buffer> <ESC> <Plug>(unite_exit)
	" insert モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
endfunction"}}}

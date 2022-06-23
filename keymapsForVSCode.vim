" --Keymaps--

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

" enterで空行挿入
nnoremap <CR> o<ESC>

" 便利
noremap ; :
noremap <S-h> ^
noremap <S-l> $

" Tab で対応の括弧にジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" ハイライト解除
nnoremap <F3> :noh<CR>
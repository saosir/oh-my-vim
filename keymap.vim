
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader>nh :noh<cr>

" Highlight search results
map <silent> <leader>hh :set hlsearch<cr>


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Close the current buffer
"map <leader>c :bd!<cr>
" bug:conflit with window move
"nmap <leader>w :w!<cr>

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vim/basic.vim<cr>
map <silent> <leader>ee :e ~/.vim/basic.vim<cr>
map <silent> <leader>ek :e ~/.vim/keymap.vim<cr>
map <silent> <leader>ep :e ~/.vim/plugins.vim<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>



map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

nmap <C-+> <C-o>
nmap <C-S-+> <C-o>
vmap <C-+> <C-o>
vmap <C-S-+> <C-o>

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


"  insert new line before cursor
imap <C-S-Enter> <Esc>O
" insert new line after cursor
imap <C-Enter> <Esc>o
" delete a wor
imap <C-Delete> <Esc>lcw
" delete a back word
imap <C-backspace> <Esc>caw
" delete a line under cursor
imap <C-S-backspace> <Esc>S
" delete chars after cursor
imap <C-S-k> <Esc>ddi
" delete a char
imap <C-d> <delete>

 " smash escape
inoremap jk <esc>
inoremap kj <esc>


" select a work
imap <c-w> <Esc>viw

imap <C-q> <Esc>
imap <C-a> <Esc>I
imap <C-e> <Esc>A
imap <C-f> <Esc>la
imap <C-b> <Esc>i


imap <C-h> <Esc>i
imap <C-l> <Esc>la
imap <C-j> <Esc>ja
imap <C-k> <Esc>ka

imap <M-l> <Esc>la
imap <M-j> <Esc>ja
imap <M-k> <Esc>ka



" Close all the buffers
map <leader>ba :1,1000 bd!<cr>


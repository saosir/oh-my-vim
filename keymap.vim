
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


"Toggle highlighting on/off, and show current value.
noremap <leader>h :set hlsearch! hlsearch?<CR>

"Highlight all occurrences of the current word
nnoremap <space>w :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>


"Another approach is to use the following to map the Enter key (<CR>) 
"so that pressing Enter toggles highlighting for the current word on and off
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()



" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" bug:conflit with window move
"nmap <leader>w :w!<cr>

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vim/basic.vim<cr>
map <silent> <leader>ee :e ~/.vim/basic.vim<cr>
map <silent> <leader>ek :e ~/.vim/keymap.vim<cr>
map <silent> <leader>ep :e ~/.vim/plugins.vim<cr>
map <silent> <leader>eu :e ~/.vim/user.vim<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>



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


"  insert new prev line under cursor
imap <C-S-Enter> <Esc>O
" insert new next line under cursor
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

" edit move cursor
imap <C-q> <Esc>
imap <C-a> <Esc>I
imap <C-e> <Esc>A
imap <C-f> <Esc>la
imap <C-b> <Esc>i
imap <C-j> <Esc>ja
imap <C-k> <Esc>ka



function! BufPos_ActivateBuffer(num)
    let l:count = 1
    for i in range(1, bufnr("$"))
        if buflisted(i) && getbufvar(i, "&modifiable")
            if l:count == a:num
                exe "buffer " . i
                return
            endif
            let l:count = l:count + 1
        endif
    endfor
    echo "No buffer!"
endfunction

" map switch buffer by <M-num>
function! BufPos_Initialize()
    for i in range(1, 9)
        exe "map <M-" . i . "> :call BufPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <M-0> :call BufPos_ActivateBuffer(10)<CR>"
endfunction
autocmd VimEnter * call BufPos_Initialize()



" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")
   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Close the current buffer
map <leader>c :Bclose<cr>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>



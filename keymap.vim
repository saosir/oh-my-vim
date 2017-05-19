
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


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


"Fast reloading of the .vimrc
if has('win32')
    map <silent> <leader>ss :source ~/_vimrc<cr>
    " Prevent CTRL-F to abort the selection (in visual mode)
    " This is caused by $VIM/_vimrc ':behave mswin' which sets 'keymodel' to
    " include 'stopsel' which means that non-shifted special keys stop selection.
    set keymodel=startsel
else
    map <silent> <leader>ss :source ~/.vimrc<cr>
endif
map <silent> <leader>ee :e ~/.vim/basic.vim<cr>
map <silent> <leader>ek :e ~/.vim/keymap.vim<cr>
map <silent> <leader>ep :e ~/.vim/plugins.vim<cr>
map <silent> <leader>eu :e ~/.vim/my_config.vim<cr>

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


 " smash escape
inoremap jk <esc>
inoremap kj <esc>

imap <C-q> <Esc>
imap <C-f> <Esc>la
imap <C-b> <Esc>i



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

" ASCII boxes tool,
vmap ,mc !boxes -d c-cmt<CR>
nmap ,mc !!boxes -d c-cmt<CR>
vmap ,xc !boxes -d c-cmt -r<CR>
nmap ,xc !!boxes -d c-cmt -r<CR>
autocmd BufEnter * nmap ,mc !!boxes -d pound-cmt<CR>
autocmd BufEnter * vmap ,mc !boxes -d pound-cmt<CR>
autocmd BufEnter * nmap ,xc !!boxes -d pound-cmt -r<CR>
autocmd BufEnter * vmap ,xc !boxes -d pound-cmt -r<CR>
autocmd BufEnter *.html nmap ,mc !!boxes -d html-cmt<CR>
autocmd BufEnter *.html vmap ,mc !boxes -d html-cmt<CR>
autocmd BufEnter *.html nmap ,xc !!boxes -d html-cmt -r<CR>
autocmd BufEnter *.html vmap ,xc !boxes -d html-cmt -r<CR>
autocmd BufEnter *.[chly],*.[pc]c nmap ,mc !!boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap ,mc !boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c nmap ,xc !!boxes -d c-cmt -r<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap ,xc !boxes -d c-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.java nmap ,mc !!boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.java vmap ,mc !boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.java nmap ,xc !!boxes -d java-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.java vmap ,xc !boxes -d java-cmt -r<CR>
autocmd BufEnter .vimrc*,.exrc nmap ,mc !!boxes -d vim-cmt<CR>
autocmd BufEnter .vimrc*,.exrc vmap ,mc !boxes -d vim-cmt<CR>
autocmd BufEnter .vimrc*,.exrc nmap ,xc !!boxes -d vim-cmt -r<CR>
autocmd BufEnter .vimrc*,.exrc vmap ,xc !boxes -d vim-cmt -r<CR>

" Remove White Space
function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\\\@<!\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)
autocmd BufWritePre * FixWhitespace


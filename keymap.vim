
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
map <silent> <leader>em :e ~/.vim/my_config.vim<cr>

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

set pastetoggle=<F5>

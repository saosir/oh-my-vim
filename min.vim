" bundle {{{1 "
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
filetype  indent on     " required!
" }}} bundle "


let g:cache_dir = '~/.vim/.cache'
function! s:get_cache_dir(suffix)
    return resolve(expand(g:cache_dir . '/' . a:suffix))
endfunction



" jistr/vim-nerdtree-tabs {{{ "
Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup=0
" }}} jistr/vim-nerdtree-tabs "


" scrooloose/nerdtree {{{1 "
Plugin 'scrooloose/nerdtree'
"let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.git','\.hg', '.*.pyc', '.*.obj']
let NERDTreeBookmarksFile= s:get_cache_dir('NERDTreeBookmarks')
nnoremap <F2> :NERDTreeToggle<CR>
" }}} scrooloose/nerdtree "


" scrooloose/nerdcommenter {{{1 "
Plugin 'scrooloose/nerdcommenter'
" }}} scrooloose/nerdcommenter "


" tpope/vim-surround {{{1 "
Plugin 'tpope/vim-surround'
" }}} tpope/vim-surround "

" jiangmiao/auto-pairs {{{1 "
Plugin 'jiangmiao/auto-pairs'
" }}} jiangmiao/auto-pairs "

"colorschem scame
if has('gui_running')
    colorschem wombat256
endif

" easymotion/vim-easymotion {{{1 "
Plugin 'easymotion/vim-easymotion'
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-bd-w)
map <space><space> <Plug>(easymotion-s)
map <leader>s <Plug>(easymotion-s2)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
" }}} easymotion/vim-easymotion "


Plugin 'msanders/snipmate.vim'

call vundle#end()            " required
filetype plugin indent on    " required

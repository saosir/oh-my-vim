set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
filetype  indent on     " required!


let g:cache_dir = '~/.vim/.cache'
function! s:get_cache_dir(suffix)
    return resolve(expand(g:cache_dir . '/' . a:suffix))
endfunction

Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup=0

Plugin 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.git','\.hg', '.*.pyc', '.*.obj']
let NERDTreeBookmarksFile= s:get_cache_dir('NERDTreeBookmarks')
nnoremap <F2> :NERDTreeToggle<CR>


Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-scripts/AutoComplPop'

Plugin 'tpope/vim-surround'

Plugin 'jiangmiao/auto-pairs'

if has('gui_running')
    colorschem wombat256
endif

Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-bd-w)
map <space><space> <Plug>(easymotion-s)
map <leader>s <Plug>(easymotion-s2)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)


Plugin 'msanders/snipmate.vim'

call vundle#end()            " required
filetype plugin indent on    " required

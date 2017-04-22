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

Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'gregsexton/gitv'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/DrawIt.git'
Plugin 'junegunn/goyo.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'hotoo/pangu.vim'
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

Plugin 'majutsushi/tagbar'

Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
    set background=dark
    colorscheme solarized
endif
nnoremap cob :set background=<C-R>=&background == 'dark' ? 'light' : 'dark'<CR><CR>


Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup=0


Plugin 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.git','\.hg', '.*.pyc', '.*.obj']
let NERDTreeBookmarksFile= s:get_cache_dir('NERDTreeBookmarks')


Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName='liangsijian'
map <c-d> :Dox<cr>
let g:syntax_extra_cpp='doxygen'
au BufNewFile,BufRead *.doxygen setfiletype doxygen
au Syntax {cpp,c,idl} runtime syntax/doxygen.vim

Plugin 'kien/ctrlp.vim'
nmap \m :CtrlPMRUFiles<cr>
nmap \b :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_cache_dir=s:get_cache_dir('ctrlp')
let g:ctrlp_reuse_window='startify'
let g:ctrlp_extensions=['funky']
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git|hg|svn|idea)$',
\ 'file': '\v\.DS_Store$'
\ }


Plugin 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a  :Tabularize
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1

Plugin 'mhinz/vim-startify'
let g:startify_session_dir = s:get_cache_dir('sessions')
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions = 1

if has('gui_running')
    Plugin 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_auto_colors = 1
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level=1
    let g:indent_guides_guide_size=1
    let g:indent_guides_color_change_percent=3
endif


Plugin 'FooSoft/vim-argwrap'
nnoremap <silent> <leader>a :call argwrap#toggle()<CR>


Plugin 'easymotion/vim-easymotion'
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-bd-w)
map <space><space> <Plug>(easymotion-s)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)



Plugin 'davidhalter/jedi-vim'
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_select_first = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader>p"
let g:jedi#rename_command = "<S-A-r>"


Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <TAB> :bn<CR>
nmap <S-TAB> :bp<CR>
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme="solarized"


call vundle#end()            " required
filetype plugin indent on    " required


nnoremap <F1> :Startify<cr>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :Tagbar<cr>
nnoremap <F4> :Goyo<cr>
nmap <F5> cob " background color switch dark/light



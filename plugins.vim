set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

filetype  indent on     " required!

let g:cache_dir = '~/.vim/.cache'
function! s:get_cache_dir(suffix)
    return resolve(expand(g:cache_dir . '/' . a:suffix))
endfunction

Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/DrawIt.git'
Plugin 'kshenoy/vim-signature'
Plugin 'tpope/vim-repeat'
Plugin 'michaeljsmith/vim-indent-object'

Plugin 'hotoo/pangu.vim'
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()


Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
    colorscheme solarized
endif
set background=dark
nnoremap cob :set background=<C-R>=&background == 'dark' ? 'light' : 'dark'<CR><CR>
nmap <F3> cob " background color switch dark/light


Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup=0


Plugin 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=0
let NERDTreeChDirMode=0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.git','\.hg', '.*.pyc', '.*.obj']
let NERDTreeBookmarksFile= s:get_cache_dir('NERDTreeBookmarks')


Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:syntax_extra_cpp='doxygen'
au BufNewFile,BufRead *.doxygen setfiletype doxygen
au Syntax {cpp,c,idl} runtime syntax/doxygen.vim
nmap <leader>d :Dox<cr>

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


Plugin 'Yggdroot/indentLine'
if has('gui_running')
    Plugin 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_auto_colors = 1
    let g:indent_guides_start_level=1
    let g:indent_guides_guide_size=1
    let g:indent_guides_color_change_percent=3
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indentLine_enabled=0
else
    let g:indentLine_enabled=1
endif

Plugin 'FooSoft/vim-argwrap'
nnoremap <silent> <leader>a :call argwrap#toggle()<CR>


Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1
" Move to line
nmap <leader>s <Plug>(easymotion-overwin-f2)
map <leader>k <Plug>(easymotion-k)
" Search
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map  <space> <Plug>(easymotion-sn)
omap <space> <Plug>(easymotion-tn)


Plugin 'justinmk/vim-sneak'
let g:sneak#label = 1
map <leader><leader>s <Plug>Sneak_s
map <leader><leader>S <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
nmap <leader>1 <Plug>AirlineSelectTab1HG
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

Plugin 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0



call vundle#end()
filetype plugin indent on


nnoremap <F1> :Startify<cr>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F4> :set hlsearch! hlsearch?<CR>


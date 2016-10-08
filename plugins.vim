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


" majutsushi/tagbar {{{1 "
Plugin 'majutsushi/tagbar'
map <F6> TagbarToggle
" }}} majutsushi/tagbar "

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



" vim-scripts/AutoComplPop {{{1 "
Plugin 'vim-scripts/AutoComplPop'
" }}} vim-scripts/AutoComplPop "


" vim-scripts/DoxygenToolkit.vim {{{1 "
Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName='liangsijian'
map <c-d> :Dox<cr>
let g:syntax_extra_cpp='doxygen'
au BufNewFile,BufRead *.doxygen setfiletype doxygen
au Syntax {cpp,c,idl} runtime syntax/doxygen.vim

" }}} vim-scripts/DoxygenToolkit.vim "

" vim-scripts/a.vim {{{1 "
Plugin 'vim-scripts/a.vim'
map <leader>as :AS<cr>
map <leader>av :AV<cr>
map <A-o> :A<cr>
" }}} vim-scripts/a.vim "


" vim-scripts/VOom {{{1 "
Plugin 'vim-scripts/VOoM'
nnoremap <silent> <F3> :VoomToggle<CR>
" }}} vim-scripts/VOom "


" tpope/vim-surround {{{1 "
Plugin 'tpope/vim-surround'
" }}} tpope/vim-surround "



" jiangmiao/auto-pairs {{{1 "
Plugin 'jiangmiao/auto-pairs'
" }}} jiangmiao/auto-pairs "




" kien/ctrlp.vim {{{1 "
Plugin 'kien/ctrlp.vim'
nmap \m :CtrlPMRUFiles<cr>
map <S-A-o> :CtrlPMRUFiles<cr>
map <space>m :CtrlPMRUFiles<cr>
nmap \b :CtrlPBuffer<cr>
map <S-A-b> :CtrlPBuffer<cr>
map <space>b :CtrlPBuffer<cr>
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_max_height=40
let g:ctrlp_show_hidden=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=200
let g:ctrlp_cache_dir=s:get_cache_dir('ctrlp')
let g:ctrlp_reuse_window='startify'
let g:ctrlp_extensions=['funky']
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git|hg|svn|idea)$',
\ 'file': '\v\.DS_Store$'
\ }
" }}} CtrlP "

"colorschem scame
colorschem wombat256



" godlygeek/tabular {{{1 "
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
" }}} godlygeek/tabular "



" mhinz/vim-startify {{{1 "
Plugin 'mhinz/vim-startify'
let g:startify_session_dir = s:get_cache_dir('sessions')
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions = 1
nnoremap <F1> :Startify<cr>
" }}} mhinz/vim-startify "


" nathanaelkane/vim-indent-guides {{{1 "
if has('gui_running')
    Plugin 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_auto_colors = 1
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level=1
    let g:indent_guides_guide_size=1
    let g:indent_guides_color_change_percent=3
    if !has('gui_running')
        let g:indent_guides_auto_colors=0
        function! s:indent_set_console_colors()
            hi IndentGuidesOdd ctermbg=235
            hi IndentGuidesEven ctermbg=236
        endfunction
    autocmd VimEnter,Colorscheme * call s:indent_set_console_colors()
    endif
endif

" }}} nathanaelkane/vim-indent-guides "


" FooSoft/vim-argwrap {{{1 "
Plugin 'FooSoft/vim-argwrap'
nnoremap <silent> <leader>a :call argwrap#toggle()<CR>
" }}} FooSoft/vim-argwrap "




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


" scrooloose/syntastic {{{1 "
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" }}} scrooloose/syntastic "

" klen/python-mode {{{1 "
Plugin 'klen/python-mode'
let g:pymode_folding = 0
let g:pymode_lint_on_write = 0
let g:pymode_run = 1
let g:pymode_rope_lookup_project=0
let g:pymode_rope_regenerate_on_write=0
let g:pymode_rope_goto_definition_bind = '<F12>'
" }}} klen/python-mode "

" honza/vim-snippets {{{1 "
Plugin 'honza/vim-snippets'

" }}} honza/vim-snippets "



if has('unix')
     "Valloric/YouCompleteMe {{{1 "
"    Plugin 'Valloric/YouCompleteMe'
    "let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
    "let g:ycm_confirm_extra_conf=0
    "let g:ycm_key_list_select_completion=[]
    "let g:ycm_key_list_previous_completion=[]
    "let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
    "let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
    "let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
    "let g:ycm_complete_in_comments = 1 " Completion in comments
    "let g:ycm_complete_in_strings = 1 " Completion in string
    "let g:ycm_enable_diagnostic_signs = 0
    "let g:ycm_enable_diagnostic_highlighting = 0
    "let g:clang_library_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
    " }}} Valloric/YouCompleteMe "
endif


" davidhalter/jedi-vim {{{1 "
Plugin 'davidhalter/jedi-vim'
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_select_first = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader>p"
let g:jedi#rename_command = "<S-A-r>"

" }}} davidhalter/jedi-vim "

" bling/vim-airline {{{1 "

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
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
let g:airline_theme="wombat"
" }}} bling/vim-airline "


" terryma/vim-multiple-cursors {{{1 "
Plugin 'terryma/vim-multiple-cursors'
" }}} terryma/vim-multiple-cursors "

" terryma/vim-expand-region {{{1 "
Plugin 'terryma/vim-expand-region'
" }}} vim-expand-region "


" tpope/vim-fugitive {{{1 "
Plugin 'tpope/vim-fugitive'

nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gvdiff<CR>
"nnoremap <leader>gd :Gvdiff
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggc :silent! Ggrep -i<Space>
" for the diffmode
noremap <Leader>du :diffupdate<CR>
if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>
" }}} tpope/vim-fugitive "



" airblade/vim-gitgutter {{{1 "
if !has('win32')
    Plugin 'airblade/vim-gitgutter'
endif
" }}} airblade/vim-gitgutter "


" gregsexton/gitv {{{1 "
Plugin 'gregsexton/gitv'
" }}} gregsexton/gitv "



" mzlogin/vim-markdown-toc{{{1 "
Plugin 'mzlogin/vim-markdown-toc'
" }}}  "

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

call vundle#end()            " required
filetype plugin indent on    " required

" bundle {{{1 "
set nocompatible               " be iMproved
filetype off                   " required!
"set rtp+=~/.vim/
"set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/ultisnips/
call vundle#rc()
" }}} bundle "
filetype  indent on     " required!


" cache dir config {{{ "
let g:cache_dir = '~/.vim/.cache'
function! s:get_cache_dir(suffix)
    return resolve(expand(g:cache_dir . '/' . a:suffix))
endfunction
" }}} cache dir config "


" scrooloose/nerdtree {{{1 "
Bundle 'scrooloose/nerdtree'
"let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.git','\.hg', '.*.pyc', '.*.obj']
let NERDTreeBookmarksFile= s:get_cache_dir('NERDTreeBookmarks')
nnoremap <F2> :NERDTreeToggle<CR>
" }}} scrooloose/nerdtree "

" jistr/vim-nerdtree-tabs {{{1 "
Bundle 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup=0
" }}} jistr/vim-nerdtree-tabs "

" scrooloose/nerdcommenter {{{1 "
Bundle 'scrooloose/nerdcommenter'
" }}} scrooloose/nerdcommenter "



" vim-scripts/AutoComplPop {{{1 "
Bundle 'vim-scripts/AutoComplPop'
" }}} vim-scripts/AutoComplPop "


" vim-scripts/DoxygenToolkit.vim {{{1 "
Bundle 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName='liangsijian'
map <c-d> :Dox<cr>
let g:syntax_extra_cpp='doxygen'
au BufNewFile,BufRead *.doxygen setfiletype doxygen
au Syntax {cpp,c,idl} runtime syntax/doxygen.vim

" }}} vim-scripts/DoxygenToolkit.vim "

" vim-scripts/a.vim {{{1 "
Bundle 'vim-scripts/a.vim'
map <c-tab> :A<cr>
map <leader>as :AS
map <leader>av :AV
map <A-o> :A<cr>
" }}} vim-scripts/a.vim "


" vim-scripts/VOom {{{1 "
Bundle 'vim-scripts/VOoM'
nnoremap <silent> <F3> :VoomToggle<CR>
" }}} vim-scripts/VOom "




" tpope/vim-surround {{{1 "
Bundle 'tpope/vim-surround'

let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" }}} tpope/vim-surround "


" plasticboy/vim-markdown  {{{ "
Bundle "plasticboy/vim-markdown"
let g:vim_markdown_folding_disabled = 1
" }}}  "

" mzlogin/vim-markdown-toc {{{ "
Bundle 'mzlogin/vim-markdown-toc'
"usage:
":GenTocGFM
"Generate table of contents in GFM link style.
":GenTocRedcarpet
"Generate table of contents in Redcarpet link style.
" }}}  "

" tpope/vim-fugitive {{{1 "
Bundle 'tpope/vim-fugitive'

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

" jiangmiao/auto-pairs {{{1 "

Bundle 'jiangmiao/auto-pairs'
" }}} jiangmiao/auto-pairs "

" kien/ctrlp.vim {{{1 "
Bundle 'kien/ctrlp.vim'
nmap \m :CtrlPMRUFiles<cr>
map <S-A-o> :CtrlPMRUFiles<cr>
nmap \b :CtrlPBuffer<cr>
map <S-A-b> :CtrlPBuffer<cr>
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_max_height=40
let g:ctrlp_show_hidden=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=20000
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
Bundle 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
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
Bundle 'mhinz/vim-startify'
let g:startify_session_dir = s:get_cache_dir('sessions')
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions = 1
nnoremap <F1> :Startify<cr>
" }}} mhinz/vim-startify "


" nathanaelkane/vim-indent-guides {{{1 "

Bundle 'nathanaelkane/vim-indent-guides'
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

" }}} nathanaelkane/vim-indent-guides "

" rhysd/clever-f.vim {{{1 "
Bundle 'rhysd/clever-f.vim'
" }}} rhysd/clever-f.vim "


" FooSoft/vim-argwrap {{{1 "
Bundle 'FooSoft/vim-argwrap'
nnoremap <silent> <leader>a :call argwrap#toggle()<CR>
" }}} FooSoft/vim-argwrap "



" bronson/vim-trailing-whitespacee {{{1 "
Bundle 'bronson/vim-trailing-whitespace'
" }}} bronson/vim-trailing-whitespace "

" easymotion/vim-easymotion {{{1 "
Bundle 'easymotion/vim-easymotion'
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-bd-w)
map <leader>s <Plug>(easymotion-s)
map <space><space> <Plug>(easymotion-s)
map <leader>s <Plug>(easymotion-s2)
" JK motions: Line motions
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
" }}} easymotion/vim-easymotion "


" scrooloose/syntastic {{{1 "
Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}} scrooloose/syntastic "

" klen/python-mode {{{1 "
Bundle 'klen/python-mode'
let g:pymode_folding = 0
let g:pymode_lint_on_write = 0
let g:pymode_run = 1
"let g:pymode_run_bind = "<C-S-e>"
let g:pymode_rope_lookup_project=0
let g:pymode_rope_regenerate_on_write=0
let g:pymode_rope_goto_definition_bind = '<F12>'
" }}} klen/python-mode "

" honza/vim-snippets {{{1 "
Bundle 'honza/vim-snippets'

" }}} honza/vim-snippets "

" SirVer/ultisnips {{{1 "
Bundle 'SirVer/ultisnips'
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips/"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" }}} SirVer/ultisnips "

if has('unix')
    " Valloric/YouCompleteMe {{{1 "
    Bundle 'Valloric/YouCompleteMe'
    let g:ycm_global_ycm_extra_conf = '~/workspace/ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf=0
    " it may disable my tab key for ultisnips, so make it empty and
    " I use <C-n> and <C-p> select one Completion
    let g:ycm_key_list_select_completion=[]
    let g:ycm_key_list_previous_completion=[]
    let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
    let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
    let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
    let g:ycm_complete_in_comments = 1 " Completion in comments
    let g:ycm_complete_in_strings = 1 " Completion in string
    let g:ycm_enable_diagnostic_signs = 0
    let g:ycm_enable_diagnostic_highlighting = 0
    " }}} Valloric/YouCompleteMe "
endif


" davidhalter/jedi-vim {{{1 "
Bundle 'davidhalter/jedi-vim'
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

Bundle 'vim-airline/vim-airline'
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
Bundle 'vim-airline/vim-airline-themes'
let g:airline_theme="wombat"
" }}} bling/vim-airline "


" terryma/vim-multiple-cursors {{{1 "
Bundle "terryma/vim-multiple-cursors"
" }}} terryma/vim-multiple-cursors "

" terryma/vim-expand-region {{{1 "
Bundle 'terryma/vim-expand-region'
" }}} vim-expand-region "

" airblade/vim-gitgutter {{{1 "
Bundle 'airblade/vim-gitgutter'
" }}} airblade/vim-gitgutter "


" Shougo/unite.vim {{{1 "
Bundle 'Shougo/unite.vim'
nnoremap <leader>b :Unite buffer<cr>
nnoremap <space>b :Unite file buffer<cr>
" }}} Shougo/unite.vim "

" gregsexton/gitv {{{1 "
Bundle 'gregsexton/gitv'
" }}} gregsexton/gitv "


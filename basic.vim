

" Sets how many lines of history VIM has to remember
set history=700
set nu

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


"I like use [ctrl-c]copy and [ctrl-v] paste
source $VIMRUNTIME/mswin.vim

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" use your mouse,you mayber a windower
set mouse=a

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
"set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase
" Makes search act like search in modern browsers
set incsearch

" hlsearch
set hlsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=1
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Use Unix as the standard file type
set ffs=unix,dos
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=73
" Use spaces instead of tabs
set expandtab
%retab!

set ai "Auto indent
set si "Smart indent
"set wrap "Wrap lines



" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
" Always show the status line
set laststatus=2

" Format the status line

set completeopt=menuone,menu,longest
set nocp



" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guioptions-=m
    if has("win32")
        try
            set guifont=DejaVu_Sans_Mono_for_Powerline:h12, Source_Code_Pro:h12, DejaVu_Sans_Mono:h12
        catch
        endtry
    elseif has("unix")
        try
            set guifont=Source\ Code\ Pro\ 12, Monospace\ 12
        catch
        endtry
    endif
    "au GUIEnter * simalt ~x
    set guitablabel=%M\ %t
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif


set columns=120
set lines=35
set t_Co=256


set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
"if has('win32')
    "set encoding=chinese
    "set fileencodings=utf-8,gb2312,gbk,gb18030,big5
    "set fenc=utf-8
    "set langmenu=zh_CN.GBK
"endif

highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black




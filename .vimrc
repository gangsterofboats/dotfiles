" No Vi mode
set nocompatible
set cpo=""

" Enable filetype plugins
filetype indent plugin on

" Read outside changes
set autoread

" Autocomplete
set wildmenu
set wildmode=list:longest

set ruler
set incsearch
set smartcase
set magic

" No error bells or blinks
set noerrorbells
set novisualbell
set t_vb=

syntax enable

set encoding=utf8
set ff=unix
set ffs=unix,dos,mac

set nobackup
set writebackup
set noswapfile

set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set ai
set si

set laststatus=2
set nu

set gfn=Consolas\ 12
colorscheme moonfly
set lines=30 columns=100

" Move directory to match current file
set browsedir=buffer
set autochdir

" Set title string
set titlestring=%t\ -\ Vim

map Y y$
set backspace=indent,eol,start
set lsp=0
set nolz
set scrolloff=3
set sm
set viminfo+=!
set whichwrap+=<,>,h,l,[,]
set textwidth=80

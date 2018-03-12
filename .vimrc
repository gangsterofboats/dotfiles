" No Vi compatibility (must be set first)
set nocompatible
set cpoptions=""

" Enable syntax highlighting
syntax enable
filetype plugin indent on

" Read outside changes
set autoread

" Enable command-line completion
set wildmenu
set wildmode=list:longest

" Status bar settings 
set laststatus=2
set ruler
set showcmd

" Search settings
set incsearch
set smartcase

" File settings
set encoding=utf8
set fileformat=unix
set fileformats=unix,dos,mac

" Backup file settings
set writebackup
set noswapfile

" Indent settings
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set smartindent

" Set line numbers
set number

" GUI settings
set guifont=Consolas\ 12
colorscheme moonfly
set lines=30 columns=100
set titlestring=%t\ -\ Vim
set linespace=0

" Move directory to match current file
set browsedir=buffer
set autochdir

" Keymaps
map Y y$

" Other settings
set backspace=indent,eol,start
set nolazyredraw
set scrolloff=5
set showmatch
set textwidth=80
set history=1000
packadd! matchit
set hidden
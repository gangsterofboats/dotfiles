""" No Vi compatibility (must be set first)
set nocompatible
set cpoptions=""

""" Packages
call plug#begin(expand('~/.vim/plugged'))

"" Vim-Plug itself
Plug 'junegunn/vim-plug'

"" General packages
Plug 'Alvarocz/vim-fresh'
Plug 'Alvarocz/vim-northpole'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'jceb/vim-orgmode'
Plug 'Raimondi/delimitMate'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'reedes/vim-colors-pencil'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/grep.vim'
Plug 'Yggdroot/indentLine'

"" Language packages

" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'

" go
" Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript
Plug 'pangloss/vim-javascript'

" perl
Plug 'vim-perl/vim-perl'
Plug 'vim-perl/vim-perl6'
Plug 'c9s/perlomni.vim'

" python
Plug 'raimon49/requirements.txt.vim'

" rust
Plug 'rust-lang/rust.vim'

call plug#end()

""" Settings

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

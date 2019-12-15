""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim configuration -- vimrc file                                          ""
"" Copyright (C) 2019 Michael Wiseman                                       ""
""                                                                          ""
"" This program is free software: you can redistribute it and/or modify     ""
"" it under the terms of the GNU Affero General Public License as           ""
"" published by the Free Software Foundation, either version 3 of the       ""
"" License, or (at your option) any later version.                          ""
""                                                                          ""
"" This program is distributed in the hope that it will be useful,          ""
"" but WITHOUT ANY WARRANTY" without even the implied warranty of           ""
"" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            ""
"" GNU Affero General Public License for more details.                      ""
""                                                                          ""
"" You should have received a copy of the GNU Affero General Public License ""
"" along with this program.  If not, see <https://www.gnu.org/licenses/>.   ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" No Vi compatibility (must be set first)
set nocompatible
set cpoptions=""

"""" Packages
call plug#begin(expand('~/.vim/plugged'))

""" Vim-Plug itself
Plug 'junegunn/vim-plug'

""" General packages
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

""" Language packages

""" Elixir
Plug 'carlosgaldino/elixir-snippets'
Plug 'elixir-lang/vim-elixir'

""" HTML
Plug 'gorodinskiy/vim-coloresque'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-haml'

""" Javascript
Plug 'pangloss/vim-javascript'

""" Perl
Plug 'c9s/perlomni.vim'
Plug 'vim-perl/vim-perl'
Plug 'vim-perl/vim-perl6'

""" Python
Plug 'raimon49/requirements.txt.vim'

""" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

"""" Settings

""" Backup file settings
execute 'set backupdir^=' . expand('~/.vim/.backup//')
execute 'set directory^=' . expand('~/.vim/.swp//')
execute 'set undodir^=' . expand('~/.vim/.undo//')
set backup
set undofile
" set writebackup

""" Enable command-line completion
set wildmenu
set wildmode=list:longest,full

""" Enable visual selection using the mouse in terminals
set mouse=a

""" File settings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformat=unix
set fileformats=unix,dos,mac

""" Indent settings
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set tabstop=4

""" Keymaps
let mapleader='\'
map Q gq
map Y y$
inoremap <C-U> <C-G>u<C-U>

""" Move directory to match current file
set autochdir
set browsedir=buffer

""" Read outside changes
set autoread

""" Search settings
set incsearch
set smartcase

""" Set line numbers
set number

""" Status bar settings
set laststatus=2
set ruler
set showcmd

""" Other settings
let c_comment_strings=1
packadd! matchit
set background=dark
set backspace=indent,eol,start
set display=truncate
set formatoptions+=j
set hidden
set history=10000
set nrformats+=alpha
set scrolloff=5
set showmatch
set tabpagemax=50
set textwidth=80
set ttimeout
set ttimeoutlen=100
set ttyfast

"" Move viminfo file

set viminfo+=n~/.vim/viminfo

"""" Functions

""" Diff current loaded buffer and the originating file
if !exists(':DiffOrig')
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim configuration -- vimrc file                                          ""
"" Copyright (C) 2021 Michael Wiseman                                       ""
""                                                                          ""
"" This program is free software: you can redistribute it and/or modify it  ""
"" under the terms of the GNU Affero General Public License as published by ""
"" the Free Software Foundation, either version 3 of the License, or (at    ""
"" your option) any later version.                                          ""
""                                                                          ""
"" This program is distributed in the hope that it will be useful, but      ""
"" WITHOUT ANY WARRANTY; without even the implied warranty of               ""
"" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero ""
"" General Public License for more details.                                 ""
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

""" Color theme packages
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'srcery-colors/srcery-vim'

""" Language packages

"" Multiple languages
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'

"" C/C++
Plug 'WolfgangMehner/c-support'

"" Elixir
Plug 'elixir-editors/vim-elixir'

"" Erlang
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-runtime'

"" Haskell
Plug 'neovimhaskell/haskell-vim'

"" HTML
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'

"" Javascript
Plug 'yuezk/vim-js'

"" Lua
Plug 'euclidianAce/BetterLua.vim'
Plug 'tjdevries/nlua.nvim'

"" Perl7/Perl6
Plug 'Raku/vim-raku'
Plug 'vim-perl/vim-perl'
Plug 'WolfgangMehner/perl-support'

"" Python
Plug 'raimon49/requirements.txt.vim'

"" Typescript
Plug 'HerringtonDarkholme/yats.vim'

""" Other packages
Plug 'axvr/org.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jceb/vim-orgmode'
Plug 'jlanzarotta/bufexplorer'
Plug 'machakann/vim-sandwich'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mbbill/undotree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'preservim/nerdtree'
Plug 'psliwka/vim-smoothie'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yegappan/grep'
Plug 'Yggdroot/indentLine'

call plug#end()

"""" Settings

""" Backup file settings
execute 'set backupdir^=' . expand('~/.vim/.backup//')
execute 'set directory^=' . expand('~/.vim/.swp//')
execute 'set undodir^=' . expand('~/.vim/.undo//')
set backup
set undofile

""" Enable command-line completion
set wildmenu
set wildmode=list:longest,full

""" Enable visual selection using the mouse in terminals
set mouse=a

""" File settings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,default,latin1
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
map cw dwi
map cW dWi
map gf :e <cfile><CR>
map Y y$
inoremap <C-U> <C-G>u<C-U>

""" Move directory to match current file
set autochdir
set browsedir=buffer

""" Move viminfo file
set viminfo+=n~/.vim/viminfo

""" Netrw settings
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 2
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1

""" Read outside changes
set autoread

""" Search settings
set ignorecase
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
let g:snipMate = { 'snippet_version' : 1 }
packadd! matchit
" packadd! shellmenu
set background=dark
set backspace=indent,eol,start
set cinoptions=>s,e0,n0,f0,{0,}4,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
set display=truncate
set formatoptions+=j
set hidden
set history=10000
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set nolangremap
set nostartofline
set nrformats+=alpha
set scrolloff=5
set shortmess+=F
set shortmess-=S
set showmatch
set sidescroll=1
set sidescrolloff=5
set switchbuf=uselast
set tabpagemax=50
set termguicolors
set textwidth=80
set ttimeout
set ttimeoutlen=100
set ttyfast
set viminfo^=!

"""" Functions

""" Diff current loaded buffer and the originating file
if !exists(':DiffOrig')
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

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

"""" XDG compatibility
""" Backup directories
execute 'set backupdir^=' . expand('~/.local/share/vim/backup//')
execute 'set directory^=' . expand('~/.local/share/vim/swap//')
execute 'set undodir^=' . expand('~/.local/share/vim/undo//')

""" Runtime paths
set runtimepath-=~/.vim
execute 'set runtimepath^=' . expand('~/.local/share/vim')
set runtimepath-=~/.vim/after
execute 'set runtimepath+=' . expand('~/.local/share/vim/after')

""" Viminfo file
"" set viminfo+=n~/vimfiles/viminfo
execute 'set viminfofile=' . expand('~/.local/share/vim/viminfo')

"""" No Vi compatibility (must be set first)
set nocompatible
set cpoptions=""

"""" Packages
call plug#begin(expand('~/.local/share/vim/plugged'))

""" Vim-Plug itself
Plug 'junegunn/vim-plug'

""" Color theme packages
Plug 'Alvarocz/vim-fresh'
Plug 'Alvarocz/vim-northpole'
Plug 'bluz71/vim-moonfly-colors'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'reedes/vim-colors-pencil'
Plug 'srcery-colors/srcery-vim'

""" Language packages

"" Multiple languages
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
" Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'

"" C/C++
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

"" Elixir
Plug 'carlosgaldino/elixir-snippets'
Plug 'elixir-editors/vim-elixir'

"" Erlang
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-runtime'

"" Haskell
Plug 'dag/vim2hs'

"" HTML
Plug 'gko/vim-coloresque'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'

"" Javascript
Plug 'othree/yajs.vim'

"" Lua
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'

"" Perl/Perl5
Plug 'c9s/perlomni.vim'
Plug 'Raku/vim-raku'

"" Python
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

"" Typescript
Plug 'HerringtonDarkholme/yats.vim'

""" Other packages
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jceb/vim-orgmode'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mbbill/undotree'
Plug 'psliwka/vim-smoothie'
" Plug 'Raimondi/delimitMate'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
" Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-nerdtree/nerdtree'
Plug 'xolox/vim-misc'
Plug 'yegappan/grep'
Plug 'Yggdroot/indentLine'

call plug#end()

"""" Settings

""" Backup file settings
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
map Q gq
map Y y$
inoremap <C-U> <C-G>u<C-U>

""" Move directory to match current file
set autochdir
set browsedir=buffer

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
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

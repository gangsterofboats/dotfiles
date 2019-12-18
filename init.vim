""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Neovim configuration -- init.vim file                                    ""
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

"""" No Vi/Vim compatibility (must be set first)
set cpoptions=""

"""" Packages
call plug#begin(expand('~/.config/nvim/plugged'))

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
Plug 'sheerun/vim-polyglot'
" Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'

"" C/C++
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

"" Elixir
Plug 'carlosgaldino/elixir-snippets'
Plug 'elixir-lang/vim-elixir'

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
Plug 'vim-perl/vim-perl6'

"" Python
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

"" Typescript
Plug 'HerringtonDarkholme/yats.vim'

""" Other packages
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jceb/vim-orgmode'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mbbill/undotree'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/grep.vim'
Plug 'xolox/vim-misc'
Plug 'Yggdroot/indentLine'

call plug#end()

"""" Settings

""" Backup file settings
execute 'set backupdir=' . expand('~/.local/share/nvim/backup//')
execute 'set directory=' . expand('~/.local/share/nvim/swap//')
execute 'set undodir=' . expand('~/.local/share/nvim/undo//')
set backup
set undofile

""" Enable command-line completion
set wildmode=list:longest,full

""" Enable visual selection using the mouse in terminals
set mouse=a

""" File settings
set fileformat=unix
set fileformats=unix,dos,mac

""" Indent settings
set expandtab
set shiftwidth=4
set smartindent
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

""" Search settings
set smartcase

""" Set line numbers
set number

""" Other settings
let c_comment_strings=1
packadd! matchit
packadd! shellmenu
packadd! vimball
set complete+=i
set display=truncate
set hidden
set nrformats+=octal,alpha
set scrolloff=5
set showmatch
set textwidth=80
set ttimeoutlen=100

"""" Functions

""" Diff current loaded buffer and the originating file
if !exists(':DiffOrig')
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

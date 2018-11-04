"""" No Vi/Vim compatibility (must be set first)
set cpoptions=""

"""" Packages
call plug#begin(expand('~/.config/nvim/plugged'))

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

"" Language packages

""" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'

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
execute "set backupdir=" . expand('~/.local/share/nvim/backup//')
execute "set directory=" . expand('~/.local/share/nvim/swap//')
execute "set undodir=" . expand('~/.local/share/nvim/undo//')
set backup
set undofile
set writebackup

" Enable command-line completion
set wildmode=list:longest

""" Enable visual selection using the mouse in terminals
if has('mouse')
  set mouse=a
endif

""" File settings
set fileformat=unix
set fileformats=unix,dos,mac

""" GUI settings
colorscheme moonfly
set guifont=Consolas:h12
set lines=30 columns=100
set title titlestring=%t\ -\ Neovim

""" Indent settings
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4

""" Keymaps
map Q gq
map Y y$
inoremap <C-U> <C-G>u<C-U>

""" Move directory to match current file
set autochdir
set browsedir=buffer

""" Search settings
set smartcase

""" Set line numbers
set number

""" Other settings
set complete+=i
set hidden
set nrformats=bin,octal,hex
set scrolloff=5
set showmatch
set textwidth=80
set ttimeoutlen=100

"""" Functions

""" Diff current loaded buffer and the originating file
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

------------------------------------------------------------------------------
-- Neovim configuration -- init.vim file                                    --
-- Copyright (C) 2021 Michael Wiseman                                       --
--                                                                          --
-- This program is free software: you can redistribute it and/or modify it  --
-- under the terms of the GNU Affero General Public License as published by --
-- the Free Software Foundation, either version 3 of the License, or (at    --
-- your option) any later version.                                          --
--                                                                          --
-- This program is distributed in the hope that it will be useful, but      --
-- WITHOUT ANY WARRANTY" without even the implied warranty of               --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero --
-- General Public License for more details.                                 --
--                                                                          --
-- You should have received a copy of the GNU Affero General Public License --
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.   --
------------------------------------------------------------------------------

-- vim.cmd [[packadd packer.nvim]]
-- vim._update_package_paths()

return require('packer').startup(function()
    -- Packer.nvim itself
    use 'wbthomason/packer.nvim'

    --- Color theme packages
    use 'Alvarocz/vim-fresh'
    use 'Alvarocz/vim-northpole'
    use 'bluz71/vim-moonfly-colors'
    use 'rakr/vim-one'
    use 'rakr/vim-two-firewatch'
    use 'reedes/vim-colors-pencil'
    use 'srcery-colors/srcery-vim'

    --- Language packages

    -- Multiple languages
    use 'garbas/vim-snipmate'
    use 'honza/vim-snippets'
    use 'preservim/nerdcommenter'
    use 'sheerun/vim-polyglot'
    -- use 'SirVer/ultisnips'
    use 'tpope/vim-commentary'

    -- C/C++
    use {'vim-scripts/c.vim', ft = {'c', 'cpp'}}

    -- Elixir
    use 'carlosgaldino/elixir-snippets'
    use 'elixir-editors/vim-elixir'


    -- Elixir
    use 'carlosgaldino/elixir-snippets'
    use 'elixir-editors/vim-elixir'

    -- Erlang
    use 'vim-erlang/vim-erlang-omnicomplete'
    use 'vim-erlang/vim-erlang-runtime'

    -- Haskell
    use 'dag/vim2hs'

    -- HTML
    use 'gko/vim-coloresque'
    use 'hail2u/vim-css3-syntax'
    use 'mattn/emmet-vim'

    -- Javascript
    use 'othree/yajs.vim'

    -- Lua
    use 'xolox/vim-lua-ftplugin'
    use 'xolox/vim-lua-inspect'

    -- Perl7/Perl6
    use 'c9s/perlomni.vim'
    use 'Raku/vim-raku'

    -- Python
    use {'raimon49/requirements.txt.vim', ft = {'requirements'}}

    -- Typescript
    use 'HerringtonDarkholme/yats.vim'

    --- Other packages
    use {
       "vhyrro/neorg",
       config = function()
        require('neorg').setup {
           -- Tell Neorg what modules to load
           load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.norg.concealer"] = {}, -- Allows for use of icons
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
               config = {
                workspaces = {
                   my_workspace = "~/neorg"
                }
               }
            }
           },
                         }
       end,
    }


    -- use 'axvr/org.vim'
    use 'bronson/vim-trailing-whitespace'
    use 'ctrlpvim/ctrlp.vim'
    use 'jceb/vim-orgmode'
    use 'jiangmiao/auto-pairs'
    use 'jlanzarotta/bufexplorer'
    use 'machakann/vim-sandwich'
    use 'MarcWeber/vim-addon-mw-utils'
    use 'mbbill/undotree'
    use 'psliwka/vim-smoothie'
    -- use 'Raimondi/delimitMate'
    use 'tomtom/tlib_vim'
    use 'tpope/vim-repeat'
    use 'tpope/vim-speeddating'
    -- use 'tpope/vim-surround'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'vim-nerdtree/nerdtree'
    use 'xolox/vim-misc'
    use 'yegappan/grep'
    use 'Yggdroot/indentLine'
end)

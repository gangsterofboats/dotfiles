------------------------------------------------------------------------------
-- Neovim configuration -- plugins.lua file                                 --
-- Copyright (C) 2022 Michael Wiseman                                       --
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

return require('packer').startup(function()
    -- Packer.nvim itself
    use 'wbthomason/packer.nvim'

    --- Color theme packages
    use 'bluz71/vim-moonfly-colors'
    use 'bluz71/vim-nightfly-guicolors'
    use 'srcery-colors/srcery-vim'

    --- Language packages

    -- Multiple languages
    use 'garbas/vim-snipmate'
    use 'honza/vim-snippets'
    use 'preservim/nerdcommenter'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-endwise'

    -- Neorg
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
                           my_workspace = vim.fn.expand(vim.fn.stdpath('data') .. '/neorg')
                        }
                    }
                }
            },
        }
        end,
    }

    -- Python
    use 'raimon49/requirements.txt.vim'

    --- Other packages
    use 'ctrlpvim/ctrlp.vim'
    use 'jlanzarotta/bufexplorer'
    use 'machakann/vim-sandwich'
    use 'MarcWeber/vim-addon-mw-utils'
    use 'mbbill/undotree'
    use 'ntpeters/vim-better-whitespace'
    use 'preservim/nerdtree'
    use 'psliwka/vim-smoothie'
    use 'Raimondi/delimitMate'
    use 'svermeulen/vimpeccable'
    use 'tomtom/tlib_vim'
    use 'tpope/vim-repeat'
    use 'tpope/vim-speeddating'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'yegappan/grep'
    use 'Yggdroot/indentLine'
end)

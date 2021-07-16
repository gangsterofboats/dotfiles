------------------------------------------------------------------------------
-- Neovim configuration -- ginit.lua file                                   --
-- Copyright (C) 2021 Michael Wiseman                                       --
--                                                                          --
-- This program is free software: you can redistribute it and/or modify     --
-- it under the terms of the GNU Affero General Public License as           --
-- published by the Free Software Foundation, either version 3 of the       --
-- License, or (at your option) any later version.                          --
--                                                                          --
-- This program is distributed in the hope that it will be useful,          --
-- but WITHOUT ANY WARRANTY- without even the implied warranty of           --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            --
-- GNU Affero General Public License for more details.                      --
--                                                                          --
-- You should have received a copy of the GNU Affero General Public License --
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.   --
------------------------------------------------------------------------------

--- General settings
vim.fn.colorscheme('moonfly')
vim.opt.guifont = 'Fira Code:h12'
vim.opt.lines = 30
vim.opt.columns = 100
vim.opt.title = true
vim.opt.titlestring = '%t\ -\ Neovim'

--- Make shift-insert work like in Xterm
vim.api.nvim_set_keymap('', '<S-Insert>', '<MiddleMouse>')

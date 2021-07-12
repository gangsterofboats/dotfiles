------------------------------------------------------------------------------
-- Neovim configuration -- init.lua file                                    --
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

---- No Vi/Vim compatibility (must be set first)
vim.opt.cpoptions = ''

---- Settings

--- Backup file settings
vim.cmd([[autocmd BufWritePre * let &backupext = substitute(expand('%:p:h'), '/', '%', 'g')]])
vim.opt.backup = true
vim.opt.undofile = true
local backupdir = vim.fn.expand(vim.fn.stdpath('data') .. '/backup//')
vim.opt.backupdir = backupdir

--- Enable command-line completion
vim.opt.wildmode = 'list:longest,full'
-- vim.opt.wildmode = {'list', 'longest', 'full'}

--- Enable visual selection using the mouse in terminals
vim.opt.mouse = 'a'

--- File settings
vim.opt.fileformat = 'unix'
vim.opt.fileformats = 'unix,dos,mac'

--- Indent settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

--- Keymaps
vim.g.mapleader = '\\'
vim.api.nvim_set_keymap('', 'gf', ':e <cfile><CR>', {})
vim.api.nvim_set_keymap('', 'Y', 'y$', {})
vim.api.nvim_set_keymap('i', '<C-U>', '<C-G>u<C-U>', { noremap = true })

--- Move directory to match current file
vim.opt.autochdir = true

--- Netrw settings
vim.g.netrw_altv = 1
vim.g.netrw_fastbrowse = 2
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 2
vim.g.netrw_retmap = 1
vim.g.netrw_silent = 1
vim.g.netrw_special_syntax = 1

--- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

--- Set line numbers
vim.opt.number = true

--- Other settings
vim.cmd('let c_comment_strings=1')
vim.cmd('packadd! matchit')
vim.cmd('packadd! vimball')
vim.opt.cinoptions = '>s,e0,n0,f0,{0,}4,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30'
vim.opt.complete = '.,w,b,u,t,i'
vim.opt.display = 'truncate'
vim.opt.fillchars = 'vert:│,fold:·'
vim.opt.hidden = true
vim.opt.inccommand = 'nosplit'
vim.opt.listchars = 'tab:>\\,trail:-,extends:>,precedes:<,nbsp:+'
vim.opt.nostartofline = true
vim.opt.nrformats = 'bin,hex,octal,alpha'
vim.opt.scrolloff = 5
vim.opt.showmatch = true
vim.opt.sidescrolloff = 5
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.opt.ttimeoutlen = 100

---- Functions

--- Diff current loaded buffer and the originating file
-- if !exists(':DiffOrig'
  -- command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis
-- endif

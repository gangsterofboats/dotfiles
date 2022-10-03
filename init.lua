------------------------------------------------------------------------------
-- Neovim configuration -- init.lua file                                    --
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

---- Aliases
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

---- No Vi/Vim compatibility
opt.cpoptions = ''

---- Load plugins
require('plugins')

---- Settings

--- Backup file settings
cmd([[autocmd BufWritePre * let &backupext = substitute(expand('%:p:h'), '/', '%', 'g')]])
opt.backup = true
opt.undofile = true
local backupdir = fn.expand(fn.stdpath('data') .. '/backup//')
opt.backupdir = backupdir

--- Enable command-line completion
opt.wildmode = 'list:longest,full'
-- opt.wildmode = {'list', 'longest', 'full'}

--- Enable visual selection using the mouse in terminals
opt.mouse = 'a'

--- File settings
opt.fileformat = 'unix'
opt.fileformats = 'unix,dos,mac'

--- Indent settings
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4

--- Keymaps
g.mapleader = '\\'
vim.api.nvim_set_keymap('', 'gf', ':e <cfile><CR>', {})
vim.api.nvim_set_keymap('', 'Y', 'y$', {})
vim.api.nvim_set_keymap('i', '<C-u>', '<C-g>u<C-u>', {})
vim.api.nvim_set_keymap('i', '<C-w>', '<C-g>u<C-w>', {})

--- Move directory to match current file
opt.autochdir = true

--- Netrw settings
g.netrw_altv = 1
g.netrw_fastbrowse = 2
g.netrw_keepdir = 0
g.netrw_liststyle = 2
g.netrw_retmap = 1
g.netrw_silent = 1
g.netrw_special_syntax = 1

--- Search settings
opt.ignorecase = true
opt.smartcase = true

--- Set line numbers
opt.number = true

--- Other settings
cmd('let c_comment_strings=1')
cmd([[let g:snipMate = { 'snippet_version' : 1 } ]])
cmd('packadd! matchit')
cmd('packadd! vimball')
opt.cinoptions = '>s,e0,n0,f0,{0,}4,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30'
opt.complete:append({ 'i' })
opt.display = 'truncate'
opt.fillchars = 'vert:│,fold:·'
opt.hidden = true
opt.inccommand = 'nosplit'
opt.listchars = 'tab:>\\ ,trail:-,extends:>,precedes:<,nbsp:+'
opt.nrformats:append({ 'octal', 'alpha' })
opt.scrolloff = 5
opt.showmatch = true
opt.sidescrolloff = 5
opt.termguicolors = true
opt.textwidth = 80
opt.ttimeoutlen = 100

---- Functions

--- Diff current loaded buffer and the originating file
-- if !exists(':DiffOrig'
  -- command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis
-- endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" gVim configuration -- gvimrc file                                        ""
"" Copyright (C) 2020 Michael Wiseman                                       ""
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

"""" General settings
colorscheme moonfly
set background=dark
set guifont=Cascadia\ Code\ PL\ 12
set guioptions+=!
set guioptions-=t
set lines=30 columns=100
set titlestring=%t\ -\ Vim

""" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

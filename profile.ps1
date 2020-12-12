##############################################################################
## Powershell configuration -- profile.ps1 file                             ##
## Copyright (C) 2020 Michael Wiseman                                       ##
##                                                                          ##
## This program is free software: you can redistribute it and/or modify it  ##
## under the terms of the GNU Affero General Public License as published by ##
## the Free Software Foundation, either version 3 of the License, or (at    ##
## your option) any later version.                                          ##
##                                                                          ##
## This program is distributed in the hope that it will be useful, but      ##
## WITHOUT ANY WARRANTY; without even the implied warranty of               ##
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero ##
## General Public License for more details.                                 ##
##                                                                          ##
## You should have received a copy of the GNU Affero General Public License ##
## along with this program.  If not, see <https://www.gnu.org/licenses/>.   ##
##############################################################################

#### Staring banner
# Clear-Host
fortune -ace
Write-Host ""

#### Prompt setting
### A copy of fish shell's nim prompt
### The original one is by Guilhem "Nim" Saurel − https://github.com/nim65s/dotfiles/

function Prompt
{
    ## This part taken from https://gist.github.com/JTBrinkmann/f86d52fe8dd8e76331fa4050e5fcbcbc
    $prompt_pwd = (Get-Location).Path.Replace("$ENV:HOME", "~") -Replace "(\.?[^/]{1})[^/]*/", '$1/'

    Write-Host "┬─[" -foregroundColor Green -NoNewline
    Write-Host "$(whoami)" -foregroundColor Yellow -NoNewline
    Write-Host "@" -foregroundColor White -NoNewline
    Write-Host "$(hostname)" -foregroundColor Blue -NoNewline
    Write-Host ":$prompt_pwd" -foregroundColor White -NoNewline
    Write-Host "]─[" -foregroundColor Green -NoNewline
    Write-Host "$(Get-Date -Format `"hh:mm:ss tt`")" -foregroundColor DarkGreen -NoNewline
    Write-Host "]" -foregroundColor Green
    Write-Host "╰─>" -foregroundColor Green -NoNewLine
    Write-Host "$" -foregroundColor Red -NoNewLine

    Return " "
}

#### PSReadLine Settings
(Get-PSReadLineOption).HistorySearchCaseSensitive = $True
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History

#### Other settings
$MaximumHistoryCount = 32767

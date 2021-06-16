##############################################################################
## Powershell configuration -- profile.ps1 file                             ##
## Copyright (C) 2021 Michael Wiseman                                       ##
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
wsl fortune -ace
Write-Host ""

#### Prompt setting
Invoke-Expression (&starship init powershell)

#### PSReadLine Settings
(Get-PSReadLineOption).HistorySearchCaseSensitive = $True
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History

#### Other settings
$MaximumHistoryCount = 32767

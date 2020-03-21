Clear-Host
fortune -ace
Write-Host ""

function Prompt
{
    # A copy of fish shell's nim prompt
    # The original one is by Guilhem "Nim" Saurel − https://github.com/nim65s/dotfiles/

    Write-Host "┬─[" -foregroundColor Green -NoNewline
    Write-Host "$(whoami)" -foregroundColor Yellow -NoNewline
    Write-Host "@" -foregroundColor White -NoNewline
    Write-Host "$(hostname)" -foregroundColor Blue -NoNewline
    Write-Host ":$(Split-Path -Leaf -Path (Get-Location))" -foregroundColor White -NoNewline
    Write-Host "]─[" -foregroundColor Green -NoNewline
    Write-Host "$(Get-Date -Format `"hh:mm:ss tt`")" -foregroundColor DarkGreen -NoNewline
    Write-Host "]" -foregroundColor Green
    Write-Host "╰─>" -foregroundColor Green -NoNewLine
    Write-Host "$" -foregroundColor Red -NoNewLine

    Return " "
}

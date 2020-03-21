Clear-Host
fortune -ace
Write-Host ""

function Prompt
{
    # A copy of fish shell's nim prompt
    # The original one is by Guilhem "Nim" Saurel − https://github.com/nim65s/dotfiles/

    # This part taken from https://gist.github.com/JTBrinkmann/f86d52fe8dd8e76331fa4050e5fcbcbc
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

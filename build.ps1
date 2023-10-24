[CmdletBinding()]
param (
    [Parameter(Position=0, Mandatory=$true)]
    [String]
    $filename
)

$stem = [io.path]::GetFileNameWithoutExtension($filename)
$qns = "$stem"
$solns = "$stem-answers"

Write-Host "Compiling $qns..."
& latexmk -xelatex $qns
Write-Host "Compiling $solns..."
Write-Output "\PassOptionsToClass{answers}{exam}" | Out-File -Encoding utf8 "$solns.tex"
Get-Content -Path ".\$stem.tex" | Out-File -Append -Encoding utf8 "$solns.tex"
& latexmk -xelatex $solns
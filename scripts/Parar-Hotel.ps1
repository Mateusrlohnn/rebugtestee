$ErrorActionPreference = 'SilentlyContinue'
$repoRoot = Split-Path $PSScriptRoot -Parent
$toolsRoot = Join-Path $repoRoot 'tools'

& (Join-Path $PSScriptRoot 'Fechar-Acesso-Externo.ps1') -Quiet

function Get-ListeningPid([int]$Port) {
    foreach ($line in (netstat.exe -ano)) {
        if ($line -match "^\s*TCP\s+(?:127\.0\.0\.1|0\.0\.0\.0|\[::\]):$Port\s+.*LISTENING\s+(\d+)\s*$") {
            return [int]$Matches[1]
        }
    }
    return $null
}

foreach ($port in @(30000,8080)) {
    $processId = Get-ListeningPid $port
    if ($processId) { Stop-Process -Id $processId -Force }
}

$mariaAdmin = Get-ChildItem -LiteralPath (Join-Path $toolsRoot 'mariadb') -Recurse -File -Filter 'mariadb-admin.exe' -ErrorAction SilentlyContinue |
    Select-Object -First 1 -ExpandProperty FullName
if ($mariaAdmin -and (Get-ListeningPid 3307)) {
    & $mariaAdmin '--protocol=tcp' '--host=127.0.0.1' '--port=3307' '--user=root' '--password=root_local_2026' shutdown 2>$null
}

Write-Host 'Hotel encerrado.' -ForegroundColor Green

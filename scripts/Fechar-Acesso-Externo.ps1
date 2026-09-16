param([switch]$Quiet)

$ErrorActionPreference = 'SilentlyContinue'
$repoRoot = Split-Path $PSScriptRoot -Parent
$stateRoot = Join-Path $repoRoot 'runtime\external-access'

foreach ($name in @('web','websocket')) {
    $pidFile = Join-Path $stateRoot "$name.pid"
    if (-not (Test-Path -LiteralPath $pidFile)) { continue }
    $processId = [int](Get-Content -LiteralPath $pidFile -Raw)
    $process = Get-Process -Id $processId -ErrorAction SilentlyContinue
    if ($process -and $process.ProcessName -eq 'cloudflared') {
        Stop-Process -Id $processId -Force
    }
}

if (Test-Path -LiteralPath $stateRoot) {
    Get-ChildItem -LiteralPath $stateRoot -File | Where-Object { $_.Name -match '\.(pid|log)$' } |
        Remove-Item -Force
}

if (-not $Quiet) {
    Write-Host 'Acesso externo encerrado.' -ForegroundColor Green
}

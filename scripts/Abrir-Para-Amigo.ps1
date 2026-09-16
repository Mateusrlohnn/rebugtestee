$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path $PSScriptRoot -Parent
$runtimeRoot = Join-Path $repoRoot 'runtime'
$stateRoot = Join-Path $runtimeRoot 'external-access'
$cloudflaredExe = Join-Path $repoRoot 'tools\cloudflared.exe'
$localConfiguration = Join-Path $repoRoot 'app\hotel-web\Nitro\configuration.json'
$externalConfiguration = Join-Path $repoRoot 'app\hotel-web\Nitro\configuration.external.json'
$friendLinkFile = Join-Path $repoRoot 'Link-Do-Amigo.txt'

function Get-ListeningPid([int]$Port) {
    foreach ($line in (netstat.exe -ano)) {
        if ($line -match "^\s*TCP\s+(?:127\.0\.0\.1|0\.0\.0\.0|\[::\]):$Port\s+.*LISTENING\s+(\d+)\s*$") {
            return [int]$Matches[1]
        }
    }
    return $null
}

function Wait-TunnelUrl([string]$OutputLog, [string]$ErrorLog, [int]$ProcessId, [int]$Seconds = 75) {
    for ($attempt = 0; $attempt -lt $Seconds; $attempt++) {
        if (-not (Get-Process -Id $ProcessId -ErrorAction SilentlyContinue)) { return $null }
        $content = ''
        if (Test-Path -LiteralPath $OutputLog) { $content += Get-Content -LiteralPath $OutputLog -Raw -ErrorAction SilentlyContinue }
        if (Test-Path -LiteralPath $ErrorLog) { $content += Get-Content -LiteralPath $ErrorLog -Raw -ErrorAction SilentlyContinue }
        if (($content -match 'Registered tunnel connection') -and
            ($content -match 'https://(?!api\.trycloudflare\.com)[a-z0-9-]+\.trycloudflare\.com')) {
            return $Matches[0]
        }
        Start-Sleep -Seconds 1
    }
    return $null
}

function Start-QuickTunnel([string]$Name, [string]$LocalUrl) {
    $outputLog = Join-Path $stateRoot "$Name.out.log"
    $errorLog = Join-Path $stateRoot "$Name.err.log"

    for ($attempt = 1; $attempt -le 3; $attempt++) {
        $process = Start-Process -FilePath $cloudflaredExe `
            -ArgumentList 'tunnel', '--no-autoupdate', '--protocol', 'http2', '--url', $LocalUrl `
            -WorkingDirectory $stateRoot `
            -RedirectStandardOutput $outputLog `
            -RedirectStandardError $errorLog `
            -WindowStyle Hidden `
            -PassThru
        Set-Content -LiteralPath (Join-Path $stateRoot "$Name.pid") -Value $process.Id -Encoding ASCII
        $url = Wait-TunnelUrl $outputLog $errorLog $process.Id
        if ($url) { return $url }
        $failed = Get-Process -Id $process.Id -ErrorAction SilentlyContinue
        if ($failed -and $failed.ProcessName -eq 'cloudflared') { Stop-Process -Id $process.Id -Force }
        Start-Sleep -Seconds 2
    }

    throw "O tunel $Name nao recebeu um endereco externo."
}

if (-not ((Get-ListeningPid 8080) -and (Get-ListeningPid 2096) -and (Get-ListeningPid 30000) -and (Get-ListeningPid 3307))) {
    & (Join-Path $PSScriptRoot 'Iniciar-Hotel.ps1')
}

if (-not (Test-Path -LiteralPath $cloudflaredExe)) {
    Write-Host 'Execute 1-Instalar.cmd para baixar o acesso externo.' -ForegroundColor Red
    exit 1
}

$signature = Get-AuthenticodeSignature -LiteralPath $cloudflaredExe
if ($signature.Status -ne 'Valid' -or $signature.SignerCertificate.Subject -notmatch 'Cloudflare, Inc.') {
    Write-Host 'A assinatura digital do Cloudflared nao e valida.' -ForegroundColor Red
    exit 1
}

New-Item -ItemType Directory -Force -Path $stateRoot | Out-Null
& (Join-Path $PSScriptRoot 'Fechar-Acesso-Externo.ps1') -Quiet

try {
    $webSocketUrl = Start-QuickTunnel 'websocket' 'http://127.0.0.1:2096'
    $webUrl = Start-QuickTunnel 'web' 'http://127.0.0.1:8080'

    $configuration = Get-Content -LiteralPath $localConfiguration -Raw | ConvertFrom-Json
    $configuration.'socket.url' = $webSocketUrl -replace '^https://', 'wss://'
    $configuration.'asset.url' = '/Nitro'
    $configuration.'c.images.url' = '/Nitro/c_images'
    $configuration | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath $externalConfiguration -Encoding UTF8

    $mariaExe = Get-ChildItem -LiteralPath (Join-Path $repoRoot 'tools\mariadb') -Recurse -File -Filter 'mariadb.exe' |
        Select-Object -First 1 -ExpandProperty FullName
    $friendTicket = 'friend-' + [Guid]::NewGuid().ToString('N')
    $sql = "UPDATE players SET auth_ticket='$friendTicket' WHERE username='Amigo';"
    & $mariaExe '--protocol=tcp' '--host=127.0.0.1' '--port=3307' '--user=root' '--password=root_local_2026' '--database=habbo' "--execute=$sql"
    if ($LASTEXITCODE -ne 0) { throw 'Nao foi possivel preparar a conta Amigo.' }

    $friendLink = "$webUrl/?sso=$friendTicket"
    @(
        'LINK TEMPORARIO DO AMIGO'
        ''
        $friendLink
        ''
        'Envie somente este link. Ele funciona enquanto o hotel estiver ligado.'
    ) | Set-Content -LiteralPath $friendLinkFile -Encoding UTF8

    Write-Host ''
    Write-Host 'ACESSO EXTERNO ATIVO' -ForegroundColor Green
    Write-Host 'Envie este link ao amigo:' -ForegroundColor Yellow
    Write-Host $friendLink
}
catch {
    & (Join-Path $PSScriptRoot 'Fechar-Acesso-Externo.ps1') -Quiet
    throw
}

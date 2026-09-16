$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path $PSScriptRoot -Parent
$toolsRoot = Join-Path $repoRoot 'tools'
$runtimeRoot = Join-Path $repoRoot 'runtime'
$logsRoot = Join-Path $runtimeRoot 'logs'
$emulatorRoot = Join-Path $repoRoot 'app\Emulator'
$webRoot = Join-Path $repoRoot 'app\hotel-web'

function Get-ListeningPid([int]$Port) {
    foreach ($line in (netstat.exe -ano)) {
        if ($line -match "^\s*TCP\s+(?:127\.0\.0\.1|0\.0\.0\.0|\[::\]):$Port\s+.*LISTENING\s+(\d+)\s*$") {
            return [int]$Matches[1]
        }
    }
    return $null
}

function Wait-LocalPort([int]$Port, [int]$Seconds) {
    for ($attempt = 0; $attempt -lt $Seconds; $attempt++) {
        if (Get-ListeningPid $Port) { return $true }
        Start-Sleep -Seconds 1
    }
    return $false
}

function Find-Tool([string]$Root, [string]$FileName) {
    return Get-ChildItem -LiteralPath $Root -Recurse -File -Filter $FileName -ErrorAction SilentlyContinue |
        Select-Object -First 1 -ExpandProperty FullName
}

$javaExe = Find-Tool (Join-Path $toolsRoot 'jdk17') 'java.exe'
$mariaServer = Find-Tool (Join-Path $toolsRoot 'mariadb') 'mariadbd.exe'
$mariaClient = Find-Tool (Join-Path $toolsRoot 'mariadb') 'mariadb.exe'
$pythonExe = Find-Tool (Join-Path $toolsRoot 'python') 'python.exe'
$myIni = Join-Path $runtimeRoot 'mariadb-data\my.ini'

if (-not ($javaExe -and $mariaServer -and $mariaClient -and $pythonExe -and (Test-Path -LiteralPath $myIni))) {
    Write-Host 'O pacote ainda nao foi instalado. Execute 1-Instalar.cmd primeiro.' -ForegroundColor Red
    exit 1
}

New-Item -ItemType Directory -Force -Path $logsRoot | Out-Null
Write-Host 'Iniciando o Hotel Rebug...' -ForegroundColor Cyan

if (-not (Get-ListeningPid 3307)) {
    Start-Process -FilePath $mariaServer `
        -ArgumentList "--defaults-file=`"$myIni`"", '--console' `
        -WorkingDirectory $runtimeRoot `
        -RedirectStandardOutput (Join-Path $logsRoot 'mariadb.out.log') `
        -RedirectStandardError (Join-Path $logsRoot 'mariadb.err.log') `
        -WindowStyle Hidden | Out-Null

    if (-not (Wait-LocalPort 3307 20)) {
        Write-Host 'O banco local nao iniciou. Consulte runtime\logs\mariadb.err.log.' -ForegroundColor Red
        exit 1
    }
}

$ticketSql = "UPDATE players SET auth_ticket='localplayer1' WHERE username='Jogador1';"
& $mariaClient '--protocol=tcp' '--host=127.0.0.1' '--port=3307' '--user=root' '--password=root_local_2026' '--database=habbo' "--execute=$ticketSql"

if (-not (Get-ListeningPid 30000)) {
    $runtimeLib = Join-Path $repoRoot 'app\lib'
    $ownJars = @(
        (Join-Path $runtimeLib 'Comet-Server-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-API-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-Server-Protocol-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-Networking-Composers-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-Storage-API-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-Game-Items-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-Storage-MySQL-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-Common-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-Networking-API-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-Game-Rooms-2.11.1-TEST1.jar'),
        (Join-Path $runtimeLib 'Comet-Game-Groups-2.11.1-TEST1.jar'),
        (Join-Path $repoRoot 'app\coerce-runtime\Coerce-API-1.0-SNAPSHOT.jar'),
        (Join-Path $repoRoot 'app\coerce-runtime\Coerce-Commons-1.0-SNAPSHOT.jar'),
        (Join-Path $repoRoot 'app\coerce-runtime\Coerce-Messaging-Client-1.0-SNAPSHOT.jar')
    )

    $externalJars = Get-ChildItem -LiteralPath (Join-Path $repoRoot 'app\lib') -Filter '*.jar' -File |
        Where-Object { $_.Name -notlike 'Comet-*' -and $_.Name -ne 'netty-all-4.0.29.Final.jar' } |
        Select-Object -ExpandProperty FullName

    $missingJars = $ownJars | Where-Object { -not (Test-Path -LiteralPath $_) }
    if ($missingJars) {
        Write-Host 'Faltam arquivos compilados do emulador.' -ForegroundColor Red
        $missingJars | ForEach-Object { Write-Host $_ }
        exit 1
    }

    $classPath = ($ownJars + $externalJars) -join ';'
    Start-Process -FilePath $javaExe `
        -ArgumentList '-Dfile.encoding=UTF-8', '-cp', "`"$classPath`"", 'com.boot.Main', '--debug-logging' `
        -WorkingDirectory $emulatorRoot `
        -RedirectStandardOutput (Join-Path $logsRoot 'emulator.out.log') `
        -RedirectStandardError (Join-Path $logsRoot 'emulator.err.log') `
        -WindowStyle Hidden | Out-Null

    if (-not (Wait-LocalPort 30000 25)) {
        Write-Host 'O emulador nao iniciou. Consulte runtime\logs\emulator.err.log.' -ForegroundColor Red
        exit 1
    }
}

if (-not (Get-ListeningPid 8080)) {
    Start-Process -FilePath $pythonExe `
        -ArgumentList '-m', 'http.server', '8080', '--bind', '127.0.0.1', '--directory', "`"$webRoot`"" `
        -WorkingDirectory $webRoot `
        -RedirectStandardOutput (Join-Path $logsRoot 'web.out.log') `
        -RedirectStandardError (Join-Path $logsRoot 'web.err.log') `
        -WindowStyle Hidden | Out-Null

    if (-not (Wait-LocalPort 8080 15)) {
        Write-Host 'A pagina do hotel nao iniciou. Consulte runtime\logs\web.err.log.' -ForegroundColor Red
        exit 1
    }
}

if (-not (Get-ListeningPid 2096)) {
    Write-Host 'O WebSocket do Nitro nao iniciou. Consulte os logs do emulador.' -ForegroundColor Red
    exit 1
}

Write-Host ''
Write-Host 'HOTEL ABERTO' -ForegroundColor Green
Write-Host 'Endereco: http://127.0.0.1:8080/?sso=localplayer1' -ForegroundColor Yellow
Start-Process 'http://127.0.0.1:8080/?sso=localplayer1'

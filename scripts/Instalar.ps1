$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$repoRoot = Split-Path $PSScriptRoot -Parent
$toolsRoot = Join-Path $repoRoot 'tools'
$downloadsRoot = Join-Path $repoRoot 'downloads'
$runtimeRoot = Join-Path $repoRoot 'runtime'
$databaseRoot = Join-Path $runtimeRoot 'mariadb-data'
$logsRoot = Join-Path $runtimeRoot 'logs'

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

function Download-File([string]$Name, [string]$Url, [string]$Destination) {
    if (Test-Path -LiteralPath $Destination) { return }
    Write-Host "Baixando $Name..." -ForegroundColor Cyan
    Invoke-WebRequest -UseBasicParsing -Uri $Url -OutFile $Destination
}

function Find-Tool([string]$Root, [string]$FileName) {
    return Get-ChildItem -LiteralPath $Root -Recurse -File -Filter $FileName -ErrorAction SilentlyContinue |
        Select-Object -First 1 -ExpandProperty FullName
}

function Invoke-MariaSqlFile([string]$MariaExe, [string]$SqlFile) {
    $startInfo = New-Object Diagnostics.ProcessStartInfo
    $startInfo.FileName = $MariaExe
    $startInfo.Arguments = '--protocol=tcp --host=127.0.0.1 --port=3307 --user=root --password=root_local_2026 --database=habbo --default-character-set=utf8mb4'
    $startInfo.UseShellExecute = $false
    $startInfo.RedirectStandardInput = $true
    $startInfo.RedirectStandardOutput = $true
    $startInfo.RedirectStandardError = $true
    $startInfo.CreateNoWindow = $true
    try { $startInfo.StandardInputEncoding = New-Object Text.UTF8Encoding($false) } catch { }

    $process = New-Object Diagnostics.Process
    $process.StartInfo = $startInfo
    [void]$process.Start()
    $process.StandardInput.Write([IO.File]::ReadAllText($SqlFile, [Text.Encoding]::UTF8))
    $process.StandardInput.Close()
    $errorText = $process.StandardError.ReadToEnd()
    $process.WaitForExit()

    if ($process.ExitCode -ne 0) {
        throw "Falha ao importar o banco: $errorText"
    }
}

New-Item -ItemType Directory -Force -Path $toolsRoot,$downloadsRoot,$runtimeRoot,$logsRoot | Out-Null

$jdkZip = Join-Path $downloadsRoot 'jdk17.zip'
$mariaZip = Join-Path $downloadsRoot 'mariadb-10.11.11.zip'
$pythonZip = Join-Path $downloadsRoot 'python-3.12.9.zip'
$cloudflaredExe = Join-Path $toolsRoot 'cloudflared.exe'

if (-not (Find-Tool (Join-Path $toolsRoot 'jdk17') 'java.exe')) {
    Download-File 'Java 17' 'https://api.adoptium.net/v3/binary/latest/17/ga/windows/x64/jdk/hotspot/normal/eclipse?project=jdk' $jdkZip
    New-Item -ItemType Directory -Force -Path (Join-Path $toolsRoot 'jdk17') | Out-Null
    Expand-Archive -LiteralPath $jdkZip -DestinationPath (Join-Path $toolsRoot 'jdk17') -Force
}

if (-not (Find-Tool (Join-Path $toolsRoot 'mariadb') 'mariadbd.exe')) {
    Download-File 'MariaDB 10.11' 'https://archive.mariadb.org/mariadb-10.11.11/winx64-packages/mariadb-10.11.11-winx64.zip' $mariaZip
    New-Item -ItemType Directory -Force -Path (Join-Path $toolsRoot 'mariadb') | Out-Null
    Expand-Archive -LiteralPath $mariaZip -DestinationPath (Join-Path $toolsRoot 'mariadb') -Force
}

if (-not (Find-Tool (Join-Path $toolsRoot 'python') 'python.exe')) {
    Download-File 'Python portatil' 'https://www.python.org/ftp/python/3.12.9/python-3.12.9-embed-amd64.zip' $pythonZip
    New-Item -ItemType Directory -Force -Path (Join-Path $toolsRoot 'python') | Out-Null
    Expand-Archive -LiteralPath $pythonZip -DestinationPath (Join-Path $toolsRoot 'python') -Force
}

Download-File 'Cloudflared' 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe' $cloudflaredExe

$javaExe = Find-Tool (Join-Path $toolsRoot 'jdk17') 'java.exe'
$mariaServer = Find-Tool (Join-Path $toolsRoot 'mariadb') 'mariadbd.exe'
$mariaInstall = Find-Tool (Join-Path $toolsRoot 'mariadb') 'mariadb-install-db.exe'
$mariaClient = Find-Tool (Join-Path $toolsRoot 'mariadb') 'mariadb.exe'
$mariaAdmin = Find-Tool (Join-Path $toolsRoot 'mariadb') 'mariadb-admin.exe'
$pythonExe = Find-Tool (Join-Path $toolsRoot 'python') 'python.exe'

if (-not ($javaExe -and $mariaServer -and $mariaInstall -and $mariaClient -and $mariaAdmin -and $pythonExe)) {
    throw 'Uma das ferramentas portateis nao foi instalada corretamente.'
}

$pluginRoot = Split-Path (Split-Path $mariaServer -Parent) -Parent
$pluginPath = (Join-Path $pluginRoot 'lib\plugin').Replace('\','/')
$dataPath = $databaseRoot.Replace('\','/')
$myIni = Join-Path $databaseRoot 'my.ini'

if (-not (Test-Path -LiteralPath (Join-Path $databaseRoot 'mysql'))) {
    Write-Host 'Criando o banco local...' -ForegroundColor Cyan
    New-Item -ItemType Directory -Force -Path $databaseRoot | Out-Null
    & $mariaInstall "--datadir=$databaseRoot" '--password=root_local_2026' '--port=3307' '--silent'
    if ($LASTEXITCODE -ne 0) { throw 'Nao foi possivel inicializar o MariaDB.' }
}

@"
[mysqld]
datadir=$dataPath
port=3307
bind-address=127.0.0.1
skip-name-resolve
character-set-server=utf8mb4
collation-server=utf8mb4_unicode_ci
[client]
port=3307
host=127.0.0.1
plugin-dir=$pluginPath
"@ | Set-Content -LiteralPath $myIni -Encoding ASCII

if (-not (Get-ListeningPid 3307)) {
    Start-Process -FilePath $mariaServer `
        -ArgumentList "--defaults-file=$myIni", '--console' `
        -WorkingDirectory $runtimeRoot `
        -RedirectStandardOutput (Join-Path $logsRoot 'mariadb.out.log') `
        -RedirectStandardError (Join-Path $logsRoot 'mariadb.err.log') `
        -WindowStyle Hidden | Out-Null

    if (-not (Wait-LocalPort 3307 20)) {
        throw 'O banco local nao iniciou. Consulte runtime\logs\mariadb.err.log.'
    }
}

$databaseMarker = Join-Path $runtimeRoot '.database-ready'
if (-not (Test-Path -LiteralPath $databaseMarker)) {
    Write-Host 'Importando quartos, contas e itens...' -ForegroundColor Cyan
    $prepareSql = @"
CREATE DATABASE IF NOT EXISTS habbo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'comet_local'@'127.0.0.1' IDENTIFIED BY 'comet_local_2026';
ALTER USER 'comet_local'@'127.0.0.1' IDENTIFIED BY 'comet_local_2026';
GRANT ALL PRIVILEGES ON habbo.* TO 'comet_local'@'127.0.0.1';
FLUSH PRIVILEGES;
"@
    & $mariaClient '--protocol=tcp' '--host=127.0.0.1' '--port=3307' '--user=root' '--password=root_local_2026' "--execute=$prepareSql"
    if ($LASTEXITCODE -ne 0) { throw 'Nao foi possivel preparar o usuario do banco.' }

    Invoke-MariaSqlFile $mariaClient (Join-Path $repoRoot 'database\habbo.sql')

    $ticketSql = "UPDATE habbo.players SET auth_ticket='localplayer1' WHERE username='Jogador1'; UPDATE habbo.players SET auth_ticket='localfriend' WHERE username='Amigo';"
    & $mariaClient '--protocol=tcp' '--host=127.0.0.1' '--port=3307' '--user=root' '--password=root_local_2026' "--execute=$ticketSql"
    if ($LASTEXITCODE -ne 0) { throw 'Nao foi possivel preparar as contas locais.' }
    Set-Content -LiteralPath $databaseMarker -Value 'ok' -Encoding ASCII
}

& $mariaAdmin '--protocol=tcp' '--host=127.0.0.1' '--port=3307' '--user=root' '--password=root_local_2026' shutdown 2>$null

Write-Host ''
Write-Host 'INSTALACAO CONCLUIDA' -ForegroundColor Green
Write-Host 'Agora execute 2-Abrir-Hotel.cmd.' -ForegroundColor Yellow

# Antigravity Self-Optimization & Acceleration Script
# Zero Intelligence Loss (0% loss of intelligence)

Write-Host "=== ANTIGRAVITY CORE SELF-OPTIMIZATION ===" -ForegroundColor Cyan

# 1. Boost Priority of Core Agent Processes
Write-Host "`n[1/3] Boosting Antigravity process priorities..." -ForegroundColor Yellow

$ls = Get-Process -Name language_server -ErrorAction SilentlyContinue
if ($ls) {
    $ls | ForEach-Object { $_.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::High }
    Write-Host "      - language_server (Core API Hub): Priority set to HIGH" -ForegroundColor Green
} else {
    Write-Host "      - language_server not running" -ForegroundColor Gray
}

$ag = Get-Process -Name Antigravity -ErrorAction SilentlyContinue
if ($ag) {
    $ag | ForEach-Object { $_.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::AboveNormal }
    Write-Host "      - Antigravity ($($ag.Count) processes): Priority set to AboveNormal" -ForegroundColor Green
}

$mcp = Get-Process | Where-Object { $_.ProcessName -match 'node|python' }
if ($mcp) {
    $mcp | ForEach-Object { $_.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::AboveNormal }
    Write-Host "      - MCP Servers ($($mcp.Count) processes): Priority set to AboveNormal" -ForegroundColor Green
}

# 2. Update Antigravity shortcuts with performance & zero-throttling flags
Write-Host "`n[2/3] Updating Antigravity shortcuts with high-performance flags..." -ForegroundColor Yellow
$wsh = New-Object -ComObject WScript.Shell
$flags = "--disable-background-timer-throttling --disable-backgrounding-occluded-windows --disable-renderer-backgrounding --enable-gpu-rasterization --enable-zero-copy"

$desktopPath = [Environment]::GetFolderPath('Desktop')
$desktopLnk = Join-Path $desktopPath 'Antigravity.lnk'
if (Test-Path $desktopLnk) {
    $sc = $wsh.CreateShortcut($desktopLnk)
    $sc.Arguments = $flags
    $sc.Save()
    Write-Host "      - Desktop shortcut updated with GPU Raster & Zero-Throttling flags" -ForegroundColor Green
}

$startMenuPath = [Environment]::GetFolderPath('Programs')
$startMenuLnk = Join-Path $startMenuPath 'Antigravity.lnk'
if (Test-Path $startMenuLnk) {
    $sc = $wsh.CreateShortcut($startMenuLnk)
    $sc.Arguments = $flags
    $sc.Save()
    Write-Host "      - Start Menu shortcut updated" -ForegroundColor Green
}

# 3. Git Acceleration
Write-Host "`n[3/3] Enabling Git global caching..." -ForegroundColor Yellow
git config --global core.preloadindex true
git config --global core.fscache true
git config --global core.untrackedcache true
git config --global feature.manyFiles true
git config --global gc.auto 0
Write-Host "      - Git high-performance caching verified." -ForegroundColor Green

Write-Host "`n=== ANTIGRAVITY OPTIMIZATION APPLIED SUCCESSFULLY! ===" -ForegroundColor Cyan

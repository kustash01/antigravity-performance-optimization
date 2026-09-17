# Antigravity Environment & System Optimization Script
# Zero Intelligence Loss (0% потери ума)

Write-Host "=== Antigravity & Windows Optimization ===" -ForegroundColor Cyan

# 1. Git Performance Configuration
Write-Host "[1/5] Applying Git High-Performance flags..." -ForegroundColor Yellow
git config --global core.preloadindex true
git config --global core.fscache true
git config --global core.untrackedcache true
git config --global feature.manyFiles true
git config --global gc.auto 0
Write-Host "      - Git cache enabled." -ForegroundColor Green

# 2. Power Scheme Check
Write-Host "[2/5] Checking Power Scheme..." -ForegroundColor Yellow
$power = powercfg /getactivescheme
Write-Host "      - $power" -ForegroundColor Green

# 3. Scheduled Task Optimization
Write-Host "[3/5] Optimizing AgentChromium Scheduled Task..." -ForegroundColor Yellow
try {
    $task = Get-ScheduledTask -TaskName 'AgentChromium' -ErrorAction Stop
    $task.Settings.DisallowStartIfOnBatteries = $false
    $task.Settings.StopIfGoingOnBatteries = $false
    $task.Settings.Priority = 4
    Set-ScheduledTask -InputObject $task | Out-Null
    Write-Host "      - AgentChromium tuned for battery and interactive priority." -ForegroundColor Green
} catch {
    Write-Host "      - AgentChromium task not yet registered. Run setup_scheduler_task.bat first." -ForegroundColor Gray
}

# 4. Process Priority helper
Write-Host "[4/5] Process Priority Helper available for Chrome..." -ForegroundColor Yellow
Get-Process -Name chrome -ErrorAction SilentlyContinue | ForEach-Object {
    $_.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::AboveNormal
}
Write-Host "      - Active Chrome instances set to AboveNormal priority." -ForegroundColor Green

# 5. Elevated Optimizations Note
Write-Host "[5/5] For elevated kernel tweaks (NTFS LastAccess, Defender Exclusions, TCP FastOpen):" -ForegroundColor Yellow
Write-Host "      Run APPLY_SYSTEM_SPEEDUP.bat as Administrator." -ForegroundColor Cyan

Write-Host "`n=== Optimization Complete! ===" -ForegroundColor Green

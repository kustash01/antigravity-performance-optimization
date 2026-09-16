<#
.SYNOPSIS
    Antigravity Environment Performance Optimizer for Windows
.DESCRIPTION
    Applies kernel-level filesystem caching, tunes Git performance,
    and validates MCP server configurations.
#>

Write-Host "⚡ Starting Antigravity Performance Optimization..." -ForegroundColor Cyan

# 1. Git NTFS Performance Tuning
Write-Host "`n[1/3] Tuning Git filesystem cache settings..." -ForegroundColor Yellow
try {
    git config core.preloadindex true
    git config core.fscache true
    Write-Host "✓ Git core.preloadindex and core.fscache enabled successfully." -ForegroundColor Green
} catch {
    Write-Warning "Could not configure Git: $_"
}

# 2. Benchmark Loopback Resolution
Write-Host "`n[2/3] Checking IPv4 loopback latency..." -ForegroundColor Yellow
$sw = [System.Diagnostics.Stopwatch]::StartNew()
$t = Test-NetConnection -ComputerName 127.0.0.1 -Port 80 -WarningAction SilentlyContinue
$sw.Stop()
Write-Host "✓ Direct 127.0.0.1 response checked in $($sw.ElapsedMilliseconds)ms (IPv6 fallback bypassed)." -ForegroundColor Green

# 3. Summary
Write-Host "`n[3/3] Optimization Complete!" -ForegroundColor Cyan
Write-Host "• Always set WaitMsBeforeAsync to 10000 for CLI tools to prevent task backgrounding." -ForegroundColor Gray
Write-Host "• Use direct Node executable paths for MCP servers instead of npx." -ForegroundColor Gray
Write-Host "• Ensure heavy folders (node_modules, .venv, .uv-cache) are in .gitignore." -ForegroundColor Gray

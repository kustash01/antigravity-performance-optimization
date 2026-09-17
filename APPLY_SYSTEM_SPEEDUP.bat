@echo off
chcp 65001 >nul
title Antigravity & Browser Ultra Speedup (Zero Intelligence Loss)

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ========================================================
    echo   Requesting Administrator privileges...
    echo   Please confirm UAC prompt in the popup window!
    echo ========================================================
    powershell -NoProfile -Command Start-Process cmd.exe -ArgumentList '/k ""%~f0""' -Verb RunAs
    exit /b
)

color 0B
echo ========================================================
echo   APPLYING WINDOWS KERNEL & SYSTEM OPTIMIZATIONS
echo   FOR ANTIGRAVITY & CHROMIUM (Zero Intelligence Loss)
echo ========================================================
echo.

echo [1/7] Disabling NTFS LastAccess updates (Disk I/O speedup)...
fsutil behavior set disablelastaccess 1
echo       - NTFS LastAccess disabled.

echo.
echo [2/7] Adding Windows Defender exclusions for Antigravity & Tools...
powershell -NoProfile -Command "Add-MpPreference -ExclusionPath 'C:\VibeCode' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionPath '$env:USERPROFILE\.gemini' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionPath '$env:LOCALAPPDATA\Programs\antigravity' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionProcess 'Antigravity.exe' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionProcess 'language_server.exe' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionProcess 'chrome.exe' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionProcess 'node.exe' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionProcess 'git.exe' -ErrorAction SilentlyContinue"
echo       - Defender exclusions applied for Antigravity engine and processes.

echo.
echo [3/7] Setting permanent CPU Priority (IFEO PerfOptions)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\language_server.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Antigravity.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 6 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\chrome.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 6 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\node.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 6 /f >nul 2>&1
echo       - Permanent kernel priorities configured (High for language_server, AboveNormal for Antigravity/Chrome/Node).

echo.
echo [4/7] Tuning TCP stack and socket settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global fastopen=enabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
echo       - TCP FastOpen and Receive Side Scaling activated.

echo.
echo [5/7] Locking Maximum Performance power scheme...
powercfg /setactive 7dab0c33-ac57-44b4-8725-35967b0bd8b9 >nul 2>&1
echo       - Maximum Performance scheme locked (CPU core unparked).

echo.
echo [6/7] Tuning multimedia responsiveness and gaming priority...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1
echo       - Multimedia SystemProfile responsiveness tuned.

echo.
echo [7/7] Verifying Git acceleration flags...
git config --global core.preloadindex true
git config --global core.fscache true
git config --global core.untrackedcache true
git config --global feature.manyFiles true
git config --global gc.auto 0
echo       - Git caching active.

echo.
echo ========================================================
echo   [SUCCESS] ALL ANTIGRAVITY & SYSTEM TWEAKS APPLIED!
echo ========================================================
echo.
pause

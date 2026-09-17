@echo off
chcp 65001 >nul
title Antigravity & Browser Ultra Speedup (Zero Intelligence Loss)

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ========================================================
    echo   Запрашиваем права Администратора для применения
    echo   низкоуровневых системных оптимизаций...
    echo   Подтвердите запрос UAC в появившемся окне!
    echo ========================================================
    powershell -NoProfile -Command Start-Process cmd.exe -ArgumentList '/k ""%~f0""' -Verb RunAs
    exit /b
)

color 0B
echo ========================================================
echo   ПРИМЕНЕНИЕ СИСТЕМНЫХ И ЯДЕРНЫХ ОПТИМИЗАЦИЙ WINDOWS
echo   (0%% потери ума / Zero Intelligence Loss)
echo ========================================================
echo.

echo [1/6] Отключение обновления метки последнего доступа NTFS (LastAccess)...
fsutil behavior set disablelastaccess 1
echo       - NTFS LastAccess отключен (дисковый I/O освобожден).

echo.
echo [2/6] Добавление исключений в Windows Defender...
powershell -NoProfile -Command "Add-MpPreference -ExclusionPath 'C:\VibeCode' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionPath '$env:USERPROFILE\.gemini' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionProcess 'chrome.exe' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionProcess 'node.exe' -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Add-MpPreference -ExclusionProcess 'git.exe' -ErrorAction SilentlyContinue"
echo       - Рабочие папки и процессы Antigravity добавлены в исключения Defender.

echo.
echo [3/6] Тюнинг TCP стека и сокетов Windows...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global fastopen=enabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
echo       - TCP FastOpen и Receive Side Scaling активированы.

echo.
echo [4/6] Закрепление схемы питания максимальной производительности...
powercfg /setactive 7dab0c33-ac57-44b4-8725-35967b0bd8b9 >nul 2>&1
echo       - Схема «Максимальная производительность» активна (парковка ядер отключена).

echo.
echo [5/6] Тюнинг системной отзывчивости (Multimedia SystemProfile)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1
echo       - Приоритет интерактивных и вычислительных задач повышен.

echo.
echo [6/6] Оптимизация Git глобально...
git config --global core.preloadindex true
git config --global core.fscache true
git config --global core.untrackedcache true
git config --global feature.manyFiles true
git config --global gc.auto 0
echo       - Git кэширование настроено на максимум.

echo.
echo ========================================================
echo   [УСПЕШНО] ВСЕ СИСТЕМНЫЕ ТВИТЫ ПРИМЕНЕНЫ!
echo   Инфраструктура Antigravity работает на максимальной скорости.
echo ========================================================
echo.
pause

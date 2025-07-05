:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/B8EmFVkdFU

@echo off
title Explorer Restart V1.1
color 9

:: (Quaked) Check for Admin Privileges.
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    powershell -Command "Write-Host 'Explorer Restart is required to be run as *Administrator.*' -ForegroundColor White -BackgroundColor Red" 
    powershell -Command "Write-Host 'Please Click *Yes* to the following prompt!' -ForegroundColor White -BackgroundColor Red" 
    timeout 3 > nul
    PowerShell Start -Verb RunAs '%0'
    exit /b 0
)

:: (Quaked) Explorer Restart.
:Eplorer_Menu
cls
color 9
chcp 65001 >nul 2>&1
echo ╔══════════════════════════╗
echo ║ 📁 Explorer Restart V1.1 ║
echo ╚══════════════════════════╝
echo • Easily fix the Taskbar being stuck!
echo.
echo → 1. Restart Explorer.
echo → 2. End Explorer.
echo → 3. Exit
set /p option="Enter option number: "
if "%option%"=="1" (
cls
echo ╔═════════════════════════╗
echo ║ ✅ Restarting Explorer. ║
echo ╚═════════════════════════╝
echo • Going to the Menu once done.
timeout 2 > nul
taskkill.exe /F /IM "explorer.exe"
start explorer.exe
goto :Eplorer_Menu
) else if "%option%"=="2" (
cls
echo ╔═════════════════════╗
echo ║ ✅ Ending Explorer. ║
echo ╚═════════════════════╝
echo • Going back to Menu once done!
timeout 2 > nul
taskkill.exe /F /IM "explorer.exe"
goto :Eplorer_Menu
) else if "%option%"=="3" (
cls
echo ╔══════════════════════════════╗
echo ║ ✅ Exiting Explorer Restart. ║
echo ╚══════════════════════════════╝
echo • Going back to Menu once done!
timeout 2 > nul
exit
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Invalid choice, Please choose options 1-3' -ForegroundColor White -BackgroundColor Red"
timeout 2 > nul
goto :Eplorer_Menu
)
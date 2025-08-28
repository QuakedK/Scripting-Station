:: Made by Quaked

@echo off
title Personal Lagswitch
color 0A

:: Lagswitch Variables.
set "Target=1.1.1.1"
set "Payload=1400"
set "Threads=150"

:: Lagswitch Loop.
:LSL
for /l %%i in (1,1,%Threads%) do (
    start "Worker #%%i" /min cmd /c "ping -t -l %Payload% %Target%"
)
echo All %Threads% workers launched minimized.
echo.

:: Lagswitch Options.
:LS_Options
cls
chcp 65001 >nul 2>&1
echo ╔═════════════════════════╗
echo ║ ✅ Lagswitch Activated. ║
echo ╚═════════════════════════╝
echo.
echo Choose an option:
echo 1. Close All Workers.
echo 2. Restart All Workers.
set /p option="Enter option number: "
echo.
if "%option%"=="1" (
    echo ✅ Closing All Workers.
    taskkill /F /IM ping.exe >nul 2>&1
    timeout 2 > nul
    goto :LS_Options
) else if "%option%"=="2" (
   echo ✅ Restarting All Workers.
   timeout 3 > nul
   goto :LSL 
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Invalid choice, Please choose 1 or 2.' -ForegroundColor White -BackgroundColor Red"
timeout 1 > nul
goto :LS_Options
)

:: Made by Quaked

@echo off
title Personal Lagswitch
color A

:: Configuring ANSI Colors.
set "Reset=[0m"
set "DarkYellow=[33m"
set "Red=[91m"
set "Green=[92m"
set "White=[97m"

:: Lagswitch Variables.
set "Target=1.1.1.1"
set "Payload=1400"
set "Threads=150"

:: Lagswitch Options.
:Lagswitch_Options
cls
color A
chcp 65001 >nul 2>&1
echo ╔═══════════════════════╗
echo ║ 📶 Lagswitch Options. ║
echo ╚═══════════════════════╝
echo • %Threads% Threads Per-Start.
echo.
echo %White%[Choose an option]
echo %Green%1. Start Lagswitch.
echo %DarkYellow%2. Stop Lagswitch.
echo %Red%3. Edit Lagswitch. 
set /p option="%White%Enter option number: "
echo %Green%
if "%option%"=="1" (
    goto :Lagswitch_Loop 
) else if "%option%"=="2" (
    echo ✔  Closing all %Threads% workers.
    taskkill /F /IM ping.exe >nul 2>&1
    timeout 2 > nul
    goto :Lagswitch_Options
) else if "%option%"=="3" (
    goto :Edit_Lagswitch
) else (
    cls
    chcp 437 >nul
    Powershell -NoProfile -Command "Write-Host 'Invalid choice, Please choose options 1-3.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :Lagswitch_Options
)

:: Lagswitch Loop.
:Lagswitch_Loop
cls
color A
chcp 65001 >nul 2>&1
echo ╔════════════════════╗
echo ║ 📶 Lagswitch Loop. ║
echo ╚════════════════════╝
for /l %%i in (1,1,%Threads%) do (
    start "Worker #%%i" /min cmd /c "ping -t -l %Payload% %Target%"
)
echo • All %Threads% workers launched minimized.
timeout 3 > nul
goto :Lagswitch_Options

:: Edit Lagswitch Variables.
:Edit_Lagswitch
cls
color A
chcp 65001 >nul 2>&1
echo ╔══════════════════════════════╗
echo ║ 📶 Edit Lagswitch Variables. ║
echo ╚══════════════════════════════╝
echo • Edit Ip Target, Payload and Thread Amount.
echo.
echo %White%[Choose an option]
echo %Green%1. Edit Target.
echo %Green%2. Edit Payload.
echo %Green%3. Edit Thread.
echo %Green%4. Back to Options.
set /p option="%White%Enter option number: "
echo %Green%
if "%option%"=="1" (
    goto :Custom_Target
) else if "%option%"=="2" (
    goto :Custom_Payload
) else if "%option%"=="3" (
    goto :Custom_Threads
) else if "%option%"=="4" (
    echo ✔  Going back to Lagswitch Options in 2 seconds.
    timeout 2 > nul
    goto :Lagswitch_Options
) else (
    cls
    chcp 437 >nul
    Powershell -NoProfile -Command "Write-Host 'Invalid choice, Please choose options 1-3.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :Edit_Lagswitch
)

:: Custom Lagswitch Target. 
:Custom_Target
cls
color A
chcp 65001 >nul 2>&1
echo ╔══════════════════════════════╗
echo ║ ✅ Enter your Custom Target. ║
echo ╚══════════════════════════════╝
echo • Target must be entered as an IP/DNS. (Example: 1.1.1.1)
echo. 
set /p Target="Enter option number: "
echo.
if %errorlevel%==0 (
   echo %Green%✔  Target "%Target%" applied successfully.
   echo.
   <nul set /p="→ Press any key to continue . . . "
   pause >nul
   goto :Edit_Lagswitch
) else (
   echo %Red%❌ Failed to apply custom target.
   timeout 2 > nul
   pause
   goto :Edit_Lagswitch
)

:: Custom Lagswitch Payload. 
:Custom_Payload
cls
color A
chcp 65001 >nul 2>&1
echo ╔═══════════════════════════════╗
echo ║ ✅ Enter your Custom Payload. ║
echo ╚═══════════════════════════════╝
echo • Payload must be entered as an amount. (Example: 1400)
echo. 
set /p Payload="Enter option number: "
echo.
if %errorlevel%==0 (
   echo %Green%✔  Payload "%Payload%" applied successfully.
   echo.
   <nul set /p="→ Press any key to continue . . . "
   pause >nul
   goto :Edit_Lagswitch
) else (
   echo %Red%❌ Failed to apply custom payload.
   timeout 2 > nul
   pause
   goto :Edit_Lagswitch
)

:: Custom Lagswitch Threads. 
:Custom_Threads
cls
color A
chcp 65001 >nul 2>&1
echo ╔═══════════════════════════════╗
echo ║ ✅ Enter your Custom Threads. ║
echo ╚═══════════════════════════════╝
echo • Threads must be entered as an amount. (Example: 150)
echo. 
set /p Threads="Enter option number: "
echo.
if %errorlevel%==0 (
   echo %Green%✔  Threads "%Threads%" applied successfully.
   echo.
   <nul set /p="→ Press any key to continue . . . "
   pause >nul
   goto :Edit_Lagswitch
) else (
   echo %Red%❌ Failed to apply custom threads.
   timeout 2 > nul
   pause
   goto :Edit_Lagswitch
)
:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/8NqDSMzYun

@echo off
title Split Svchost V1.0
color 9

:: Check for Admin Privileges.
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    Powershell -NoProfile -Command "Write-Host 'Split Svchost is required to be run as *Administrator.*' -ForegroundColor White -BackgroundColor Red" 
    Powershell -NoProfile -Command "Write-Host 'Please Click *Yes* to the following prompt!' -ForegroundColor White -BackgroundColor Red" 
    timeout 3 > nul
    Powershell -NoProfile Start -Verb RunAs '%0'
    exit /b 0
)

:: Group Svchost Start Screen.
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                           ███████╗██████╗ ██╗     ██╗████████╗                       
echo.                                           ██╔════╝██╔══██╗██║     ██║╚══██╔══╝                       
echo.                                           ███████╗██████╔╝██║     ██║   ██║                          
echo.                                           ╚════██║██╔═══╝ ██║     ██║   ██║                          
echo.                                           ███████║██║     ███████╗██║   ██║                          
echo.                                           ╚══════╝╚═╝     ╚══════╝╚═╝   ╚═╝                     
echo.                                                            
echo.                                 ███████╗██╗   ██╗ ██████╗██╗  ██╗ ██████╗ ███████╗████████╗
echo.                                 ██╔════╝██║   ██║██╔════╝██║  ██║██╔═══██╗██╔════╝╚══██╔══╝
echo.                                 ███████╗██║   ██║██║     ███████║██║   ██║███████╗   ██║   
echo.                                 ╚════██║╚██╗ ██╔╝██║     ██╔══██║██║   ██║╚════██║   ██║   
echo.                                 ███████║ ╚████╔╝ ╚██████╗██║  ██║╚██████╔╝███████║   ██║   
echo.                                 ╚══════╝  ╚═══╝   ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝       
echo. 
echo.                                  ╔════════════════════════════════════════════════════╗
echo.                                  ║              Version 1.0 - By Quaked               ║
echo.                                  ╚════════════════════════════════════════════════════╝
echo.
echo.
echo.
echo.
echo. 
echo. ╔═════════╗                                                                        
echo. ║ Loading ║                                              
echo. ╚═════════╝
timeout 2 > nul       

:: Spliting Svchost.
cls
color D
chcp 65001 >nul 2>&1
echo ╔══════════════════════╗
echo ║ ✅ Spliting Svchost! ║
echo ╚══════════════════════╝
chcp 437 >nul  

:: Spliting svchost.exe processes, based on RAM capacity in KB.  
for /f %%R in ('Powershell -NoProfile -Command "[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB) * 1024 * 1024"') do set "Ram_Amount_KB=%%R"
reg add "HKLM\System\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d %Ram_Amount_KB% /f

chcp 65001 >nul 2>&1
echo ✔  Split successfully.
timeout 2 > nul


:: Spliting Svchost End Screen.
cls
color 9
chcp 65001 >nul 2>&1
echo ╔════════════════════════╗
echo ║ ✅ Split Svchost Done! ║
echo ╚════════════════════════╝
echo ✔  Now Restarting in 5 seconds
timeout 5 > nul
shutdown /r /t 0 

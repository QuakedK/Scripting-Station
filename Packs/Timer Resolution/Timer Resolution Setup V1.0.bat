:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/8NqDSMzYun

@echo off
title Timer Resolution Setup V1.0
color A

:: Check for Admin Privileges. (Timer Resolution Setup requires elevated permissions)
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    Powershell -NoProfile -Command "Write-Host 'Timer Resolution Setup is required to be run as *Administrator.*' -ForegroundColor White -BackgroundColor Red" 
    Powershell -NoProfile -Command "Write-Host 'Please Click *Yes* to the following prompt!' -ForegroundColor White -BackgroundColor Red" 
    timeout 3 > nul
    Powershell -NoProfile Start -Verb RunAs '%0'
    exit /b 0
)

:: Checking if Timer Resolution Resources exist. 
if not exist "C:\Timer Resolution Resources" (
   goto :Download_Resources
) else (
   goto :VCRedist_Check
)

:: Downloading Timer Resolution Resources at start. (Includes SetTimerResolution, MeasureSleep, Micro-Adjust-Benchmark)
:Download_Resources
setlocal
set "FileURL=https://github.com/QuakedK/Scripting-Station/raw/refs/heads/main/Packs/Timer%%20Resolution/TimerResolutionResources.zip"
set "FileName=Timer Resolution Resources.zip"
set "ExtractFolder=C:\Timer Resolution Resources"
set "DownloadsFolder=C:\"
curl -s -L "%FileURL%" -o "%DownloadsFolder%\%FileName%"
if %errorlevel% equ 0 (
    mkdir "%ExtractFolder%" >nul 2>&1
    pushd "%ExtractFolder%" >nul 2>&1
    tar -xf "%DownloadsFolder%\%FileName%" --strip-components=1 >nul 2>&1
    popd >nul 2>&1
    del /q "C:\Timer Resolution Resources.zip" >nul 2>&1
    endlocal & goto :VCRedist_Check
) else (
    endlocal & goto :Resources_Download_Failed
)

:: Timer Resolution Resources failed to download.
:Resources_Download_Failed
cls
color C
chcp 65001 >nul 2>&1
echo ╔══════════════════════════════════════════════════════════╗
echo ║ ⚠️ Timer Resolution Resources Folder failed to download. ║
echo ╚══════════════════════════════════════════════════════════╝
echo • Please ensure you're connected to the internet.
echo.
chcp 437 >nul
Powershell -NoProfile -Command "Write-Host '[Choose an option]' -ForegroundColor Gray"
Powershell -NoProfile -Command "Write-Host '1. Retry - *Tries to download the tools folder again*' -ForegroundColor Green" 
Powershell -NoProfile -Command "Write-Host '2. Download Manually - *Open''s Github page*' -ForegroundColor Cyan"
Powershell -NoProfile -Command "Write-Host '3. Continue - *Skips*' -ForegroundColor DarkYellow"  
Powershell -NoProfile -Command "Write-Host 'Enter option number: ' -ForegroundColor Gray -NoNewline"
set /p option=
chcp 65001 >nul 2>&1
if "%option%"=="1" (
    cls
    color A
    echo ╔══════════════════════════════════════════════════╗
    echo ║ ✅ Retrying Timer Resolution Resources download. ║
    echo ╚══════════════════════════════════════════════════╝
    echo • Smart decision, attempting download again in 2 seconds!
    timeout 2 > nul
    cls
    chcp 437 >nul
    goto :Download_Resources
) else if "%option%"=="2" (
    cls
    color A
    echo ╔═════════════════════════╗
    echo ║ ✅ Opening Github Page. ║
    echo ╚═════════════════════════╝
    echo • Smart decision, launching Github page in 2 seconds!
    timeout 2 > nul
    start "" "https://github.com/QuakedK/Scripting-Station/blob/main/Packs/Timer%%20Resolution/TimerResolutionResources.zip"
    echo.
    <nul set /p="→ Press any key to continue . . . "
    goto :Resources_Download_Failed
) else if "%option%"=="3" (
    cls
    color A
    echo ╔════════════════╗
    echo ║ ✅ Continuing. ║
    echo ╚════════════════╝
    echo • Skipping in 2 seconds!
    timeout 2 > nul
    cls
    chcp 437 >nul
    goto :VCRedist_Check
) else (
    cls
    chcp 437 >nul
    Powershell -NoProfile -Command "Write-Host 'Invalid choice, Please choose options 1-3.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :Resources_Download_Failed
)

:: Check if Visual C++ 2015-2022 Redistributable (x64) is installed. (Needed for SetTimerResolution, etc)
:VCRedist_Check
del /q "Timer Resolution Resources.zip" >nul 2>&1
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64" > nul 2>&1
if %errorlevel% == 0 (
    echo [%DATE% %TIME%] VCRuntime Check: Visual C++ 2015-2022 Redistributable is installed.  >> "C:\Oneclick Logs\Oneclick Log.txt"
    goto :Winver_Check
) else (
    echo [%DATE% %TIME%] VCRuntime Check: Visual C++ 2015-2022 Redistributable is not installed.  >> "C:\Oneclick Logs\Oneclick Log.txt"
    goto :VCRuntime_Download
)

:: Download Visual C++ 2015-2022 Redistributable.
:VCRuntime_Download
setlocal
cls
color C
chcp 65001 >nul 2>&1
echo ╔════════════════════════════════════════════════════════╗
echo ║ ⚠️ Visual C++ 2015-2022 Redistributable not installed. ║
echo ╚════════════════════════════════════════════════════════╝
echo • Downloading Runtimes!
mkdir "C:\VC Redist" >nul 2>&1
set "FileURL=https://aka.ms/vs/17/release/vc_redist.x64.exe"
set "FileName=VC_redist.x64.exe"
set "DownloadsFolder=C:\VC Redist"
curl -s -L "%FileURL%" -o "%DownloadsFolder%\%FileName%"
if exist "%DownloadsFolder%\%FileName%" (
   echo.
   chcp 437 >nul   
   Powershell -NoProfile -Command "Write-Host '1. Visual C++ 2015-2022 Redistributable downloaded successfully.' -ForegroundColor Green"
   Powershell -NoProfile -Command "Write-Host '2. Now automatically starting the installer <3' -ForegroundColor Green"
   echo.
   start "" "C:\VC Redist\VC_redist.x64.exe" /install /passive /norestart
   Powershell -NoProfile -Command "Write-Host 'Press any key to continue . . . ' -ForegroundColor Green -NoNewline"
   pause >nul
   rd /s /q "C:\VC Redist" >nul 2>&1
   cls
   chcp 437 >nul
   goto :Winver_Check
) else (
   rd /s /q "C:\VC Redist" >nul 2>&1
   goto :VCRuntime_Download_Failed
)
endlocal

:: Visual C++ 2015-2022 Redistributable Download Failed.
:VCRuntime_Download_Failed
cls
color C
chcp 65001 >nul 2>&1
echo ╔═════════════════════════════════════════════════════════════╗
echo ║ ⚠️ Visual C++ 2015-2022 Redistributable failed to download. ║
echo ╚═════════════════════════════════════════════════════════════╝
echo • Please ensure you're connected to the internet.
echo.
chcp 437 >nul
Powershell -NoProfile -Command "Write-Host '[Choose an option]' -ForegroundColor Gray"
Powershell -NoProfile -Command "Write-Host '1. Retry - *Tries to download VCRuntimes again*' -ForegroundColor Green" 
Powershell -NoProfile -Command "Write-Host '2. Download Manually - *Open''s the Microsoft download page*' -ForegroundColor Cyan" 
Powershell -NoProfile -Command "Write-Host '3. Continue - *Skips*' -ForegroundColor DarkYellow"  
Powershell -NoProfile -Command "Write-Host 'Enter option number: ' -ForegroundColor Gray -NoNewline"
set /p option=
chcp 65001 >nul 2>&1
if "%option%"=="1" (
    cls
    color A
    echo ╔══════════════════════════════════╗
    echo ║ ✅ Retrying VCRuntimes download. ║
    echo ╚══════════════════════════════════╝
    echo • Smart decision, attempting download again in 2 seconds!
    timeout 2 > nul
    goto :VCRuntime_Download
) else if "%option%"=="2" (
    cls
    color A
    echo ╔════════════════════════════╗
    echo ║ ✅ Opening Microsoft Page. ║
    echo ╚════════════════════════════╝
    echo • Smart decision, launching the Microsoft page in 2 seconds!
    timeout 2 > nul
    start "" "https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170"
    echo.
    <nul set /p="→ Press any key to continue . . . "
    pause >nul
    goto :VCRuntime_Download_Failed
) else if "%option%"=="3" (
    cls
    color A
    echo ╔════════════════╗
    echo ║ ✅ Continuing. ║
    echo ╚════════════════╝
    echo • Skipping in 2 seconds!
    timeout 2 > nul
    cls
    chcp 437 >nul
    goto :Winver_Check
) else (
    cls
    chcp 437 >nul
    Powershell -NoProfile -Command "Write-Host 'Invalid choice, Please choose options 1-3.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :VCRuntime_Download_Failed
)

:: Check for Windows 11 Version.
:Winver_Check
setlocal enabledelayedexpansion
for /f "tokens=3" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild') do set CurrentBuild=%%A
if !CurrentBuild! GEQ 22000 (
    goto :Global_RegKey
) else (
    goto :Win_Server_Check   
)
endlocal

:: Check for Windows Server Version. (Server Versions can use GlobalTimerResolutionRequests)
:Win_Server_Check 
setlocal enabledelayedexpansion
for /f "tokens=3*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set "ProductName=%%A %%B"
echo !ProductName! | find /i "Server" >nul
if !errorlevel! == 0 (
    goto :Global_RegKey
) else (
    goto :BCDEdit
)
endlocal

:: Setup GlobalTimerResolutionRequests Registry Key. (For Win 11+)
:Global_RegKey
cls
color A
chcp 65001 >nul 2>&1
echo ╔══════════════════════════════════════════════╗
echo ║ ✅ Setting up GlobalTimerResolutionRequests. ║
echo ╚══════════════════════════════════════════════╝

echo • Adding GlobalTimerResolutionRequests Reg Key.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f >nul 2>&1

echo ✔  Globals applied successfully.
timeout 2 > nul

:: BCDEdit Tweaks.
:BCDEdit
cls
color A
chcp 65001 >nul 2>&1
echo ╔═════════════════════════════╗
echo ║ ✅ Applying BCDEdit Tweaks. ║
echo ╚═════════════════════════════╝

echo • Deleting useplatformclock.
bcdedit /deletevalue useplatformclock >nul 2>&1

echo • Setting useplatformtick.
bcdedit /set useplatformtick no >nul 2>&1

echo • Disabling dynamictick.
bcdedit /set disabledynamictick yes >nul 2>&1

echo ✔  BCDEdit Tweaks applied successfully.
timeout 1 > nul

:: PowerShell Execution Policy.
chcp 437 >nul
Powershell -NoProfile -Command "Set-ExecutionPolicy Unrestricted -Force"

:: Done.
:Done
cls
color A
chcp 65001 >nul 2>&1
echo ╔════════════════════════════════════╗
echo ║ ✅ Timer Resolution Setup is done. ║
echo ╚════════════════════════════════════╝
echo • Closing in 5 seconds!
timeout 5 > nul
exit

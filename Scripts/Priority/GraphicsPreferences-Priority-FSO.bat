@echo off

:: Games & Apps Graphics Preferences, Priority and FSO.
cls
color D
chcp 65001 >nul 2>&1
echo ╔═════════════════════════════════════════════════════════╗
echo ║ ✅ Auto Setting Graphics Preferences, Priority and FSO. ║
echo ╚═════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion

:: Roblox Path.
for /f "delims=" %%F in ('dir "C:\Program Files (x86)\Roblox\Versions\version-*" /ad /b /o:-d') do (
    set "LatestRobloxPath=C:\Program Files (x86)\Roblox\Versions\%%F\RobloxPlayerBeta.exe"
    goto :End1
)
:End1

:: Discord Path.
for /f "delims=" %%D in ('dir "%USERPROFILE%\AppData\Local\Discord\app-*" /ad /b /o:-d') do (
    set "LatestDiscordPath=%USERPROFILE%\AppData\Local\Discord\%%D\Discord.exe"
    goto :End2
)
:End2

:: Games Paths.
set "games[0]=%LatestRobloxPath%"
set "games[1]=C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe"
set "games[2]=C:\Program Files\Epic Games\RocketLeague\Binaries\Win64\RocketLeague.exe"
set "games[3]=C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\bin\win64\cs2.exe"
set "games[4]=C:\Program Files (x86)\Steam\steamapps\common\Tom Clancy's Rainbow Six Siege\RainbowSix.exe"
set "games[5]=C:\Program Files (x86)\Steam\steamapps\common\Overwatch\Overwatch.exe"
set "games[6]=C:\Program Files (x86)\Steam\steamapps\common\Trove\Games\Trove\Live\Trove.exe"
set "games[7]=C:\Program Files (x86)\Steam\steamapps\common\VRChat\VRChat.exe"
set "games[8]=C:\Program Files (x86)\Steam\steamapps\common\FPSAimTrainer\FPSAimTrainer.exe"
set "games[9]=C:\Program Files (x86)\Steam\steamapps\common\Mafia The Old Country\MafiaTheOldCountry\Binaries\Win64\MafiaTheOldCountry.exe"
set "games[10]=C:\Program Files (x86)\Steam\steamapps\common\The Forest\TheForest.exe"
set "games[11]=C:\Program Files (x86)\Steam\steamapps\common\Dying Light 2\ph\work\bin\x64\DyingLightGame_x64_rwdi.exe"
set "games[12]=C:\Program Files (x86)\Steam\steamapps\common\Schedule I\Schedule I.exe"
set "games[13]=C:\Program Files (x86)\Steam\steamapps\common\Far Cry 3\bin\farcry3_d3d11.exe"
set "games[14]=C:\Program Files (x86)\Steam\steamapps\common\Sons Of The Forest\SonsOfTheForest.exe"
set "games[15]=C:\Program Files (x86)\Steam\steamapps\common\Mafia Definitive Edition\mafiadefinitiveedition.exe"
set "games[16]="C:\Program Files (x86)\Steam\steamapps\common\The Outlast Trials\OPP\Binaries\Win64\TOTClient-Win64-Shipping.exe"
set "games[17]=%USERPROFILE%\AppData\Local\osu!\osu!.exe"
set "games[18]=C:\Riot Games\VALORANT\live\VALORANT.exe"
set "games[19]=C:\Program Files\Epic Games\VALORANT\VALORANT.exe"
set "games[20]=C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V\GTA5.exe"
set "games[21]=C:\Program Files\Epic Games\GTAV\GTAV.exe"
set "games[22]=C:\Program Files\Rockstar Games\Grand Theft Auto V\GTA5.exe"
set "games[23]=C:\Program Files\Epic Games\Apex\Apex.exe"
set "games[24]=C:\Program Files (x86)\Steam\steamapps\common\Apex Legends\Apex Legends.exe"
set "games[25]=C:\Program Files (x86)\Electronic Arts\Apex\Apex.exe"
set "games[26]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops\BlackOps.exe"
set "games[27]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops II\BlackOps2.exe"
set "games[28]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops III\BlackOps3.exe"
set "games[29]=C:\Program Files (x86)\Battle.net\Call of Duty Black Ops 4\BlackOps4.exe"
set "games[30]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops Cold War\BlackOpsColdWar.exe"
set "games[31]=C:\Program Files (x86)\Battle.net\Call of Duty Black Ops Cold War\BlackOpsColdWar.exe"
set "games[32]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops 6\BlackOps6.exe"
set "games[33]=C:\Program Files (x86)\Battle.net\Call of Duty Black Ops 6\BlackOps6.exe"
set "games[34]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Modern Warfare\modernwarfare.exe"
set "games[35]=C:\Program Files (x86)\Battle.net\Call of Duty Modern Warfare\modernwarfare.exe"
set "games[36]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Modern Warfare II\cod22-cod.exe"
set "games[37]=C:\Program Files (x86)\Battle.net\Call of Duty Modern Warfare II\cod22-cod.exe"
set "games[38]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Modern Warfare III\cod23-cod.exe"
set "games[39]=C:\Program Files (x86)\Battle.net\Call of Duty Modern Warfare III\cod23-cod.exe"
set "games[40]=C:\Program Files\Genshin Impact\Genshin Impact Game\GenshinImpact.exe"
set "games[41]=C:\Program Files\Epic Games\Genshin Impact\Genshin Impact Game\GenshinImpact.exe"
set "games[42]=C:\Program Files (x86)\Steam\steamapps\common\Dead by Daylight\DeadByDaylight\Binaries\Win64\DeadByDaylight-Win64-Shipping.exe"
set "games[43]=C:\Program Files\Epic Games\Dead by Daylight\DeadByDaylight\Binaries\Win64\DeadByDaylight-EGS-Shipping.exe"
set "games[44]=C:\Program Files (x86)\Steam\steamapps\common\Aimlabs\AimLab_tb.exe"
set "games[45]=C:\Program Files\Epic Games\Aimlabs\AimLab_tb.exe"
set "games[46]=C:\Program Files (x86)\Steam\steamapps\common\Tom Clancy's Rainbow Six Siege\RainbowSix.exe"
set "games[47]=C:\Program Files (x86)\Ubisoft\Ubisoft Game Launcher\games\Tom Clancy's Rainbow Six Siege\RainbowSix.exe"

:: Apps Paths. 
set "apps[0]=%LatestDiscordPath%"
set "apps[1]=%USERPROFILE%\AppData\Roaming\Spotify\Spotify.exe"
set "apps[2]=C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe"
set "apps[3]=C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe"
set "apps[4]=C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\EpicWebHelper.exe"
set "apps[5]=C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\CrashReportClient.exe"
set "apps[6]=C:\Program Files (x86)\Steam\Steam.exe"
set "apps[7]=C:\Program Files (x86)\Steam\bin\cef\cef.win7x64\steamwebhelper.exe"
set "apps[8]=C:\Program Files (x86)\Battle.net\Battle.net.exe"
set "apps[9]=C:\Program Files\Core Temp\Core Temp.exe"
set "apps[10]=C:\Program Files (x86)\CapFrameX\CapFrameX.exe"
set "apps[11]=C:\Program Files\CPUID\HWMonitor\HWMonitor.exe"
set "apps[12]=C:\Program Files\VideoLAN\VLC\vlc.exe"
set "apps[13]=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "apps[14]=C:\Program Files\Open-Shell\StartMenu.exe"
set "apps[15]=C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
set "apps[16]=%USERPROFILE%\AppData\Local\Programs\Opera GX\launcher.exe"
set "apps[17]=C:\Windows\explorer.exe"

:: Other Paths. (Applies Only High Priority)
set "other[0]=Adobe Premiere Pro.exe"
set "other[1]=VegasPro.exe"
set "other[2]=Resolve.exe"
set "other[3]=blender.exe"
set "other[4]=shotcut.exe"
set "other[5]=HandBrake.exe"
set "other[6]=capcut.exe"
set "other[7]=Cinebench.exe"
set "other[8]=3DMark.exe"
set "other[9]=LatMon.exe"
set "other[10]=y-cruncher.exe"
set "other[11]=TM5.exe"
set "other[12]=linpack_xeon64.exe"
set "other[13]=node.exe"
set "other[14]=WinRAR.exe"
set "other[15]=UnRAR.exe"
set "other[16]=Rar.exe"
set "other[17]=7zFM.exe"
set "other[18]=7zG.exe"
set "other[19]=7z.exe"

:: Registry Keys.
set regKeyGP=HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences
set regKeyPR=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options
set regKeyFO=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers

:: Set Games to High Performance and High Priority.
for /L %%i in (0, 1, 43) do (
    set "currentPath=!games[%%i]!"
    if exist "!currentPath!" (
        for %%a in (!currentPath!) do set "exeName=%%~nxa"
        echo Adding !exeName! to High Performance Mode, High Priority and FSO.
        reg add "%regKeyGP%" /v "!currentPath!" /t REG_SZ /d "GpuPreference=2" /f >nul 2>&1
        reg add "%regKeyPR%\!exeName!\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
        reg add "%regKeyFO%" /v "!currentPath!" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f >nul 2>&1
    ) else (
        echo !currentPath! does not exist >nul 2>&1
    )
)

:: Set Apps to Power Saving and Low Priority.
for /L %%i in (0, 1, 17) do (
    set "currentPath=!apps[%%i]!"
    if exist "!currentPath!" (
        for %%a in (!currentPath!) do set "exeName=%%~nxa"
        echo Adding !exeName! to Power Saving Mode and Low Priority.
        reg add "%regKeyGP%" /v "!currentPath!" /t REG_SZ /d "GpuPreference=1" /f >nul 2>&1
        reg add "%regKeyPR%\!exeName!\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f >nul 2>&1 
    ) else (
        echo !currentPath! does not exist >nul 2>&1
    )
)

:: Set Other Paths to High Priority
for /L %%i in (0, 1, 19) do (
    set "exeName=!other[%%i]!"
    reg add "%regKeyPR%\!exeName!\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
)

endlocal

echo ✔  Graphics Preferences, Priority and FSO applied successfully.
timeout 999 > nul



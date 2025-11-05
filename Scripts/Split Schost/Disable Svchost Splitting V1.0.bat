:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/8NqDSMzYun

@echo off
title Disable Svchost Splitting V1.0
color 9

:: Split Svchost Disabler
cls
chcp 65001 >nul 2>&1
echo ╔═════════════════════════════╗
echo ║ ✅ Disabling Split Svchost. ║
echo ╚═════════════════════════════╝

:: Split SvcHost. (Effectively disables process splitting by using the maximum possible DWORD value)
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "4294967295" /f 

echo ✔  Svchost Splitting disabled successfully.
timeout 2 > nul

:: End Screen.
cls
color D
chcp 65001 >nul 2>&1
echo ╔════════════════════════════════════╗
echo ║ ✅ Disable Svchost Splitting Done! ║
echo ╚════════════════════════════════════╝
echo ✔  Now Restarting in 5 seconds
timeout 5 > nul
shutdown /r /t 0 


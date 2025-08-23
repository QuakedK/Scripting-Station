# Deprecated Docs
Deprecated Docs is a info based docket, containing info regarding things I found to be Deprecated.

![Deprecated (4K)](https://github.com/user-attachments/assets/973450df-0d3f-4412-8245-a08f09fd4ebd)

# #1 Services
1. [Xbox Game Monitoring/xbgm Service](https://revertservice.com/10/xbgm/) Only on Win 10 1703–1803, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v "Start" /t REG_DWORD /d 4 /f
``` 
2. [OS Remediation System Service/Ossrs](https://www.askvg.com/how-to-remove-or-disable-windows-setup-remediations-service-in-windows-10/) Only on Win 10 1507–1703, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ossrs" /v "Start" /t REG_DWORD /d 4 /f
```
3. [Bluetooth Handsfree Service/BthHFSrv](https://batcmd.com/windows/10/services/bthhfsrv/) Only on Win 10 1507–1709, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BthHFSrv" /v "Start" /t REG_DWORD /d 4 /f
```
4. [DataCollectionPublishingService/DcpSvc](https://batcmd.com/windows/10/services/dcpsvc/) Only on Win 10 1507–1607, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DcpSvc" /v "Start" /t REG_DWORD /d 4 /f
```
5. [Fax Service/Fax](https://batcmd.com/windows/11/services/fax/) Only on Win10 1507-22H2/Win 11 21H2, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Fax" /v "Start" /t REG_DWORD /d 4 /f
```
6. [HomeGroup Listener Service/HomeGroupListener](https://batcmd.com/windows/10/services/homegrouplistener/) Only on Win 10 1507-1709, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HomeGroupListener" /v "Start" /t REG_DWORD /d 4 /f
```
7. [HomeGroup Provider Service/HomeGroupProvider](https://batcmd.com/windows/10/services/homegroupprovider/) Only on Win 10 1507-1709, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HomeGroupProvider" /v "Start" /t REG_DWORD /d 4 /f
```
8. [Internet Explorer ETW Collector Service/IEEtwCollectorService](https://batcmd.com/windows/10/services/ieetwcollectorservice/) Only on Win 10 1507-1511, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IEEtwCollectorService" /v "Start" /t REG_DWORD /d 4 /f
```
9. [Touch Keyboard and Handwriting Panel Service/TabletInputService](https://batcmd.com/windows/11/services/tabletinputservice/) Only on Win 10 1507-22H2/Win 11 21H2, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d 4 /f
```
10. [Interactive Services Detection/UI0Detect](https://batcmd.com/windows/10/services/ui0detect/) Only on Win 10 1507-1709, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UI0Detect" /v "Start" /t REG_DWORD /d 4 /f
```
11. [Windows Store Service/WSService](https://batcmd.com/windows/10/services/wsservice/) Only on Win 10 1507-1511, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSService" /v "Start" /t REG_DWORD /d 4 /f
```

# #2 Command-line Tools
1. [Wmic](https://learn.microsoft.com/en-us/windows/win32/wmisdk/wmic) fully removed as of [Windows 11 24H2](https://en.wikipedia.org/wiki/Windows_11,_version_24H2), as Microsoft Shifts to PowerShell-based management and modern APIs, moving away from legacy command-line tools.

**Primary Replacement**
```powershell
Get-CimInstance – Replaces wmic path ... get
Invoke-CimMethod – Replaces wmic ... call
```

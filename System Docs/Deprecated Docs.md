# Deprecated Docs
Deprecated Docs is a info based docket, containing info regarding things I found to be Deprecated.

![Deprecated (4K)](https://github.com/user-attachments/assets/973450df-0d3f-4412-8245-a08f09fd4ebd)

# #1 Services
1. [Xbox Game Monitoring/xbgm Service](https://revertservice.com/10/xbgm/) Only on Win 10 1703–1803, deprecated on higher Windows Versions.
```bat
sc config xbgm start=disabled
``` 
2. [OS Remediation System Service/Ossrs](https://www.askvg.com/how-to-remove-or-disable-windows-setup-remediations-service-in-windows-10/) Only on Win 10 1507–1703, deprecated on higher Windows Versions.
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ossrs" /v Start /t REG_DWORD /d 4 /f
```

# #2 Command-line Tools
1. [Wmic](https://learn.microsoft.com/en-us/windows/win32/wmisdk/wmic) fully removed as of [Windows 11 24H2](https://en.wikipedia.org/wiki/Windows_11,_version_24H2), as Microsoft Shifts to PowerShell-based management and modern APIs, moving away from legacy command-line tools.

**Primary Replacement**
```powershell
Get-CimInstance – Replaces wmic path ... get
Invoke-CimMethod – Replaces wmic ... call
```

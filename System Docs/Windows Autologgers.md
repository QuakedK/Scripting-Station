# Windows Autologgers
Windows Autologgers is a info based docket, containing info regarding autologgers like how they can be disabled, and what issues may occur.

<img width="1650" height="1032" alt="image" src="https://github.com/user-attachments/assets/d93a1d9a-68db-4481-96bb-1038103be8ad" />

# How to disable them?
1. Open Registry Editor and paste ```HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger```.
2. Select any Autologger and change the "start dword" to "0" then restart.

> [!NOTE]
> If the Autologger doesn't contain a "start dword", simply right-click and add a new "Dword (32-Bit Value)" and rename it to "Start" and edit the value to "0"
> And the available enabled or disabled Autologgers can be found by opening ```Performance Monitor > Data Collector Sets > Startup Event Trace Sessions```.

# Which ones should we not disable?
```
EventLog-Application - Breaks file explorer on windows 11.
EventLog-System - Breaks file explorer on windows 11.
Tpm - May cause Anti-Cheat issues.
TPMProvisioningService - May cause Anti-Cheat issues.
DiagLog - May blocks the Diagnostic Policy Service which is needed for Minecraft.

More than likely, DiagLog isn't the only thing breaking Minecraft. 

```
# Full list
```
Cellcore
CimFSUnionFS-Filter
Circular Kernel Context Logger 
CloudExperienceHostOobe 
DefenderApiLogger 
DefenderAuditLogger 
DiagLog 
Diagtrack-Listener 
EventLog-Application 
EventLog-Security 
EventLog-System
FilterMgr-Logger
FaceTel 
LwtNetLog 
Mellanox-Kernel 
Microsoft-Windows-Rdp-Graphics-RdpIdd-Trace 
Microsoft-Windows-Setup 
NBSMBLOGGER 
NetCore 
NtfsLog 
PEAuthLog 
RadioMgr 
RdrLog 
ReadyBoot 
ReFSLog 
SetupPlatform 
SetupPlatformTel 
SpoolerLogger 
SQMLogger 
TCPIPLOGGER 
TileStore 
Tpm
TPMProvisioningService 
UBPM 
WdiContextLog 
WFP-IPsec Trace 
WiFiDriverIHVSession 
WiFiDriverIHVSessionRepro 
WiFiSession 
WMI_Traces 
```
# Acess Denied
```
DefenderApiLogger
DefenderAuditLogger
EventLog-Security
NetCore
RadioMgr
```
> [!NOTE]
> Opening [Nsudo](https://github.com/QuakedK/Task-Destroyer/blob/main/Downloads/NSudoLG.exe), checking "Enable All Prilvileges" and in the "Address Bar" typing "CMD" and pasting the following works.
> Defender needs to be disabled with [Dcontrol](https://github.com/QuakedK/Oneclick/raw/refs/heads/main/Downloads/V8.0/dControl.exe) otherwise DefenderApiLogger and DefenderAuditLogger will re-enable itself.

```
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\EventLog-Security" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NetCore" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RadioMgr" /v "Start" /t REG_DWORD /d "0" /f
```

# Services
Services Docs is a info based docket, containing info regarding things I found to be related to Windows Services.

![New Project (2) (1)](https://github.com/user-attachments/assets/f6665832-512f-4582-8882-93c04f67e7db)

# What are services?
Windows services are background programs that run to support the operating system and applications. They can handle tasks like networking, updates, printing, or security without needing direct user interaction. Some are essential for Windows to work properly, while others are optional depending on what features you use. Services can be disabled with Services.msc, SC Config Commands, or the Registry!

# Enable/Disable Services

**CMD:**
```
sc config [ServiceName] start= boot → Loaded by the kernel at boot
sc config [ServiceName] start= system → Loaded by Windows at system startup
sc config [ServiceName] start= auto → Starts automatically with Windows
sc config [ServiceName] start= demand → Manual start by user or app
sc config [ServiceName] start= disabled → Prevents the service from starting
```

**Registry:**
```
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ServiceName" /v Start /t REG_DWORD /d 0 /f  → Boot (kernel)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ServiceName" /v Start /t REG_DWORD /d 1 /f  → System (OS startup)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ServiceName" /v Start /t REG_DWORD /d 2 /f  → Automatic
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ServiceName" /v Start /t REG_DWORD /d 3 /f  → Manual (demand start)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ServiceName" /v Start /t REG_DWORD /d 4 /f  → Disabled
```

# SC Commands
```
sc query [service] – Check service status
sc queryex [service] – Check service status with PID
sc start [service] – Start a service
sc stop [service] – Stop a service
sc pause [service] – Pause a service
sc continue [service] – Resume a paused service
sc config [service] [options] – Change service configuration/startup type
sc delete [service] – Delete a service
sc failure [service] [options] – Set actions on service failure
sc qc [service] – View service configuration
sc sdshow [service] – Show service security descriptor
sc sdset [service] [SDDL] – Set service security descriptor
sc control [service] [code] – Send a custom command to a service
sc getkeyname [displayname] – Get service name from display name
sc getdisplayname [servicename] – Get display name from service name
sc enumdepend [service] – List dependent services
sc qdescription [service] – Show service description
```

# Appinfo Service
If **Application Information** is disabled, apps can't request admin permissions meaning you can't open the said apps requesting administrator. However disabling **Uac/User Account Control**, allows you to get away with disabling **AppInfo** 
because with UAC off Windows auto-runs apps with admin rights. Ignoring the request of admin that normally happens when UAC is enabled!

```bat
:: Disable Appinfo
sc config Appinfo start=disabled

:: Disable UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v EnableLUA /t REG_DWORD /d 0
```




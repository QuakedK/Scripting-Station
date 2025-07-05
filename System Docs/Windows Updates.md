# Windows Update Docs
Windows Update Docs is a info based docket, containing info regarding things I found to be related to Windows Updates.

![65bd86f316b61d97d0ebd70b_10692-10879 (1)](https://github.com/user-attachments/assets/6d01d801-e8b4-4fa6-bf49-df14ddb6478d)

# #1 Services
```bat
:: Update Orchestrator.
sc config UsoSvc start=disabled 

:: Windows Update.
sc config wuauserv start=disabled 

:: Microsoft Update Health Service. (May not exist unless installed)
sc config uhssvc start=disabled

:: Windows Update Medic Service. (Can only be disabled via reg)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 4 /f

:: Windows Modules Installer. (installs the updates)
sc config TrustedInstaller start=disabled

:: Delivery Optimization. (Downloads Updates)
sc config DoSvc start=disabled

:: Background Intelligent Transfer Service. (Used by Updates)
sc config BITS start=disabled
```

# #2 Task
```bat
:: Update Orchestrator Task.
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\Report policies" /F
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Maintenance Work" /F
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /F 
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /F 
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work" /F
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Work" /F
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work" /F
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScanAfterUpdate" /F
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScan_LicenseAccepted" /F
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\UIEOrchestrator" /F
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\UpdateModelTask" /F 
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /F
schtasks /Delete /TN "Microsoft\Windows\UpdateOrchestrator\UUS Failover Task" /F
schtasks /Delete /TN "Microsoft\Windows\WaaSMedic\PerformRemediation" /Disable
schtasks /Delete /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable
```

# #3 Reg Edit
```bat
:: Defer Updates.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgrade" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgradePeriod" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d "1" /f

:: Pause Updates. (3000 Years)
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings" /v PausedFeatureStatus /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings" /v PausedQualityStatus /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v FlightSettingsMaxPauseDays /t REG_DWORD /d 3650 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v PauseFeatureUpdatesEndTime /t REG_SZ /d "3000-11-06T14:03:37Z" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v PauseFeatureUpdatesStartTime /t REG_SZ /d "2023-11-06T14:03:37Z" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v PauseQualityUpdatesEndTime /t REG_SZ /d "3000-11-06T14:03:37Z" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v PauseQualityUpdatesStartTime /t REG_SZ /d "2023-11-06T14:03:37Z" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v PauseUpdatesExpiryTime /t REG_SZ /d "3000-11-06T14:03:37Z" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v PauseUpdatesStartTime /t REG_SZ /d "2023-11-06T14:03:37Z" /f
```

# #4 Exe's
```bat
:: UsoCoreWorker (Used by Updates)
"C:\Windows\System32\UsoClient.exe"

:: UsoClient (Tied to UsoCoreWorker)
"C:\Windows\UUS\amd64\MoUsoCoreWorker.exe"

:: UPFC (Updateability From SCM) | Note: Help Windows Updates by working with Servicing Component Manager (SCM)
"C:\Windows\System32\upfc.exe"

:: Delivery Optimization DLL. (Delivery Optimization has a dll instead of exe)
"C:\Windows\System32\DoSvc.dll"
"C:\Windows\System32\en-US\DoSvc.dll.mui"

:: Server Initiated Healing client. (Repairs update components silently)
"C:\Windows\System32\SIHClient.exe"
"C:\Windows\System32\en-US\sihclient.exe.mui"

:: Wuauclt. (Legacy Windows Update client, mostly deprecated post-Windows 10 1709)
"C:\Windows\System32\wuauclt.exe"

:: Wusa. (Windows Update Standalone Installer)
"C:\Windows\System32\wusa.exe"
"C:\Windows\System32\en-US\wusa.mui"

:: MusNotification, MusNotificationUx, MoNotificationUxStub (Windows Update Notifications & UX)
"C:\Windows\System32\MusNotification.exe"
"C:\Windows\System32\MoNotificationUxStub.exe"
"C:\Windows\System32\MoNotificationUxStub.exe"

:: WaaSMedicSvc.dll, WaaSMedicPS.dll, WaaSAssessment.dll. (Update Medic Self-Healing Framework)
"C:\Windows\System32\WaaSMedicSvc.dll"
"C:\Windows\System32\WaaSMedicPS.dll"
"C:\Windows\System32\WaaSAssessment.dll"
``` 

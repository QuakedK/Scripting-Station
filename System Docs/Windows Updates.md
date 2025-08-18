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
schtasks /Delete /TN "Microsoft\Windows\WaaSMedic\PerformRemediation" /F
schtasks /Delete /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /F
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
> [!NOTE]
> You can find more update related things in "C:\Windows\UUS\amd64"

```bat
:: UsoCoreWorker (Used by Updates)
"C:\Windows\System32\UsoClient.exe"
-----------------------------------------
"C:\Windows\WinSxS\amd64_microsoft-windows-update-uus-core_*\UsoClient.exe"

:: UsoClient (Tied to UsoCoreWorker)
"C:\Windows\UUS\amd64\MoUsoCoreWorker.exe"

:: UpdateAgent.dll, UpdateCompression.dll, updatecsp.dll, updatepolicy.dll, UpdateReboot.dll, UpgradeResultsUI.exe. (All Tied to Windows Updates)
"C:\Windows\System32\UpdateAgent.dll"
"C:\Windows\System32\UpdateCompression.dll"
"C:\Windows\System32\updatecsp.dll"
"C:\Windows\System32\updatepolicy.dll"
"C:\Windows\System32\en-US\UpdatePolicy.dll.mui"
"C:\Windows\System32\UpdateReboot.dll"
"C:\Windows\System32\UpgradeResultsUI.exe"
"C:\Windows\System32\en-US\UpgradeResultsUI.exe.mui"
-----------------------------------------
"C:\Windows\WinSxS\amd64_microsoft-onecore-u*latform-updateagent_*\UpdateAgent.dll"
"C:\Windows\WinSxS\amd64_microsoft-onecore-u*latform-updateagent_*\r\UpdateAgent.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-servicingstack_*\updateagent.dll"
"C:\Windows\WinSxS\x86_microsoft-windows-servicingstack_*\updateagent.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-servicingstack_*\UpdateCompression.dll"
"C:\Windows\WinSxS\x86_microsoft-windows-servicingstack_*\UpdateCompression.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-deltapackageexpander_*\UpdateCompression.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-deltapackageexpander_*\r\UpdateCompression.dll"
"C:\Windows\WinSxS\wow64_microsoft-windows-deltapackageexpander_*\UpdateCompression.dll"
"C:\Windows\WinSxS\wow64_microsoft-windows-deltapackageexpander_*\r\UpdateCompression.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-update-updatecsps_*\updatecsp.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-update-updatecsps_*\r\updatecsp.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy.resources_*\UpdatePolicy.dll.mui"
"C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy.resources_*\r\UpdatePolicy.dll.mui"
"C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy.resources_*\UpdatePolicyCore.dll.mui"
"C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy.resources_*\r\UpdatePolicyCore.dll.mui"
"C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy_*\updatepolicy.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy_*\r\updatepolicy.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy_*\updatepolicycore.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy_*\r\updatepolicycore.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-u*e-preview.resources_*\updatepolicycore.dll.mui"
"C:\Windows\WinSxS\amd64_microsoft-windows-u*policy-core-preview_*\updatepolicycore.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-update-aggregators_*\UpdateReboot.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-update-aggregators_*\r\UpdateReboot.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-security-spp-ux-dlg_*\UpgradeResultsUI.exe"
"C:\Windows\WinSxS\amd64_microsoft-windows-security-spp-ux-dlg_*\r\UpgradeResultsUI.exe"
"C:\Windows\WinSxS\amd64_microsoft-windows-s*pp-ux-dlg.resources_*\UpgradeResultsUI.exe.mui"

:: UPFC (Updateability From SCM) | Note: Help Windows Updates by working with Servicing Component Manager (SCM)
"C:\Windows\System32\upfc.exe"
-----------------------------------------
"C:\Windows\WinSxS\amd64_microsoft-windows-upfc_*\upfc.exe"
"C:\Windows\WinSxS\amd64_microsoft-windows-upfc_*\r\upfc.exe"

:: Update Orchestrator.
"C:\Windows\System32\UIEOrchestrator.exe"
-----------------------------------------
"C:\Windows\WinSxS\amd64_microsoft-windows-u*xis-uieorchestrator_*\UIEOrchestrator.exe*"
"C:\Windows\WinSxS\amd64_microsoft-windows-u*xis-uieorchestrator_*\UIEApi.dll*"

:: Delivery Optimization DLL. (Delivery Optimization has a dll instead of exe)
"C:\Windows\System32\DoSvc.dll"
"C:\Windows\System32\en-US\DoSvc.dll.mui"
-----------------------------------------
"C:\Windows\WinSxS\amd64_microsoft-windows-deliveryoptimization_*\dosvc.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-deliveryoptimization_*\r\dosvc.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-d*imization.resources_*\dosvc.dll.mui"

:: Server Initiated Healing client. (Repairs update components silently)
"C:\Windows\System32\SIHClient.exe"
"C:\Windows\System32\en-US\sihclient.exe.mui"
-----------------------------------------
"C:\Windows\WinSxS\amd64_serviceinitiatedhealing-client.resources_*\sihclient.exe.mui"
"C:\Windows\WinSxS\amd64_serviceinitiatedhealing-client.resources_*\r\sihclient.exe.mui"
"C:\Windows\WinSxS\amd64_serviceinitiatedhealing-client_*\SIHClient.exe"
"C:\Windows\WinSxS\amd64_serviceinitiatedhealing-client_*\r\SIHClient.exe"

:: Wuauclt. (Legacy Windows Update client, mostly deprecated post-Windows 10 1709)
"C:\Windows\System32\wuauclt.exe"
"C:\Windows\UUS\amd64\wuaucltcore.exe"

:: Wusa. (Windows Update Standalone Installer)
"C:\Windows\System32\wusa.exe"
"C:\Windows\System32\en-US\wusa.exe.mui"

:: MusUpdateHandlers.dll, MusUpdateHandlers1.dll (Modern Update Settings Handler)
"C:\Windows\System32\MusUpdateHandlers.dll"
"C:\Windows\System32\en-US\MusUpdateHandlers.dll.mui"
"C:\Windows\System32\MusUpdateHandlers1.dll"
"C:\Windows\System32\en-US\MusUpdateHandlers1.dll.mui"
-----------------------------------------
"C:\Windows\WinSxS\amd64_microsoft-windows-u*x-musupdatehandlers_\MusUpdateHandlers.dll*"
"C:\Windows\WinSxS\amd64_microsoft-windows-u*x-musupdatehandlers_\MusUpdateHandlers.dll1*"
"C:\Windows\WinSxS\amd64_microsoft-windows-u*ehandlers.resources_*\MusUpdateHandlers1.dll.mui"
"C:\Windows\WinSxS\amd64_microsoft-windows-u*ehandlers.resources_*\r\MusUpdateHandlers1.dll.mui"

:: MoNotification, MoNotificationUxStub (Windows Update Notifications & UX)
"C:\Windows\UUS\amd64\MoNotificationUx.exe"
"C:\Windows\System32\MoNotificationUxStub.exe"
-----------------------------------------
"C:\Windows\WinSxS\amd64_microsoft-windows-update-uus-core-ux_*\MoNotificationUx.exe"
"C:\Windows\WinSxS\amd64_microsoft-windows-u*n-preview.resources_*\MoNotificationUx.exe"
"C:\Windows\WinSxS\amd64_microsoft-windows-update-uus-core-ux_*\MoNotificationUxStub.exe"
"C:\Windows\WinSxS\amd64_microsoft-windows-u*n-preview.resources_*\MoNotificationUxStub.exe"

:: WaaSMedicAgent.exe, WaaSMedicSvc.dll, WaaSMedicPS.dll, WaaSAssessment.dll. (Update Medic Self-Healing Framework)
"C:\Windows\System32\WaaSMedicSvc.dll"
"C:\Windows\System32\WaaSMedicPS.dll"
"C:\Windows\System32\WaaSAssessment.dll"
"C:\Windows\UUS\amd64\WaaSMedicAgent.exe"
-----------------------------------------
"C:\Windows\WinSxS\amd64_microsoft-windows-waasassessment_*\WaaSAssessment.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasassessment_*\r\WaaSAssessment.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic_*\WaaSMedicPS.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic_*\r\WaaSMedicPS.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic_*\WaaSMedicSvc.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic_*\r\WaaSMedicSvc.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic_*\WaaSMedicSvcImpl.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic_*\r\WaaSMedicSvcImpl.dll"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic.resources_*\WaaSMedicSvcImpl.dll.mui"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic_*\WaaSMedicAgent.exe"
"C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic_*\r\WaaSMedicAgent.exe"

``` 

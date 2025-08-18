@echo off

:: Important Note, some things in C:\Windows\WinSxS won't delete even with (NSudo) due to insufficient permissions.

:: Delivery Optimization.
del "C:\Windows\System32\DoSvc.dll" /s /f /q 
del "C:\Windows\System32\en-US\DoSvc.dll.mui" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-deliveryoptimization_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-d*imization.resources_*") do rd /s /q "%%D"

:: Server Initiated Healing.
del "C:\Windows\System32\sihclient.exe" /s /f /q 
del "C:\Windows\System32\en-US\sihclient.exe.mui" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_serviceinitiatedhealing-client.resources_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_serviceinitiatedhealing-client_*") do rd /s /q "%%D"

:: MoNotification.
del "C:\Windows\System32\MoNotificationUxStub.exe" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-update-uus-core-ux_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-u*n-preview.resources_*") do rd /s /q "%%D"

:: Modern Update Settings Handler.
del "C:\Windows\System32\MusUpdateHandlers.dll" /s /f /q 
del "C:\Windows\System32\MusUpdateHandlers1.dll" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-u*x-musupdatehandlers_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-u*ehandlers.resources_*") do rd /s /q "%%D"

:: Update Orchestrator.
del "C:\Windows\System32\UIEOrchestrator.exe" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-u*xis-uieorchestrator_*") do rd /s /q "%%D"

:: Update
del "C:\Windows\System32\UpdateAgent.dll" /s /f /q 
del "C:\Windows\System32\UpdateCompression.dll" /s /f /q 
del "C:\Windows\SysWOW64\UpdateCompression.dll" /s /f /q 
del "C:\Windows\System32\updatecsp.dll" /s /f /q 
del "C:\Windows\System32\updatepolicy.dll" /s /f /q 
del "C:\Windows\System32\en-US\UpdatePolicy.dll.mui" /s /f /q 
del "C:\Windows\System32\UpdateReboot.dll" /s /f /q 
del "C:\Windows\System32\UpgradeResultsUI.exe" /s /f /q 
del "C:\Windows\System32\en-US\UpgradeResultsUI.exe.mui" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-onecore-u*latform-updateagent_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-servicingstack_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\x86_microsoft-windows-servicingstack_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-deltapackageexpander_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\wow64_microsoft-windows-deltapackageexpander_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-update-updatecsps_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy.resources_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-updatepolicy_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-u*e-preview.resources_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-u*policy-core-preview_") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-update-aggregators_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-security-spp-ux-dlg_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-s*pp-ux-dlg.resources_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-update-uus-core_*") do rd /s /q "%%D"

:: Updateability From SCM.
del "C:\Windows\System32\upfc.exe" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-upfc_*") do rd /s /q "%%D"

:: UsoClient.
del "C:\Windows\System32\UsoClient.exe" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-update-uus-core_*") do rd /s /q "%%D"

:: Windows Update Medic Service.
del "C:\Windows\System32\WaaSAssessment.dll" /s /f /q 
del "C:\Windows\System32\WaaSMedicPS.dll" /s /f /q 
del "C:\Windows\System32\WaaSMedicSvc.dll" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-waasassessment_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-waasmedic.resources_*") do rd /s /q "%%D"

:: Windows Update AutoUpdate Client.
del "C:\Windows\System32\wuauclt.exe" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-w*wsupdateclient-core_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-u*client-core-preview_*") do rd /s /q "%%D"

:: Windows Update Standalone Installer.
del "C:\Windows\System32\wusa.exe" /s /f /q 
del "C:\Windows\System32\en-US\wusa.exe.mui" /s /f /q 
del "C:\Windows\SysWOW64\wusa.exe" /s /f /q 
for /d %%D in ("C:\Windows\WinSxS\amd64_microsoft-windows-wusa.resources_*") do rd /s /q "%%D"
for /d %%D in ("C:\Windows\WinSxS\wow64_microsoft-windows-wusa_*") do rd /s /q "%%D"

:: Undocked Update Stack.
rd /s /q "C:\Windows\UUS" 

pause

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

# Application Information Service
**Application Information Service** or **Appinfo** is responsible for facilitating elevated privilege requests, meaning it allows apps to run as an administrator.

> [!CAUTION]
> If **Application Information** is disabled, apps can't request admin permissions meaning you can't open apps that request administrator. However disabling **Uac/User Account Control**, allows you to get away with disabling **AppInfo** 
because with UAC off Windows auto-runs apps with admin rights. Ignoring the request of admin that normally happens when UAC is enabled!

```bat
:: Disable Appinfo
sc config Appinfo start=disabled

:: Disable UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v EnableLUA /t REG_DWORD /d 0
```

# Capability Access Manager Service
**Capability Access Manager Service** or **camsvc** is responsible for managing permissions for apps to access certain system capabilities. 

> [!CAUTION]
> If **Capability Access Manager Service** is disabled using you're mic on games, discord or basically anything becomes impossible.

```bat
:: Disable camsvc
reg add "HKLM\SYSTEM\CurrentControlSet\Services\camsvc" /v Start /t REG_DWORD /d 4 /f
```

# Cryptographic Service
**Cryptographic Service** or **CryptSvc** is responsible for checking digital signatures of Windows files, manages root certificates, and is required for Windows Update, drivers, and Store apps. 

> [!CAUTION]
> If **Cryptographic Service*** is disabled, updates and certificate validation will fail. Windows protects this service with WRP (Windows Resource Protection), so it can’t easily be removed or disabled. However deleting in the registry works, but in my experince things like services.msc won't work due to weired UAC behavior after disabling CryptSvc. Disabling UAC seems to fix this issue.

```bat
reg delete "HKLM\System\CurrentControlSet\Services\CryptSvc" /f

:: Disable UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v EnableLUA /t REG_DWORD /d 0
```

# CoreMessaging Service
**CoreMessaging Service** or **CoreMessagingRegistrar** is a core Windows service used for manageing communication between system components.

> [!CAUTION]
> If CoreMessaging Service you'll get an infinite loading screen upon boot!        

```bat
:: Disable CoreMessagingRegistrar
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CoreMessagingRegistrar" /v Start /t REG_DWORD /d 4 /f
```

# DCOM Server Process Launcher Service
**DCOM Server Process Launcher Service** or **DcomLaunch** starts and manages COM and DCOM servers. These are components many Windows applications and services rely on to communicate with each other.

> [!CAUTION]
> If this service is stopped or disabled, Windows will not boot properly, since core processes (including system logon) depend on it. 

```bat
:: Disable DcomLaunch
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DcomLaunch" /v Start /t REG_DWORD /d 4 /f
```

# RPC Endpoint Mapper Service
**RPC Endpoint Mapper Service** or **RpcEptMapper** Resolves RPC interfaces identifiers to transport endpoints.

> [!CAUTION]
> If this service is stopped or disabled, programs using Remote Procedure Call (RPC) services will not function properly. And you won't be able to boot into windows!

```bat
:: Disable RpcEptMapper
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RpcEptMapper" /v Start /t REG_DWORD /d 4 /f
```

# Power Service
The **Power Service** manages power policy and system power events, like **sleep, hibernate, battery monitoring, energy efficiency, evice sleep states, power button actions and all power plans.

> [!CAUTION]
> If **Power Service** is disabled Power Plans will be broken.

```bat
:: Disable Power
sc config Power start=disabled
```

# Windows Management Instrumentation Service
**Windows Management Instrumentation Service** or **Winmgmt** is a core Windows service used for system management and monitoring. 

> [!CAUTION]
> If **Windows Management Instrumentation Service** is disabled tools that rely on WMI will not work if disabled, even anticheats tend to break. Confrimed Broken Anticheat: Rocket League

```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v Start /t REG_DWORD /d 4 /f
```

# All Services (Created from scratch)

```bat
:: Windows Services.

sc config AarSvc start=disabled 
sc config AJRouter start=disabled :: Seemingly doesn't exist on 24H2.
sc config ALG start=disabled
sc config AppIDSvc start=disabled :: Needs to be disabled in the registry.
sc config Appinfo start=disabled :: UAC needs to be disabled before disabling Appinfo otherwise apps won't be able to request admin permissions.
sc config AppMgmt start=disabled  :: Seemingly only on Pro/Enterprise verisons.
sc config AppReadiness start=disabled
sc config AppXSvc start=disabled :: Needs to be disabled in the registry.
sc config AssignedAccessManagerSvc start=disabled >nul 2>&1 :: Seemingly only on Pro/Enterprise verisons. 
sc config AudioEndpointBuilder start=auto :: Windows Audio, left auto.
sc config AudioSrv start=auto :: Windows Audio, left auto.
sc config autotimesvc start=disabled
sc config AxInstSV start=disabled

---------------------------------------------------

sc config BcastDVRUserService start=disabled :: Because it's a contains a random UserID disable via registry.
sc config BDESVC start=disabled >nul 2>&1
sc config BFE start=disabled :: Needs to be disabled in the registry.
sc config BITS start=disabled   
sc config BluetoothUserService start=disabled :: Because it's a contains a random UserID disable via registry.  
sc config BrokerInfrastructure start=auto :: Windows Core, left auto. 
sc config BTAGService start=disabled
sc config BthAvctpSvc start=disabled
sc config bthserv start=disabled 

---------------------------------------------------

sc config camsvc start=demand :: Windows Core, left manual. 
sc config CaptureService start=disabled :: Because it's a contains a random UserID disable via registry.  
sc config cbdhsvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config CDPSvc start=disabled
sc config CDPUserSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config CertPropSvc start=disabled
sc config ClipSVC start=disabled :: Needs to be disabled in the registry.
sc config CloudBackupRestoreSvc start=disabled :: Because it's a contains a random UserID disable via registry, also 23H2-24H2 only.
sc config cloudidsvc start=demand >nul 2>&1 
sc config COMSysApp start=disabled
sc config ConsentUxUserSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config CoreMessagingRegistrar start=auto :: Windows Core, left auto.
sc config CredentialEnrollmentManagerUserSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config CryptSvc start=auto :: Windows Core, left auto but can be disabled via deleting it's registry key.
sc config CscService start=disabled :: Seemingly only on Pro/Enterprise verisons.

---------------------------------------------------

sc config DcomLaunch start=auto :: Windows Core, left auto.
sc config dcsvc start=disabled
sc config defragsvc start=demand :: Left on Auto incase of a manual defrag.
sc config DeviceAssociationBrokerSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config DeviceAssociationService start=disabled
sc config DeviceInstall start=disabled
sc config DevicePickerUserSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config DevicesFlowUserSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config DevQueryBroker start=disabled
sc config Dhcp start=auto :: Windows Core, left auto.
sc config diagnosticshub.standardcollector.service start=disabled >nul 2>&1 :: Seemingly doesn't exist on 24H2. 
sc config DiagTrack start=disabled
sc config diagsvc start=disabled
sc config DispBrokerDesktopSvc start=disabled
sc config DisplayEnhancementService start=disabled
sc config DmEnrollmentSvc start=disabled
sc config dmwappushservice start=disabled
sc config Dnscache start=auto :: Windows Core, left auto.  
sc config dot3svc start=disabled
sc config DoSvc start=disabled :: Needs to be disabled in the registry. 
sc config DPS start=disabled  
sc config DsmSvc start=disabled
sc config DsSvc start=disabled 
sc config DusmSvc start=disabled 

---------------------------------------------------
 
sc config Eaphost start=disabled
sc config edgeupdate start=disabled
sc config edgeupdatem start=disabled
sc config EFS start=disabled
sc config embeddedmode start=disabled :: Needs to be disabled in the registry.  
sc config EntAppSvc start=disabled :: Needs to be disabled in the registry.
sc config EventLog start=disabled
sc config EventSystem start=disabled

---------------------------------------------------

sc config fdPHost start=disabled 
sc config FDResPub start=disabled 
sc config fhsvc start=disabled 
sc config FontCache start=disabled 
sc config FrameServer start=disabled
sc config FrameServerMonitor start=disabled 

---------------------------------------------------

sc config GameInputSvc start=disabled :: Exist's on 23H2-24H2, and is used by Microsoft Store, Xbox app games and UWP apps.
sc config gpsvc start=disabled :: Left auto, but can be disabled in the registry with NSudo.   
sc config GraphicsPerfSvc start=disabled

---------------------------------------------------
 
sc config hidserv start=demand :: Windows Core, left manual. 
sc config HvHost start=disabled

---------------------------------------------------

sc config icssvc start=disabled 
sc config IKEEXT start=disabled 
sc config InstallService start=disabled  
sc config InventorySvc start=disabled
sc config iphlpsvc start=auto :: Windows Core, left auto.
sc config IpxlatCfgSvc start=disabled

---------------------------------------------------

sc config KeyIso start=disabled
sc config KtmRm start=disabled

---------------------------------------------------

sc config LanmanServer start=disabled
sc config LanmanWorkstation start=disabled
sc config lfsvc start=disabled
sc config LocalKdc start=disabled
sc config LicenseManager start=disabled 
sc config lltdsvc start=disabled 
sc config lmhosts start=disabled 
sc config LSM start=auto :: Windows Core, left auto.
sc config LxpSvc start=disabled  

---------------------------------------------------
 
sc config MapsBroker start=disabled  
sc config McpManagementService start=disabled :: Seemingly only exist on 24H2.  
sc config MessagingService start=disabled :: Because it's a contains a random UserID disable via registry.
sc config MicrosoftEdgeElevationService start=disabled 
sc config MpsSvc start=auto :: Windows Core, left auto. 
sc config MSDTC start=disabled
sc config MSiSCSI start=disabled
sc config msiserver start=demand :: Windows Core, left manual. 

---------------------------------------------------

sc config NaturalAuthentication start=disabled
sc config NcaSvc start=disabled
sc config NcbService start=disabled
sc config NcdAutoSetup start=disabled
sc config ndu start=disabled
sc config Netlogon start=disabled
sc config Netman start=disabled
sc config netprofm start=demand :: Windows Core, left manual. 
sc config NetSetupSvc start=disabled
sc config NetTcpPortSharing start=disabled 
sc config NgcCtnrSvc start=disabled :: Needs to be disabled in the registry.
sc config NgcSvc start=disabled :: Needs to be disabled in the registry.
sc config NlaSvc start=disabled  
sc config NPSMSvc start=disabled :: Because it's a contains a random UserID disable via registry and 24H2 only.
sc config nsi start=auto :: Windows Core, left auto. 

---------------------------------------------------

sc config OneSyncSvc start=disabled  :: Because it's a contains a random UserID disable via registry.

---------------------------------------------------

sc config p2pimsvc start=disabled :: Seemingly doesn't exist on 24H2.
sc config p2psvc start=disabled :: Seemingly doesn't exist on 24H2.
sc config P9RdrService start=disabled :: Because it's a contains a random UserID disable via registry.
sc config PcaSvc start=disabled 
sc config PeerDistSvc start=disabled :: Seemingly only on Pro/Enterprise verisons.
sc config PenService start=disabled :: Because it's a contains a random UserID disable via registry.    
sc config perceptionsimulation start=disabled 
sc config PerfHost start=disabled
sc config PhoneSvc start=disabled
sc config PimIndexMaintenanceSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config pla start=disabled
sc config PlugPlay start=demand :: Sorta Windows Core, left auto. 
sc config PNRPAutoReg start=disabled :: Seemingly doesn't exist on 24H2.
sc config PNRPsvc start=disabled :: Seemingly doesn't exist on 24H2.
sc config PolicyAgent start=disabled
sc config Power start=auto :: Windows Core, left auto. 
sc config PrintDeviceConfigurationService start=disabled :: Seemingly only exist on 24H2.
sc config PrintNotify start=disabled 
sc config PrintScanBrokerService start=disabled :: Seemingly only exist on 24H2.   
sc config PrintWorkflowUserSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config ProfSvc start=auto :: Windows Core, left auto. 
sc config PushToInstall start=disabled

---------------------------------------------------

sc config QWAVE start=disabled

---------------------------------------------------

sc config RasAuto start=disabled
sc config RasMan start=disabled
sc config refsdedupsvc start=disabled :: Seemingly only exist on 24H2.   
sc config RemoteAccess start=disabled 
sc config RemoteRegistry start=disabled 
sc config RetailDemo start=disabled 
sc config RmSvc start=disabled
sc config RpcEptMapper start=auto :: Windows Core, left auto.    
sc config RpcLocator start=disabled
sc config RpcSs start=auto :: Windows Core, left auto. 

---------------------------------------------------
   
sc config SamSs start=disabled
sc config SCardSvr start=disabled
sc config ScDeviceEnum start=disabled 
sc config Schedule start=auto :: Windows Core, left auto.    
sc config SCPolicySvc start=disabled
sc config SDRSVC start=disabled
sc config seclogon start=disabled
sc config SecurityHealthService start=demand :: Windows Core, left manual.  
sc config SENS start=disabled
sc config Sense start=disabled :: Seemingly only on Pro/Enterprise verisons.
sc config SensorDataService start=disabled
sc config SensorService start=disabled
sc config SensrSvc start=disabled
sc config SEMgrSvc start=disabled
sc config SessionEnv start=disabled
sc config SgrmBroker start=disabled :: Needs to be disabled in the registry.
sc config SharedAccess start=disabled  
sc config SharedRealitySvc start=disabled :: Seemingly doesn't exist on 24H2. 
sc config ShellHWDetection start=disabled 
sc config shpamsvc start=disabled
sc config SmsRouter start=disabled
sc config smphost start=disabled
sc config SNMPTrap start=disabled
sc config sppsvc start=delayed-auto :: Sorta Windows Core, left auto.
sc config Spooler start=disabled
sc config SSDPSRV start=disabled
sc config ssh-agent start=disabled
sc config SstpSvc start=disabled 
sc config StateRepository start=auto :: Windows Core, left auto. 
sc config stisvc start=disabled
sc config StorSvc start=disabled 
sc config svsvc start=disabled
sc config swprv start=demand :: Sorta Windows Core, left manual.
sc config SysMain start=disabled
sc config SystemEventsBroker start=disabled :: Needs to be disabled in the registry.

---------------------------------------------------

sc config TapiSrv start=disabled
sc config TermService start=disabled
sc config TextInputManagementService start=auto :: Windows Core, left auto.
sc config Themes start=disabled
sc config TieringEngineService start=disabled 
sc config TimeBrokerSvc start=disabled :: Needs to be disabled in the registry.
sc config TokenBroker start=disabled
sc config TrkWks start=disabled 
sc config TroubleshootingSvc start=disabled
sc config TrustedInstaller start=demand :: Windows Core, left manual.
sc config tzautoupdate start=disabled

---------------------------------------------------

sc config UdkUserSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config UevAgentService start=disabled :: Seemingly only on Pro/Enterprise verisons.   
sc config uhssvc start=disabled :: May not exist unless installed.  
sc config UmRdpService start=disabled 
sc config UnistoreSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config upnphost start=disabled
sc config UserDataSvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config UserManager start=auto :: Windows Core, left auto.
sc config UsoSvc start=disabled

---------------------------------------------------

sc config VacSvc start=demand :: Seemingly doesn't exist on 24H2.
sc config VaultSvc start=disabled
sc config vds start=disabled
sc config vmicguestinterface start=disabled 
sc config vmicheartbeat start=disabled
sc config vmickvpexchange start=disabled 
sc config vmicrdv start=disabled
sc config vmicshutdown start=disabled
sc config vmictimesync start=disabled
sc config vmicvmsession start=disabled
sc config vmicvss start=disabled 
sc config VSS start=demand :: Sorta Windows Core, left manual.

---------------------------------------------------

sc config W32Time start=disabled  
sc config WaaSMedicSvc start=disabled :: Needs to be disabled in the registry.
sc config WalletService start=disabled
sc config WarpJITSvc start=disabled
sc config wbengine start=disabled
sc config WbioSrvc start=disabled
sc config Wcmsvc start=disabled
sc config wcncsvc start=disabled 
sc config WdNisSvc start=demand :: Windows Core, left manual. 
sc config WdiServiceHost start=disabled
sc config WdiSystemHost start=disabled
sc config WebClient start=disabled
sc config webthreatdefsvc start=disabled
sc config webthreatdefusersvc start=disabled :: Because it's a contains a random UserID disable via registry.
sc config Wecsvc start=disabled 
sc config WEPHOSTSVC start=disabled
sc config wercplsupport start=disabled
sc config WerSvc start=disabled
sc config WFDSConMgrSvc start=disabled 
sc config WiaRpc start=disabled
sc config WinDefend start=auto :: Windows Core, left auto. 
sc config Winmgmt start=auto :: Windows Core, left auto. 
sc config WinRM start=disabled
sc config wisvc start=disabled 
sc config WlanSvc start=disabled
sc config wlidsvc start=disabled
sc config wlpasvc start=disabled
sc config WManSvc start=disabled  
sc config wmiApSrv start=disabled
sc config WMPNetworkSvc start=disabled >nul 2>&1
sc config workfolderssvc start=disabled
sc config WpcMonSvc start=disabled
sc config WPDBusEnum start=disabled
sc config WpnService start=disabled
sc config WpnUserService start=disabled :: Because it's a contains a random UserID disable via registry.
sc config wscsvc start=delayed-auto :: Windows Core, left auto. 
sc config WSAIFabricSvc start=disabled :: Seemingly only exist on 24H2.   
sc config WSearch start=disabled
sc config Wuauserv start=disabled
sc config WwanSvc start=disabled  

---------------------------------------------------

sc config XblAuthManager start=disabled
sc config XblGameSave start=disabled
sc config XboxGipSvc start=disabled
sc config XboxNetApiSvc start=disabled

:: Windows Services Regs.
reg add "HKLM\System\CurrentControlSet\Services\AppIDSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\CaptureService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\cbdhsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\CDPUserSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\ClipSVC" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\CloudBackupRestoreSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\ConsentUxUserSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\CredentialEnrollmentManagerUserSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\DeviceAssociationBrokerSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\DevicePickerUserSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\DevicesFlowUserSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\EntAppSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\embeddedmode" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\MessagingService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\NgcSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\NgcCtnrSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\NPSMSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\OneSyncSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\P9RdrService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\PenService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\PrintWorkflowUserSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\TimeBrokerSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\UdkUserSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\UserDataSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\UnistoreSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\webthreatdefusersvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WpnUserService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f

:: Deprecated on Windows 11.
AppVClient
BthHFSrv 
DcpSvc
DialogBlockingService
Fax :: Techinally exist on Windows 11 21H2, but not beyond that.
HomeGroupListener
HomeGroupProvider
IEEtwCollectorService
TabletInputService :: Techinally exist on Windows 11 21H2, but not beyond that.
UI0Detect
WSService
```

# Taskbar Docs
Taskbar Docs is a info based docket, containing info regarding things I found to be related to the Taskbar.

![Taskbar Image](https://github.com/user-attachments/assets/cc63608d-628f-490f-9a4e-3ebd11c292ba)

# #1 Reg Edit
```bat
:: Reset Taskbar Pins via Reg.
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_DWORD /d "0" /f 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesChanges" /t REG_DWORD /d "0" /f 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesResolve" /t REG_DWORD /d "0" /f 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesVersion" /t REG_DWORD /d "0" /f 
```

# #2 Path
```bat
:: Typical Paths.
"%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"
"%ProgramData%\Microsoft\Windows\Start Menu\Programs"
"%AppData%\Microsoft\Internet Explorer\Quick Launch"
```

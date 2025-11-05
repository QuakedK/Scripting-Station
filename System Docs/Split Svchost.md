# Split Svchost Docs

# #1 What is svchost.exe?
svchost.exe (Service Host) is a generic host process in Windows that runs multiple system services.
Many Windows services don’t have their own process — instead, they are grouped under svchost.exe instances.
Grouping services saves memory and reduces the number of processes, but too many services in one svchost can cause instability if one service crashes.

# #2 What is a Svchost split?
Windows can split services into multiple svchost processes to balance memory usage and stability.
SvcHostSplitThresholdInKB is a registry value that tells Windows:
“If the memory used by all services in one svchost process exceeds this many KB, split some services into a new svchost process.”
Essentially, it’s a threshold for service grouping.
Default value is usually ~3.5 GB on 64-bit Windows, not the total RAM.

# #3 How to chanage your SvcHostSplitThreshold?
1. Open Regedit and go to the following path.
```
HKLM\System\CurrentControlSet\Control
```
2. Find the "SvcHostSplitThresholdInKB" Dword and with the following values or use [SvcHost Split Threshold Calculator](https://mr-muhammad-kashan.github.io/SvcHost-Split-Threshold-Guide/)
```
2GB = 2097152 Decimal/200000 Hexadecimal
4GB = 4194304 Decimal/400000 Hexadecimal
6GB = 6291456 Decimal/600000 Hexadecimal
8GB = 8388608 Decimal/800000 Hexadecimal
10GB = 10485760 Decimal/A00000 Hexadecimal
12GB = 12582912 Decimal/C00000 Hexadecimal
14GB = 14680064 Decimal/E00000 Hexadecimal
16GB = 16777216 Decimal/1000000 Hexadecimal
32GB = 33554432 Decimal/2000000 Hexadecimal
48GB = 50331648 Decimal/3000000 Hexadecimal
64GB = 67108864 Decimal/4000000 Hexadecimal
128GB = 134217728 Decimal/8000000 Hexadecimal

4TB = 4294967295 Decimal/ffffffff Hexadecimal
(This effectively disables process splitting by using the maximum possible DWORD value.)
```
<img width="1224" height="746" alt="image" src="https://github.com/user-attachments/assets/703f25c5-13f2-4864-b084-787fd8a3550f" />

# #4. Effectively disable process splitting by using the maximum possible DWORD value!
[Disable Svchost Splitting V1.0](https://github.com/QuakedK/Scripting-Station/blob/main/Scripts/Split%20Schost/Disable%20Svchost%20Splitting%20V1.0.bat)
```
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "4294967295" /f 
```

# #5. Automatically Change the value with a simple script!
1. Download and run [Split Svchost V1.0.bat](https://github.com/QuakedK/Scripting-Station/blob/main/Scripts/Split%20Schost/Split%20Svchost%20V1.0.bat) as admin!
<img width="978" height="512" alt="image" src="https://github.com/user-attachments/assets/07d19864-c614-46f5-bfb1-2f4e92344066" />

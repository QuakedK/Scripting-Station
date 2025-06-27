:: Log File Setup.
set LOGFILE="Yourpath\YourLogName.txt"
call :YourMainScript > %LOGFILE%
exit /B

:: Your Log Start.
:YourMainScript

:: YourMainScript Start Date & Time.
echo YourMainScript Started: %DATE% %TIME%

:: Your Script Goes here.

:: YourMainScript End Date & Time.
echo YourMainScript Ended: %DATE% %TIME%
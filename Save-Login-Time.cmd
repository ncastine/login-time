%echo off
REM Record login times. Use pure Batch script.
REM Put this in %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

REM Construct a filename that includes year and month.
REM Get the date part MM/DD/YYYY.
FOR /F "tokens=2" %%d IN ('date /t') DO (SET MONTH_DAY_YEAR=%%d)

ECHO Date: %MONTH_DAY_YEAR%

REM Extract the month number
FOR /F "tokens=1 delims=/" %%m IN ('ECHO %MONTH_DAY_YEAR%') DO (SET MONTH=%%m)

ECHO Month: %MONTH%

REM Extract the year
FOR /F "tokens=3 delims=/" %%y IN ('ECHO %MONTH_DAY_YEAR%') DO (SET YEAR=%%y)

ECHO Year: %YEAR%

REM Now construct path to file.
REM Note that Desktop may not be there on all Windows installations.
REM It may be remapped, and figuring out where is hard in pure Batch.
SET LOGIN_TIMES_FILE="%HOMESHARE%\Desktop\%YEAR% %MONTH% Login Times.log"

ECHO Using File: %LOGIN_TIMES_FILE%

REM Finally, record current date and time in the file
date /t >> %LOGIN_TIMES_FILE%
time /t >> %LOGIN_TIMES_FILE%

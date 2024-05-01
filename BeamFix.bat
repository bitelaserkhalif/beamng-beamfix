@echo off
rem  setlocal enableDelayedExpansion

Title EXTRACT JSON BEAMNG (FIND NO TEXTURE)
ver > nul
rem errorlevel reset
set autodetectver=false
for /f "delims== tokens=1,2" %%G in (config.txt) do set %%G=%%H

rem check autodetect
if %autodetectver% equ true (
	for /f "tokens=3" %%a in ('reg query "HKCU\Software\BeamNG\BeamNG.drive"  /V version  ^|findstr /ri "REG_SZ"') do set version=%%a
	for /f "tokens=3" %%a in ('reg query "HKCU\Software\BeamNG\BeamNG.drive"  /V userpath_override  ^|findstr /ri "REG_SZ"') do set userpath_override=%%a
	if %ERRORLEVEL% neq 0 goto defaultconfig
	goto customconfig
	)



goto menu
rem default value errorlevel is 0. if not 0 = no custom path set up
rem https://documentation.beamng.com/support/version/

REM Enter the path with quotation marks!
REM At this moment, only for json files! No support for old material.cs
REM WARNING, all files unpacked is gonna be overwritten!

:defaultconfig
cls
	for /f "tokens=1 delims=. " %%a in (%version%) do set VER_PATH=%%a.%%b
echo Detecting gamepath by registry is ON!
echo DEFAULT path config detected
set bNGmodPath=%homedrive%%homepath%\AppData\Local\BeamNG.Drive\%VER_PATH%\mods
echo Path default is loaded: %bNGmodPath% , game ver %version%, %VER_PATH%
pause
goto menu

:customconfig
cls
	for /f "tokens=1-3 delims=. " %%a in ("%version%") do set VER_PATH=%%a.%%b
echo Detecting gamepath by registry is ON!
echo CUSTOM path config detected
set bNGmodPath=%userpath_override%%VER_PATH%\mods\
echo Path default is loaded: %bNGmodPath% , game ver %version%, %VER_PATH%
pause
goto menu

REM Menu
:MENU
cls
ECHO.
ECHO ...............................................
ECHO MOD path is : %bNGmodPath%
ECHO Attempting to autodetect version : %autodetectver%
ECHO ...............................................
ECHO Press 1, or 2 to select your task, or 3 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - Extract JSONs
ECHO 2 - Extract JBEAMs
ECHO 3 - Extract LUAs
ECHO X - EXIT
ECHO.
SET /P M=Type 1, 2, 3, or X then press ENTER: 
IF /I %M%==1 GOTO JSONU
IF /I %M%==2 GOTO JBEAM
IF /I %M%==3 GOTO LUA
IF /I %M%==X GOTO EOF
ECHO Wrong option
pause
GOTO MENU

:JSONU
REM set variable for JSON unpack
CLS
ECHO ...............................................
ECHO For all JSON type 1
ECHO For material JSON type 2
ECHO For cancel type C
ECHO ...............................................
SET /P  M=Scan all JSON, or materials only? (may be inaccurate): 
IF /I %M%==1 set TOUNPACK="*\*.json" & goto JSONU2
IF /I %M%==2 set TOUNPACK="*\*.materials.json" & goto JSONU2
IF /I %M%==C goto MENU
ECHO INVALID
PAUSE
goto MENU

:JSONU2
REM set variable for texture legacy
CLS
ECHO %TOUNPACK%  filter used
ECHO ...............................................
ECHO Would you like to scan legacy textures (materials.cs)? C to cancel.
ECHO ...............................................
SET /P M=(Y/N/C): 
IF /I %M%==y set TOUNPACK=%TOUNPACK%  "*materials.cs" & goto UNPACK
IF /I %M%==n goto UNPACK
IF /I %M%==c goto MENU
ECHO INVALID, GO BACK
set TOUNPACK=""
PAUSE
goto JSONU

:LUA
REM set variable for JSON unpack
ECHO ...............................................
ECHO Unpack all LUAs
ECHO ...............................................
set TOUNPACK="*\*.lua"
PAUSE
goto UNPACK


:JBEAM
REM WORKING
ECHO ...............................................
ECHO Warning: big size!
ECHO ...............................................
set TOUNPACK="*\*.jbeam"
PAUSE
goto UNPACK

:UNPACK
CLS
echo %TOUNPACK%
pause
for %%f in (%bNGmodPath%\repo\*.zip) do (
echo UNPACK : %%f , file name is %%~nxf
7zip\7za.exe x "%%f" -ba -r -y %TOUNPACK% -o"unpacked\repo\%%~nxf"
)
echo.
echo 3RD PARTY MODS:
echo.
for %%f in (%bNGmodPath%\*.zip) do (
echo UNPACK : %%f , file name is %%~nxf
7zip\7za.exe x "%%f" -ba -r -y %TOUNPACK% -o"unpacked\%%~nxf"
)
pause
goto MENU

:EOF
ECHO BYE
rem todo : lower case, uppercase. also errors and conflicts
pause
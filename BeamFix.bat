@echo off
Title EXTRACT JSON BEAMNG (FIND NO TEXTURE)
ECHO Enter the path with quotation marks!
ECHO At this moment, only for json files! No support for old material.cs
ECHO WARNING, all files unpacked is gonna be overwritten!
set /p bNGmodPath=Path of beamng mod folder: 
echo.
echo REPO PARTY MODS:
echo.
for %%f in (%bNGmodPath%\repo\*.zip) do (
echo UNPACK : %%f , file name is %%~nxf
7zip\7za.exe x "%%f" -ba -r -y *\*.json -o"unpacked\repo\%%~nxf"
)
echo.
echo 3RD PARTY MODS:
echo.
for %%f in (%bNGmodPath%\*.zip) do (
echo UNPACK : %%f , file name is %%~nxf
7zip\7za.exe x "%%f" -ba -r -y *\*.json -o"unpacked\%%~nxf"
)
rem todo : lower case, uppercase. also errors and conflicts
pause
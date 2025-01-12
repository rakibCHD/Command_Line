@echo off
title Enhanced System Info Viewer
cls

echo Enhanced System Information Viewer
echo ==================================
echo.

echo System Information..
wmic os get Caption,OSArchitecture
echo.

echo Disk name..
wmic logicaldisk get name,Size,FreeSpace
echo.


echo Internet Configuration..
ipconfig
echo.

echo Running Processes..
tasklist
echo.

echo User Information..
echo User Name: %USERNAME%
echo Computer Name: %COMPUTERNAME%
echo.

echo Current Date and Time..
echo %DATE% %TIME%
echo.

echo Checking Internet Connectivity..
ping www.google.com -n 4
echo.

@echo off
echo Listing USB Devices...
wmic path Win32_PnPEntity where "DeviceID like 'USB%%'" get Name,DeviceID


pause

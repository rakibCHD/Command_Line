@echo off
title Enhanced System Info Viewer
cls

echo Enhanced System Information Viewer
echo ==================================
echo.

echo Current Date and Time..
echo ==================================
echo %DATE% %TIME%
echo.

echo User Information..
echo ==================================
echo User Name: %USERNAME%
echo Computer Name: %COMPUTERNAME%
echo.

echo System Information..
echo ==================================
wmic os get Caption,version,serialnumber,buildnumber,manufacturer,OSArchitecture
wmic path softwarelicensingservice get OA3xOriginalProductKey
echo.


echo Disk Info..Size in Byte..
echo ==================================
wmic logicaldisk get name,Size,FreeSpace
echo.

echo RAM Info...Capacity in Byte..
echo ==================================
wmic memorychip get capacity, devicelocator, manufacturer, memorytype, typeDetail
echo.

echo BIOS Information..
echo ==================================
wmic bios get name, version, manufacturer
echo.

echo Running Processes...
tasklist
echo.

echo Ports Info..
echo ==================================
echo Serial Communication Ports...
wmic path Win32_SerialPort get deviceid, caption, description

echo Network Ports...
wmic nic get name, deviceid, macaddress, status

echo USB Ports...
wmic path Win32_USBHub get deviceid, caption, description

echo Parallel Ports...
wmic path Win32_ParallelPort get deviceid, caption, description
echo.


echo Listing USB Devices..
echo ==================================
wmic path Win32_PnPEntity where "DeviceID like 'USB%%'" get Name,DeviceID

echo Internet Configuration..
ipconfig
echo.

echo Checking Internet Connectivity..
ping www.google.com -n 4
echo.

pause

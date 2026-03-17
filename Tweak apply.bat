@echo off
title Internet Optimizer by uhm_jakob7 (on discord)
color 2

echo.
echo.
echo.
echo                                       ==========================================
echo                                                INTERNET OPTIMIZATION TOOL
echo                                       ==========================================
echo.
echo.
echo.

:: Schritt 1
echo [ + ] Internet Cache gets deletet...
ipconfig /flushdns >nul 2>&1
timeout /t 1 >nul

:: Schritt 2
echo [ + ] TCP/IP Stack gets optimized...
netsh int ip reset >nul 2>&1
timeout /t 1 >nul

:: Step 3
echo [ + ] Winsock reset...
netsh winsock reset >nul 2>&1
timeout /t 1 >nul


:: Step 4
echo [ + ] Netzwerk-Latenz...
netsh interface tcp set global congestionprovider=ctcp >nul 2>&1
timeout /t 1 >nul

:: Step 5
echo [ + ] QoS gets deletet...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >nul 2>&1
timeout /t 1 >nul

:: Schritt 6
echo [ + ] Important Network Data gets Cleaned...
del /q /f /s "%TEMP%\*" >nul 2>&1
timeout /t 1 >nul

:: Ready
echo.
echo [ + ] Network got optimized!
echo [ + ] Restart your pc.
echo.

pause
exit
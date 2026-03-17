@echo off
title Internet Optimizer by uhm_jakob7 (on discord)
color 0C

echo.
echo.
echo.
echo                                      ==========================================
echo                                                RESTORE TWEAKS TOOL
echo                                      ==========================================
echo.
echo.
echo.

:: Schritt 1
echo [ + ] Network cache getting resetet...
ipconfig /flushdns >nul 2>&1
timeout /t 1 >nul

:: Schritt 2
echo [ + ] TCP/IP Stack resetet...
netsh int ip reset >nul 2>&1
timeout /t 1 >nul

:: Schritt 3
echo [ + ] Winsock resetet...
netsh winsock reset >nul 2>&1
timeout /t 1 >nul

:: Schritt 4
echo [ + ] TCP Settings comes back to normal settings...
netsh interface tcp set global autotuninglevel=normal >nul 2>&1
netsh interface tcp set global rss=default >nul 2>&1
netsh interface tcp set global chimney=default >nul 2>&1
timeout /t 1 >nul

:: Schritt 5
echo [ + ] Gets resetet...
netsh interface tcp set global congestionprovider=none >nul 2>&1
timeout /t 1 >nul

:: Schritt 6
echo [ + ] QoS gets resetet...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /f >nul 2>&1
timeout /t 1 >nul

:: Schritt 7
echo [ + ] Network getting updated...
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
timeout /t 1 >nul

:: Fertig
echo.
echo [ + ] Succsessfully resetet the tweaks!
echo [ + ] Restard PC.
echo.

pause
exit
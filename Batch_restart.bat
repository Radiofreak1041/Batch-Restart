@echo off
Title Self-restarting script
:Restart
Rem Put your code here. Example: java -Xms4G -Xmx4G -XX:+UseConcMarkSweepGC -jar spigot-1.14.2.jar

echo.
set time=10
echo.
:loop

    setlocal enableextensions enabledelayedexpansion

    for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
    for /f %%a in ('"prompt $H&for %%b in (0) do rem"') do set "BS=%%a"

    <nul set /p"=!BS!!CR!Terminate program? Close this window within %time% seconds^! "

set /a time=%time%-1
if %time%==0 goto timesup

ping localhost -n 2 > nul
goto loop

:timesup
echo.
echo.
echo Restarting...
echo.
goto Restart
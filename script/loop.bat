@echo off
echo =================================================================
echo  Starting infinite loop to keep the runner alive.
echo  This session will be terminated automatically after 6 hours.
echo  You can manually stop this from the GitHub Actions page.
echo =================================================================

:loop
echo [%TIME%] Runner is alive...
timeout /t 60 /nobreak >nul
goto loop

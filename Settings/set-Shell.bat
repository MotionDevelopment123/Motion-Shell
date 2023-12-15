@ECHO OFF
set /p CURRENT=<CURRENT.OPTION
ECHO The shell is currently set to %CURRENT%
ECHO.
ECHO Please select which module you would like to set as the shell, if you have not installed the module using the original installer and selecting the modile please do that first, each module installed using the installer will be set and can later be switched between different modules using this option.
ECHO.
ECHO.
ECHO 1. Steam
ECHO 2. Playnite Splash
ECHO 3. Playnite
ECHO 4. Custom
ECHO 5. Exit

set /p op=Please select:
if "%op%"=="1" goto Steam
if "%op%"=="2" goto Playnite-Splash
if "%op%"=="3" goto Playnite
if "%op%"=="4" goto Custom
if "%op%"=="5" goto end


:Steam
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Steam\Motion-Shell.exe" /f
set /p CURRENT=Steam
ECHO|set /p=%CURRENT%>CURRENT.OPTION
goto end

:Playnite-Splash
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Playnite\Motion-Shell.exe" /f
set /p CURRENT=Playnite-Splash
ECHO|set /p=%CURRENT%>CURRENT.OPTION
goto end

:Playnite
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Playnite\Motion-Shell.exe" /f
set /p CURRENT=Playnite
ECHO|set /p=%CURRENT%>CURRENT.OPTION
goto end

:Custom
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Custom\Motion-Shell.exe" /f
set /p CURRENT=Custom
ECHO|set /p=%CURRENT%>CURRENT.OPTION
goto end

:end
Exit
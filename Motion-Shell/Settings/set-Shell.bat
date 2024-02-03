@ECHO OFF
CLS
CD C:\Motion-Shell\Settings\
set /p CURRENT=<CURRENT.OPTION
ECHO The shell is currently set to %CURRENT%
ECHO.
ECHO Please select which module you would like to set as the shell.
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
START C:\Motion-Shell\Motion-Settings.exe
goto end

:Playnite-Splash
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Playnite\Motion-Shell.exe" /f
set /p CURRENT=Playnite
ECHO|set /p=%CURRENT%>CURRENT.OPTION
START C:\Motion-Shell\Motion-Settings.exe
goto end

:Playnite
CD C:\Motion-Shell\Playnite
set /p=PLAYNITE<PLAYNITE.LOCATION
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "%PLAYNITE%" /f
set /p CURRENT=Playnite
ECHO|set /p=%CURRENT%>CURRENT.OPTION
START C:\Motion-Shell\Motion-Settings.exe
goto end

:Custom
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Custom\Motion-Shell.exe" /f
set /p CURRENT=Custom
ECHO|set /p=%CURRENT%>CURRENT.OPTION
START C:\Motion-Shell\Motion-Settings.exe
goto end

:end
EXIT
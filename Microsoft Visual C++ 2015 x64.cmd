@ECHO OFF
start /w "" "%~dp0\vc_redist.x64.exe" /q /norestart
IF %ERRORLEVEL% == 3010 EXIT /B 0
EXIT /B %ERRORLEVEL%

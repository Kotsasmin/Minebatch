@ECHO OFF
start /w "" "%~dp0\vc_redist.x86" /q /norestart
IF %ERRORLEVEL% == 3010 EXIT /B 0
EXIT /B %ERRORLEVEL%

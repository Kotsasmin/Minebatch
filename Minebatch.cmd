@echo off
set version=0.5
title Loading...
color 9f
call:check
title Minebatch %version%
:menu1
cls
echo Menu (page: 1/3)
echo.
echo 1) Minecraft (5/5)
echo 2) Minecraft Dungeons (2/5)
echo 3) Minecraft Story Mode Season 1 (4/5)
echo 4) Minecraft Story Mode Season 2 (4/5)
echo 5) Minecraft Pocket Edition (2/5)
echo 6) TLauncher (4/5)
echo 7) Minecraft server soft (4/5)
echo 8) Page 2
echo 9) Exit
echo.
echo.
echo.
choice /c 123456789 /n /m "Select: "
if %errorlevel%==1 (goto mc)
if %errorlevel%==2 (goto dun)
if %errorlevel%==3 (goto mcsm)
if %errorlevel%==4 (goto mcsm2)
if %errorlevel%==5 (goto mcpe)
if %errorlevel%==6 (goto tl)
if %errorlevel%==7 (goto mcss)
if %errorlevel%==8 (goto menu2)
if %errorlevel%==9 (exit)



:menu2
cls
echo Menu (page: 2/3)
echo.
echo 1) Java (5/5)
echo 2) DirectX (4/5)
echo 3) uTorrent (5/5)
echo 4) opengl (2/5)
echo 5) Update "Minebatch"
echo 6) Help
echo 7) Found a bug or a broken link?
echo 8) Page 1
echo 9) Page 3
echo.
echo.
echo.
choice /c 123456789 /n /m "Select: "
if %errorlevel%==1 (goto java)
if %errorlevel%==2 (goto dirX)
if %errorlevel%==3 (goto torrent)
if %errorlevel%==4 (goto open)
if %errorlevel%==5 (goto update)
if %errorlevel%==6 (goto help)
if %errorlevel%==7 (goto bug)
if %errorlevel%==8 (goto menu1)
if %errorlevel%==9 (goto menu3)

:menu3
cls
echo Menu (page: 3/3)
echo.
echo 1) Wep pages
echo 2) Credits
echo 3) Contact and info
echo 4) Clean-up system
echo 5) Page 2
echo.
echo.
echo.
choice /c 12345 /n /m "Select: "
if %errorlevel%==1 (goto web)
if %errorlevel%==2 (goto credits)
if %errorlevel%==3 (goto contact)
if %errorlevel%==4 (goto clean)
if %errorlevel%==5 (goto menu2)




:mc
cls
echo Minecraft (5/5)
echo.
echo 1) Auto download/install/launch
echo 2) Manual download
echo 3) Launch
echo 4) Back
echo.
echo.
echo.
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto mc_download)
if %errorlevel%==2 (goto mc_manual_download)
if %errorlevel%==3 (goto mc_launch)
if %errorlevel%==4 (goto menu1)


:mc_download
cls
if exist %appdata%\.minecraft\Minecraft.exe start %appdata%\.minecraft\Minecraft.exe & goto menu1
echo Downloading Minecraft Launcher...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://launcher.mojang.com/download/Minecraft.exe" -o "%appdata%\.minecraft\Minecraft.exe"
start %appdata%\.minecraft\Minecraft.exe & goto menu1

:mc_manual_download
cls
echo Opening web page... After downloading it, please put it in that folder: %appdata%\.minecraft
echo.
echo.
echo.
start https://launcher.mojang.com/download/Minecraft.exe
start %appdata%\.minecraft
pause
goto menu1

:mc_launch
cls
if exist %appdata%\.minecraft\Minecraft.exe start %appdata%\.minecraft\Minecraft.exe & goto menu1
echo You have to install Minecraft first! Automatically or manually.
echo.
echo.
echo.
pause
goto menu1

:dun
cls
echo Minecraft Dungeons (2/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto dun_download)
if %errorlevel%==2 (goto dun_manual_download)
if %errorlevel%==3 (goto menu1)


:dun_download
cls
if exist %appdata%\.minecraft\dun.torrent start %appdata%\.minecraft\dun.torrent & goto menu1
echo Downloading Minecraft Dungeons...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://tlauncher.org/download/10524" -o "%appdata%\.minecraft\dun.torrent"
start %appdata%\.minecraft\dun.torrent & goto menu1

:dun_manual_download
cls
echo Opening web page...
echo.
echo.
echo.
start https://tlauncher.org/download/10524 & goto menu1


:mcsm
cls
echo Minecraft Story Mode Season 1 (4/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcsm_download)
if %errorlevel%==2 (goto mcsm_manual_download)
if %errorlevel%==3 (goto menu1)


:mcsm_download
cls
if exist %appdata%\.minecraft\mcsm.torrent start %appdata%\.minecraft\mcsm.torrent & goto menu1
echo Downloading Minecraft Story Mode Season 1...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://tlauncher.org/download/3494" -o "%appdata%\.minecraft\mcsm.torrent"
start %appdata%\.minecraft\mcsm.torrent & goto menu1


:mcsm_manual_download
cls
echo Opening web page...
echo.
echo.
echo.
start https://tlauncher.org/download/3494 & goto menu1


:mcsm2
cls
echo Minecraft Story Mode Season 2 (4/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcsm2_download)
if %errorlevel%==2 (goto mcsm2_manual_download)
if %errorlevel%==3 (goto menu1)


:mcsm2_download
cls
if exist %appdata%\.minecraft\mcsm2.torrent start %appdata%\.minecraft\mcsm2.torrent & goto menu1
echo Downloading Minecraft Story Mode Season 2...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://tlauncher.org/download/4585" -o "%appdata%\.minecraft\mcsm2.torrent"
start %appdata%\.minecraft\mcsm2.torrent & goto menu1


:mcsm2_manual_download
cls
echo Opening web page...
echo.
echo.
echo.
start https://tlauncher.org/download/4585 & goto menu1


:mcpe
cls
echo Minecraft Pocket Edition (2/5)
echo.
echo Minecraft Pocket Edition has two versions: Mod 1 and Mod 2.
echo.
echo.
echo 1) Mod 1 includes: Unlocked premium skins - Unlocked premium textures
echo 2) Mod 2 includes: Unlocked premium skins - Unlocked premium textures 
echo No damage mod - Unlimited breath - Max Inventory Size - ONE hit kill with weapons 
echo Max score - Indestructible Tools
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcpe1)
if %errorlevel%==2 (goto mcpe2)
if %errorlevel%==3 (goto menu1)


:mcpe1
cls
echo Minecraft Pocket Edition (Mod 1) (2/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcpe1_download)
if %errorlevel%==2 (goto mcpe1_manual_download)
if %errorlevel%==3 (goto mcpe)


:mcpe2
cls
echo Minecraft Pocket Edition (Mod 2) (2/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcpe2_download)
if %errorlevel%==2 (goto mcpe2_manual_download)
if %errorlevel%==3 (goto mcpe)



:mcpe1_download
cls
echo Downloading Minecraft Pocket Edition (MOD 1)... After the downloading, please copy the
echo file: mcpe1.apk from your Desktop to your phone. Then open the file from your phone
echo and do the installation!
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "http://s3.rexdl.com/android/game/Minecraft-v1.12.1.1-Mod1-www.ReXdl.com.apk" -o "%USERPROFILE%\Desktop\mcpe1.apk"
start %USERPROFILE%\Desktop
pause
goto menu1


:mcpe1_manual_download
cls
echo Opening web page... When the download is finished, copy the file to your phone
echo and do the installation from your phone!
echo.
echo.
echo.
start http://s3.rexdl.com/android/game/Minecraft-v1.12.1.1-Mod1-www.ReXdl.com.apk
pause>nul
goto menu1

:mcpe2_download
cls
echo Downloading Minecraft Pocket Edition (MOD 2)... After the downloading, please copy the
echo file: mcpe1.apk from your Desktop to your phone. Then open the file from your phone
echo and do the installation!
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "http://s3.rexdl.com/android/game/Minecraft-v1.12.1.1-Mod2-www.ReXdl.com.apk" -o "%USERPROFILE%\Desktop\mcpe2.apk"
start %USERPROFILE%\Desktop
pause
goto menu1


:mcpe2_manual_download
cls
echo Opening web page... When the download is finished, copy the file to your phone
echo and do the installation from your phone!
echo.
echo.
echo.
start http://s3.rexdl.com/android/game/Minecraft-v1.12.1.1-Mod2-www.ReXdl.com.apk
pause>nul
goto menu!

:tl
cls
echo TLauncher (4/5)
echo.
echo 1) Auto download/install/launch
echo 2) Manual download
echo 3) Launch
echo 4) Back
echo.
echo.
echo.
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto tl_download)
if %errorlevel%==2 (goto tl_manual_download)
if %errorlevel%==3 (goto tl_launch)
if %errorlevel%==4 (goto menu1)


:tl_download
cls
if exist %appdata%\.minecraft\TLauncher.exe start %appdata%\.minecraft\TLauncher.exe & goto menu1
echo Downloading TLauncher...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://tlauncher.org/exe" -o "%appdata%\.minecraft\TLauncher.exe"
start %appdata%\.minecraft\TLauncher.exe & goto menu1


:tl_manual_download
cls
if exist %appdata%\.minecraft\TLauncher.exe start %appdata%\.minecraft\TLauncher.exe & goto menu1
echo Opening web page... After downloading it, please put it in that folder: %appdata%\.minecraft
echo.
echo.
echo.
start https://tlauncher.org/exe
start %appdata%\.minecraft
pause
goto menu1


:tl_launch
cls
if exist %appdata%\.minecraft\TLauncher.exe start %appdata%\.minecraft\TLauncher.exe & goto menu1
echo You have to install TLauncher first! Automatically or manually.
echo.
echo.
echo.
pause
goto menu1


:mcss
cls
echo Minecraft server soft (4/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcss_download)
if %errorlevel%==2 (goto mcss_manual_download)
if %errorlevel%==3 (goto menu1)



:mcss_download
cls
echo Downloading Minecraft server soft...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://www.mcserversoft.com/downloadlatest" -o "%appdata%\.minecraft\mcss.zip"
start %appdata%\.minecraft\mcss.zip
goto menu1


:mcss_manual_download
cls
echo Opening web page...
echo.
echo.
echo.
start https://www.mcserversoft.com/downloadlatest
goto menu1


:java
cls
echo Java (5/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto java_download)
if %errorlevel%==2 (goto java_manual_download)
if %errorlevel%==3 (goto menu2)


:java_download
cls
echo Downloading Java...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=242959_a4634525489241b9a9e1aa73d9e118e6" -o "%appdata%\.minecraft\java.exe"
start %appdata%\.minecraft\java.exe
goto menu2


:java_manual_download
cls
echo Opening web page...
echo.
echo.
echo.
start https://javadl.oracle.com/webapps/download/AutoDL?BundleId=242959_a4634525489241b9a9e1aa73d9e118e6
goto menu2


:dirX
cls
echo DirectX (4/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto dirX_download)
if %errorlevel%==2 (goto dirX_manual_download)
if %errorlevel%==3 (goto menu2)


:dirX_download
cls
echo Downloading DirectX...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe" -o "%appdata%\.minecraft\dirX.exe"
start %appdata%\.minecraft\dirX.exe & goto menu2


:dirX_manual_download
cls
echo Opening web page...
echo.
echo.
echo.
start https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe
goto menu2


:torrent
cls
echo uTorrent (5/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto torrent_download)
if %errorlevel%==2 (goto torrent_manual_download)
if %errorlevel%==3 (goto menu2)




:torrent_download
cls
echo Downloading uTorrent...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://download-hr.utorrent.com/track/stable/endpoint/utorrent/os/windows" -o "%appdata%\.minecraft\torrent.exe"
start %appdata%\.minecraft\torrent.exe & goto menu2


:torrent_manual_download
cls
echo Opening web page...
echo.
echo.
echo.
start https://download-hr.utorrent.com/track/stable/endpoint/utorrent/os/windows
goto menu2


:open
cls
echo opengl (2/5)
echo.
echo 1) 32-bit
echo 2) 64-bit
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto open32)
if %errorlevel%==2 (goto open64)
if %errorlevel%==3 (goto menu2)

:open32
cls
echo opengl (32-bit) (2/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto open32_download)
if %errorlevel%==2 (goto open32_manual_download)
if %errorlevel%==3 (goto open)

:open32_download
cls
echo Downloading opengl (32-bit)...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/32.dll?raw=true" -o "%USERPROFILE%\Desktop\opengl32.dll"
goto menu2


:open32_manual_download
echo Opening web page...
echo.
echo.
echo.
start https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/32.dll?raw=true
goto menu2

:open64
cls
echo opengl (64-bit) (2/5)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto open64_download)
if %errorlevel%==2 (goto open64_manual_download)
if %errorlevel%==3 (goto open)

:open64_download
cls
echo Downloading opengl (64-bit)...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/64.dll?raw=true" -o "%USERPROFILE%\Desktop\opengl32.dll"
goto menu2


:open64_manual_download
cls
echo Opening web page...
echo.
echo.
echo.
start https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/64.dll?raw=true
goto menu2


:update
cls
echo Update "Minebatch"
echo.
echo 1) Auto check for updates and auto install
echo 2) Open download page
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto update)
if %errorlevel%==2 (goto download)
if %errorlevel%==3 (goto menu2)

:update
if exist %appdata%\.minecraft\version.txt del %appdata%\.minecraft\version.txt
cls
echo Checking for updates...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/version.txt" -o "%appdata%\.minecraft\version.txt"
set /p new_version=<%appdata%\.minecraft\version.txt
if %version%==%new_version% goto version_not_found
cls
echo Auto updating...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd" -o "Minebatch_%new_version%.cmd"
start Minebatch_%new_version%.cmd
start /b "" cmd /c del "%~f0"&exit /b
exit



:version_not_found
cls
echo You are using the latest version!
echo.
echo.
echo.
pause
goto menu2

:download
cls
echo Opening web page...
echo.
echo.
echo.
start https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd
goto menu2






:check
if not exist %appdata%\.minecraft mkdir %appdata%\.minecraft
if exist debug.log del debug.log
mode con:cols=130 lines=40
call:internet
call:url
call:verion_updater
goto:EOF

:internet
Ping www.google.nl -n 1 -w 1000 >nul
if errorlevel 1 (set internet=0) else (set internet=1)
if %internet%==0 goto internet_error
goto:EOF

:internet_error
cls
echo You are not connected to the internet... You can still run "Minebatch",
echo but you won't have the ability to download files and games from the internet
echo or auto update "Minebatch".
echo.
echo.
echo.
pause
goto:EOF

:url
if exist "C:\Windows\System32\curl.exe" goto:EOF
cls
echo The file curl.exe isn't installed at you computer. If you don't install it
echo here: "C:\Windows\System32\curl.exe" you won't have the ability to download automatically
echo files and games to your computer or to upgrade "Minebatch". I you try to download
echo files using the auto downloader, you will recieve an error message! 
echo.
echo.
echo.
echo Press any key to download manually the file: curl.exe...
pause>nul
start http://www.mediafire.com/file/oohiofdtlvkmf7p/curl.exe/file
goto:EOF

:verion_updater
if %internet%==0 goto:EOF
if exist %appdata%\.minecraft\version.txt del %appdata%\.minecraft\version.txt
curl -o %appdata%\.minecraft\version.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/version.txt" -L -s
set /p new_version=<%appdata%\.minecraft\version.txt
if %version%==%new_version% goto:EOF
title Update found!
cls
echo A new version is available %new_version%
echo.
echo 1) Auto update
echo 2) No thanks, don't update
echo.
echo.
echo.
choice /c 12 /n /m "Select: "
if %errorlevel%==1 (goto version_updater_update)
if %errorlevel%==2 (goto:EOF)

:version_updater_update
cls
echo Auto updating...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd" -o "Minebatch_%new_version%.cmd"
start Minebatch_%new_version%.cmd
start /b "" cmd /c del "%~f0"&exit /b
exit

@echo off
set version=0.0.0.5.1
title Minebatch %version%
echo Loading...
color 9f
call:check
:menu1
cls
echo Menu (page: 1/3)
echo.
echo 1) Minecraft
echo 2) TLauncher
echo 3) Minecraft Dungeons
echo 4) Minecraft Story Mode Season 1
echo 5) Minecraft Story Mode Season 2
echo 6) Minecraft Pocket Edition
echo 7) Minecraft server soft
echo 8) Page 2
echo 9) Exit
echo.
echo.
echo.
choice /c 123456789 /n /m "Select: "
if %errorlevel%==1 (goto mc)
if %errorlevel%==2 (goto tl)
if %errorlevel%==3 (goto dun)
if %errorlevel%==4 (goto mcsm1)
if %errorlevel%==5 (goto mcsm2)
if %errorlevel%==6 (goto mcpe)
if %errorlevel%==7 (goto mcss)
if %errorlevel%==8 (goto menu2)
if %errorlevel%==9 (exit)



:menu2
cls
echo Menu (page: 2/3)
echo.
echo 1) Java
echo 2) DirectX
echo 3) uTorrent
echo 4) opengl
echo 5) Update "Minebatch"
echo 6) Found a bug or a broken link?
echo 7) Page 1
echo 8) Page 3
echo 9) Exit
echo.
echo.
echo.
choice /c 123456789 /n /m "Select: "
if %errorlevel%==1 (goto java)
if %errorlevel%==2 (goto dirX)
if %errorlevel%==3 (goto torrent)
if %errorlevel%==4 (goto open)
if %errorlevel%==5 (goto update)
if %errorlevel%==6 (goto bug)
if %errorlevel%==7 (goto menu1)
if %errorlevel%==8 (goto menu3)
if %errorlevel%==9 (exit)

:menu3
cls
echo Menu (page: 3/3)
echo.
echo 1) Wep pages
echo 2) Credits
echo 3) Contact and info
echo 4) Clean-up system
echo 5) Page 2
echo 6) Exit
echo.
echo.
echo.
choice /c 123456 /n /m "Select: "
if %errorlevel%==1 (goto web1)
if %errorlevel%==2 (goto credits)
if %errorlevel%==3 (goto contact)
if %errorlevel%==4 (goto clean)
if %errorlevel%==5 (goto menu2)
if %errorlevel%==6 (exit)


:mc
cls
echo Minecraft
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
echo Minecraft Dungeons
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
echo Minecraft Story Mode Season 1
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
echo Minecraft Story Mode Season 2
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
echo Minecraft Pocket Edition
echo.
echo Minecraft Pocket Edition has two versions: Mod 1 and Mod 2.
echo.
echo.
echo 1) Mod 1 includes: Unlocked premium skins - Unlocked premium textures
echo 2) Mod 2 includes: Unlocked premium skins - Unlocked premium textures 
echo 	No damage mod - Unlimited breath - Max Inventory Size - ONE hit kill with weapons 
echo 	Max score - Indestructible Tools
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
echo Minecraft Pocket Edition (Mod 1)
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
echo Minecraft Pocket Edition (Mod 2)
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
echo TLauncher
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
echo Minecraft server soft
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
echo Java
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
echo DirectX
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
echo uTorrent
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
echo opengl
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
echo opengl (32-bit)
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
echo opengl (64-bit)
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
if exist %appdata%\.minecraft\version.txt del %appdata%\.minecraft\version.txt
timeout 3 /nobreak >nul
curl -o %appdata%\.minecraft\version.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/version.txt" -L -s
set /p new_version=<%appdata%\.minecraft\version.txt
if %version%==%new_version% goto version_not_found
cls
echo Auto updating...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd" -o "Minebatch_%new_version%.cmd"
start Minebatch_%new_version%.cmd
(goto) 2>nul & del "%~f0"
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

:bug
cls
echo Really? Oh my god! Please, let me know about that bug! You can contact me with:
echo.
echo 1) Discord
echo 2) E-mail
echo 3) Fill an online form
echo 4) Back
echo.
echo.
echo.
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto discord)
if %errorlevel%==2 (goto e-mail)
if %errorlevel%==3 (goto form)
if %errorlevel%==4 (goto menu2)

:discord
cls
echo Discord
echo.
echo You can DM me on Discord, or you can just join mine Discord server.
echo.
echo 1) DM me
echo 2) Join my server
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto discord_dm)
if %errorlevel%==2 (goto discord_server)
if %errorlevel%==3 (goto bug)

:discord_dm
echo|set /p=Kotsasmin#9454|clip
cls
echo Discord DM
echo.
echo ID copied to clipboard, but here it is if you can't find it: Kotsasmin#9454
echo.
echo.
echo.
pause
goto bug

:discord_server
echo|set /p=https://discord.gg/KHvjMcKkEX|clip
start https://discord.gg/KHvjMcKkEX
cls
echo Invite link copied to clipboard, but here it is if you can't find it: https://discord.gg/KHvjMcKkEX
echo.
echo.
echo.
pause
goto bug

:e-mail
echo|set /p=kotsasmin@gmail.com|clip
cls
echo E-mail
echo.
echo My e-mail is now on clipboard but here it is if you can't find it: kotsasmin@gmail.com
echo.
echo.
echo.
pause
goto bug


:form
cls
echo Opening web page...
echo.
echo.
echo.
start https://forms.gle/xUKXpNnvkgBLBvct8
goto bug





:web1
cls
echo Web pages (page: 1/2)
echo.
echo 1) Kotsasmin's web page
echo 2) copyitright's web page
echo 3) TLauncher's web page
echo 4) Rexdl's web page
echo 5) Mc server soft's web page
echo 6) Minecraft's web page
echo 7) Java's web page
echo 8) Page 2
echo 9) Back
choice /c 123456789 /n /m "Select: "
if %errorlevel%==1 (start http://kotsasmin.blogspot.com & goto web)
if %errorlevel%==2 (start https://www.playfreeminecraft.nl/ & goto web)
if %errorlevel%==3 (start https://tlauncher.org/ & goto web)
if %errorlevel%==4 (start https://rexdl.com/ & goto web)
if %errorlevel%==5 (start https://www.mcserversoft.com/ & goto web)
if %errorlevel%==6 (start https://www.minecraft.net/en-us/ & goto web)
if %errorlevel%==7 (start https://www.java.com/en/ & goto web)
if %errorlevel%==8 (goto web2)
if %errorlevel%==9 (goto menu3)


:web2
cls
echo Web pages (page: 2/2)
echo.
echo 1) DirectX's web page
echo 2) uTorrent's web page
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (start https://www.microsoft.com/en-us/download/details.aspx?id=35 & goto web)
if %errorlevel%==2 (start https://www.utorrent.com/ & goto web)
if %errorlevel%==3 (goto menu3)

:credits
cls
echo     MINSProduction and Kotsasmin presents
timeout 5 /nobreak >nul
echo       in association with copyitright
timeout 5 /nobreak >nul
cls
echo                 Minebatch
timeout 5 /nobreak >nul
cls
echo Main programmer: Kotsasmin
timeout 1 /nobreak >nul
echo.
echo Assistants: Nickolasmin
timeout 1 /nobreak >nul
echo             Aggelosmin
timeout 1 /nobreak >nul
echo             copyitright
timeout 1 /nobreak >nul
echo.
echo Testers: copyitright
timeout 1 /nobreak >nul
echo          Efitselou
timeout 10 /nobreak >nul
cls
echo Curl commands and "curl.exe" file by copyitright
timeout 1 /nobreak >nul
echo.
echo Updating system assistant: copyitright
timeout 1 /nobreak >nul
echo.
echo Idea by: Nickolasmin
timeout 1 /nobreak >nul
echo.
echo Design and main menu by: Kotsasmin, Nickolasmin
timeout 10 /nobreak >nul
cls
echo Websites and sources: Minecraft
timeout 1 /nobreak >nul
echo                       TLauncher
timeout 1 /nobreak >nul
echo                       Rexdl
timeout 1 /nobreak >nul
echo                       MC server soft
timeout 1 /nobreak >nul
echo                       uTorrent
timeout 1 /nobreak >nul
echo                       Java
timeout 1 /nobreak >nul
echo                       GitHub
timeout 1 /nobreak >nul
echo                       DirectX
timeout 1 /nobreak >nul
echo                       playfreeminecraft (copyitright)
timeout 1 /nobreak >nul
echo                       MediaFire
timeout 10 /nobreak >nul
cls
echo Special thanks to One for supporting us!
timeout 1 /nobreak >nul
echo.
echo Special thanks to GitHub and MediaFire for helping in online storage!
timeout 5 /nobreak >nul
cls
echo Music by: Antimo and Welles - That's the Spirit
timeout 5 /nobreak >nul
cls
echo Thank you for downloading Minebatch! Have a nice day!
echo.
echo.
echo.
pause
goto menu3



:contact
cls
echo Contact (copy)
echo.
echo 1) My e-mail: kotsasmin@gmail.com
echo 2) My Discord server: https://discord.gg/KHvjMcKkEX
echo 3) My Discord ID: Kotsasmin#9454
echo 4) My website: kotsasmin.blogspot.com
echo 5) Back
echo.
echo.
echo.
choice /c 12345 /n /m "Select: "
if %errorlevel%==1 (echo|set /p=kotsasmin@gmail.com|clip)
if %errorlevel%==2 (echo|set /p=https://discord.gg/KHvjMcKkEX|clip)
if %errorlevel%==3 (echo|set /p=Kotsasmin#9454|clip)
if %errorlevel%==4 (echo|set /p=kotsasmin.blogspot.com|clip)
if %errorlevel%==5 (goto menu3)
goto contact

:clean
cls
echo Warning! Save and close all of your progresses before cleaning up your PC! Also,
echo this will take a lot of time.
echo.
echo 1) Start cleaning up
echo 2) Back
echo.
echo.
echo.
choice /c 12 /n /m "Select: "
if %errorlevel%==1 (goto cleanup)
if %errorlevel%==2 (goto menu3)

:cleanup
cls
echo Starting cleaning up...
echo.
echo -----------------------
echo.
del /f /q "%userprofile%\Start Menu\Programs\Accessories\Program Compatibility Wizard.lnk">nul
del /f /q "%userprofile%\Start Menu\Programs\Accessories\Tour Windows XP.lnk">nul
rd /s /q "C:\Documents and Settings\All Users\Start Menu\Programs\Games\">nul
del /f /q "%userprofile%\Start Menu\Programs\Outlook Express.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Programs\MSN.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Programs\Windows Messenger.lnk">nul
del /f /q "%userprofile%\Start Menu\Programs\Remote Assistance.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Set Program Access and Defaults.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Windows Catalog.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\New Microsoft Office Document*">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Open Microsoft Office Document*">nul
CD /d "C:\Documents and Settings\All Users\Desktop">nul
del /f /q "Show Desktop*">nul
CD /d "%userprofile%\Desktop">nul
del /f /q "Show Desktop*">nul
defrag C: -f
defrag D: -f
del /a /s /q %windir%\temp & md %windir%\temp>nul
del /a /s /q %userprofile%\recent\*.*>nul
del /a /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">nul
del /a /s /q "%userprofile%\Local Settings\Temp\*.*">nul
del /a /s /q "%userprofile%\recent\*.*">nul
del /a /s /q %systemdrive%\*.tmp>nul
del /a /s /q %systemdrive%\*._mp>nul
del /a /s /q %systemdrive%\*.log>nul
del /a /s /q %systemdrive%\*.gid>nul
del /a /s /q %systemdrive%\*.chk>nul
del /a /s /q %systemdrive%\*.old>nul
del /a /s /q %systemdrive%\recycled\*.*>nul
del /a /s /q %windir%\*.bak>nul
del /a /s /q %windir%\prefetch\*.*>nul
echo.
echo -----------------------
echo.
echo Cleaning up is complete!
echo.
echo.
echo.
timeout 5 /nobreak >nul
pause
goto menu3



:check
cls
echo Loading...
echo Gathering data ...
if not exist %appdata%\.minecraft mkdir %appdata%\.minecraft
if exist debug.log del debug.log
mode con:cols=130 lines=40
call:internet
call:url
call:verion_updater
title Minebatch %version% %mode%
goto:EOF

:internet
cls
echo Loading...
echo Checking internet connection...
Ping www.google.nl -n 1 -w 1000 >nul
if errorlevel 1 (set internet=0) else (set internet=1)
if %internet%==1 set mode=Online
if %internet%==0 set mode=Offline
if %internet%==0 goto internet_error
cls
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
cls
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
cls
goto:EOF

:verion_updater
cls
if %internet%==0 goto:EOF
echo Loading...
echo Checking for updates...
if exist %appdata%\.minecraft\version.txt del %appdata%\.minecraft\version.txt
timeout 3 /nobreak >nul
curl -o %appdata%\.minecraft\version.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/version.txt" -L -s
set /p new_version=<%appdata%\.minecraft\version.txt
if %version%==%new_version% goto:EOF
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
if %errorlevel%==2 (cls & goto:EOF)

:version_updater_update
cls
echo Auto updating...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd" -o "Minebatch_%new_version%.cmd"
start Minebatch_%new_version%.cmd
(goto) 2>nul & del "%~f0"
exit


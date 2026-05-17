@echo off
title Server Starter
color 0b

:: 1. Pfade festlegen
set VBOX_PATH="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
set VM_NAME="Metin2Server"
set SERVER_IP=SERVER_IP 

echo ============================================
echo   Metin2 Server Start-Automatisierung
echo ============================================

:: 2. VirtualBox starten
echo [%time%] Pruefe VM-Status...
%VBOX_PATH% list runningvms | findstr /i %VM_NAME% >nul
if %errorlevel% equ 0 (
    echo [%time%] VM laeuft bereits.
) else (
    echo [%time%] Starte VM %VM_NAME%...
    %VBOX_PATH% startvm %VM_NAME% --type gui
)

:: 3. Warten (Boot-Zeit)
echo [%time%] Warte 30 Sekunden auf Systemstart...
timeout /t 30 /nobreak >nul

:: 4. SSH Login und Befehle senden
:: WICHTIG: Erfordert, dass dein SSH-Key bereits hinterlegt ist!
echo [%time%] Verbinde zu %SERVER_IP%...
echo [%time%] Sende Befehle: game, m2, Auswahl 1
echo 1 | ssh -o StrictHostKeyChecking=accept-new root@%SERVER_IP% "tcsh -c 'game; m2'"

echo.
echo [%time%] Fertig! Der Server sollte nun online sein.
echo ============================================
pause

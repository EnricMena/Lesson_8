@echo off
title Material Me - Abrir ubicacion del APK
echo.
echo ================================================
echo  MATERIAL ME - APK LISTO PARA INSTALAR
echo ================================================
echo.
echo El APK esta en:
echo app\build\outputs\apk\debug\app-debug.apk
echo.
echo INSTRUCCIONES:
echo.
echo 1. Se abrira una ventana con el APK
echo 2. Arrastra el archivo "app-debug.apk" a tu emulador
echo 3. Se instalara automaticamente
echo.
echo O puedes:
echo - Copiarlo a tu dispositivo fisico e instalarlo
echo - Usar adb install app-debug.apk
echo.
pause
echo.
echo Abriendo ubicacion...
start "" "%~dp0app\build\outputs\apk\debug"


@echo off
title Material Me - Instalador
color 0A
echo.
echo ========================================
echo  INSTALANDO MATERIAL ME APP...
echo ========================================
echo.
cd /d "%~dp0"
call gradlew.bat installDebug
if %ERRORLEVEL% EQU 0 (
    color 0A
    echo.
    echo ========================================
    echo  EXITO! App instalada
    echo ========================================
    echo.
    echo Abre la app en tu dispositivo/emulador
) else (
    color 0C
    echo.
    echo ========================================
    echo  ERROR - Ver instrucciones arriba
    echo ========================================
)
echo.
pause


@echo off
echo ================================================
echo   MATERIAL ME - SCRIPT DE INSTALACION
echo ================================================
echo.

cd /d "%~dp0"

echo [1/4] Limpiando proyecto...
gradlew.bat clean > nul 2>&1

echo [2/4] Compilando aplicacion (esto puede tardar 1-2 minutos)...
gradlew.bat assembleDebug

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] La compilacion fallo. Revisa los errores arriba.
    pause
    exit /b 1
)

echo.
echo [3/4] Verificando APK...
if exist "app\build\outputs\apk\debug\app-debug.apk" (
    echo [OK] APK generado exitosamente
    echo.
    echo [4/4] Instalando en dispositivo/emulador...
    echo.
    echo IMPORTANTE: Asegurate de tener:
    echo - Un emulador de Android corriendo, O
    echo - Un dispositivo Android conectado con depuracion USB habilitada
    echo.
    pause

    gradlew.bat installDebug

    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ================================================
        echo   INSTALACION EXITOSA!
        echo ================================================
        echo.
        echo La app "Material Me" esta ahora instalada.
        echo Buscala en tu dispositivo/emulador y abrala.
        echo.
    ) else (
        echo.
        echo [ERROR] No se pudo instalar. Posibles causas:
        echo - No hay dispositivo/emulador conectado
        echo - Depuracion USB no habilitada
        echo.
        echo Puedes instalar manualmente el APK desde:
        echo %cd%\app\build\outputs\apk\debug\app-debug.apk
        echo.
    )
) else (
    echo [ERROR] No se genero el APK
)

echo.
pause


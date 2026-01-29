# Material Me - Script de Instalación Automatica
# Este script compila e instala la app automaticamente

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "   MATERIAL ME - INSTALACION AUTOMATICA" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

$projectPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectPath

# Paso 1: Verificar que existe gradlew
if (-not (Test-Path ".\gradlew.bat")) {
    Write-Host "[ERROR] No se encontro gradlew.bat" -ForegroundColor Red
    Write-Host "Asegurate de ejecutar este script desde la raiz del proyecto" -ForegroundColor Yellow
    pause
    exit 1
}

# Paso 2: Limpiar proyecto
Write-Host "[1/5] Limpiando proyecto..." -ForegroundColor Yellow
$cleanResult = .\gradlew.bat clean 2>&1
Write-Host "[OK] Limpieza completada" -ForegroundColor Green

# Paso 3: Compilar
Write-Host ""
Write-Host "[2/5] Compilando aplicacion..." -ForegroundColor Yellow
Write-Host "      (esto puede tardar 1-2 minutos la primera vez)" -ForegroundColor Gray
$buildResult = .\gradlew.bat assembleDebug 2>&1

if ($buildResult -match "BUILD SUCCESSFUL") {
    Write-Host "[OK] Compilacion exitosa" -ForegroundColor Green
} elseif ($buildResult -match "BUILD FAILED") {
    Write-Host "[ERROR] La compilacion fallo" -ForegroundColor Red
    Write-Host ""
    Write-Host "Errores encontrados:" -ForegroundColor Yellow
    $buildResult | Select-String "error|Error" | Select-Object -First 5
    pause
    exit 1
} else {
    Write-Host "[ADVERTENCIA] Compilacion completada con warnings" -ForegroundColor Yellow
}

# Paso 4: Verificar APK
Write-Host ""
Write-Host "[3/5] Verificando APK generado..." -ForegroundColor Yellow
$apkPath = ".\app\build\outputs\apk\debug\app-debug.apk"

if (Test-Path $apkPath) {
    $apk = Get-Item $apkPath
    $sizeMB = [math]::Round($apk.Length / 1MB, 2)
    Write-Host "[OK] APK generado exitosamente" -ForegroundColor Green
    Write-Host "      Ubicacion: $apkPath" -ForegroundColor Gray
    Write-Host "      Tamaño: $sizeMB MB" -ForegroundColor Gray
    Write-Host "      Fecha: $($apk.LastWriteTime)" -ForegroundColor Gray
} else {
    Write-Host "[ERROR] No se genero el APK" -ForegroundColor Red
    pause
    exit 1
}

# Paso 5: Verificar dispositivos
Write-Host ""
Write-Host "[4/5] Verificando dispositivos conectados..." -ForegroundColor Yellow

$adbPath = $null
$possiblePaths = @(
    "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
    "$env:ANDROID_HOME\platform-tools\adb.exe",
    "C:\Program Files (x86)\Android\android-sdk\platform-tools\adb.exe"
)

foreach ($path in $possiblePaths) {
    if (Test-Path $path) {
        $adbPath = $path
        break
    }
}

if ($adbPath) {
    $devices = & $adbPath devices 2>&1
    $deviceCount = ($devices | Select-String "device$" | Measure-Object).Count

    if ($deviceCount -gt 0) {
        Write-Host "[OK] Se encontraron $deviceCount dispositivo(s) conectado(s)" -ForegroundColor Green
    } else {
        Write-Host "[ADVERTENCIA] No se encontraron dispositivos conectados" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "OPCIONES:" -ForegroundColor Cyan
        Write-Host "1. Inicia un emulador de Android desde Android Studio" -ForegroundColor White
        Write-Host "2. Conecta un dispositivo fisico con depuracion USB habilitada" -ForegroundColor White
        Write-Host "3. Instala manualmente el APK desde:" -ForegroundColor White
        Write-Host "   $apkPath" -ForegroundColor Gray
        Write-Host ""
        $continue = Read-Host "¿Deseas continuar de todas formas? (S/N)"
        if ($continue -ne "S" -and $continue -ne "s") {
            Write-Host "Instalacion cancelada" -ForegroundColor Yellow
            pause
            exit 0
        }
    }
}

# Paso 6: Instalar
Write-Host ""
Write-Host "[5/5] Instalando aplicacion..." -ForegroundColor Yellow
$installResult = .\gradlew.bat installDebug 2>&1

if ($installResult -match "BUILD SUCCESSFUL") {
    Write-Host ""
    Write-Host "================================================" -ForegroundColor Green
    Write-Host "   INSTALACION EXITOSA!" -ForegroundColor Green
    Write-Host "================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "La app 'Material Me' esta ahora instalada en tu dispositivo/emulador." -ForegroundColor White
    Write-Host ""
    Write-Host "SIGUIENTES PASOS:" -ForegroundColor Cyan
    Write-Host "1. Busca el icono de 'Droid Cafe' o 'Material Me' en tu dispositivo" -ForegroundColor White
    Write-Host "2. Abre la aplicacion" -ForegroundColor White
    Write-Host "3. Prueba las funciones:" -ForegroundColor White
    Write-Host "   - Desliza items para eliminarlos" -ForegroundColor Gray
    Write-Host "   - Arrastra items para reordenarlos" -ForegroundColor Gray
    Write-Host "   - Toca un item para ver detalles" -ForegroundColor Gray
    Write-Host "   - Presiona el boton flotante para resetear" -ForegroundColor Gray
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "[ERROR] No se pudo instalar la aplicacion" -ForegroundColor Red
    Write-Host ""
    Write-Host "POSIBLES CAUSAS:" -ForegroundColor Yellow
    Write-Host "- No hay dispositivo/emulador conectado o corriendo" -ForegroundColor White
    Write-Host "- Depuracion USB no habilitada en el dispositivo" -ForegroundColor White
    Write-Host "- El emulador no termino de iniciar" -ForegroundColor White
    Write-Host ""
    Write-Host "SOLUCION:" -ForegroundColor Cyan
    Write-Host "Puedes instalar manualmente arrastrando el APK al emulador," -ForegroundColor White
    Write-Host "o copiandolo a tu dispositivo e instalandolo desde ahi:" -ForegroundColor White
    Write-Host ""
    Write-Host "$apkPath" -ForegroundColor Gray
    Write-Host ""
}

pause


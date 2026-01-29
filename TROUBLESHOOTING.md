# Guía de Solución: No se puede iniciar la app

## Problema
La aplicación Material Me no se puede iniciar desde Android Studio.

## Soluciones Paso a Paso

### Solución 1: Sincronizar Proyecto con Gradle Files (MÁS COMÚN)
1. En Android Studio, ve a: **File > Sync Project with Gradle Files**
2. Espera a que termine la sincronización
3. Intenta ejecutar la app nuevamente con el botón Run (triángulo verde)

### Solución 2: Invalidar Caché y Reiniciar
1. En Android Studio, ve a: **File > Invalidate Caches / Restart...**
2. Selecciona **"Invalidate and Restart"**
3. Espera a que Android Studio se reinicie
4. Ve a **File > Sync Project with Gradle Files**
5. Intenta ejecutar la app

### Solución 3: Limpiar y Reconstruir el Proyecto
1. En Android Studio, ve a: **Build > Clean Project**
2. Espera a que termine
3. Luego ve a: **Build > Rebuild Project**
4. Espera a que termine la reconstrucción
5. Intenta ejecutar la app

### Solución 4: Compilar desde la Línea de Comandos
Si Android Studio sigue dando problemas, compila desde PowerShell:

```powershell
cd "C:\Users\enric\Desktop\MaterialMeStarter2\MaterialMe-Starter"
.\gradlew clean
.\gradlew assembleDebug
```

Si compila exitosamente, instala manualmente:
```powershell
.\gradlew installDebug
```

O instala el APK manualmente:
- El APK está en: `app\build\outputs\apk\debug\app-debug.apk`
- Cópialo a tu dispositivo/emulador e instálalo

### Solución 5: Verificar Configuración del Emulador/Dispositivo
1. Asegúrate de que tienes un emulador corriendo o un dispositivo conectado
2. En Android Studio, verifica el dropdown junto al botón Run
3. Debería mostrar un dispositivo disponible
4. Si no hay dispositivos:
   - Para emulador: **Tools > AVD Manager > Create Virtual Device**
   - Para dispositivo físico: Habilita "Depuración USB" en opciones de desarrollador

### Solución 6: Corregir problemas de Gradle
Si ves errores sobre dependencias, actualiza el archivo `build.gradle` (Project level):

Reemplaza `jcenter()` con `mavenCentral()` en ambos bloques de repositorios.

### Solución 7: Verificar Versión de Java
El proyecto requiere JDK 8 o superior. Verifica en:
**File > Project Structure > SDK Location**

## Errores Comunes y Soluciones

### Error: "Cannot resolve symbol 'R'"
**Solución**: Sincroniza con Gradle (Solución 1)

### Error: "Failed to find target with hash string 'android-XX'"
**Solución**: 
1. Ve a **Tools > SDK Manager**
2. Instala el SDK Platform correspondiente
3. Sincroniza con Gradle

### Error: "No target device found"
**Solución**: Crea o inicia un emulador (ver Solución 5)

### Error: "Installation failed with message..."
**Solución**: 
1. Desinstala la versión anterior de la app del dispositivo/emulador
2. Intenta nuevamente

## Verificación de que el Proyecto Compila

Para verificar que el proyecto está bien configurado, ejecuta en PowerShell:

```powershell
cd "C:\Users\enric\Desktop\MaterialMeStarter2\MaterialMe-Starter"
.\gradlew assembleDebug --console=plain
```

Si al final ves "BUILD SUCCESSFUL", el proyecto está bien y el problema es de configuración de Android Studio.

## Comando Rápido de Instalación

Si todo lo demás falla, usa este comando para instalar directamente:

```powershell
cd "C:\Users\enric\Desktop\MaterialMeStarter2\MaterialMe-Starter"
.\gradlew installDebug
```

Esto compilará e instalará la app automáticamente en el dispositivo/emulador conectado.

## Logs de Depuración

Si necesitas ver los logs detallados:

```powershell
cd "C:\Users\enric\Desktop\MaterialMeStarter2\MaterialMe-Starter"
.\gradlew installDebug --info
```

O ver los logs de la app cuando está corriendo:

```powershell
adb logcat | Select-String "MaterialMe"
```

## Contacto

Si ninguna solución funciona, proporciona:
1. El mensaje de error exacto que aparece
2. La versión de Android Studio que estás usando
3. Si tienes un emulador corriendo o dispositivo conectado

---

**TIP**: La mayoría de los problemas se resuelven con **File > Sync Project with Gradle Files** seguido de **Build > Rebuild Project**.


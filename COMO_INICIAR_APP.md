# 🚀 INICIO RÁPIDO - Material Me App

## ✅ LA FORMA MÁS FÁCIL (Android Studio):

### Paso 1: Abrir el Proyecto
1. Abre **Android Studio**
2. Selecciona **"Open"** 
3. Navega a: `C:\Users\enric\Desktop\MaterialMeStarter2\MaterialMe-Starter`
4. Click en **OK**

### Paso 2: Sincronizar (MUY IMPORTANTE)
Cuando el proyecto se abra, verás una barra amarilla en la parte superior que dice:
**"Gradle files have changed since last project sync"**

1. Click en **"Sync Now"** (esquina derecha de la barra)
2. Espera a que termine la sincronización (1-2 minutos)
3. Verás "Gradle sync finished" en la parte inferior

### Paso 3: Preparar Dispositivo/Emulador

**OPCIÓN A - Emulador (Recomendado):**
1. Click en **Tools > Device Manager**
2. Si no tienes emuladores, click en **"Create Device"**
3. Selecciona un dispositivo (ej: Pixel 5)
4. Selecciona una imagen del sistema (ej: API 34)
5. Click **"Finish"**
6. Click en el ▶️ (play) para iniciar el emulador
7. Espera a que el emulador inicie completamente (muestre la pantalla de inicio)

**OPCIÓN B - Dispositivo Físico:**
1. Conecta tu dispositivo Android por USB
2. En tu dispositivo, habilita "Depuración USB" en Opciones de Desarrollador
3. Acepta el mensaje de autorización en tu dispositivo

### Paso 4: Ejecutar la App
1. En Android Studio, verifica que el dropdown junto al botón Run muestre tu dispositivo/emulador
2. Click en el botón **Run** ▶️ (triángulo verde)
3. La app se compilará e instalará automáticamente
4. Se abrirá automáticamente en tu dispositivo/emulador

---

## 🔧 SI ANDROID STUDIO DA PROBLEMAS:

### Solución Rápida:
1. **File > Invalidate Caches / Restart...**
2. Selecciona **"Invalidate and Restart"**
3. Espera a que se reinicie
4. **File > Sync Project with Gradle Files**
5. Intenta ejecutar nuevamente

---

## 💻 ALTERNATIVA: Línea de Comandos

Si Android Studio no funciona, usa estos comandos en PowerShell:

### 1. Abrir PowerShell en la carpeta del proyecto:
```powershell
cd "C:\Users\enric\Desktop\MaterialMeStarter2\MaterialMe-Starter"
```

### 2. Compilar e Instalar:
```powershell
.\gradlew installDebug
```

Esto compilará e instalará automáticamente la app.

### 3. Si hay errores, primero limpia:
```powershell
.\gradlew clean
.\gradlew installDebug
```

---

## 📱 INSTALACIÓN MANUAL DEL APK

Si todo lo demás falla:

### 1. Compilar el APK:
```powershell
cd "C:\Users\enric\Desktop\MaterialMeStarter2\MaterialMe-Starter"
.\gradlew assembleDebug
```

### 2. El APK estará en:
```
app\build\outputs\apk\debug\app-debug.apk
```

### 3. Para emulador:
- Arrastra el APK directamente a la ventana del emulador
- Se instalará automáticamente

### 4. Para dispositivo físico:
- Copia el APK a tu dispositivo
- Abre el archivo con un explorador de archivos
- Toca para instalar
- Habilita "Instalar desde fuentes desconocidas" si es necesario

---

## 🎮 SCRIPTS AUTOMÁTICOS DISPONIBLES:

He creado dos scripts que hacen todo automáticamente:

### Windows:
```
INSTALAR_APP.bat
```
Doble click para ejecutar

### PowerShell:
```
INSTALAR_APP.ps1
```
Click derecho > "Ejecutar con PowerShell"

---

## ✨ CARACTERÍSTICAS DE LA APP:

Una vez que la app esté corriendo, prueba:

1. **Swipe to Dismiss**: Desliza cualquier card hacia izquierda o derecha para eliminarla
2. **Drag & Drop**: Mantén presionado y arrastra una card para reordenar
3. **Ver Detalles**: Toca cualquier card para ver la pantalla de detalles
4. **Reset**: Presiona el botón flotante (⟳) para restaurar todos los items

---

## ❓ PROBLEMAS COMUNES:

### "Cannot resolve symbol 'R'"
- Solución: File > Sync Project with Gradle Files

### "No target device found"
- Solución: Inicia un emulador o conecta un dispositivo

### "Installation failed"
- Solución: Desinstala la app anterior del dispositivo e intenta de nuevo

### Gradle se queda compilando infinitamente
- Solución: Cancela (Ctrl+C), luego ejecuta: `.\gradlew --stop` y vuelve a intentar

---

## 🆘 ÚLTIMA OPCIÓN:

Si nada funciona, proporcióname:
1. Una captura de pantalla del error exacto
2. La versión de Android Studio que tienes
3. Si estás usando emulador o dispositivo físico

---

**TIP PROFESIONAL**: La forma más confiable es usar Android Studio directamente con el botón Run ▶️


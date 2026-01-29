# 🧪 GUÍA DE PRUEBAS - LAB 5.3

## Cómo probar todas las funcionalidades implementadas

---

## 🎯 TEST 1: Soporte Landscape en Teléfono

### Pasos:
1. Ejecuta la app en un emulador de teléfono (ej: Pixel 5)
2. La app se abre en **portrait**
3. Observa: **1 columna** de tarjetas
4. Intenta hacer **swipe** → Funciona ✅
5. **Rota** el dispositivo a landscape (Ctrl+F11 o botón rotate)
6. Observa: **2 columnas** en grid
7. Intenta hacer **swipe** → NO funciona (deshabilitado) ✅

### Resultado esperado:
- Portrait: 1 columna vertical con swipe
- Landscape: 2 columnas en grid sin swipe
- Drag & drop funciona en ambos

---

## 📱 TEST 2: Soporte Tablets - Portrait

### Crear emulador de tablet:
1. En Android Studio: **Tools > Device Manager**
2. Click **Create Device**
3. Selecciona **Tablet** → **Pixel Tablet**
4. Selecciona una imagen del sistema (API 34)
5. Click **Finish**

### Pasos de prueba:
1. Ejecuta la app en el emulador de tablet
2. Mantén el tablet en **portrait**
3. Observa:
   - **2 columnas** de tarjetas ✅
   - **Texto más grande** que en teléfono ✅
   - Cards se ven proporcionadas

### Compara:
| Aspecto | Teléfono | Tablet |
|---------|----------|--------|
| Columnas (portrait) | 1 | 2 |
| Tamaño título | Headline | Display1 |
| Tamaño texto | Subhead | Headline |

---

## 🔄 TEST 3: Soporte Tablets - Landscape

### Pasos:
1. Con la app abierta en tablet
2. **Rota** a landscape
3. Observa: **3 columnas** en grid ✅
4. Verifica que el texto sigue siendo grande
5. Scroll vertical para ver todas las tarjetas

### Resultado esperado:
- Tablet landscape: 3 columnas
- Uso máximo del espacio
- Texto legible y proporcionado

---

## 🌍 TEST 4: Localización - Soccer vs Football

### Opción A: Cambiar locale del emulador

#### Para ver "Soccer" (Estados Unidos):
1. En el emulador, abre **Settings**
2. Ve a **System > Languages & input > Languages**
3. Click **Add a language**
4. Busca y selecciona **English (United States)**
5. Arrastra para ponerlo en primer lugar
6. Vuelve a la app (o ciérrala y ábrela)
7. Busca el 8º deporte → Debería decir **"Soccer"** ⚽

#### Para ver "Football" (Reino Unido):
1. En Settings > Languages
2. Cambia a **English (United Kingdom)**
3. Vuelve a la app
4. Busca el 8º deporte → Debería decir **"Football"** ⚽

#### Otros locales que muestran "Football":
- Español (cualquier país)
- Français (French)
- Deutsch (German)
- Italiano (Italian)
- Cualquier otro idioma

### Opción B: Crear dos emuladores

1. **Emulador 1:** Configurado con locale en-US
   - Muestra "Soccer"
   
2. **Emulador 2:** Configurado con locale en-GB
   - Muestra "Football"

---

## 🔍 TEST 5: Verificación Completa

### Matriz de pruebas:

| Dispositivo | Orientación | Columnas | Texto | Swipe | Soccer/Football |
|-------------|-------------|----------|-------|-------|-----------------|
| Teléfono | Portrait | 1 | Pequeño | ✅ Sí | Según locale |
| Teléfono | Landscape | 2 | Pequeño | ❌ No | Según locale |
| Tablet | Portrait | 2 | Grande | ❌ No | Según locale |
| Tablet | Landscape | 3 | Grande | ❌ No | Según locale |

### Prueba sistemática:
```
1. Teléfono + Portrait + US     → 1 col, texto pequeño, swipe OK, "Soccer"
2. Teléfono + Landscape + US    → 2 col, texto pequeño, no swipe, "Soccer"
3. Teléfono + Portrait + UK     → 1 col, texto pequeño, swipe OK, "Football"
4. Tablet + Portrait + US       → 2 col, texto grande, no swipe, "Soccer"
5. Tablet + Landscape + US      → 3 col, texto grande, no swipe, "Soccer"
6. Tablet + Portrait + UK       → 2 col, texto grande, no swipe, "Football"
7. Tablet + Landscape + UK      → 3 col, texto grande, no swipe, "Football"
```

---

## 📸 Capturas Recomendadas

Para documentar la práctica, toma screenshots de:

1. **Teléfono portrait** - 1 columna
2. **Teléfono landscape** - 2 columnas
3. **Tablet portrait** - 2 columnas, texto grande
4. **Tablet landscape** - 3 columnas
5. **App con "Soccer"** - locale US
6. **App con "Football"** - locale UK

---

## 🎬 TEST 6: Funcionalidades Existentes

Verifica que todo lo del Lab 5.2 sigue funcionando:

### Drag & Drop:
1. Mantén presionada cualquier tarjeta
2. Arrástral a otra posición
3. Suéltala
4. Verifica que se reordena ✅

### Click para detalles:
1. Toca cualquier tarjeta
2. Se abre DetailActivity ✅
3. Muestra imagen grande y título
4. Botón back funciona

### FAB Reset:
1. Elimina algunas tarjetas (swipe en portrait teléfono)
2. Reordena otras (drag & drop)
3. Presiona el botón flotante (⟳)
4. Todas las tarjetas vuelven al orden original ✅

---

## 🐛 PROBLEMAS COMUNES Y SOLUCIONES

### Problema: No veo cambios al rotar
**Solución:** 
- Cierra completamente la app
- Vuelve a ejecutar desde Android Studio
- En emulador: Settings > Display > Auto-rotate screen (activado)

### Problema: Texto no se ve más grande en tablet
**Solución:**
- Verifica que usaste un emulador de tablet (no teléfono grande)
- El emulador debe tener ≥ 600dp de smallest width
- Revisa que los estilos estén en values-sw600dp/

### Problema: Siempre veo "Soccer"
**Solución:**
- Verifica el locale en Settings > Languages
- Debe estar en inglés pero NO "English (United States)"
- Prueba con "English (United Kingdom)"

### Problema: Siempre veo "Football"
**Solución:**
- Cambia el locale a "English (United States)"
- Debe decir exactamente "United States", no solo "English"

---

## ✅ CHECKLIST FINAL

Antes de dar por completada la práctica, verifica:

- [ ] App rota correctamente entre portrait y landscape
- [ ] Teléfono muestra 1 columna portrait, 2 landscape
- [ ] Tablet muestra 2 columnas portrait, 3 landscape
- [ ] Swipe funciona solo en teléfono portrait
- [ ] Drag & drop funciona en todas las configuraciones
- [ ] Texto es más grande en tablets que en teléfonos
- [ ] Locale US muestra "Soccer"
- [ ] Otros locales muestran "Football"
- [ ] DetailActivity funciona correctamente
- [ ] FAB reset restaura la lista original

---

## 🎓 CONCEPTOS CLAVE DEMOSTRADOS

Al completar estas pruebas, habrás demostrado:

1. **Resource Qualifiers**: Android elige automáticamente recursos según configuración
2. **Responsive Design**: Un código, múltiples layouts
3. **GridLayoutManager**: Layouts flexibles en grilla
4. **Style Inheritance**: Estilos que se adaptan al contexto
5. **Internationalization**: Contenido localizado por región
6. **Smallest Width**: Forma correcta de detectar tablets

---

## 📝 NOTAS PARA EL INFORME

Incluye en tu documentación:

1. Screenshots de las diferentes configuraciones
2. Explicación de los resource qualifiers usados
3. Tabla comparativa teléfono vs tablet
4. Ejemplo de localización Soccer/Football
5. Diagrama de la estructura de carpetas res/

---

**¡Buena suerte con las pruebas!** 🚀

Si algo no funciona como se describe aquí, revisa:
- LAB_5.3_IMPLEMENTACION_COMPLETA.md
- Logs de compilación
- Resource qualifiers correctos


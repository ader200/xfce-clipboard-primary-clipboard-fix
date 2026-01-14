# Guía del Portapapeles en Linux Mint XFCE

## Tipos de Portapapeles

### 1. PRIMARY (Selección)
- **Cómo se llena:** Seleccionando texto con el mouse
- **Cómo se pega:** Click medio del mouse (rueda)
- **Comando para ver:** `xclip -o -selection primary`

### 2. CLIPBOARD (Portapapeles estándar)
- **Cómo se llena:** Ctrl+C, Ctrl+X o clic derecho → Copiar
- **Cómo se pega:** Ctrl+V o clic derecho → Pegar
- **Comando para ver:** `xclip -o -selection clipboard`

### 3. SECONDARY (Secundario)
- Raramente usado en la práctica
- Comando: `xclip -o -selection secondary`

---

## Dónde se Guarda

El contenido del portapapeles se guarda en **memoria RAM** (volátil):

**Se pierde al:**
- Reiniciar el sistema
- Cerrar la sesión
- Apagar la computadora

**Para persistencia:** Usar un gestor de portapapeles (CopyQ, Parcellite, etc.)

---

## Comandos Útiles

### Ver contenido actual
```bash
# PRIMARY
xclip -o -selection primary

# CLIPBOARD
xclip -o -selection clipboard
```

### Copiar contenido
```bash
# Copiar a PRIMARY
echo "texto" | xclip -selection primary

# Copiar a CLIPBOARD
echo "texto" | xclip -selection clipboard
```

### Copiar archivo
```bash
xclip -selection clipboard archivo.txt
```

---

## Solución de Problemas

### El portapapeles no funciona
1. Verificar que xclip esté instalado: `which xclip`
2. Verificar que autocutsel esté corriendo: `ps aux | grep autocutsel`

### Pérdida frecuente de contenido
- El contenido se pierde al reiniciar (es normal)
- Para historial, instalar un gestor

### Conflictos entre PRIMARY y CLIPBOARD
- Sin sincronización: Funcionan independientemente
- Con sincronización: Siempre tienen el mismo contenido

---

## Con Sincronización Bidireccional (Nuestra Solución)

| Acción | PRIMARY | CLIPBOARD |
|--------|---------|-----------|
| Seleccionar mouse | ✓ | ✓ |
| Ctrl+C | ✓ | ✓ |
| Click medio | ✓ | - |
| Ctrl+V | - | ✓ |

Ambos portapapeles siempre tienen el mismo contenido.

---

## Gestores de Portapapeles (Opcional)

| Gestor | Comando instalación | Características |
|--------|---------------------|-----------------|
| CopyQ | `sudo apt install copyq` | Avanzado, búsqueda, etiquetas |
| Parcellite | `sudo apt install parcellite` | Ligero, básico |
| Clipit | `sudo apt install clipit` | XFCE, simple |

**Nota:** Si usas un gestor, puede que不要再使用 autocutsel para evitar conflictos.

---

## Más Información

Ver repositorio principal:
https://github.com/ader200/clipboard-bidirectional-sync

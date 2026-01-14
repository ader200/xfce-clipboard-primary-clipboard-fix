# xfce-clipboard-primary-clipboard-fix

## Solución para sincronizar PRIMARY y CLIPBOARD en Linux

En Linux (XFCE, Cinnamon, Mint), la selección con mouse (PRIMARY) dominaba sobre Ctrl+C (CLIPBOARD). Esta solución sincroniza ambos portapapeles bidireccionalmente.

**Palabras clave (Keywords):**
Linux, XFCE, Cinnamon, Mint, clipboard, portapapeles, PRIMARY, CLIPBOARD, sync, sincronización, xclip, autocutsel, copy, paste, selección mouse, Ctrl+C, Linux Mint

## Nuestra Solución

Instalar `autocutsel` con **sincronización bidireccional**:
- PRIMARY (selección mouse) ↔ CLIPBOARD (Ctrl+C) siempre sincronizados
- Da igual dónde copies primero, el otro se actualiza automáticamente
- Ambos portapapeles siempre tienen el mismo contenido

## Requisitos

- Linux Mint XFCE (funciona en cualquier distro basada en Debian/Ubuntu)
- `xclip`: Para visualizar el portapapeles
- `autocutsel`: Para sincronización automática

## Instalación Rápida

```bash
# Clonar el repositorio
git clone https://github.com/ader200/xfce-clipboard-primary-clipboard-fix.git
cd xfce-clipboard-primary-clipboard-fix

# Ejecutar instalación
chmod +x install.sh
./install.sh

# Reiniciar sesión para que funcione después deboot
# O simplemente cierra sesión y vuelve a entrar
```

## Instalación Manual

```bash
# 1. Instalar dependencias
sudo apt update
sudo apt install xclip autocutsel

# 2. Configurar inicio automático
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/autocutsel-bidirectional.desktop << 'EOF'
[Desktop Entry]
Name=autocutsel-bidirectional
Exec=autocutsel -selection PRIMARY -fork & autocutsel -selection CLIPBOARD -fork
Terminal=false
Type=Application
NoDisplay=true
EOF

# 3. Iniciar ahora (sin reiniciar)
autocutsel -selection PRIMARY -fork &
autocutsel -selection CLIPBOARD -fork &
```

## Verificar que Funciona

```bash
# Terminal 1: Copiar algo a PRIMARY
echo "Hola desde PRIMARY" | xclip -selection primary

# Terminal 2: Verificar que CLIPBOARD tiene lo mismo
xclip -o -selection clipboard
# Salida: Hola desde PRIMARY

# Ahora selecciona texto con el mouse
# Verás que Ctrl+V también pega ese contenido
# Y viceversa
```

## Menú Interactivo (Opcional)

Este proyecto incluye un visor interactivo del portapapeles:

```bash
# Ver estado de ambos portapapeles en tiempo real
clipboard-monitor

# Ver solo PRIMARY
cbp

# Ver solo CLIPBOARD
cbc
```

El menú interactivo permite:
- Monitoreo automático con actualización en tiempo real
- Copiar entre portapapeles manualmente
- Ver gestores de portapapeles instalados
- Cambiar intervalo de actualización

## Desinstalación

```bash
chmod +x uninstall.sh
./uninstall.sh
```

## Funcionamiento

| Acción | PRIMARY | CLIPBOARD | Resultado |
|--------|---------|-----------|-----------|
| Seleccionar texto (mouse) | ✓ | ✓ | Ambos se actualizan |
| Ctrl+C | ✓ | ✓ | Ambos se actualizan |
| Ctrl+V | - | ✓ | Pega desde CLIPBOARD |
| Click medio pegar | ✓ | - | Pega desde PRIMARY |

## Archivos del Proyecto

```
xfce-clipboard-primary-clipboard-fix/
├── README.md                   # Documentación principal
├── LICENSE                     # MIT License
├── .gitignore                  # Archivos ignorados por git
├── install.sh                  # Script de instalación automática
├── uninstall.sh                # Script de desinstalación
├── bin/
│   └── clipboard-monitor       # Menú interactivo (opcional)
└── docs/
    └── GUIA_PORTAPAPELES.md    # Guía detallada en español
```

## Problemas Comunes

**"Copied to clipboard" aparece al copiar**
→ Hay otro gestor de portapapeles activo
```bash
killall copyq parcellite clipit
```

**No funciona después de instalar**
→ Reiniciar sesión: cierra sesión y vuelve a entrar

**Error: xclip no encontrado**
→ Instalar xclip: `sudo apt install xclip`

## ¿Por qué funciona?

`autocutsel` es una herramienta que vigila cambios en los portapapeles de X11:

- `autocutsel -selection PRIMARY -fork`: Vigila PRIMARY y sincroniza cambios a CLIPBOARD
- `autocutsel -selection CLIPBOARD -fork`: Vigila CLIPBOARD y sincroniza cambios a PRIMARY

Juntos crean una sincronización bidireccional en tiempo real.

## Licencia

MIT License - Libre uso y modificación

## Autor

[@ader200](https://github.com/ader200)

---

¿Funcionó para ti? ¿Tienes sugerencias? Abre un issue en el repositorio.

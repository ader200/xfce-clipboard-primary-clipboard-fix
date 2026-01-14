#!/bin/bash

set -e

echo "=========================================="
echo "  Clipboard Bidirectional Sync Installer"
echo "=========================================="
echo ""

echo "[1/4] Verificando sistema..."
if ! command -v apt-get &> /dev/null; then
    echo "ERROR: Este script requiere Debian/Ubuntu/Mint"
    exit 1
fi

echo "[2/4] Instalando dependencias..."
sudo apt-get update
sudo apt-get install -y xclip autocutsel

echo "[3/4] Configurando inicio automático..."
mkdir -p ~/.config/autostart

cat > ~/.config/autostart/autocutsel-bidirectional.desktop << 'EOF'
[Desktop Entry]
Name=autocutsel-bidirectional
Comment=Sync PRIMARY and CLIPBOARD clipboards bidirectionally
Exec=autocutsel -selection PRIMARY -fork & autocutsel -selection CLIPBOARD -fork
Terminal=false
Type=Application
NoDisplay=true
X-GNOME-Autostart-enabled=true
EOF

chmod +x ~/.config/autostart/autocutsel-bidirectional.desktop

echo "[4/4] Iniciando sincronización..."
autocutsel -selection PRIMARY -fork &
autocutsel -selection CLIPBOARD -fork &

echo ""
echo "=========================================="
echo "  ¡INSTALACIÓN COMPLETA!"
echo "=========================================="
echo ""
echo "La sincronización bidireccional está activa."
echo "PRIMARY y CLIPBOARD ahora siempre tendrán el mismo contenido."
echo ""
echo "Para que funcione después de reiniciar, cierra sesión y vuelve a entrar."
echo ""

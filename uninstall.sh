#!/bin/bash

set -e

echo "=========================================="
echo "  Clipboard Bidirectional Sync Uninstaller"
echo "=========================================="
echo ""

echo "[1/3] Deteniendo procesos autocutsel..."
killall autocutsel 2>/dev/null || echo "No había procesos de autocutsel activos"

echo "[2/3] Eliminando configuración de inicio..."
rm -f ~/.config/autostart/autocutsel-bidirectional.desktop

echo "[3/3] Limpiando..."
echo ""

echo "=========================================="
echo "  ¡DESINSTALACIÓN COMPLETA!"
echo "=========================================="
echo ""
echo "La sincronización bidireccional ha sido desactivada."
echo "Los portapapeles PRIMARY y CLIPBOARD ya no estarán sincronizados."
echo ""
echo "Reinicia tu sesión para que los cambios surtan efecto."
echo ""

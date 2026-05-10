#!/bin/bash

set -e

echo "=== Eliminando Neovim del sistema ==="

# 1. Desinstalar Neovim
sudo apt remove --purge neovim -y
sudo apt autoremove -y

echo "=== Eliminando configuración de usuario ==="

# 2. Configuración de Neovim
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

# 3. Configuración vieja de Vim (opcional limpieza total)
rm -rf ~/.vim
rm -f ~/.vimrc

echo "=== Verificación ==="

if command -v nvim >/dev/null 2>&1; then
  echo "Neovim aún está instalado"
  nvim --version
else
  echo "Neovim eliminado correctamente (no encontrado en PATH)"
fi

echo "=== Proceso terminado ==="

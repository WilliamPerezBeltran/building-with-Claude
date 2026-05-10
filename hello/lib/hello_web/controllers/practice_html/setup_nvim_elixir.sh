#!/bin/bash

set -e

echo "Instalando dependencias base..."

sudo apt update
sudo apt install -y git curl build-essential neovim

echo "Instalando vim-plug para Neovim..."

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Creando configuración de Neovim..."

mkdir -p ~/.config/nvim

cat > ~/.config/nvim/init.vim << 'EOF'
set number
set termguicolors
syntax on
filetype plugin indent on

call plug#begin()

" Treesitter (syntax moderna)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Soporte Elixir
Plug 'elixir-editors/nvim-elixir'

" LSP base (opcional pero recomendado)
Plug 'neovim/nvim-lspconfig'

call plug#end()
EOF

echo "Instalando Elixir LSP..."

mkdir -p ~/tools
cd ~/tools

if [ ! -d "elixir-ls" ]; then
  git clone https://github.com/elixir-lsp/elixir-ls.git
  cd elixir-ls
  mix deps.get
  mix compile
fi

echo ""
echo "CONFIGURACION TERMINADA"
echo ""
echo "Ahora abre Neovim y ejecuta:"
echo ""
echo "  :PlugInstall"
echo "  :TSInstall elixir heex html"
echo ""
echo "Luego agrega el path del LSP si quieres:"
echo ""
echo "  ~/tools/elixir-ls/release"
echo ""

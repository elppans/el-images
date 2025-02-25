#!/bin/bash

# Verifique se o Zenity está instalado
if ! command -v zenity &> /dev/null
then
    echo "Zenity não está instalado. Instalando..."
    # sudo apt-get install zenity -y
    # sudo pacman --needed --noconfirm -S zenity
    exit 1
fi

LOCAL_BIN="usr/local/bin"
ACTION_DIR="$HOME/.local/share/nautilus/scripts"
ACTION_TOOLS="El-Images"

# Crie o diretório de scripts do Nautilus no diretório do usuário se não existir
mkdir -p "$ACTION_DIR"

# Copie o diretório de ferramentas Action Scripts para o diretório de Scripts
cp -rf "$ACTION_TOOLS" "$ACTION_DIR"

# Torne o script de conversão executável
chmod +x "$ACTION_DIR"/"$ACTION_TOOLS"/*/*

# Copie os binários para o sistema
sudo cp -a "$LOCAL_BIN" "/$LOCAL_BIN"

# Reinicie o Nautilus para aplicar as mudanças
nautilus -q

echo "Configuração concluída. As ações 'El-Images' foi adicionada ao menu de contexto do Nautilus."


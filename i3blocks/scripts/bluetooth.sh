#!/bin/bash
# Script de Bluetooth que abre o gerenciador ao ser clicado.

# Se o bloco foi clicado com o botão esquerdo do mouse (botão 1)...
if [ "$BLOCK_BUTTON" == "1" ]; then
    # Abre o gerenciador de bluetooth em segundo plano.
    # O '&' é importante para não travar a barra.
    blueman-manager &
fi

# O resto do script continua igual, apenas para mostrar o status.
if bluetoothctl show | grep -q "Powered: yes"; then
    # Ícone para bluetooth LIGADO
    echo " ON"
else
    # Ícone para bluetooth DESLIGADO
    echo " OFF"
fi

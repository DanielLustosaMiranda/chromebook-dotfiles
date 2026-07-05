#!/bin/bash
# Script de status de rede que abre o editor de conexões de rede ao ser clicado.

# --- Ação de Clique ---
# Se o bloco foi clicado com o botão esquerdo (1)...
if [ "$BLOCK_BUTTON" == "1" ]; then
    kitty -e nmtui &
fi

# --- Lógica de Status ---

# 1. Detecta a interface de rede ativa dinamicamente.
#    Isto substitui a linha 'INTERFACE="wlp2s0"'
INTERFACE=$(ip route get 1.1.1.1 | awk '{print $5; exit}')

# Se nenhuma interface com rota para a internet for encontrada...
if [ -z "$INTERFACE" ]; then
    echo " out"
    exit 0
fi

# 2. Obtém o endereço IP usando um método robusto.
IP_ADDRESS=$(ip -4 addr show "$INTERFACE" | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)

SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2-)

# 3. Verifica a conectividade com a internet.
if ping -c 1 -W 1 1.1.1.1 &>/dev/null; then
    # Conexão com internet OK
    #echo " "
    echo "  $SSID"
else
    # Conectado à rede local, mas sem internet
    echo "! "
fi

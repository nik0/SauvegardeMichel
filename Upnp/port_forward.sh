#!/bin/bash

# Obtenir l'adresse IP locale de la machine (ex: 192.168.1.42)
IP=$(ip route get 1.1.1.1 | grep -oP 'src \K[\d.]+')
# Vérification
if [[ -z "$IP" ]]; then
    echo "Erreur : impossible de déterminer l'adresse IP locale."
    exit 1
fi

# Définir les redirections : format "port_interne:port_externe"
PORTS_TCP=(
  "8999:8999" # Torrent
  "10477:10477"
)

PORTS_UDP=(
  "8999:8999" # Torrent
  "10477:10477"
)
# Ajouter chaque redirection
for mapping in "${PORTS_TCP[@]}"; do
    IFS=':' read -r INTERNAL EXTERNAL <<< "$mapping"
    echo "Redirection TCP $EXTERNAL -> $IP:$INTERNAL"
    upnpc -e "Auto $INTERNAL" -a "$IP" "$INTERNAL" "$EXTERNAL" TCP
done

# Ajouter chaque redirection
for mapping in "${PORTS_UDP[@]}"; do
    IFS=':' read -r INTERNAL EXTERNAL <<< "$mapping"
    echo "Redirection TCP $EXTERNAL -> $IP:$INTERNAL"
    upnpc -e "Auto $INTERNAL" -a "$IP" "$INTERNAL" "$EXTERNAL" UDP
done


#!/bin/bash
BOT_TOKEN="7584881278:AAFzxC3JOSuN7BNeGSHNqzJvhryNjPi-vbw"  # ton token

API_URL="https://api.telegram.org/bot$BOT_TOKEN"
OFFSET_FILE="offset.txt"

# Aide (un seul endroit)
send_help() {
  help_text=$'📚 Commandes disponibles:\n- gets <URL> → series\n- getf/get <URL> → films\n- help → affiche cette aide'
  curl -s -X POST "$API_URL/sendMessage" -d chat_id="$chat_id" -d text="$help_text" >/dev/null
}

# Initialise l’offset si le fichier n’existe pas
if [[ -f "$OFFSET_FILE" ]]; then
  OFFSET=$(cat "$OFFSET_FILE")
else
  OFFSET=0
fi

echo "🔁 En écoute des messages privés depuis OFFSET = $OFFSET"

while true; do
  response=$(curl -s "$API_URL/getUpdates?offset=$OFFSET&timeout=30")

  count=$(echo "$response" | jq '.result | length')
  if [[ "$count" -eq 0 ]]; then
    sleep 1
    continue
  fi

  for i in $(seq 0 $((count - 1))); do
    update=$(echo "$response" | jq ".result[$i]")
    update_id=$(echo "$update" | jq '.update_id')
    chat_id=$(echo "$update" | jq -r '.message.chat.id // empty')
    sender_name=$(echo "$update" | jq -r '.message.from.first_name // "?"')
    message_text=$(echo "$update" | jq -r '.message.text // empty')
    if [[ -n "$message_text" ]]; then
      echo "💬 [$chat_id] $sender_name : $message_text"
        # Rendre insensible à la casse
      lower_msg=$(echo "$message_text" | tr '[:upper:]' '[:lower:]')

      # Détecter gets/getf/get et définir le répertoire, gérer help et commandes inconnues
      cmd=$(echo "$lower_msg" | awk '{print $1}')
      if [[ "$cmd" == "gets" || "$cmd" == "getf" || "$cmd" == "get" ]]; then
        url=$(echo "$message_text" | cut -d' ' -f2-)
        case "$cmd" in
          gets)
            DEST_DIR="/Series"
            ;;
          getf)
            DEST_DIR="/Films"
            ;;
          get)
            DEST_DIR="/Films"
            ;;
        esac
        echo "📥 Commande ${cmd^^} détectée avec URL : $url"

        PYTHON_VENV="/home/maurice/Telegram/jdvenv/bin/python"
        SEND_JD_SCRIPT="/home/maurice/Telegram/download.py"
        # Exécution du script Python et capture de la sortie et du statut
        echo "🔎 Exécution du script Python"
        output=$("$PYTHON_VENV" "$SEND_JD_SCRIPT" "$url" "$DEST_DIR" 2>&1)
        status=$?

        echo "🔎 Statut : $status"
        echo "📄 Sortie : $output"

        # Message de confirmation avec le statut
        if [[ $status -eq 0 ]]; then
          reply="✅ Lien ajouté avec succès à MyJDownloader dans $DEST_DIR."
        else
          reply="❌ Erreur lors de l'ajout du lien dans $DEST_DIR."
        fi
        # Envoi du message à Telegram
        curl -s -X POST "$API_URL/sendMessage" \
          -d chat_id="$chat_id" \
          -d text="$reply" >/dev/null
      elif [[ "$cmd" == "help" || "$cmd" == "/help" || "$cmd" == "/start" ]]; then
        send_help
      else
        send_help
      fi

    fi

    # Met à jour OFFSET en mémoire
    OFFSET=$((update_id + 1))
    echo "$OFFSET" > "$OFFSET_FILE"
  done

  sleep 1
done

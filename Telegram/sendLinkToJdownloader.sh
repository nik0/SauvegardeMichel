#!/bin/bash

# ---- CONFIG ----
EMAIL="nicolas.ebele@gmail.com"
PASSWORD="nik01911"
DEVICE_NAME="JDownloader@Docker"   # Nom de ton appareil tel qu'affiché sur my.jdownloader.org
LINK="https://exemple.com/fichier.zip"

# ---- LOGIN ----
SESSION=$(curl -s -X POST "https://api.jdownloader.org/v1/auth" \
  -H "Content-Type: application/json" \
  -d "{\"email\":\"$EMAIL\", \"password\":\"$PASSWORD\"}" \
  | jq -r '.sessionToken')

if [ "$SESSION" == "null" ] || [ -z "$SESSION" ]; then
    echo "Erreur : impossible de se connecter."
    exit 1
fi

# ---- TROUVER L'ID DU DEVICE ----
DEVICE_ID=$(curl -s -X GET "https://api.jdownloader.org/v1/devices" \
  -H "Authorization: $SESSION" | jq -r ".[] | select(.name==\"$DEVICE_NAME\") | .id")

if [ -z "$DEVICE_ID" ]; then
    echo "Erreur : appareil introuvable."
    exit 1
fi

# ---- ENVOYER LE LIEN ----
curl -s -X POST "https://api.jdownloader.org/v1/devices/$DEVICE_ID/linkgrabberv2/addLinks" \
  -H "Authorization: $SESSION" \
  -H "Content-Type: application/json" \
  -d "{\"links\":\"$LINK\"}"

echo "✅ Lien envoyé à $DEVICE_NAME"

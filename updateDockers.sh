#!/bin/bash

# Dossiers racines à explorer
BASE_DIRECTORIES=(
  /home/michel
)

echo "=== [$(date)] Mise à jour des services docker-compose actifs ==="

for BASE in "${BASE_DIRECTORIES[@]}"; do
  echo "🔍 Recherche dans $BASE"

  # Recherche tous les docker-compose.yml dans les sous-répertoires
  while IFS= read -r -d '' COMPOSE_FILE; do
    DIR=$(dirname "$COMPOSE_FILE")
    echo ">> Vérification : $DIR"

    cd "$DIR" || continue

    # Vérifie s’il y a des conteneurs actifs associés à ce projet
    if docker compose ps -q | grep -q .; then
      echo " ✅ Projet actif trouvé dans $DIR"
      echo " - Pull des images..."
      docker compose pull
      echo " - Redémarrage des conteneurs..."
      docker compose up -d
    else
      echo " ❌ Aucun conteneur actif dans $DIR — ignoré"
    fi

  done < <(find "$BASE" -type f -iname "docker-compose.yml" -print0)

done

echo "=== ✅ Fin de la mise à jour ==="

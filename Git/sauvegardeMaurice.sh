#!/bin/bash
# ===========================
# Script de sauvegarde Git
# ===========================

# 📂 Dossier à sauvegarder
REPO_DIR="/home/maurice"

# ⏱️ Date pour le commit automatique
DATE=$(date +"%Y-%m-%d %H:%M:%S")

cd "$REPO_DIR" || exit 1

# Vérifie si c'est bien un repo Git
if [ ! -d ".git" ]; then
    echo "❌ Pas un dépôt Git : $REPO_DIR"
    exit 1
fi

# Met à jour depuis GitHub pour éviter les conflits
git pull --rebase origin main

# Ajoute tous les fichiers modifiés
git add .

# Commit avec la date
git commit -m "Backup automatique : $DATE" || echo "Rien à commiter"

# Push vers GitHub
git push origin main

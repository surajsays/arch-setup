#!/bin/bash
set -e

# === Settings ===
REPO_DIR="$HOME/arch-setup"   # path to your repo
OLD_USER="suraj"              # old username in configs

echo "🚀 Making $REPO_DIR portable..."

# === Step 1: Backup ===
BACKUP_DIR="$REPO_DIR-backup-$(date +%F-%H%M%S)"
echo "📦 Creating backup at $BACKUP_DIR"
cp -r "$REPO_DIR" "$BACKUP_DIR"

# === Step 2: Replace paths ===
echo "🔄 Replacing hardcoded paths..."

find "$REPO_DIR" -type f | while read -r file; do
    if file "$file" | grep -qE 'text|utf-8|ascii'; then
        # Replace $HOME → $HOME
        sed -i "s|/home/$OLD_USER|\\\$HOME|g" "$file"

        # (Optional) Replace plain "suraj" → $USER
        sed -i "s|\\b$OLD_USER\\b|$USER|g" "$file"
    fi
done

echo "✅ Done! All configs in $REPO_DIR are now portable."
echo "👉 Backup stored at $BACKUP_DIR"

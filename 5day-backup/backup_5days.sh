#!/bin/bash
####################################
# Backup Script (Every 5 Days)
# Author: Your Name
# Version: 1.0
####################################

# STEP 1: Define source directory (what to back up)
SOURCE="/home"

# STEP 2: Define destination directory (where backups will be stored)
DEST="/mnt/backup"

# STEP 3: Get current date
DATE=$(date +'%Y-%m-%d')

# STEP 4: Define backup file name
BACKUP_FILE="$DEST/backup_$DATE.tar.gz"

# STEP 5: Create destination directory if not exists
echo "[INFO] Creating destination directory: $DEST"
mkdir -p "$DEST"

# STEP 6: Start backup process
echo "[INFO] Creating backup from $SOURCE to $BACKUP_FILE"
tar -czf "$BACKUP_FILE" -C "$SOURCE" .
if [ $? -eq 0 ]; then
    echo "[SUCCESS] Backup created successfully → $BACKUP_FILE"
else
    echo "[ERROR] Backup process failed!"
    exit 1
fi

# STEP 7: Remove old backups older than 5 days
echo "[INFO] Removing backups older than 5 days..."
find "$DEST" -type f -name "backup_*.tar.gz" -mtime +5 -exec rm {} \;
echo "[SUCCESS] Old backups cleanup completed"

# STEP 8: Show backup list
echo "[INFO] Current backups in $DEST:"
ls -lh "$DEST"

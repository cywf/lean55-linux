#!/bin/bash

# Set variables
DB_USER="username"
DB_PASSWORD="password"
BACKUP_DIR="/var/backups/mysql"
BACKUP_FILE="mysql_$(date +%Y%m%d).tar.gz"
OLD_BACKUPS_DAYS=7

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Backup each MySQL database
for DB in $(mysql -u $DB_USER -p$DB_PASSWORD -e "SHOW DATABASE
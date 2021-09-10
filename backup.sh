#!/bin/bash

export PGHOST=localhost
export PGPORT=5432
export PGDATABASE=suppliers
export PGUSER=postgres
export PGPASSWORD=SecurePas$

TIME=$(date "+%s")
BACKUP_FILE="postgres_${PGDATABASE}_${TIME}.pgdump"
echo "Backing up $PGDATABASE to $BACKUP_FILE"
pg_dump --format=custom > $BACKUP_FILE
echo "Backup completed"
#!/bin/bash

export PGHOST=localhost
export PGPORT=5432
export PGDATABASE=suppliers
export PGUSER=abc
export PGPASSWORD=*put your own pw*

TIME=$(date "+%s")
BACKUP_FILE="postgres_${PGDATABASE}_${TIME}.pgdump"
pg_dump --format=custom > $BACKUP_FILE
echo "Backup completed"

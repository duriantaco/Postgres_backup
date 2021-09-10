#!/bin/bash

export PG_DB_HOST=localhost
export PG_DB_PORT=5432
export PG_DB_NAME=suppliers
export PG_DB_USER=abc
export PG_DB_PW=<use your own pw>

TIME=$(date "+%s")
BACKUP_FILE="postgres_${PG_DB_NAME}_${TIME}.pgdump"
echo "Backing up $PG_DB_NAME to $BACKUP_FILE"
pg_dump --format=custom > $BACKUP_FILE
echo "Backup completed"

S3_BUCKET=s3://ai-model-database-backup/postgresql
S3_TARGET=$S3_BUCKET/$BACKUP_FILE
echo "Copying $BACKUP_FILE to $S3_TARGET"
aws s3 cp $BACKUP_FILE $S3_TARGET

echo "Backup completed for $PG_DB_NAME"




#!/bin/bash

DATE=$(date +%d-%m-%Y)
BACKUP_DIR="/backups"
##HOST and credentionals 
DB_HOST=<remote-hostname or local-hostname>
DB_PASSWORD=securepassword
DB_NAME=postgres
DB_PORT=5432
APP_NAME=myawesomeapp

## list table to backup
tables=("table1" "table2" "table3")

## Go through each table and pull the records
for table in ${tables[@]};
do
  echo "Downloading records for the table: $table"
  ## Run pg_dump command against each table and pull the records
  pg_dump -d postgresql://postgres:$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_NAME --column-inserts --data-only --table="$table" > $BACKUP_DIR/$APP_NAME-$table-$(date +%d-%m-%Y).sql

  echo "Downloading finished for the table: $table"
done


0 23 1 31 7 maksim /home/maksim/ansible-book/bash/backup_sql.sh


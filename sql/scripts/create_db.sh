#!/bin/bash
export DB_NAME=$USER"_DB"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ./cs166-project/startup/startPostgreSQL.sh 
sleep 1
source ./cs166-project/startup/createPostgreDB.sh 
cp cs166-project/data/*.txt /tmp/$USER/myDB/data/
psql -h localhost -p 1024 $DB_NAME < cs166-project/sql/src/create_tables.sql 
psql -h localhost -p 1024 $DB_NAME < cs166-project/sql/src/create_indexes.sql
psql -h localhost -p 1024 $DB_NAME < cs166-project/sql/src/load_data.sql

#!/bin/bash
mysql -u "$DB_USERNAME" -p"$DB_PASSWORD" -h 10.231.8.25 -e "CREATE TABLE db_changes.new_table ( \
  column1 INT NOT NULL AUTO_INCREMENT, \
  PRIMARY KEY (column1));"

#!/usr/bin/env bash
for i in $(seq 1 100000); do mysql -u "$DB_USERNAME" -h  10.231.8.25 -D db_changes -s -e "INSERT INTO new_table VALUES (NULL);"; done

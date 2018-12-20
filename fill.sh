for i in $(seq 1 $END); do mysql -u "$DB_USERNAME" -p"$DB_PASSWORD" -h  -D db_changes -s -e "INSERT INTO new_table VALUES (NULL);"; done

for i in $(seq 1 10000000); do mysql -u "$DB_USERNAME" -p"$DB_PASSWORD" -h  10.231.8.25 -D db_changes -s -e "INSERT INTO new_table VALUES (NULL);"; done

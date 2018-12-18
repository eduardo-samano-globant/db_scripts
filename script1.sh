mysql -u "$(vault read -field=username data-eng/vivid-master-rw)" -p"$(vault read -field=password data-eng/vivid-master-rw)" -h 10.231.8.25 -e "CREATE TABLE `db_changes`.`new_table` (
  `column1` INT NOT NULL,
  PRIMARY KEY (`column1`));"

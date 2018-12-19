  pt-online-schema-change  \
  --execute  \
  --progress=time,30 \
  --nocheck-replication-filters  \
  --user=$(vault read -field=username data-eng/vivid-master-rw)  \
  --password=$(vault read -field=password data-eng/vivid-master-rw)  \
  --critical-load=Threads_running=200  \
  --alter "ADD COLUMN columnper VARCHAR(45) NOT NULL DEFAULT '' AFTER column2" \
  h=10.231.8.25,D=db_changes,t=new_table

  pt-online-schema-change  \
  --execute  \
  --progress=time,30 \
  --nocheck-replication-filters  \
  --user=$DB_USERNAME  \
  --critical-load=Threads_running=200  \
  --alter "ADD COLUMN columnper VARCHAR(45) NOT NULL DEFAULT '' AFTER column1" \
  h=10.231.8.25,D=db_changes,t=new_table

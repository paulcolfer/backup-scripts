# the backups are saved to this folder
BACKUPS="/mnt/backup"
# docker volumes are stored in this folder
VOLUMES="/var/lib/docker/volumes"
# get the iso date format
NOW=$(date --iso)

#Docker volume to backup (Postgres in this example)
docker stop Postgres
zip -r --symlinks $BACKUPS/postgres-$NOW".zip $VOLUMES/postgres_data || true
docker start Postgres

#repeat the above block for each container

# remove backups older than 7 days
echo "Cleanup started..."
find $BACKUPS -mtime +7 -delete
echo "Cleanup finished."

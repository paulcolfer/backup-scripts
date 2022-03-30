# the backups are saved to this folder
BACKUPS="/mnt/backup"
# docker volumes are stored in this folder
VOLUMES="/var/lib/docker/volumes"

#Docker Volume to Backup
docker stop Postgres
zip -r --symlinks $BACKUPS/postgres-"`date +"%Y-%m-%d"`".zip $VOLUMES/postgres_data || true
docker start Postgres

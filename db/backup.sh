#!/bin/bash

# Get pg_dump from a Docker Container and pg_restore into another

# cd /tmp || exit

# # Get the current directory
# current_dir=$(pwd)
# echo "Current directory is: $current_dir"

# # Switch to the current directory (just as an example)
# cd "$current_dir"
# 
# # Confirm the directory change
# echo "Switched to directory: $(pwd)"

# docker exec postgres-container pg_dump -U keycloak -F t keycloakdb > /tmp/keycloakdb_backup.tar

# From the host machine to save backup inside the running container
# docker exec -t postgres-container pg_dump -U keycloak -d keycloakdb -F c -b -v -f /var/lib/postgresql/data/keycloakdb_backup.dump

docker exec -i postgres-container /bin/bash -c "PGPASSWORD=keycloakpass pg_dump --username keycloak keycloakdb" > /tmp/keycloakdb_backup.sql

# From the host machine to retrieve the created backup that has been stored inside the running container
# docker cp postgres-container:/var/lib/postgresql/data/keycloakdb_backup.dump /tmp/keycloakdb_backup.dump


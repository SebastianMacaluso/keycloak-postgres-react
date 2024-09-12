#!/bin/bash

cd /tmp || exit

# From the host machine to save backup inside the running container
docker exec -t postgres-container pg_dump -U keycloak -d keycloakdb -F c -b -v -f /var/lib/postgresql/data/keycloakdb_backup.dump

# From the host machine to retrieve the created backup that has been stored inside the running container
docker cp postgres-container:/var/lib/postgresql/data/keycloakdb_backup.dump keycloakdb_backup.dump

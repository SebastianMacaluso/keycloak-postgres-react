#!/bin/bash

# cd /tmp || exit

# From the host machine
# docker exec -i postgres-container pg_restore -U keycloak -d keycloakdb -v /tmp/keycloakdb_backup.dump
docker exec -i postgres-container pg_restore -U keycloak -d keycloakdb -v /var/lib/postgresql/data/keycloakdb_backup.dump   
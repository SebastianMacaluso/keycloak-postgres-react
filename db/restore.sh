#!/bin/bash

cd /tmp || exit

# From the host machine
docker exec -i postgres-container pg_restore -U keycloak -d keycloakdb -v keycloakdb_backup.dump

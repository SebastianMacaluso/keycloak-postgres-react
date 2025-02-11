#!/bin/bash

# cd /tmp || exit

# From the host machine

# docker cp /tmp/keycloakdb_backup.tar postgres-container:/var/lib/postgresql/data/keycloakdb_backup.tar

# docker exec -it postgres-container psql -U keycloak

# pg_restore -U keycloak -C -d keycloakdb /var/lib/postgresql/data/keycloakdb_backup.tar

cat /tmp/keycloakdb_backup.sql | docker exec -i postgres-container psql -U keycloak -d keycloakdb


# -----
# docker exec -i postgres-container /bin/bash -c "PGPASSWORD=keycloakpass psql --username keycloak keycloakdb" < /tmp/keycloakdb_backup.sql
# -------
# docker cp /tmp/keycloakdb_backup.dump postgres-container:/var/lib/postgresql/data/keycloakdb_backup.dump 

# docker exec -i postgres-container pg_restore -U keycloak -d keycloakdb -v /tmp/keycloakdb_backup.dump
# docker exec -i postgres-container pg_restore -U keycloak -d keycloakdb -v /var/lib/postgresql/data/keycloakdb_backup.dump   
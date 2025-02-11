#!/bin/bash

# Create keycloak-react network
# docker network create keycloak-react-network

# Remove running container
docker stop keycloak-container
docker rm -f keycloak-container

# Delete image
docker image rm -f keycloak-image

# Build image
docker build -t keycloak-image .

# # Run container
# docker run -d -p 8080:8080 --name keycloak-container --network keycloak-react-network  keycloak-image start-dev

# Run container
docker run -d -p 8080:8080 --name keycloak-container --network keycloak-react-network -v ./realm-export.json:/opt/keycloak/data/import/realm-export.json keycloak-image start-dev --import-realm

# --import-realm imports the configuration file mounted: /opt/keycloak/data/import/realm-export.json
# ./realms:/opt/keycloak/data/import:z mounts the volume to the directory where Keycloak stores its data

# Display container logs
# docker logs -f keycloak-container


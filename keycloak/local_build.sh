#!/bin/bash

# Create keycloak-react network
docker network create keycloak-react-network

# Remove running container
docker stop keycloak-container
docker rm -f keycloak-container

# Delete image
docker image rm -f keycloak-image

# Build image
docker build -t keycloak-image .

# Run container
docker run -d -p 8080:8080 --name keycloak-container --network keycloak-react-network keycloak-image start-dev

# Display container logs
docker logs -f keycloak-container


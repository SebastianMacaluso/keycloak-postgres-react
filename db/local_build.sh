#!/bin/bash

# Create network if it doesn't exist
docker network create keycloak-react-network

# Remove running PostgresSQL container
docker stop postgres-container
docker rm -f postgres-container

# Delete existing PostgresSQL image if it exists
docker image rm -f postgres-image

# Build the PostgresSQL image from the custom Dockerfile
docker build -t postgres-image .

# Run PostgresSQL container
docker run -d \
  --name postgres-container \
  --network keycloak-react-network \
  -v "$HOME"/Data/keycloak-react:/var/lib/postgresql/data \
  postgres-image

# Display PostgresSQL logs
docker logs -f postgres-container

#!/bin/bash

echo "Starting PostgreSQL and Keycloak containers..."

# Initialize network and launch Postgres db
cd db
sh local_build.sh

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL to start..."
sleep 2  # Adjust sleep time if needed

# Launch keycloak
cd ../keycloak
sh local_build.sh

#Launch website
cd ../skillab-app
npm start
#!/bin/bash

# Check if a configuration file is provided
if [ -z "$1" ]; then
  echo "Usage: ./import.sh <config-file>"
  exit 1
fi

CONFIG_FILE=$1

# Run the Keycloak Config CLI tool with the updated options
java -jar keycloak-config-cli.jar \
  --keycloak.url="http://localhost:8081" \
  --keycloak.user="admin" \
  --keycloak.password="admin" \
  --import.managed.group="full" \
  --import.remote-state.enabled="true" \
  --import.files.locations="/home/to/config/file"

echo "Import of $CONFIG_FILE with remote-state enabled is complete."
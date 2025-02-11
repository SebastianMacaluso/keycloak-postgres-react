# Base image for PostgreSQL
FROM postgres:17.2

# Set environment variables
ENV POSTGRES_USER=keycloak
ENV POSTGRES_PASSWORD=keycloakpass
ENV POSTGRES_DB=keycloakdb

# Expose PostgreSQL port
EXPOSE 5432

# Set the default command to run PostgreSQL
CMD ["postgres"]

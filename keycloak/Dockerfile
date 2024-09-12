# Base image
FROM quay.io/keycloak/keycloak:latest

# Set environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://postgres-container:5432/keycloakdb
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=keycloakpass

#RUN sed -i 's/^skip-name-resolve/#skip-name-resolve/' /etc/my.cnf

# Expose Keycloak port
EXPOSE 8080

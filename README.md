# keycloak-react

We have implemente a single page application where a public section is always shown
but a protected section is only shown when the user logs in using keycloak.

A keycloak server is deployed using Docker with an external DB for conf storing.
A Postgres db is deployed using Docker with external volume.
Keycloak conf can be exported with simple dump.

Proper scripts are provided for deploying db, keycloak and web.

This postgres-keycloak-react test shows the feasability of combining these technologies,
however, this configuration is insecure:

The single page application is sent to browser with all the contents,
including the protected section. Any advance user could bypass the credentials check.
Despite the fact that credentials are check in the backend, the page is insecure.

For a secure configuration, content should be sent to the browser
only when the credentials check is done.
An API could be use to serve the protected content.


# TODO: Modify skillab client to avoid localhost in redirect and post logout urls
# TODO: Add TLS. A certificate is needed.
# TODO: Add API for serving protected content.
# TODO: Add mechanism for creating protected contena (i.e. Express backend (node.js) + mongo)

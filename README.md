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


Go to db directory
1) Run "bash local_bild.sh"
Go to keycloak dir
2) Run "bash local_build.sh"
3) If we want to retrieve the dataset run from the db dir "bash restore.sh"
4) Open the local host
 http://localhost:8080/realms/master/protocol/openid-connect/auth?client_id=security-admin-console&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fadmin%2Fmaster%2Fconsole%2F&state=de5e0e6b-8555-4640-9751-fa9e3ecd4d48&response_mode=query&response_type=code&scope=openid&nonce=13e0d455-908f-4202-ac96-917a8b278538&code_challenge=DOSEBEHD2N2KoRzZ2g0n9Bdpvnshev2c-yGucO8_URU&code_challenge_method=S256
 Mode retails here https://www.keycloak.org/getting-started/getting-started-docker
 
 Work here directly on the browser
5) before killing the database container, make a backup
GO to dr dir and run "bash backup.sh"
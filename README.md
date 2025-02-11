# keycloak-react implementation for login/logout/registration of website

We have implemented a single page application where a public section is always shown
but a protected section is only shown when the user logs in using keycloak.

A keycloak server is deployed using Docker with an external DB for conf storing.
A Postgres db is deployed using Docker with external volume.
Keycloak conf can be exported with simple dump to export the database to a different machine.

Proper scripts are provided for deploying db, keycloak and web.

This postgres-keycloak-react test shows the feasability of combining these technologies,
however, this configuration is insecure:

The single page application is sent to browser with all the contents,
including the protected section. Any advance user could bypass the credentials check.
Despite the fact that credentials are check in the backend, the page is insecure.

For a secure configuration, content should be sent to the browser only when the credentials check is done.
An API could be use to serve the protected content.


 **TODO**: Modify skillab client to avoid localhost in redirect and post logout urls

 **TODO**: Add TLS. A certificate is needed.

 **TODO**: Add API for serving protected content.

 **TODO**: Add mechanism for creating protected contena (i.e. Express backend (node.js) + mongo)


To launch the website with keycloak authentication and postgres database, go to the main dir:

`bash launch_postgres_keycloak_reactapp.sh`


## Keycloack and Postgres db:

Keycloak and postgres db are implemented over Docker, running on a common network: keycloak-react-network

a) Before killing the database container, if we want to restore the db in a different machine, make a backup

`bash db/backup.sh`

b) To retrieve the dataset into a different machine, run in the `db` dir (not tested)

`bash db/restore.sh`

### Keycloak configuration file
There is a configuration file that can be modified:

`realm-export.json`

The Keycloak session can be opened at
[http://localhost:8080/](http://localhost:8080/)

username: admin

password: admin

## React
The react app is launched at 
[http://localhost:3000/](http://localhost:3000/)

From there, the login or registration of a new user can be done through keycloak

## Installation requirements

**Install**
- Docker
- npm


### React

To create a new app (for a new project)

1- `npx create-react-app my_new_app`

Then change the version of react to 18 if getting an error in `package.json`

2- Go to root dir of the app and run

`npm install`
`npm run dev`

`npm install web-vitals`

`npm start`


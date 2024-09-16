import { useState, useEffect } from "react";

import Keycloak from "keycloak-js";


const Protected: React.FC = () => {

  const keycloakOptions = {
    url: import.meta.env.VITE_KEYCLOAK_URL,
    realm: import.meta.env.VITE_KEYCLOAK_REALM,
    clientId: import.meta.env.VITE_KEYCLOAK_CLIENT,
  };

  const [keycloak, setKeycloak] = useState<Keycloak>()


  useEffect(() => {
    const initKeycloak = async () =>{
      const keycloakInstance = new Keycloak(keycloakOptions)
      try {
        await keycloakInstance.init({onLoad: 'login-required'})
        setKeycloak(keycloakInstance)
        if (keycloakInstance.authenticated){
          console.log("Exxxitooooorr")
          console.log(keycloakInstance)
        }
      } catch (error) {
        console.log(`Error ${error}`)
      }
    }
    initKeycloak()
  }, [])

  return (
    <>
      <div>Protected</div>
      {keycloak && <p>Contenido protegido</p>}
    </>
  )
};

export default Protected;

import { useState, useEffect } from "react";
import Keycloak from "keycloak-js";

import './App.css';
import Protected from "./components/Protected";
import Public from "./components/Public";


const App: React.FC = () => {


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

  return keycloak ? <Protected /> : <Public />;
};

export default App;


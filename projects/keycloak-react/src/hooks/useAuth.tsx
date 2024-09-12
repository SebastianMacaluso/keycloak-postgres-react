import { useState, useEffect, useRef } from "react";
import Keycloak from "keycloak-js";

const client = new Keycloak({
  url: import.meta.env.VITE_KEYCLOAK_URL,
  realm: import.meta.env.VITE_KEYCLOAK_REALM,
  clientId: import.meta.env.VITE_KEYCLOAK_CLIENT,
});

// Define the type for the return value of useAuth
type Token = string | undefined;

const useAuth = (): [boolean, Token] => {
  const isRun = useRef<boolean>(false);
  const [token, setToken] = useState<Token>(undefined);
  const [isLogin, setLogin] = useState<boolean>(false);

  useEffect(() => {
    if (isRun.current) return;

    isRun.current = true;
    client
      .init({
        onLoad: "login-required",
      })
      .then((authenticated) => {
        setLogin(authenticated);
        setToken(client.token || undefined);
      });
  }, []);

  return [isLogin, token];
};

export default useAuth;

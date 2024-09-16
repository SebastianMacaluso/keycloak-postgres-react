import { useState } from "react";

import Protected from "./Protected";
import Public from "./Public";


const Home: React.FC = () => {
  // Estado para controlar si se debe mostrar el componente Protected
  const [showProtected, setShowProtected] = useState(false);

  // Función para alternar el estado
  const toggleProtected = () => {
    setShowProtected(!showProtected);
  };

  return (
    <>
      <div>Home</div>
      <div>
        Public: <Public />
      </div>
      <button onClick={toggleProtected}>
        {showProtected ? "Hide Protected" : "Show Protected"}
      </button>
      {showProtected && (
        <div>
          Protected: <Protected />
        </div>
      )}
    </>
  );
};

export default Home;

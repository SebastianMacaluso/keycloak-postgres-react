
import { useState } from "react";

import Protected from "./components/Protected";
import Public from "./components/Public";
import './App.css';


const App: React.FC = () => {

  // State for controlling Protected component showing
  const [showProtected, setShowProtected] = useState(false);

  // Function to change Protected component showing state
  const toggleProtected = () => { setShowProtected(!showProtected); };

  return (
    <div className='home'>
      <div>Home</div>
      <div>
        Public: <Public />
      </div>
      <button onClick={toggleProtected}>
        {showProtected ? "Hide Protected" : "Show Protected"}
      </button>
        <div>
          Protected: {showProtected && <Protected />}
        </div>
    </div>
  );

};

export default App;


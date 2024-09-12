import './App.css';
import Protected from "./components/Protected";
import Public from "./components/Public";
import useAuth from "./hooks/useAuth";

const App: React.FC = () => {
  const [isLogin, token] = useAuth();

  return isLogin ? <Protected token={token} /> : <Public />;
};

export default App;


import { useState, useEffect, useRef } from "react";
import axios from "axios";

// Define types for props
interface ProtectedProps {
  token: string | undefined;
}

// Define types for data (assuming it’s an array of strings; adjust if needed)
interface DataType {
  [index: number]: string;
}

const Protected: React.FC<ProtectedProps> = ({ token }) => {
  const isRun = useRef<boolean>(false);

  const [data, setData] = useState<DataType | null>(null);

  useEffect(() => {
    if (isRun.current) return;

    isRun.current = true;

    const config = {
      headers: {
        authorization: `Bearer ${token}`,
      },
    };

    axios
      .get<DataType>("/documents", config)
      .then((res) => setData(res.data))
      .catch((err) => console.error(err));
  }, [token]);

  return data ? (
    <>
      "Data with no map"
    </>
  ) : (
    <div>Protected</div>
  );
};

export default Protected;

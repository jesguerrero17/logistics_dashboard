import { createContext, useContext, useEffect, useState } from 'react';
import { createEmptySupplyChainData, loadSupplyChainData } from './loadData';

const SupplyChainDataContext = createContext(null);

export function SupplyChainDataProvider({ children }) {
  const [data, setData] = useState(createEmptySupplyChainData());
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    let active = true;

    async function fetchData() {
      try {
        setLoading(true);
        setError('');
        const nextData = await loadSupplyChainData();

        if (active) {
          setData(nextData);
        }
      } catch (err) {
        if (active) {
          setError(err instanceof Error ? err.message : 'Failed to load CSV data.');
          setData(createEmptySupplyChainData());
        }
      } finally {
        if (active) {
          setLoading(false);
        }
      }
    }

    fetchData();

    return () => {
      active = false;
    };
  }, []);

  return (
    <SupplyChainDataContext.Provider value={{ ...data, loading, error }}>
      {children}
    </SupplyChainDataContext.Provider>
  );
}

export function useSupplyChainData() {
  const context = useContext(SupplyChainDataContext);

  if (!context) {
    throw new Error('useSupplyChainData must be used within a SupplyChainDataProvider.');
  }

  return context;
}

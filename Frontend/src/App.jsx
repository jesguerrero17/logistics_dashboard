import { Route, Switch } from 'wouter';
import Dashboard from './pages/Dashboard';
import Inventory from './pages/Inventory';
import Suppliers from './pages/Suppliers';
import Shipping from './pages/Shipping';
import Pipeline from './pages/Pipeline';
import { SupplyChainDataProvider } from './data/SupplyChainDataContext';

function NotFound() {
  return (
    <div className="flex items-center justify-center h-screen bg-white">
      <div className="text-center">
        <h1 className="text-4xl font-bold text-primary mb-4">404</h1>
        <p className="text-gray-600 mb-8">Page not found</p>
        <a href="/" className="text-accent hover:underline font-semibold">
          Back to Dashboard
        </a>
      </div>
    </div>
  );
}

export default function App() {
  return (
    <SupplyChainDataProvider>
      <Switch>
        <Route path="/" component={Dashboard} />
        <Route path="/inventory" component={Inventory} />
        <Route path="/suppliers" component={Suppliers} />
        <Route path="/shipping" component={Shipping} />
        <Route path="/pipeline" component={Pipeline} />
        <Route component={NotFound} />
      </Switch>
    </SupplyChainDataProvider>
  );
}

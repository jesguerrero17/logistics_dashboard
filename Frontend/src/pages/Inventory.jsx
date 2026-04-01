import DashboardLayout from '../components/DashboardLayout';
import { AlertCircle, CheckCircle, Package } from 'lucide-react';
import { useSupplyChainData } from '../data/SupplyChainDataContext';

function DataState({ title, message, tone = 'default' }) {
  const toneClasses =
    tone === 'error'
      ? 'border-red-200 bg-red-50 text-red-800'
      : 'border-gray-200 bg-white text-primary';

  return (
    <div className={`rounded-lg border p-6 ${toneClasses}`}>
      <h3 className="text-lg font-bold mb-2">{title}</h3>
      <p className="text-sm">{message}</p>
    </div>
  );
}

export default function Inventory() {
  const { loading, error, inventoryItems } = useSupplyChainData();

  const getAvailabilityBadge = (availability) => {
    switch (availability) {
      case 'in-stock':
        return (
          <div className="flex items-center gap-2">
            <CheckCircle className="w-4 h-4 text-green-600" />
            <span className="text-green-700 font-medium">In Stock</span>
          </div>
        );
      case 'low-stock':
        return (
          <div className="flex items-center gap-2">
            <AlertCircle className="w-4 h-4 text-yellow-600" />
            <span className="text-yellow-700 font-medium">Low Stock</span>
          </div>
        );
      case 'out-of-stock':
        return (
          <div className="flex items-center gap-2">
            <AlertCircle className="w-4 h-4 text-red-600" />
            <span className="text-red-700 font-medium">Out of Stock</span>
          </div>
        );
      default:
        return null;
    }
  };

  if (loading) {
    return (
      <DashboardLayout>
        <DataState title="Loading inventory data" message="Reading SKU, stock, and availability values from the CSV." />
      </DashboardLayout>
    );
  }

  if (error) {
    return (
      <DashboardLayout>
        <DataState title="Inventory data unavailable" message={error} tone="error" />
      </DashboardLayout>
    );
  }

  const lowStockItems = inventoryItems.filter(
    (item) => item.availability === 'low-stock' || item.availability === 'out-of-stock'
  );
  const inStockCount = inventoryItems.filter((item) => item.availability === 'in-stock').length;
  const lowStockCount = inventoryItems.filter((item) => item.availability === 'low-stock').length;
  const outOfStockCount = inventoryItems.filter((item) => item.availability === 'out-of-stock').length;

  return (
    <DashboardLayout>
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold text-primary flex items-center gap-2">
              <Package className="w-8 h-8" />
              Inventory Management
            </h1>
            <p className="text-gray-600 mt-1">
              Track stock levels and product availability across all SKUs
            </p>
          </div>
          <div className="text-right">
            <div className="text-3xl font-bold text-primary">{inventoryItems.length}</div>
            <div className="text-sm text-gray-600">Total SKUs</div>
          </div>
        </div>

        {lowStockItems.length > 0 && (
          <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
            <div className="flex items-start gap-3">
              <AlertCircle className="w-5 h-5 text-yellow-600 flex-shrink-0 mt-0.5" />
              <div>
                <h3 className="font-semibold text-yellow-900">Low Stock Alert</h3>
                <p className="text-sm text-yellow-800 mt-1">
                  {lowStockItems.length} item{lowStockItems.length !== 1 ? 's' : ''} need attention.
                  Consider reviewing the affected SKUs in the CSV-backed inventory view.
                </p>
              </div>
            </div>
          </div>
        )}

        <div className="bg-white rounded-lg shadow-sm overflow-hidden border border-gray-200">
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr className="border-b border-gray-200 bg-gray-50">
                  <th className="text-left py-4 px-6 font-semibold text-primary">SKU</th>
                  <th className="text-left py-4 px-6 font-semibold text-primary">Product Type</th>
                  <th className="text-right py-4 px-6 font-semibold text-primary">Stock Level</th>
                  <th className="text-center py-4 px-6 font-semibold text-primary">Availability</th>
                  <th className="text-right py-4 px-6 font-semibold text-primary">Lead Time</th>
                </tr>
              </thead>
              <tbody>
                {inventoryItems.map((item) => (
                  <tr key={item.sku} className="border-b border-gray-200 hover:bg-gray-50 transition-colors">
                    <td className="py-4 px-6">
                      <span className="font-mono font-semibold text-primary">{item.sku}</span>
                    </td>
                    <td className="py-4 px-6 text-primary">{item.productType}</td>
                    <td className="py-4 px-6 text-right">
                      <span
                        className={`font-bold text-lg ${
                          item.stockLevel === 0
                            ? 'text-red-600'
                            : item.stockLevel < 20
                              ? 'text-yellow-600'
                              : 'text-green-600'
                        }`}
                      >
                        {item.stockLevel.toLocaleString()}
                      </span>
                    </td>
                    <td className="py-4 px-6 text-center">{getAvailabilityBadge(item.availability)}</td>
                    <td className="py-4 px-6 text-right text-gray-600 text-sm">{item.leadTime.toLocaleString()} days</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="kpi-card">
            <p className="kpi-label">In Stock Items</p>
            <p className="kpi-value mt-2">{inStockCount}</p>
            <p className="text-xs text-gray-600 mt-2">
              {inventoryItems.length ? ((inStockCount / inventoryItems.length) * 100).toFixed(1) : '0.0'}% of total
            </p>
          </div>
          <div className="kpi-card">
            <p className="kpi-label">Low Stock Items</p>
            <p className="kpi-value mt-2 text-yellow-600">{lowStockCount}</p>
            <p className="text-xs text-gray-600 mt-2">Requires attention</p>
          </div>
          <div className="kpi-card">
            <p className="kpi-label">Out of Stock Items</p>
            <p className="kpi-value mt-2 text-red-600">{outOfStockCount}</p>
            <p className="text-xs text-gray-600 mt-2">Urgent restock needed</p>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}

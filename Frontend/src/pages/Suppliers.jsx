import DashboardLayout from '../components/DashboardLayout';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Cell } from 'recharts';
import { Users, Globe, Clock } from 'lucide-react';
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

export default function Suppliers() {
  const { loading, error, suppliers, ordersBySupplier } = useSupplyChainData();

  const getQualityRateColor = (qualityPassRate) => {
    if (qualityPassRate >= 80) return 'text-green-600 bg-green-50';
    if (qualityPassRate >= 50) return 'text-blue-600 bg-blue-50';
    return 'text-yellow-600 bg-yellow-50';
  };

  if (loading) {
    return (
      <DashboardLayout>
        <DataState title="Loading supplier data" message="Aggregating suppliers, order quantities, lead times, and inspection-based quality pass rates from the CSV." />
      </DashboardLayout>
    );
  }

  if (error) {
    return (
      <DashboardLayout>
        <DataState title="Supplier data unavailable" message={error} tone="error" />
      </DashboardLayout>
    );
  }

  const averageLeadTime = suppliers.length
    ? suppliers.reduce((sum, supplier) => sum + supplier.leadTime, 0) / suppliers.length
    : 0;
  const totalOrders = suppliers.reduce((sum, supplier) => sum + supplier.ordersPlaced, 0);
  const averageQualityPassRate = suppliers.length
    ? suppliers.reduce((sum, supplier) => sum + supplier.qualityPassRate, 0) / suppliers.length
    : 0;

  return (
    <DashboardLayout>
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold text-primary flex items-center gap-2">
              <Users className="w-8 h-8" />
              Supplier Management
            </h1>
            <p className="text-gray-600 mt-1">
              Monitor supplier locations, lead times, order volume, and inspection-derived quality signals
            </p>
          </div>
          <div className="text-right">
            <div className="text-3xl font-bold text-primary">{suppliers.length}</div>
            <div className="text-sm text-gray-600">Active Suppliers</div>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm p-6 border border-gray-200">
          <h3 className="text-lg font-bold text-primary mb-4">Orders by Supplier</h3>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={ordersBySupplier}>
              <CartesianGrid strokeDasharray="3 3" stroke="#E8EAED" />
              <XAxis dataKey="name" tick={{ fill: '#6B7280', fontSize: 11 }} angle={-45} textAnchor="end" height={100} />
              <YAxis tick={{ fill: '#6B7280', fontSize: 12 }} />
              <Tooltip
                contentStyle={{
                  backgroundColor: '#FFFFFF',
                  border: '1px solid #E8EAED',
                  borderRadius: '8px',
                }}
                formatter={(value) => value.toLocaleString()}
              />
              <Bar dataKey="orders" radius={[8, 8, 0, 0]}>
                {ordersBySupplier.map((entry, index) => (
                  <Cell key={`supplier-cell-${index}`} fill={entry.fill} />
                ))}
              </Bar>
            </BarChart>
          </ResponsiveContainer>
        </div>

        <div className="bg-white rounded-lg shadow-sm overflow-hidden border border-gray-200">
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr className="border-b border-gray-200 bg-gray-50">
                  <th className="text-left py-4 px-6 font-semibold text-primary">Supplier Name</th>
                  <th className="text-left py-4 px-6 font-semibold text-primary flex items-center gap-2">
                    <Globe className="w-4 h-4" />
                    Location
                  </th>
                  <th className="text-center py-4 px-6 font-semibold text-primary flex items-center justify-center gap-2">
                    <Clock className="w-4 h-4" />
                    Lead Time (days)
                  </th>
                  <th className="text-right py-4 px-6 font-semibold text-primary">Orders Placed</th>
                  <th className="text-center py-4 px-6 font-semibold text-primary">Quality Pass Rate</th>
                </tr>
              </thead>
              <tbody>
                {suppliers.map((supplier) => (
                  <tr key={supplier.id} className="border-b border-gray-200 hover:bg-gray-50 transition-colors">
                    <td className="py-4 px-6">
                      <span className="font-semibold text-primary">{supplier.name}</span>
                    </td>
                    <td className="py-4 px-6 text-primary">{supplier.location}</td>
                    <td className="py-4 px-6 text-center">
                      <span className="font-semibold text-primary">{supplier.leadTime.toFixed(1)}</span>
                    </td>
                    <td className="py-4 px-6 text-right">
                      <span className="font-semibold text-primary">{supplier.ordersPlaced.toLocaleString()}</span>
                    </td>
                    <td className="py-4 px-6 text-center">
                      <span
                        className={`inline-block px-3 py-1 rounded-full text-sm font-semibold ${getQualityRateColor(
                          supplier.qualityPassRate
                        )}`}
                      >
                        {supplier.qualityPassRate.toFixed(1)}%
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="kpi-card">
            <p className="kpi-label">Avg Lead Time</p>
            <p className="kpi-value mt-2">{averageLeadTime.toFixed(1)} days</p>
            <p className="text-xs text-gray-600 mt-2">Across all suppliers</p>
          </div>
          <div className="kpi-card">
            <p className="kpi-label">Total Orders</p>
            <p className="kpi-value mt-2">{totalOrders.toLocaleString()}</p>
            <p className="text-xs text-gray-600 mt-2">Summed from Order quantities</p>
          </div>
          <div className="kpi-card">
            <p className="kpi-label">Avg Quality Pass Rate</p>
            <p className="kpi-value mt-2">{averageQualityPassRate.toFixed(1)}%</p>
            <p className="text-xs text-gray-600 mt-2">Inspection pass rate, not a supplier SLA</p>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}

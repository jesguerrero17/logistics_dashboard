import DashboardLayout from '../components/DashboardLayout';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Cell } from 'recharts';
import { Truck } from 'lucide-react';
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

export default function Shipping() {
  const { loading, error, shippingRecords, shippingCostByCarrier, summary } = useSupplyChainData();

  if (loading) {
    return (
      <DashboardLayout>
        <DataState title="Loading shipping data" message="Aggregating carriers, transportation modes, routes, shipping costs, and shipping times from the CSV." />
      </DashboardLayout>
    );
  }

  if (error) {
    return (
      <DashboardLayout>
        <DataState title="Shipping data unavailable" message={error} tone="error" />
      </DashboardLayout>
    );
  }

  return (
    <DashboardLayout>
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold text-primary flex items-center gap-2">
              <Truck className="w-8 h-8" />
              Shipping Management
            </h1>
            <p className="text-gray-600 mt-1">
              Track shipment rows, carriers, routes, transportation modes, shipping costs, and total costs from the CSV
            </p>
          </div>
          <div className="text-right">
            <div className="text-3xl font-bold text-primary">{shippingRecords.length}</div>
            <div className="text-sm text-gray-600">Total Shipments</div>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm p-6 border border-gray-200">
          <h3 className="text-lg font-bold text-primary mb-4">Shipping Cost by Carrier</h3>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={shippingCostByCarrier}>
              <CartesianGrid strokeDasharray="3 3" stroke="#E8EAED" />
              <XAxis dataKey="carrier" tick={{ fill: '#6B7280', fontSize: 12 }} />
              <YAxis tick={{ fill: '#6B7280', fontSize: 12 }} />
              <Tooltip
                contentStyle={{
                  backgroundColor: '#FFFFFF',
                  border: '1px solid #E8EAED',
                  borderRadius: '8px',
                }}
                formatter={(value) => `$${value.toLocaleString()}`}
              />
              <Bar dataKey="cost" radius={[8, 8, 0, 0]}>
                {shippingCostByCarrier.map((entry, index) => (
                  <Cell key={`carrier-cell-${index}`} fill={entry.fill} />
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
                  <th className="text-left py-4 px-6 font-semibold text-primary">Shipment ID</th>
                  <th className="text-left py-4 px-6 font-semibold text-primary">Carrier</th>
                  <th className="text-left py-4 px-6 font-semibold text-primary">Mode</th>
                  <th className="text-left py-4 px-6 font-semibold text-primary">Route</th>
                  <th className="text-right py-4 px-6 font-semibold text-primary">Shipping Cost</th>
                  <th className="text-right py-4 px-6 font-semibold text-primary">Shipping Time</th>
                  <th className="text-right py-4 px-6 font-semibold text-primary">Total Cost</th>
                </tr>
              </thead>
              <tbody>
                {shippingRecords.map((record) => (
                  <tr key={record.id} className="border-b border-gray-200 hover:bg-gray-50 transition-colors">
                    <td className="py-4 px-6">
                      <span className="font-mono font-semibold text-primary">{record.id}</span>
                    </td>
                    <td className="py-4 px-6 text-primary font-medium">{record.carrier}</td>
                    <td className="py-4 px-6 text-primary">
                      <span className="inline-block px-2 py-1 bg-gray-100 rounded text-xs font-medium">
                        {record.transportationMode}
                      </span>
                    </td>
                    <td className="py-4 px-6 text-primary">{record.route}</td>
                    <td className="py-4 px-6 text-right">
                      <span className="font-semibold text-primary">${record.shippingCost.toLocaleString()}</span>
                    </td>
                    <td className="py-4 px-6 text-right text-gray-600 text-sm">{record.shippingTime.toLocaleString()} days</td>
                    <td className="py-4 px-6 text-right text-primary font-semibold">${record.totalCost.toLocaleString()}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
          <div className="kpi-card">
            <p className="kpi-label">Total Shipping Cost</p>
            <p className="kpi-value mt-2">${summary.totalShippingCost.toLocaleString(undefined, { maximumFractionDigits: 0 })}</p>
            <p className="text-xs text-gray-600 mt-2">Summed from Shipping costs</p>
          </div>
          <div className="kpi-card">
            <p className="kpi-label">Avg Shipping Time</p>
            <p className="kpi-value mt-2 text-blue-600">{summary.averageShippingTime.toFixed(1)} days</p>
            <p className="text-xs text-gray-600 mt-2">Across all shipments</p>
          </div>
          <div className="kpi-card">
            <p className="kpi-label">Carriers</p>
            <p className="kpi-value mt-2 text-green-600">{summary.carrierCount}</p>
            <p className="text-xs text-gray-600 mt-2">Distinct shipping carriers</p>
          </div>
          <div className="kpi-card">
            <p className="kpi-label">Transport Modes</p>
            <p className="kpi-value mt-2 text-primary">{summary.modeCount}</p>
            <p className="text-xs text-gray-600 mt-2">Distinct transportation modes</p>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}

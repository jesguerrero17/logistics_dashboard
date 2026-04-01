import DashboardLayout from '../components/DashboardLayout';
import {
  BarChart,
  Bar,
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
  Cell,
} from 'recharts';
import { TrendingUp, TrendingDown, ArrowUpRight, ArrowDownRight, Database } from 'lucide-react';
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

export default function Dashboard() {
  const {
    loading,
    error,
    kpiData,
    revenueByProduct,
    salesTrend,
    shippingCostByCarrier,
    recentSales,
    dataMeta,
  } = useSupplyChainData();

  if (loading) {
    return (
      <DashboardLayout>
        <DataState title="Loading dashboard data" message="Parsing public/supply_chain_data.csv and building KPIs, charts, and tables." />
      </DashboardLayout>
    );
  }

  if (error) {
    return (
      <DashboardLayout>
        <DataState title="CSV load failed" message={error} tone="error" />
      </DashboardLayout>
    );
  }

  return (
    <DashboardLayout>
      <div className="mb-6 flex items-center gap-3 rounded-lg border border-blue-100 bg-blue-50 px-4 py-3 text-sm text-slate-700">
        <Database className="h-4 w-4 text-primary" />
        <span>
          Powered by real supply chain CSV data: {dataMeta.rowCount.toLocaleString()} rows, {dataMeta.columnCount} columns.
        </span>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        {kpiData.map((kpi) => (
          <div
            key={kpi.label}
            className="kpi-card group hover:shadow-lg hover:scale-105 transform transition-all duration-300"
          >
            <div className="flex items-start justify-between mb-4">
              <div>
                <p className="kpi-label">{kpi.label}</p>
                <p className="kpi-value mt-2">{kpi.value}</p>
              </div>
              <div
                className={`p-2 rounded-lg ${
                  kpi.trend === 'up'
                    ? 'bg-green-100 text-green-600'
                    : kpi.trend === 'down'
                      ? 'bg-red-100 text-red-600'
                      : 'bg-gray-100 text-gray-600'
                }`}
              >
                {kpi.trend === 'up' ? (
                  <TrendingUp className="w-5 h-5" />
                ) : kpi.trend === 'down' ? (
                  <TrendingDown className="w-5 h-5" />
                ) : (
                  <div className="w-5 h-5" />
                )}
              </div>
            </div>
            <div className="flex items-center gap-1 text-sm text-gray-600">
              {kpi.trend === 'up' ? (
                <>
                  <ArrowUpRight className="w-4 h-4 text-green-600" />
                  <span className="text-green-600 font-medium">{kpi.context}</span>
                </>
              ) : kpi.trend === 'down' ? (
                <>
                  <ArrowDownRight className="w-4 h-4 text-red-600" />
                  <span className="text-red-600 font-medium">{kpi.context}</span>
                </>
              ) : (
                <span>{kpi.context}</span>
              )}
            </div>
          </div>
        ))}
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
        <div className="chart-container">
          <h3 className="text-lg font-bold text-primary mb-4">Revenue by Product Type</h3>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={revenueByProduct}>
              <CartesianGrid strokeDasharray="3 3" stroke="#E8EAED" />
              <XAxis dataKey="name" tick={{ fill: '#6B7280', fontSize: 12 }} />
              <YAxis tick={{ fill: '#6B7280', fontSize: 12 }} />
              <Tooltip
                contentStyle={{
                  backgroundColor: '#FFFFFF',
                  border: '1px solid #E8EAED',
                  borderRadius: '8px',
                }}
                formatter={(value) => `$${value.toLocaleString()}`}
              />
              <Bar dataKey="revenue" radius={[8, 8, 0, 0]}>
                {revenueByProduct.map((entry, index) => (
                  <Cell key={`revenue-cell-${index}`} fill={entry.fill} />
                ))}
              </Bar>
            </BarChart>
          </ResponsiveContainer>
        </div>

        <div className="chart-container">
          <h3 className="text-lg font-bold text-primary mb-1">Sales Trend (Sequence-Based)</h3>
          <p className="text-sm text-gray-600 mb-4">Dataset batches inferred from CSV row order. No calendar date field is present in the source data.</p>
          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={salesTrend}>
              <CartesianGrid strokeDasharray="3 3" stroke="#E8EAED" />
              <XAxis dataKey="batch" tick={{ fill: '#6B7280', fontSize: 12 }} />
              <YAxis tick={{ fill: '#6B7280', fontSize: 12 }} />
              <Tooltip
                contentStyle={{
                  backgroundColor: '#FFFFFF',
                  border: '1px solid #E8EAED',
                  borderRadius: '8px',
                }}
              />
              <Legend />
              <Line
                type="monotone"
                dataKey="sales"
                name="Units Sold"
                stroke="#1F3A5F"
                strokeWidth={2}
                dot={{ fill: '#1F3A5F', r: 4 }}
                activeDot={{ r: 6 }}
              />
              <Line
                type="monotone"
                dataKey="revenue"
                name="Revenue"
                stroke="#00D9FF"
                strokeWidth={2}
                dot={{ fill: '#00D9FF', r: 4 }}
                activeDot={{ r: 6 }}
              />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
        <div className="chart-container">
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
                  <Cell key={`shipping-cell-${index}`} fill={entry.fill} />
                ))}
              </Bar>
            </BarChart>
          </ResponsiveContainer>
        </div>

        <div className="chart-container">
          <h3 className="text-lg font-bold text-primary mb-1">Recent Records from Dataset</h3>
          <p className="text-sm text-gray-600 mb-4">Latest rows from the source CSV in dataset order.</p>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-gray-200">
                  <th className="text-left py-3 px-4 font-semibold text-primary">Product</th>
                  <th className="text-right py-3 px-4 font-semibold text-primary">Qty</th>
                  <th className="text-right py-3 px-4 font-semibold text-primary">Revenue</th>
                  <th className="text-center py-3 px-4 font-semibold text-primary">Inspection</th>
                </tr>
              </thead>
              <tbody>
                {recentSales.map((sale) => (
                  <tr key={sale.id} className="border-b border-gray-200 hover:bg-gray-50 transition-colors">
                    <td className="py-3 px-4 text-primary">{sale.product}</td>
                    <td className="py-3 px-4 text-right text-primary">{sale.quantity.toLocaleString()}</td>
                    <td className="py-3 px-4 text-right text-primary font-semibold">
                      ${sale.revenue.toLocaleString()}
                    </td>
                    <td className="py-3 px-4 text-center">
                      <span
                        className={`inline-block px-3 py-1 rounded-full text-xs font-medium ${
                          sale.status === 'Pass'
                            ? 'bg-green-100 text-green-700'
                            : sale.status === 'Fail'
                              ? 'bg-red-100 text-red-700'
                              : 'bg-yellow-100 text-yellow-700'
                        }`}
                      >
                        {sale.status}
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}

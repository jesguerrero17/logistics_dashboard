import DashboardLayout from '../components/DashboardLayout';
import { ArrowRight, Database, FileText, Table, BarChart3 } from 'lucide-react';

function SchemaCard({ title, fields }) {
  return (
    <div className="border border-gray-200 rounded-lg p-4 bg-gray-50">
      <h3 className="font-bold text-primary mb-3">{title}</h3>
      <ul className="space-y-2 text-sm text-primary">
        {fields.map((field) => (
          <li key={field}>{field}</li>
        ))}
      </ul>
    </div>
  );
}

export default function Pipeline() {
  const schemaCards = [
    {
      title: 'PRODUCT',
      fields: ['SKU', 'ProductType', 'Price'],
    },
    {
      title: 'INVENTORY',
      fields: ['SKU', 'Availability', 'StockLevels'],
    },
    {
      title: 'SALES',
      fields: ['SaleID', 'SKU', 'NumProductsSold', 'RevenueGenerated', 'CustomerDemographics'],
    },
    {
      title: 'SUPPLIER',
      fields: ['SupplierID', 'SupplierName', 'Location'],
    },
    {
      title: 'SUPPLIER_PRODUCT',
      fields: ['SupplierID', 'SKU', 'SupplierLeadTime'],
    },
    {
      title: 'PURCHASE_ORDER',
      fields: ['POID', 'SupplierID', 'SKU', 'OrderQuantity'],
    },
    {
      title: 'MANUFACTURING',
      fields: ['ManufacturingID', 'SKU', 'ProductionVolumes', 'ManufacturingLeadTime', 'ManufacturingCosts'],
    },
    {
      title: 'INSPECTION',
      fields: ['InspectionID', 'ManufacturingID', 'InspectionResults', 'DefectRates'],
    },
    {
      title: 'SHIPPING',
      fields: ['ShipmentID', 'POID', 'ShippingCarrier', 'TransportationMode', 'Route', 'ShippingTimes', 'ShippingCosts', 'TotalCosts'],
    },
  ];

  return (
    <DashboardLayout>
      <div className="space-y-8">
        <div>
          <h1 className="text-3xl font-bold text-primary flex items-center gap-2">
            <Database className="w-8 h-8" />
            Data Pipeline Architecture
          </h1>
          <p className="text-gray-600 mt-1">
            Frontend representation of the CSV-to-relational data pipeline used in the project
          </p>
          <p className="text-sm text-gray-600 mt-3">
            This frontend mirrors the backend pipeline by transforming raw CSV fields into structured views that align with the normalized PostgreSQL schema.
          </p>
        </div>

        <div className="bg-white rounded-lg shadow-sm p-12 border border-gray-200">
          <div className="flex flex-col lg:flex-row items-center justify-between gap-8">
            <div className="flex flex-col items-center">
              <div className="w-32 h-32 bg-gradient-to-br from-blue-400 to-blue-600 rounded-lg shadow-lg flex items-center justify-center transform hover:scale-105 transition-transform duration-300">
                <div className="text-center">
                  <FileText className="w-12 h-12 text-white mx-auto mb-2" />
                  <p className="text-white font-bold text-sm">CSV Source</p>
                </div>
              </div>
              <p className="text-sm text-gray-600 mt-4 text-center">Raw operational dataset</p>
            </div>

            <div className="hidden lg:flex items-center">
              <ArrowRight className="w-8 h-8 text-accent" />
            </div>
            <div className="lg:hidden">
              <ArrowRight className="w-8 h-8 text-accent rotate-90" />
            </div>

            <div className="flex flex-col items-center">
              <div className="w-32 h-32 bg-gradient-to-br from-teal-400 to-teal-600 rounded-lg shadow-lg flex items-center justify-center transform hover:scale-105 transition-transform duration-300">
                <div className="text-center">
                  <Database className="w-12 h-12 text-white mx-auto mb-2" />
                  <p className="text-white font-bold text-sm">Relational DB</p>
                </div>
              </div>
              <p className="text-sm text-gray-600 mt-4 text-center">Normalized project schema</p>
            </div>

            <div className="hidden lg:flex items-center">
              <ArrowRight className="w-8 h-8 text-accent" />
            </div>
            <div className="lg:hidden">
              <ArrowRight className="w-8 h-8 text-accent rotate-90" />
            </div>

            <div className="flex flex-col items-center">
              <div className="w-32 h-32 bg-gradient-to-br from-sky-500 to-cyan-500 rounded-lg shadow-lg flex items-center justify-center transform hover:scale-105 transition-transform duration-300">
                <div className="text-center">
                  <Table className="w-12 h-12 text-white mx-auto mb-2" />
                  <p className="text-white font-bold text-sm">Query Layer</p>
                </div>
              </div>
              <p className="text-sm text-gray-600 mt-4 text-center">Joins and aggregations</p>
            </div>

            <div className="hidden lg:flex items-center">
              <ArrowRight className="w-8 h-8 text-accent" />
            </div>
            <div className="lg:hidden">
              <ArrowRight className="w-8 h-8 text-accent rotate-90" />
            </div>

            <div className="flex flex-col items-center">
              <div className="w-32 h-32 bg-gradient-to-br from-slate-600 to-slate-800 rounded-lg shadow-lg flex items-center justify-center transform hover:scale-105 transition-transform duration-300">
                <div className="text-center">
                  <BarChart3 className="w-12 h-12 text-white mx-auto mb-2" />
                  <p className="text-white font-bold text-sm">Dashboard</p>
                </div>
              </div>
              <p className="text-sm text-gray-600 mt-4 text-center">KPIs, charts, and tables</p>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <div className="bg-white rounded-lg shadow-sm p-6 border-l-4 border-blue-500 border border-gray-200">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center font-bold text-blue-600">
                1
              </div>
              <h3 className="font-bold text-primary">Data Ingestion</h3>
            </div>
            <p className="text-sm text-gray-600">
              The frontend loads the shared CSV dataset, preserving source columns such as SKU, Product type, Supplier name, Shipping costs, and Costs.
            </p>
          </div>

          <div className="bg-white rounded-lg shadow-sm p-6 border-l-4 border-teal-500 border border-gray-200">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-8 h-8 bg-teal-100 rounded-full flex items-center justify-center font-bold text-teal-600">
                2
              </div>
              <h3 className="font-bold text-primary">Schema Alignment</h3>
            </div>
            <p className="text-sm text-gray-600">
              Backend work normalizes the source into PRODUCT, INVENTORY, SALES, SUPPLIER, SUPPLIER_PRODUCT, PURCHASE_ORDER, MANUFACTURING, INSPECTION, and SHIPPING tables.
            </p>
          </div>

          <div className="bg-white rounded-lg shadow-sm p-6 border-l-4 border-sky-500 border border-gray-200">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-8 h-8 bg-sky-100 rounded-full flex items-center justify-center font-bold text-sky-600">
                3
              </div>
              <h3 className="font-bold text-primary">Derived Views</h3>
            </div>
            <p className="text-sm text-gray-600">
              The dashboard groups and summarizes those fields into defensible frontend views such as revenue by product type, supplier order totals, inventory snapshots, and shipping cost rollups.
            </p>
          </div>

          <div className="bg-white rounded-lg shadow-sm p-6 border-l-4 border-slate-700 border border-gray-200">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-8 h-8 bg-slate-100 rounded-full flex items-center justify-center font-bold text-slate-700">
                4
              </div>
              <h3 className="font-bold text-primary">Analytics UI</h3>
            </div>
            <p className="text-sm text-gray-600">
              React pages then present the aggregated results while keeping labels honest about inferred metrics, sequence-based trends, and inspection-derived quality indicators.
            </p>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm p-6 border border-gray-200">
          <h2 className="text-xl font-bold text-primary mb-6">Project Schema Overview</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {schemaCards.map((card) => (
              <SchemaCard key={card.title} title={card.title} fields={card.fields} />
            ))}
          </div>
        </div>

        <div className="bg-blue-50 rounded-lg p-6 border border-blue-200">
          <h2 className="text-lg font-bold text-primary mb-4">Why This View Matches the Team Project</h2>
          <ul className="space-y-3 text-sm text-primary">
            <li className="flex items-start gap-3">
              <span className="text-accent font-bold">+</span>
              <span>
                <strong>Schema-accurate entities:</strong> The page now reflects the real table names and field concepts used in the backend/database design.
              </span>
            </li>
            <li className="flex items-start gap-3">
              <span className="text-accent font-bold">+</span>
              <span>
                <strong>No placeholder columns:</strong> Removed example-only fields such as ProductID, ProductName, WarehouseLocation, SaleDate, and DeliveryDate.
              </span>
            </li>
            <li className="flex items-start gap-3">
              <span className="text-accent font-bold">+</span>
              <span>
                <strong>Clear frontend narrative:</strong> Shows how raw CSV columns map into normalized tables and then into dashboard-level aggregates.
              </span>
            </li>
            <li className="flex items-start gap-3">
              <span className="text-accent font-bold">+</span>
              <span>
                <strong>Defensible analytics language:</strong> The dashboard distinguishes direct source fields from inferred summaries such as sequence-based trends and inspection-derived quality pass rates.
              </span>
            </li>
          </ul>
        </div>
      </div>
    </DashboardLayout>
  );
}

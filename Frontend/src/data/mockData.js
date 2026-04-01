// Mock data for Supply Chain Dashboard
// Design: Modern Data-Driven theme with slate blue and teal accents

export const kpiData = [
  {
    label: 'Total Revenue',
    value: '$2.45M',
    change: 12.5,
    trend: 'up',
  },
  {
    label: 'Total Units Sold',
    value: '18,450',
    change: 8.2,
    trend: 'up',
  },
  {
    label: 'Total Products',
    value: '342',
    change: -2.1,
    trend: 'down',
  },
  {
    label: 'Total Suppliers',
    value: '47',
    change: 5.3,
    trend: 'up',
  },
];

// Revenue by Product Type
export const revenueByProduct = [
  { name: 'Electronics', revenue: 580000, fill: '#1F3A5F' },
  { name: 'Textiles', revenue: 420000, fill: '#2D5A8C' },
  { name: 'Machinery', revenue: 650000, fill: '#00D9FF' },
  { name: 'Chemicals', revenue: 380000, fill: '#0099CC' },
  { name: 'Packaging', revenue: 415000, fill: '#4A7BA7' },
];

// Sales Trend (Monthly)
export const salesTrend = [
  { month: 'Jan', sales: 2400, revenue: 240000 },
  { month: 'Feb', sales: 2210, revenue: 221000 },
  { month: 'Mar', sales: 2290, revenue: 229000 },
  { month: 'Apr', sales: 2000, revenue: 200000 },
  { month: 'May', sales: 2181, revenue: 218100 },
  { month: 'Jun', sales: 2500, revenue: 250000 },
  { month: 'Jul', sales: 2100, revenue: 210000 },
  { month: 'Aug', sales: 2200, revenue: 220000 },
  { month: 'Sep', sales: 2290, revenue: 229000 },
  { month: 'Oct', sales: 2390, revenue: 239000 },
  { month: 'Nov', sales: 2490, revenue: 249000 },
  { month: 'Dec', sales: 2590, revenue: 259000 },
];

// Shipping Cost by Carrier
export const shippingCostByCarrier = [
  { carrier: 'FedEx', cost: 145000, fill: '#1F3A5F' },
  { carrier: 'UPS', cost: 128000, fill: '#2D5A8C' },
  { carrier: 'DHL', cost: 98000, fill: '#00D9FF' },
  { carrier: 'Local', cost: 67000, fill: '#0099CC' },
];

// Recent Sales
export const recentSales = [
  {
    id: 'SAL001',
    product: 'Industrial Motor',
    quantity: 12,
    revenue: 24000,
    date: '2024-12-15',
    status: 'completed',
  },
  {
    id: 'SAL002',
    product: 'Textile Roll',
    quantity: 450,
    revenue: 13500,
    date: '2024-12-14',
    status: 'shipped',
  },
  {
    id: 'SAL003',
    product: 'Chemical Batch',
    quantity: 8,
    revenue: 32000,
    date: '2024-12-13',
    status: 'completed',
  },
  {
    id: 'SAL004',
    product: 'Packaging Box',
    quantity: 5000,
    revenue: 7500,
    date: '2024-12-12',
    status: 'pending',
  },
  {
    id: 'SAL005',
    product: 'Electronic Component',
    quantity: 200,
    revenue: 18000,
    date: '2024-12-11',
    status: 'completed',
  },
];

// Inventory Items
export const inventoryItems = [
  {
    sku: 'SKU-001',
    productType: 'Industrial Motor',
    stockLevel: 45,
    availability: 'in-stock',
    lastRestocked: '2024-12-10',
  },
  {
    sku: 'SKU-002',
    productType: 'Textile Roll',
    stockLevel: 12,
    availability: 'low-stock',
    lastRestocked: '2024-12-08',
  },
  {
    sku: 'SKU-003',
    productType: 'Chemical Batch',
    stockLevel: 0,
    availability: 'out-of-stock',
    lastRestocked: '2024-11-30',
  },
  {
    sku: 'SKU-004',
    productType: 'Packaging Box',
    stockLevel: 8500,
    availability: 'in-stock',
    lastRestocked: '2024-12-12',
  },
  {
    sku: 'SKU-005',
    productType: 'Electronic Component',
    stockLevel: 234,
    availability: 'in-stock',
    lastRestocked: '2024-12-09',
  },
  {
    sku: 'SKU-006',
    productType: 'Fastener Kit',
    stockLevel: 5,
    availability: 'low-stock',
    lastRestocked: '2024-12-01',
  },
  {
    sku: 'SKU-007',
    productType: 'Bearing Assembly',
    stockLevel: 78,
    availability: 'in-stock',
    lastRestocked: '2024-12-11',
  },
  {
    sku: 'SKU-008',
    productType: 'Valve Unit',
    stockLevel: 0,
    availability: 'out-of-stock',
    lastRestocked: '2024-11-25',
  },
];

// Suppliers
export const suppliers = [
  {
    id: 'SUP001',
    name: 'Global Electronics Ltd',
    location: 'Taiwan',
    leadTime: 14,
    ordersPlaced: 156,
    reliability: 98,
  },
  {
    id: 'SUP002',
    name: 'Textile Mills Co',
    location: 'India',
    leadTime: 21,
    ordersPlaced: 89,
    reliability: 95,
  },
  {
    id: 'SUP003',
    name: 'Chemical Industries',
    location: 'Germany',
    leadTime: 7,
    ordersPlaced: 124,
    reliability: 99,
  },
  {
    id: 'SUP004',
    name: 'Packaging Solutions',
    location: 'USA',
    leadTime: 3,
    ordersPlaced: 203,
    reliability: 97,
  },
  {
    id: 'SUP005',
    name: 'Precision Manufacturing',
    location: 'Japan',
    leadTime: 10,
    ordersPlaced: 178,
    reliability: 99,
  },
  {
    id: 'SUP006',
    name: 'Fastener Specialists',
    location: 'China',
    leadTime: 28,
    ordersPlaced: 145,
    reliability: 92,
  },
];

// Shipping Records
export const shippingRecords = [
  {
    id: 'SHIP001',
    carrier: 'FedEx',
    transportationMode: 'Air',
    route: 'Taiwan → USA',
    shippingCost: 2400,
    status: 'delivered',
    date: '2024-12-15',
  },
  {
    id: 'SHIP002',
    carrier: 'UPS',
    transportationMode: 'Ground',
    route: 'USA → Canada',
    shippingCost: 450,
    status: 'in-transit',
    date: '2024-12-14',
  },
  {
    id: 'SHIP003',
    carrier: 'DHL',
    transportationMode: 'Air',
    route: 'Germany → UK',
    shippingCost: 1800,
    status: 'delivered',
    date: '2024-12-13',
  },
  {
    id: 'SHIP004',
    carrier: 'Local',
    transportationMode: 'Ground',
    route: 'Local Distribution',
    shippingCost: 120,
    status: 'pending',
    date: '2024-12-12',
  },
  {
    id: 'SHIP005',
    carrier: 'FedEx',
    transportationMode: 'Air',
    route: 'Japan → USA',
    shippingCost: 3200,
    status: 'in-transit',
    date: '2024-12-11',
  },
];

// Orders by Supplier
export const ordersBySupplier = [
  { name: 'Global Electronics Ltd', orders: 156, fill: '#1F3A5F' },
  { name: 'Packaging Solutions', orders: 203, fill: '#2D5A8C' },
  { name: 'Precision Manufacturing', orders: 178, fill: '#00D9FF' },
  { name: 'Fastener Specialists', orders: 145, fill: '#0099CC' },
  { name: 'Chemical Industries', orders: 124, fill: '#4A7BA7' },
  { name: 'Textile Mills Co', orders: 89, fill: '#6B8CAE' },
];

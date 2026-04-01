import Papa from 'papaparse';

const CHART_COLORS = ['#1F3A5F', '#2D5A8C', '#00D9FF', '#0099CC', '#4A7BA7', '#6B8CAE'];
const UNKNOWN_LABEL = 'Unknown';

export function createEmptySupplyChainData() {
  return {
    rawRows: [],
    kpiData: [],
    revenueByProduct: [],
    salesTrend: [],
    shippingCostByCarrier: [],
    recentSales: [],
    inventoryItems: [],
    suppliers: [],
    ordersBySupplier: [],
    shippingRecords: [],
    dataMeta: {
      rowCount: 0,
      columnCount: 0,
      source: '/supply_chain_data.csv',
    },
    summary: {
      totalShippingCost: 0,
      averageShippingTime: 0,
      carrierCount: 0,
      modeCount: 0,
    },
  };
}

function hasValue(value) {
  if (value === null || value === undefined) {
    return false;
  }

  if (typeof value === 'string') {
    return value.trim() !== '';
  }

  return true;
}

function getText(value, fallback = UNKNOWN_LABEL) {
  if (!hasValue(value)) {
    return fallback;
  }

  return String(value).trim() || fallback;
}

function getNumber(value, fallback = 0) {
  if (typeof value === 'number' && Number.isFinite(value)) {
    return value;
  }

  if (!hasValue(value)) {
    return fallback;
  }

  const parsed = Number(value);
  return Number.isFinite(parsed) ? parsed : fallback;
}

function cleanRow(row) {
  return Object.fromEntries(
    Object.entries(row).map(([key, value]) => [key, hasValue(value) ? value : null])
  );
}

function normalizeAvailability(value, stockLevel) {
  const rawValue = typeof value === 'string' ? value.trim().toLowerCase() : '';

  if (rawValue.includes('out')) {
    return 'out-of-stock';
  }

  if (rawValue.includes('low')) {
    return 'low-stock';
  }

  if (rawValue.includes('in')) {
    return 'in-stock';
  }

  const availabilityScore = getNumber(value, Number.NaN);
  const stock = getNumber(stockLevel, 0);
  const thresholdValue = Number.isFinite(availabilityScore) ? availabilityScore : stock;

  if (stock <= 0 || thresholdValue <= 0) {
    return 'out-of-stock';
  }

  if (stock < 20 || thresholdValue < 20) {
    return 'low-stock';
  }

  return 'in-stock';
}

function normalizeInspectionResult(value) {
  const normalized = getText(value, 'Pending').toLowerCase();

  if (normalized.includes('pass')) {
    return 'Pass';
  }

  if (normalized.includes('fail')) {
    return 'Fail';
  }

  return 'Pending';
}

function toChartSeries(items, valueKey, labelKey) {
  return items.map((item, index) => ({
    ...item,
    [labelKey]: item[labelKey],
    [valueKey]: item[valueKey],
    fill: CHART_COLORS[index % CHART_COLORS.length],
  }));
}

function buildRevenueByProduct(rows) {
  const grouped = new Map();

  rows.forEach((row) => {
    const productType = getText(row['Product type']);
    const revenue = getNumber(row['Revenue generated']);
    grouped.set(productType, (grouped.get(productType) || 0) + revenue);
  });

  return toChartSeries(
    Array.from(grouped.entries())
      .map(([name, revenue]) => ({ name, revenue }))
      .sort((a, b) => b.revenue - a.revenue),
    'revenue',
    'name'
  );
}

function buildShippingCostByCarrier(rows) {
  const grouped = new Map();

  rows.forEach((row) => {
    const carrier = getText(row['Shipping carriers']);
    const cost = getNumber(row['Shipping costs']);
    grouped.set(carrier, (grouped.get(carrier) || 0) + cost);
  });

  return toChartSeries(
    Array.from(grouped.entries())
      .map(([carrier, cost]) => ({ carrier, cost }))
      .sort((a, b) => b.cost - a.cost),
    'cost',
    'carrier'
  );
}

function buildSalesTrend(rows) {
  if (rows.length === 0) {
    return [];
  }

  const bucketCount = Math.min(12, rows.length);
  const bucketSize = Math.ceil(rows.length / bucketCount);
  const trend = [];

  for (let index = 0; index < bucketCount; index += 1) {
    const start = index * bucketSize;
    const bucketRows = rows.slice(start, start + bucketSize);

    if (bucketRows.length === 0) {
      continue;
    }

    trend.push({
      batch: `Batch ${index + 1}`,
      sales: bucketRows.reduce((sum, row) => sum + getNumber(row['Number of products sold']), 0),
      revenue: bucketRows.reduce((sum, row) => sum + getNumber(row['Revenue generated']), 0),
    });
  }

  return trend;
}

function buildRecentSales(rows) {
  return rows
    .slice(-8)
    .reverse()
    .map((row, index) => ({
      id: `${getText(row.SKU, 'SKU')}-sale-${index + 1}`,
      product: getText(row['Product type']),
      quantity: getNumber(row['Number of products sold']),
      revenue: getNumber(row['Revenue generated']),
      status: normalizeInspectionResult(row['Inspection results']),
    }));
}

function buildInventoryItems(rows) {
  const itemsBySku = new Map();

  rows.forEach((row, index) => {
    const sku = getText(row.SKU);
    const nextItem = {
      sku,
      productType: getText(row['Product type']),
      stockLevel: getNumber(row['Stock levels']),
      availability: normalizeAvailability(row.Availability, row['Stock levels']),
      leadTime: getNumber(row['Lead times']),
      sourceRow: index,
    };

    // When the CSV repeats a SKU, keep the last occurrence as the representative
    // inventory snapshot. The dataset has no timestamp, so this preserves source
    // order without blending multiple rows into an invented inventory state.
    itemsBySku.set(sku, nextItem);
  });

  return Array.from(itemsBySku.values())
    .sort((a, b) => a.sku.localeCompare(b.sku))
    .map(({ sourceRow, ...item }) => item);
}

function buildSuppliers(rows) {
  const suppliersByName = new Map();

  rows.forEach((row) => {
    const supplierName = getText(row['Supplier name']);
    const supplierLeadTime = getNumber(row['Lead time'], getNumber(row['Lead times']));
    const inspectionResult = normalizeInspectionResult(row['Inspection results']);

    if (!suppliersByName.has(supplierName)) {
      suppliersByName.set(supplierName, {
        id: supplierName,
        name: supplierName,
        location: getText(row.Location),
        leadTimeTotal: 0,
        leadTimeCount: 0,
        ordersPlaced: 0,
        passCount: 0,
        totalRows: 0,
      });
    }

    const current = suppliersByName.get(supplierName);
    current.location = current.location === UNKNOWN_LABEL ? getText(row.Location) : current.location;
    current.leadTimeTotal += supplierLeadTime;
    current.leadTimeCount += 1;
    current.ordersPlaced += getNumber(row['Order quantities']);
    current.totalRows += 1;

    if (inspectionResult === 'Pass') {
      current.passCount += 1;
    }
  });

  return Array.from(suppliersByName.values())
    .map((supplier) => ({
      id: supplier.id,
      name: supplier.name,
      location: supplier.location,
      leadTime: supplier.leadTimeCount ? supplier.leadTimeTotal / supplier.leadTimeCount : 0,
      ordersPlaced: supplier.ordersPlaced,
      qualityPassRate: supplier.totalRows ? (supplier.passCount / supplier.totalRows) * 100 : 0,
    }))
    .sort((a, b) => b.ordersPlaced - a.ordersPlaced);
}

function buildOrdersBySupplier(suppliers) {
  return toChartSeries(
    suppliers.map((supplier) => ({
      name: supplier.name,
      orders: supplier.ordersPlaced,
    })),
    'orders',
    'name'
  );
}

function buildShippingRecords(rows) {
  return rows.map((row, index) => ({
    id: `${getText(row.SKU, 'SKU')}-${getText(row['Shipping carriers'], 'carrier')}-${index + 1}`,
    carrier: getText(row['Shipping carriers']),
    transportationMode: getText(row['Transportation modes']),
    route: getText(row.Routes),
    shippingCost: getNumber(row['Shipping costs']),
    shippingTime: getNumber(row['Shipping times']),
    totalCost: getNumber(row.Costs),
  }));
}

function buildSummary(shippingRecords) {
  const totalShippingCost = shippingRecords.reduce((sum, record) => sum + record.shippingCost, 0);
  const averageShippingTime = shippingRecords.length
    ? shippingRecords.reduce((sum, record) => sum + record.shippingTime, 0) / shippingRecords.length
    : 0;

  return {
    totalShippingCost,
    averageShippingTime,
    carrierCount: new Set(shippingRecords.map((record) => record.carrier)).size,
    modeCount: new Set(shippingRecords.map((record) => record.transportationMode)).size,
  };
}

function buildKpiData(rows, inventoryItems, suppliers) {
  const totalRevenue = rows.reduce((sum, row) => sum + getNumber(row['Revenue generated']), 0);
  const totalUnitsSold = rows.reduce((sum, row) => sum + getNumber(row['Number of products sold']), 0);

  return [
    {
      label: 'Total Revenue',
      value: `$${totalRevenue.toLocaleString(undefined, { maximumFractionDigits: 0 })}`,
      trend: 'neutral',
      context: 'Sum of Revenue generated',
    },
    {
      label: 'Total Units Sold',
      value: totalUnitsSold.toLocaleString(),
      trend: 'neutral',
      context: 'Sum of Number of products sold',
    },
    {
      label: 'Total Products',
      value: inventoryItems.length.toLocaleString(),
      trend: 'neutral',
      context: 'Distinct SKU count',
    },
    {
      label: 'Total Suppliers',
      value: suppliers.length.toLocaleString(),
      trend: 'neutral',
      context: 'Distinct Supplier name count',
    },
  ];
}

export async function loadSupplyChainData() {
  const parsed = await new Promise((resolve, reject) => {
    Papa.parse('/supply_chain_data.csv', {
      header: true,
      download: true,
      dynamicTyping: true,
      skipEmptyLines: false,
      complete: resolve,
      error: reject,
    });
  });

  const cleanedRows = (parsed.data || []).filter((row) => row && Object.values(row).some(hasValue)).map(cleanRow);

  if (cleanedRows.length === 0) {
    throw new Error('No usable rows were found in public/supply_chain_data.csv.');
  }

  const inventoryItems = buildInventoryItems(cleanedRows);
  const suppliers = buildSuppliers(cleanedRows);
  const shippingRecords = buildShippingRecords(cleanedRows);
  const fields = parsed.meta?.fields || Object.keys(cleanedRows[0] || {});

  return {
    rawRows: cleanedRows,
    kpiData: buildKpiData(cleanedRows, inventoryItems, suppliers),
    revenueByProduct: buildRevenueByProduct(cleanedRows),
    salesTrend: buildSalesTrend(cleanedRows),
    shippingCostByCarrier: buildShippingCostByCarrier(cleanedRows),
    recentSales: buildRecentSales(cleanedRows),
    inventoryItems,
    suppliers,
    ordersBySupplier: buildOrdersBySupplier(suppliers),
    shippingRecords,
    dataMeta: {
      rowCount: cleanedRows.length,
      columnCount: fields.length,
      source: '/supply_chain_data.csv',
    },
    summary: buildSummary(shippingRecords),
  };
}

-- ===========================
-- RAW STAGING TABLE
-- ===========================
CREATE TABLE IF NOT EXISTS raw_supply_chain (
    ProductType VARCHAR,
    SKU VARCHAR,
    Price NUMERIC,
    Availability INT,
    NumProductsSold INT,
    RevenueGenerated NUMERIC,
    CustomerDemographics VARCHAR,
    StockLevels INT,
    LeadTimes INT,
    OrderQuantities INT,
    ShippingTimes INT,
    ShippingCarriers VARCHAR,
    ShippingCosts NUMERIC,
    SupplierName VARCHAR,
    Location VARCHAR,
    SupplierLeadTime INT,
    ProductionVolumes INT,
    ManufacturingLeadTime INT,
    ManufacturingCosts NUMERIC,
    InspectionResults VARCHAR,
    DefectRates NUMERIC,
    TransportationModes VARCHAR,
    Routes VARCHAR,
    Costs NUMERIC
);

-- ===========================
-- PRODUCT
-- ===========================
CREATE TABLE IF NOT EXISTS PRODUCT (
    SKU VARCHAR PRIMARY KEY,
    ProductType VARCHAR,
    Price NUMERIC
);

-- ===========================
-- INVENTORY
-- ===========================
CREATE TABLE IF NOT EXISTS INVENTORY (
    SKU VARCHAR PRIMARY KEY REFERENCES PRODUCT(SKU),
    Availability INT,
    StockLevels INT
);

-- ===========================
-- SALES
-- ===========================
CREATE TABLE IF NOT EXISTS SALES (
    SaleID SERIAL PRIMARY KEY,
    SKU VARCHAR REFERENCES PRODUCT(SKU),
    NumProductsSold INT,
    RevenueGenerated NUMERIC,
    CustomerDemographics VARCHAR
);

-- ===========================
-- SUPPLIER
-- ===========================
CREATE TABLE IF NOT EXISTS SUPPLIER (
    SupplierID SERIAL PRIMARY KEY,
    SupplierName VARCHAR,
    Location VARCHAR
);

-- ===========================
-- SUPPLIER_PRODUCT
-- ===========================
CREATE TABLE IF NOT EXISTS SUPPLIER_PRODUCT (
    SupplierID INT REFERENCES SUPPLIER(SupplierID),
    SKU VARCHAR REFERENCES PRODUCT(SKU),
    SupplierLeadTime INT,
    PRIMARY KEY (SupplierID, SKU)
);

-- ===========================
-- PURCHASE_ORDER
-- ===========================
CREATE TABLE IF NOT EXISTS PURCHASE_ORDER (
    POID SERIAL PRIMARY KEY,
    SupplierID INT REFERENCES SUPPLIER(SupplierID),
    SKU VARCHAR REFERENCES PRODUCT(SKU),
    OrderQuantity INT
);

-- ===========================
-- MANUFACTURING
-- ===========================
CREATE TABLE IF NOT EXISTS MANUFACTURING (
    ManufacturingID SERIAL PRIMARY KEY,
    SKU VARCHAR REFERENCES PRODUCT(SKU),
    ProductionVolumes INT,
    ManufacturingLeadTime INT,
    ManufacturingCosts NUMERIC
);

-- ===========================
-- INSPECTION
-- ===========================
CREATE TABLE IF NOT EXISTS INSPECTION (
    InspectionID SERIAL PRIMARY KEY,
    ManufacturingID INT REFERENCES MANUFACTURING(ManufacturingID),
    InspectionResults VARCHAR,
    DefectRates NUMERIC
);

-- ===========================
-- SHIPPING
-- ===========================
CREATE TABLE IF NOT EXISTS SHIPPING (
    ShipmentID SERIAL PRIMARY KEY,
    POID INT REFERENCES PURCHASE_ORDER(POID),
    ShippingCarrier VARCHAR,
    TransportationMode VARCHAR,
    Route VARCHAR,
    ShippingTimes INT,
    ShippingCosts NUMERIC,
    TotalCosts NUMERIC
);
-- Supply Chain Database - Final Queries

-- BASIC OPERATIONS

-- INSERT (add a test product)
INSERT INTO product (sku, product_type, price)
VALUES ('TEST123', 'Electronics', 199.99);

-- SELECT (search for a product)
SELECT *
FROM product
WHERE sku = 'TEST123';

-- UPDATE (modify stock levels)
UPDATE inventory
SET stock_levels = 200
WHERE sku = 'TEST123';

-- DELETE (remove test product)
DELETE FROM product
WHERE sku = 'TEST123';


-- JOIN QUERY (MULTI-TABLE)

SELECT p.sku, p.product_type, s.supplier_name, s.location
FROM product p
JOIN supplier_product sp ON p.sku = sp.sku
JOIN supplier s ON sp.supplier_id = s.supplier_id
LIMIT 10;


-- AGGREGATE QUERIES

-- Total revenue per product
SELECT sku, SUM(revenue_generated) AS total_revenue
FROM sales
GROUP BY sku;

-- Average defect rate
SELECT AVG(defect_rates) AS avg_defect_rate
FROM inspection;

-- Average shipping cost per transportation mode
SELECT transportation_mode, AVG(shipping_costs) AS avg_shipping_cost
FROM shipping
GROUP BY transportation_mode;


-- ADVANCED FEATURE
-- Supplier Risk Scoring System

SELECT s.supplier_name,
       AVG(sp.supplier_lead_time) * 0.4 +
       AVG(i.defect_rates) * 0.3 +
       AVG(m.manufacturing_costs) * 0.3 AS risk_score
FROM supplier s
JOIN supplier_product sp ON s.supplier_id = sp.supplier_id
JOIN manufacturing m ON sp.sku = m.sku
JOIN inspection i ON m.manufacturing_id = i.manufacturing_id
GROUP BY s.supplier_name
ORDER BY risk_score DESC;


-- ADVANCED (RISK CLASSIFICATION)

SELECT supplier_name,
       CASE 
           WHEN risk_score < 50 THEN 'Low Risk'
           WHEN risk_score < 100 THEN 'Medium Risk'
           ELSE 'High Risk'
       END AS risk_level
FROM (
    SELECT s.supplier_name,
           AVG(sp.supplier_lead_time) * 0.4 +
           AVG(i.defect_rates) * 0.3 +
           AVG(m.manufacturing_costs) * 0.3 AS risk_score
    FROM supplier s
    JOIN supplier_product sp ON s.supplier_id = sp.supplier_id
    JOIN manufacturing m ON sp.sku = m.sku
    JOIN inspection i ON m.manufacturing_id = i.manufacturing_id
    GROUP BY s.supplier_name
) sub;
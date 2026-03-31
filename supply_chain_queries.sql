SELECT p.sku, p.product_type, s.supplier_name
FROM product p
JOIN supplier_product sp ON p.sku = sp.sku
JOIN supplier s ON sp.supplier_id = s.supplier_id
LIMIT 10;
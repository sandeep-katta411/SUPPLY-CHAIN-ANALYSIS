create database project_supply_chain_data;
USE project_supply_chain_data;
SHOW TABLES;
DESCRIBE supply_chain;
SELECT *
FROM supply_chain
LIMIT 10;
SELECT COUNT(*) AS total_records
FROM supply_chain;
SELECT COUNT(*) AS missing_sku
FROM supply_chain
WHERE SKU IS NULL;
SELECT COUNT(*) AS missing_price
FROM supply_chain
WHERE price IS NULL;
SELECT
    COUNT(*) AS total_rows,
    SUM(SKU IS NULL) AS missing_sku,
    SUM(Price IS NULL) AS missing_price,
    SUM(costs IS NULL) AS missing_costs
FROM supply_chain;
SELECT
    SKU,
    COUNT(*) AS record_count
FROM supply_chain
GROUP BY SKU
HAVING COUNT(*) > 1;
SELECT
    MIN(Price) AS minimum_price,
    MAX(Price) AS maximum_price,
    AVG(Price) AS average_price
from supply_chain;
SELECT COUNT(*) AS empty_sku
FROM supply_chain
WHERE SKU = '';
SELECT
    SUM(Revenue_generated) AS total_revenue,
    SUM(Number_of_products_sold) AS total_units_sold
FROM supply_chain;
SELECT
    Product_type,
    SUM(Revenue_generated) AS total_revenue
FROM supply_chain
GROUP BY Product_type
ORDER BY total_revenue DESC;
SELECT
    Product_type,
    AVG(Price) AS average_price
FROM supply_chain
GROUP BY Product_type
ORDER BY average_price DESC;
SELECT
    Product_type,
    AVG(Stock_levels) AS average_stock_level
FROM supply_chain
GROUP BY Product_type
ORDER BY average_stock_level ASC;
SELECT
    Product_type,
    AVG(Stock_levels) AS average_stock_level,
    SUM(Number_of_products_sold) AS total_units_sold
FROM supply_chain
GROUP BY Product_type
ORDER BY average_stock_level ASC;
SELECT
    Availability,
    COUNT(*) AS record_count
FROM supply_chain
GROUP BY Availability;
SELECT
    Supplier_name,
    AVG(Lead_time) AS average_lead_time
FROM supply_chain
GROUP BY Supplier_name
ORDER BY average_lead_time ASC;
SELECT
    Supplier_name,
    AVG(Manufacturing_costs) AS average_manufacturing_cost
FROM supply_chain
GROUP BY Supplier_name
ORDER BY average_manufacturing_cost ASC;
SELECT
    Supplier_name,
    Product_type,
    AVG(Lead_time) AS average_lead_time
FROM supply_chain
GROUP BY
    Supplier_name,
    Product_type
ORDER BY average_lead_time ASC;
SELECT
    Shipping_carriers,
    AVG(Shipping_costs) AS average_shipping_cost
FROM supply_chain
GROUP BY Shipping_carriers
ORDER BY average_shipping_cost ASC;
SELECT
    Transportation_modes,
    AVG(Shipping_costs) AS average_shipping_cost,
    AVG(Shipping_times) AS average_shipping_time
FROM supply_chain
GROUP BY Transportation_modes
ORDER BY average_shipping_cost ASC;
SELECT
    Product_type,
    AVG(Manufacturing_lead_time) AS average_manufacturing_lead_time
FROM supply_chain
GROUP BY Product_type
ORDER BY average_manufacturing_lead_time ASC;
SELECT
    Product_type,
    SUM(Production_volumes) AS total_production_volume
FROM supply_chain
GROUP BY Product_type
ORDER BY total_production_volume DESC;
SELECT
    Product_type,
    SUM(Revenue_generated) AS total_revenue,
    SUM(Number_of_products_sold) AS total_units_sold,
    AVG(Stock_levels) AS average_stock_level,
    AVG(Shipping_costs) AS average_shipping_cost,
    AVG(Defect_rates) AS average_defect_rate
FROM supply_chain
GROUP BY Product_type
ORDER BY total_revenue DESC;
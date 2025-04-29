-- Select customers table
SELECT * FROM customers;

-- Select orders table
SELECT * FROM orders;

-- Select order_items table
SELECT * FROM order_items;

-- Select products table
SELECT * FROM products;

-- Select payments table
SELECT * FROM payments;

-- Extract year and month components
SELECT 
    order_id,
    order_date,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    total_amount
FROM 
    Orders
ORDER BY 
    order_id
LIMIT 5;

-- Calculate monthly revenue and order volume
SELECT
    SUM(total_amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date);

-- Monthly and Yearly Revenue and Order volume Analysis
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    total_revenue DESC;
    
-- Monthly, Yearly Revenue and Order volume Analysis with LIMIT
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    total_revenue DESC
LIMIT 2;

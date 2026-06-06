KPI 1: Total Revenue
SELECT
    ROUND(SUM(price),2) AS total_revenue
FROM olist_order_items_dataset;
KPI 2: Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM olist_orders_dataset;
KPI 3: Total Customers
SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM olist_customers_dataset;
KPI 4: Average Order Value
SELECT
    ROUND(
        SUM(price) /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM olist_order_items_dataset;
KPI 5: Top Revenue Category
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 1;
KPI 6: Top Customer
SELECT
    o.customer_id,
    ROUND(SUM(oi.price),2) AS total_spent
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 1;
KPI 7: Monthly Growth
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
        ROUND(SUM(oi.price),2) AS revenue
    FROM olist_orders_dataset o
    JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
    GROUP BY month
)
SELECT * FROM monthly_sales;
Query 1: Top 10 Customers by Spending
SELECT
    o.customer_id,
    ROUND(SUM(oi.price),2) AS total_spent
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;

Query 2: Repeat Customers
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM olist_orders_dataset
GROUP BY customer_id
HAVING COUNT(order_id) > 1
ORDER BY total_orders DESC;

Query 3: Customer Lifetime Value (CLV)
SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price),2) AS lifetime_value
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY lifetime_value DESC;

SELECT
    customer_id,
    lifetime_value,
    DENSE_RANK() OVER (
        ORDER BY lifetime_value DESC
    ) AS customer_rank
FROM (
    SELECT
        o.customer_id,
        ROUND(SUM(oi.price),2) AS lifetime_value
    FROM olist_orders_dataset o
    JOIN olist_order_items_dataset oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
) t;

Query 5: Customer Segmentation
SELECT
    customer_id,
    lifetime_value,
    CASE
        WHEN lifetime_value >= 5000 THEN 'Premium'
        WHEN lifetime_value >= 1000 THEN 'Gold'
        WHEN lifetime_value >= 500 THEN 'Silver'
        ELSE 'Regular'
    END AS customer_segment
FROM (
    SELECT
        o.customer_id,
        ROUND(SUM(oi.price),2) AS lifetime_value
    FROM olist_orders_dataset o
    JOIN olist_order_items_dataset oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
) t
ORDER BY lifetime_value DESC;
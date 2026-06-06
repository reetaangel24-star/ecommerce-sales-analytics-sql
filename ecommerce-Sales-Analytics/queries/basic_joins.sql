SELECT
    o.order_id,
    c.customer_city,
    o.order_status
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id
LIMIT 10;
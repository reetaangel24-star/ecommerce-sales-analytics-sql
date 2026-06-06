CREATE VIEW sales_summary AS
SELECT
    DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
GROUP BY sales_month;

Test:

SELECT * FROM sales_summary;
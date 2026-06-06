1.Top 10 Products by Number of Sales
	SELECT
    product_id,
    COUNT(*) AS total_sales
FROM olist_order_items_dataset
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;

2: Top 10 Products by Revenue
	SELECT
    product_id,
    ROUND(SUM(price),2) AS total_revenue
FROM olist_order_items_dataset
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;

3.Product + Category Analysis
	SELECT
    p.product_category_name,
    COUNT(oi.order_id) AS total_orders,
    ROUND(SUM(oi.price),2) AS revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;
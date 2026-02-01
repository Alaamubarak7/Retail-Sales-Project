SELECT * FROM orders;
SELECT COUNT (*) FROM customers;


SELECT orders.order_id, customers.name
FROM orders 
JOIN customers 
on orders.customer_id = customers.customer_id;



SELECT orders.order_id,
SUM(products.price * order_items.quantity) AS order_total
FROM orders
JOIN order_items  ON orders.order_id = order_items.order_id
JOIN products  ON order_items.product_id = products.product_id
GROUP BY orders.order_id;


SELECT c.name,
SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;



SELECT p.name,p.product_id,p.price,
SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.name,p.product_id,p.price
ORDER BY total_sold DESC;



SELECT MONTH(order_date) AS month,
COUNT(*) AS orders_count
FROM orders
GROUP BY MONTH(order_date);



CREATE VIEW best_customers AS
SELECT c.name,
SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
GROUP BY c.name
;

drop view best_customers

SELECT *
FROM best_customers
ORDER BY total_spent DESC;
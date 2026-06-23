
-- First join query file
--SELECT
--    s.order_id,
--    s.date,
--    c.customer,
--    s.amount
--FROM sales s
--INNER JOIN customers c
--    ON s.customer_id = c.customer_id
--ORDER BY s.date, s.order_id;

-- 1) Count orders per customer (LEFT JOIN + COUNT)
--SELECT
--    c.customer,
--    COUNT(s.order_id) AS order_count
--FROM customers c
--LEFT JOIN sales s
--    ON c.customer_id = s.customer_id
--GROUP BY c.customer
--ORDER BY order_count DESC, c.customer;


-- 2) SUM and AVG per customer + HAVING

--SELECT
--    c.customer,
--    COUNT(s.order_id) AS order_count,
--    SUM(s.amount)    AS total_amount,
--    AVG(s.amount)    AS avg_amount
--FROM customers c
--LEFT JOIN sales s
--    ON c.customer_id = s.customer_id
--GROUP BY c.customer
--ORDER BY total_amount DESC;

-- 3) Using HAVING function

SELECT
    c.customer,
    COUNT(s.order_id) AS order_count,
    SUM(s.amount)     AS total_amount
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer
HAVING SUM(s.amount) > 20
ORDER BY total_amount DESC;
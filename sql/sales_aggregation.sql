SELECT
    customer,
    SUM(amount) AS total_amount
FROM sales
GROUP BY customer
ORDER BY total_amount DESC;

SELECT
    category,
    SUM(amount) AS total_amount
FROM sales
GROUP BY category
ORDER BY total_amount DESC;

-- Customers with total_amount > 15 (using HAVING)
SELECT
    customer,
    SUM(amount) AS total_amount
FROM sales
GROUP BY customer
HAVING SUM(amount) > 15
ORDER BY total_amount DESC;


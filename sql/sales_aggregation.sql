SELECT
    customer,
    SUM(amount) AS total_amount
FROM sales
GROUP BY customer
ORDER BY total_amount DESC;
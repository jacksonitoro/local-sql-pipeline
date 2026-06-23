
-- RANK by total spend
--WITH customer_totals AS (
--    SELECT
--        customer_id,
--        customer,
--        SUM(amount) AS total_amount
--    FROM sales
--    WHERE amount IS NOT NULL
--    GROUP BY customer_id, customer
--)
--SELECT
--    customer_id,
--    customer,
--    total_amount,
--    RANK() OVER (
--        ORDER BY total_amount DESC
--    ) AS spend_rank
--FROM customer_totals
--ORDER BY spend_rank;

-- LAG + running total
SELECT
    customer_id,
    customer,
    date,
    amount,
    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY date
    ) AS previous_amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM sales
WHERE amount IS NOT NULL
ORDER BY customer_id, date;
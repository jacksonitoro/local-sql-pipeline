-- 1) All orders with amount > 10
SELECT *
FROM sales
WHERE amount > 10
ORDER BY amount DESC;

-- 2) Only 'food' category
SELECT *
FROM sales
WHERE category = 'food'
ORDER BY date, amount;

-- 3) Orders in 2024-01-02 only
SELECT *
FROM sales
WHERE date = '2024-01-02'
ORDER BY amount DESC;
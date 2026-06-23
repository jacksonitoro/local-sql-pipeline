-- Basic SELECT
--SELECT * FROM sales;

--SELECT * FROM sales
--WHERE amount > 10;

--SELECT *
--FROM sales
--ORDER BY date DESC, amount DESC;

--SELECT *
--FROM sales
--ORDER BY amount DESC
--LIMIT 3;

--SELECT *
--FROM sales
--WHERE customer IN ('Alice', 'Bob')
--ORDER BY date, amount;

--SELECT *
--FROM sales
--WHERE category ILIKE 'foo%'
--ORDER BY date, amount;

--SELECT *
--FROM sales
--WHERE amount IS NULL;

SELECT *
FROM sales
WHERE amount IS NOT NULL;
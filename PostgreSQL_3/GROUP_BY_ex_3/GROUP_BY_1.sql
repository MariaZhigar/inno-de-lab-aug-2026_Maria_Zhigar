-- 01_ex_GROUP_BY.sql
SELECT 
	country,
	count(*)
FROM
	customers
GROUP BY
	country
ORDER BY
	country DESC;

-- 02_ex_GROUP_BY.sql
SELECT 
	item,
	count(*),
	AVG(amount) AS avg_amount
FROM
	orders
GROUP BY
	item
ORDER BY
	avg_amount DESC;
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
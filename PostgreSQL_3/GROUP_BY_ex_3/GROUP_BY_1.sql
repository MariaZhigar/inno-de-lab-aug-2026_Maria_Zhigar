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


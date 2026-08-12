-- 01_ex_WHERE.sql
SELECT 
	first_name,
	last_name,
	age,
	country
FROM
	Customers
WHERE
	country = 'USA'
	AND age > 25;
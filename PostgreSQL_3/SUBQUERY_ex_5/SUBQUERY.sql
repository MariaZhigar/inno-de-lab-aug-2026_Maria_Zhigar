-- 01_ex_SUBQUERY.sql
SELECT 
	c.first_name,
	c.last_name,
	o.amount
FROM
	customers AS c
	INNER JOIN orders AS o            --joining tables with inner join
	ON c.customer_id = o.customer_id 
WHERE o.amount = (					  --subquery
	SELECT MAX(amount) 
	FROM orders 
);
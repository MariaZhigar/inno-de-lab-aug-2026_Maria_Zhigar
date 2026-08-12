-- 01_ex_JOIN.sql
SELECT 
	c.first_name,
	c.last_name,
	o.item,
	o.amount
FROM
	Customers AS c
INNER JOIN Orders AS o
	ON c.customer_id = o.customer_id;
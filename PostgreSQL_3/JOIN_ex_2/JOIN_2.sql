-- 02_ex_JOIN.sql
SELECT 
	s.status,
	c.first_name,
	c.last_name
FROM
	customers AS c
INNER JOIN shippings AS s
	ON c.customer_id = s.customer;
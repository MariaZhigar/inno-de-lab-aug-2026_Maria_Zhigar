-- 02_ex_JOIN.sql
-- Display the list of deliveries with status and the name of the customer they belong to

-- Select columns to display in the result set
SELECT 
	s.status,		-- Delivery status (Shippings table)
	c.first_name,	-- Customer's first name (Customers table)
	c.last_name		-- Customer's last name (Customers table)
-- The primary table — Customers
FROM
	customers AS c
-- Join Customers table with Shippings table
INNER JOIN shippings AS s				-- INNER JOIN: we only need deliveries that have a real customer
	ON c.customer_id = s.customer; 		-- Join condition: match rows by customer_id
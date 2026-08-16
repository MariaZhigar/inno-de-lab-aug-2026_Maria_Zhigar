-- 01_ex_JOIN.sql
-- Get the list of orders together with the first and last name of the customer who placed them

-- Select columns to display in the result set
SELECT 
	c.first_name,		-- Customer's first name (from Customers table)
	c.last_name,		-- Customer's last name (from Customers table)
	o.item,				-- Product name in the order (from Orders table)
	o.amount			-- Order amount (from Orders table)
-- Primary table — Customers
FROM
	Customers AS c
-- Join Customers table with Orders table
INNER JOIN Orders AS o					-- INNER JOIN: we only need orders that have a real customer
	ON c.customer_id = o.customer_id;	-- Join condition: match rows by customer_id
-- 02_ex_WHERE.sql
-- Display all orders with amount greater than 1000

-- Select columns to display in the result set
SELECT 
	order_id,   	-- Order's ID
	item,			-- Product name
	amount,			-- Order amount
	customer_id 	-- ID of the customer who placed the order
-- Source table
FROM
	orders
-- Filter rows
WHERE
	amount > 1000;	
					
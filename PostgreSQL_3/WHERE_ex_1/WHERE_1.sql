-- 01_ex_WHERE.sql
-- Task: Find all customers from 'USA' who are older than 25

-- Select columns to display in the result set
SELECT 
	first_name,   -- Customer's first name
	last_name,    -- Customer's last name
	age,          -- Customer's age
	country       -- Customer's country
-- Source table
FROM
	Customers
-- Filter rows
WHERE
	country = 'USA'  -- Condition 1: country must be 'USA'
	AND age > 25;	 -- Condition 2: age strictly greater than 25
			
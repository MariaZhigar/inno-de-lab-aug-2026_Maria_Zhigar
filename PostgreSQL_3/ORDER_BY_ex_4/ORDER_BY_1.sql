-- 01_ex_ORDER_BY.sql
-- Display the list of customers sorted by age in descending order

-- Select columns to display in the result set
SELECT 
	first_name,		 -- Customer's first name
	age				 -- Customer's age
-- Source table
FROM
	customers
-- Sort the result by the age column in descending order
ORDER BY
	age DESC;
-- 01_ex_GROUP_BY.sql
-- Count the number of customers in each country

SELECT 
	country, 	-- Customer's country
	count(*)	-- Aggregate function: counts the number of customers within each group/country
-- Specify the source table
FROM
	customers
-- Group rows by the country
-- All customers from the same country are gathered into one group
GROUP BY
	country
-- Sort in reverse alphabetical order
ORDER BY
	country DESC;
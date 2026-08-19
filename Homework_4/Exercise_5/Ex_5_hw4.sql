-- Task 5: Functions and Views

-- 1. Create function CalculateAnnualBonus	

CREATE FUNCTION CalculateAnnualBonus(
	employee_id INT,		-- Employee ID
	salary 		DECIMAL		-- Employee salary
)
RETURNS DECIMAL 			-- Function returns a decimal number
LANGUAGE plpgsql			-- Function body language
AS $$
BEGIN
	RETURN salary * 0.10;	-- Return 10% of salary
END;
$$;

-- 2. Use the function in a SELECT

SELECT 
	employeeid,									-- Employee ID
	CONCAT(firstname, ' ', lastname)			-- Concatenate first and last name with a space
	AS full_name,								-- Column alias
	CalculateAnnualBonus(employeeid ,salary)	-- Call the function for each row
	AS Bonus									-- Column alias
FROM employees;			-- Source table
	
-- 3. Create a View for IT department employees

CREATE VIEW IT_Department_View AS
SELECT
	EmployeeID,		-- Employee ID
	FirstName,		-- First name
	LastName, 		-- Last name
	Salary			-- Salary
FROM 
	Employees		-- Source table
WHERE 
	Department = 'IT';	-- Filter: IT department only

-- 4. Select data from the View
	
SELECT * FROM IT_Department_View;


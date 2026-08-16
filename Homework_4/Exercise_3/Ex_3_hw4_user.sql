-- Task 3: DCL

-- Select all employees to view current data
SELECT * FROM Employees;

-- Insert a new employee
INSERT INTO employees (FirstName, LastName, Department, Salary)
VALUES 
	('Kira', 'Black', 'Finance', 54000.00);

-- Update salary for employee Diana Prince
UPDATE employees
SET
	salary = 100000.00
WHERE 
	firstname = 'Diana'
	AND lastname = 'Prince';

-- Check which user the current session is running under
SELECT current_user;
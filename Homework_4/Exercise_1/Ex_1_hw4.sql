-- Task 1: DML

-- 1. Insert two new employees (departments other than 'IT')

INSERT INTO employees (FirstName, LastName, Department, Salary)
VALUES 
	('Evgenia', 'Black', 'Finance', 54000.00),
	('Daria', 'Spenser', 'HR', 54000.00);

-- 2. Select all employees

SELECT *
FROM employees;

-- 3. Select only first and last name of employees from department 'IT'

SELECT
	FirstName,		-- Employee's first name
	LastName		-- Employee's last name
FROM employees
WHERE department = 'IT';

-- 4. Update Alice Smith's salary to 65000.00

UPDATE employees
SET
	salary = 65000.00		-- New salary value
WHERE 						-- Condition
	firstname = 'Alice'
	AND lastname = 'Smith';

-- 5. Delete employee Eve Davis

DELETE 
FROM employees 
WHERE						-- Condition
	firstname = 'Eve'
	AND lastname = 'Davis';
	
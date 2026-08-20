-- Task 4: DML/DCL

-- 1. Increase HR department salary by 10%

UPDATE employees
SET
	salary = salary * 1.1	-- Multiply current salary by 1.1
WHERE 
	department = 'HR';		-- Filter: HR department only

-- 2. Move employees with salary > 70000 to 'Senior IT'

UPDATE employees
SET
	department = 'Senior IT'	-- New department value
WHERE 
	salary > 70000.00;			-- Condition

-- 3. Delete employees not assigned to any project
-- NOT EXISTS

DELETE 
FROM employees AS e
-- For each employee we ask: "Does he have a project?
WHERE NOT EXISTS(
	SELECT 1
	-- Check if at least one row 
	FROM employeeprojects AS ep
	WHERE
		ep.EmployeeID = e.EmployeeID
);
	
-- LEFT JOIN
	
DELETE
FROM Employees
-- Delete those whose ID is in the list
WHERE EmployeeID IN (
	-- The list comes from the subquery below
    SELECT e.EmployeeID
    FROM Employees e
    LEFT JOIN EmployeeProjects ep 
        ON e.EmployeeID = ep.EmployeeID
    WHERE ep.EmployeeID IS NULL
);

-- 4. Transaction: new project + assign two employees

START TRANSACTION;

-- Insert new project
INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate) 
VALUES
	('Website Flowers', 150000.00, '2026-01-15', '2026-06-30');

-- Assign two employees to this project
INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
VALUES 
    (1, currval('projects_projectid_seq'), 150),
    (2, currval('projects_projectid_seq'), 200);

COMMIT;		-- Save permanently. Now everyone sees changes.
			-- If there was an error — we would ROLLBACK.
	
	
	
	
	
	
	
	
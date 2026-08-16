-- Task 6, item 1: Find projects where Bob Johnson worked more than 150 hours

SELECT
	CONCAT(e.firstname, ' ', e.lastname)	-- Concatenate first and last name with a space
	AS full_name,							-- Column alias
	p.projectname							-- Project name
FROM 				
	employees 					-- Main table: employees
	AS e 
INNER JOIN
	employeeprojects AS ep		-- Join with project assignments		
	ON e.employeeid = ep.employeeid
INNER JOIN
	projects AS p 				-- Join with projects table
	ON ep.projectid = p.projectid
WHERE							-- Filter
	e.firstname = 'Bob'
	AND
	e.lastname = 'Johnson'
	AND
	ep.hoursworked > 150;

-- 2. Increase Budget by 10% if at least one IT employee is assigned

UPDATE 
	projects
SET 
    Budget = Budget * 1.1	-- Increase budget by 10%
-- Select only projects found in the subquery
WHERE projectid IN (
		SELECT DISTINCT	ep.projectid 	-- Unique project IDs
		FROM 
			employeeprojects AS ep
		INNER JOIN 
			employees AS e
		ON ep.EmployeeID = e.EmployeeID
		WHERE e.department = 'IT'
);

SELECT *
FROM projects;

-- 3. Set EndDate to one year after StartDate if EndDate is empty

UPDATE 
	projects
SET 
	EndDate = StartDate + INTERVAL '1 year'		-- New date = start date + 1 year
WHERE
	EndDate IS NULL;							-- Only for projects with no end 

-- 4. Transaction: new employee + assignment to project
	
START TRANSACTION;
-- Common Table Expression - table for one query
WITH new_employee AS (
	INSERT INTO Employees (FirstName, LastName, Department, Salary)
    VALUES ('Frank', 'Miller', 'IT', 70000.00)
    -- Return ID of the just-inserted employee
    RETURNING EmployeeID
)
	
INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
SELECT 
	ne.EmployeeID,		-- New employee ID from CTE
	(
	SELECT projectid 	-- Subquery: find project ID
	FROM projects
	WHERE ProjectName = 'Website Redesign'
	),
	80					-- Hours worked
FROM 
	new_employee AS ne;

COMMIT;					-- Save all changes








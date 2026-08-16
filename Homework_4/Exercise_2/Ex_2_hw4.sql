-- Task 2: DDL

-- 1. Create table Departments

CREATE TABLE Departments (
	DepartmentID SERIAL PRIMARY KEY,			-- Department's ID
	DepartmentName VARCHAR(50) NOT NULL UNIQUE, -- Department's name 
	Location VARCHAR(50)						-- Office location
	);

-- 2. Modify Employees table — add Email column

ALTER TABLE employees
ADD email VARCHAR(100);

-- 3. Fill email column with unique values

UPDATE employees
SET
	-- Generate email: firstname.lastname+id@company.com
	email = CONCAT(LOWER(FirstName), '.', LOWER(LastName), employeeid, '@company.com');

-- 4. Add UNIQUE constraint to Email column

ALTER TABLE employees
ADD CONSTRAINT uq_employees_email UNIQUE (email);

-- 5. Rename column Location to OfficeLocation

ALTER TABLE departments 
RENAME COLUMN location TO OfficeLocation;


-- Task 3: DCL

-- Create a new user in PostgreSQL
CREATE USER 
	hr_user					-- Username
WITH PASSWORD 
	'secure_pass123'; 		-- Connection password

-- Grant privileges on the employees table
GRANT SELECT
	ON employees 
	TO hr_user;
GRANT INSERT, UPDATE 
	ON employees 
	TO hr_user;
-- Grant privileges on the sequence
GRANT USAGE, SELECT 
	ON SEQUENCE employees_employeeid_seq 
	TO hr_user;

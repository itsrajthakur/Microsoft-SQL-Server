-- Insert a new record
INSERT INTO Employees (EmployeeName, HireDate)
VALUES ('Jane Smith', '2023-01-16');

SELECT * FROM Employees;

-- Get the last generated ID SCOPE_IDENTITY()
SELECT SCOPE_IDENTITY() AS LastGeneratedID;

-- Get the last generated ID IDENT_CURRENT('TableName')
SELECT IDENT_CURRENT('Employees') AS LastGeneratedID;

-- Get the last generated ID @@IDENTITY
SELECT @@IDENTITY AS LastGeneratedID;

--Differences
--SCOPE_IDENTITY(): Best practice for retrieving the last identity value generated in the current scope and session.
--IDENT_CURRENT('TableName'): Returns the last identity value generated for a specific table, regardless of the session or scope (use with caution).
--@@IDENTITY: Returns the last identity value generated in the current session, but can be affected by triggers (not recommended for use).
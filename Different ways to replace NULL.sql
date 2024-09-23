CREATE TABLE employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(50),
    ManagerID INT,
    Department VARCHAR(50)
);

INSERT INTO employee (EmployeeName, ManagerID, Department) VALUES
('John', NULL, 'Sales'),
('Mike', 1, NULL),
('Sara', 1, 'Marketing'),
('Sophia', 2, 'Sales'),
('James', NULL, NULL),
('Emma', 3, 'Marketing');

select * from employee;

--ISNULL(): Quick and straightforward for single replacements.
SELECT EmployeeName, ISNULL(ManagerID, 0), ISNULL(Department,0) AS ManagerID
FROM employee;

--COALESCE(): Flexible for checking multiple potential NULL values.
SELECT EmployeeName, COALESCE(ManagerID, Department, -1) AS Result
FROM employee;

--CASE Statement: For complex conditions beyond simple replacements.
SELECT EmployeeName,
       CASE 
           WHEN ManagerID IS NULL THEN 'No Manager'
           ELSE CAST(ManagerID AS VARCHAR(10))
       END AS Manager
FROM employee;

--NULLIF(): Useful for converting specific values to NULL.
SELECT EmployeeName, NULLIF(ManagerID, 0) AS ManagerID
FROM employee;

--Updating: Permanent changes in the data for reporting or data quality.
UPDATE employee
SET ManagerID = 0
WHERE ManagerID IS NULL;

--CONCAT() and REPLACE(): Effective for handling string concatenations and ensuring NULL values don’t interfere.
SELECT CONCAT(EmployeeName, ' reports to ', 
ISNULL(CAST(ManagerID AS NVARCHAR(10)), 'No Manager')) AS Report
FROM employee;

SELECT REPLACE(ISNULL(Department, 'No Department'),
'No Department', 'No Info') AS DepartmentInfo
FROM employee;

drop table employee;
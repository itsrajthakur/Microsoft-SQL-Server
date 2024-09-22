CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeEmail NVARCHAR(100),
    EmployeeName NVARCHAR(50),
    CONSTRAINT UQ_EmployeeEmail UNIQUE (EmployeeEmail)
);

INSERT INTO Employees (EmployeeID, EmployeeEmail, EmployeeName)
VALUES (1, 'john.doe@example.com', 'John Doe');

--Selecting All Columns from a table, use the asterisk (*) wildcard
SELECT * FROM Employees;

--Selecting Specific Columns
SELECT EmployeeID, EmployeeName FROM Employees;

--Using WHERE Clause
SELECT * FROM Employees WHERE EmployeeID = 1;
SELECT * FROM Employees WHERE Age > 30 AND HireDate < '2022-01-01';

--Sorting Results ORDER BY clause
SELECT * FROM Employees ORDER BY EmployeeName ASC; -- Sorts by EmployeeName in ascending order ASC and descending order DESC

--Limiting Results using the TOP clause
SELECT TOP 5 * FROM Employees;

--Using GROUP BY The GROUP BY clause is used to group rows that have the same values in specified columns into summary rows. It is often used with aggregate functions (like COUNT(), SUM(), etc.):
SELECT DepartmentID, COUNT(*) AS NumberOfEmployees FROM Employees GROUP BY DepartmentID;

--Using HAVING The HAVING clause is used to filter groups created by GROUP BY:
SELECT DepartmentID, COUNT(*) AS NumberOfEmployees FROM Employees GROUP BY DepartmentID HAVING COUNT(*) > 10;

--Joining Tables
SELECT e.EmployeeName, d.DepartmentName FROM Employees e INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
SELECT e.EmployeeName, d.DepartmentName FROM Employees e LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

--Using Aggregate Functions Aggregate functions can perform calculations on a set of values and return a single value:
SELECT AVG(Salary) AS AverageSalary FROM Employees;

--Subqueries A subquery is a SELECT statement nested inside another query:
SELECT * FROM Employees WHERE EmployeeID IN (SELECT EmployeeID FROM Managers);

DELETE FROM Employees;

DROP TABLE Employees;
SELECT DepartmentID, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY DepartmentID;--Simple Grouping with COUNT

SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID;--Grouping with SUM

SELECT DepartmentID, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 10;--Using HAVING with GROUP BY

SELECT DepartmentID, JobTitle, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY DepartmentID, JobTitle;--Grouping by Multiple Columns

SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY TotalSalary DESC;--Combining GROUP BY with ORDER BY

SELECT DepartmentID,
       COUNT(*) AS NumberOfEmployees,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;--Example with Multiple Aggregates

SELECT d.DepartmentName, COUNT(e.EmployeeID) AS NumberOfEmployees
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;--Using GROUP BY with JOINs

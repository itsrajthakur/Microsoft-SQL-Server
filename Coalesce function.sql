--The COALESCE() function in SQL Server is used to return the first non-NULL value from a list of expressions. It is particularly useful when you want to handle NULL values in your queries by providing alternative values.

SELECT COALESCE(NULL, NULL, 'Hello', 'World') AS Result;

CREATE TABLE employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    ManagerID INT,
    Department NVARCHAR(50)
);

INSERT INTO employee (EmployeeID, EmployeeName, ManagerID, Department) VALUES
(1, 'John', NULL, 'Sales'),
(2, 'Mike', 1, NULL),
(3, 'Sara', 1, 'Marketing'),
(4, 'Sophia', 2, 'Sales'),
(5, 'James', NULL, NULL),
(6, 'Emma', 3, 'Marketing');

select * from employee;

--You can use COALESCE() to provide default values when querying
SELECT EmployeeName,
COALESCE(ManagerID, 0) AS ManagerID,
COALESCE(Department, 'No Department') AS Department
FROM employee;

--You can also use COALESCE() to handle multiple columns:
--not work sql server
SELECT EmployeeName, COALESCE(ManagerID, Department, -1) AS Result
FROM employee;

--Dynamic Queries COALESCE() can also be useful in dynamic queries where the presence of data is uncertain:
DECLARE @StartDate DATETIME = NULL;
DECLARE @EndDate DATETIME = GETDATE();
SELECT COALESCE(@StartDate, @EndDate) AS SelectedDate;

drop table employee;

--The COALESCE() function is a powerful tool in SQL Server for managing NULL values effectively. By providing a default value when NULL is encountered, it helps ensure that your queries return meaningful results. It is especially useful in reporting, data manipulation, and when dealing with optional fields in your database.
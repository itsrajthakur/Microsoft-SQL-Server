CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50)
);

INSERT INTO Employees (EmployeeID, EmployeeName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

SELECT 
    ROW_NUMBER() OVER (ORDER BY EmployeeID) AS RowNum,
    EmployeeID,
    EmployeeName
FROM 
    Employees;

drop table Employees;
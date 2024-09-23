-- Create the employee table
CREATE TABLE employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName NVARCHAR(50),
    ManagerID INT
);

-- Insert data into the employee table
INSERT INTO employee (EmployeeName, ManagerID) VALUES
('John', NULL),       -- John has no manager (he is the top-level manager)
('Mike', 1),          -- Mike's manager is John (EmployeeID 1)
('Sara', 1),          -- Sara's manager is John (EmployeeID 1)
('Sophia', 2),        -- Sophia's manager is Mike (EmployeeID 2)
('James', 2),         -- James's manager is Mike (EmployeeID 2)
('Emma', 3);          -- Emma's manager is Sara (EmployeeID 3)

--employee list
select * from employee;

-- Self Join to list employees with their managers
SELECT E.EmployeeName AS Employee, M.EmployeeName AS Manager
FROM employee E
LEFT JOIN employee M
ON E.ManagerID = M.EmployeeID;

-- Find managers who have no employees reporting to them
SELECT M.EmployeeName AS Manager
FROM employee M
LEFT JOIN employee E
ON M.EmployeeID = E.ManagerID
WHERE E.ManagerID IS NULL;

WITH ManagerHierarchy AS (
    SELECT EmployeeID, EmployeeName, ManagerID, 1 AS Level
    FROM employee
    WHERE ManagerID IS NULL -- Start from top-level managers (John)

    UNION ALL

    SELECT e.EmployeeID, e.EmployeeName, e.ManagerID, mh.Level + 1
    FROM employee e
    INNER JOIN ManagerHierarchy mh ON e.ManagerID = mh.EmployeeID
)
SELECT * FROM ManagerHierarchy;

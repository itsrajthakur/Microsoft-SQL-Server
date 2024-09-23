--Creating a Local Temporary Table
CREATE TABLE #TempTable
(
    ID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT
);

-- Insert data into the temporary table
INSERT INTO #TempTable (ID, Name, Age)
VALUES (1, 'John Doe', 30), (2, 'Jane Smith', 25);

-- Select data from the temporary table
SELECT * FROM #TempTable;

-- Drop the temporary table
DROP TABLE #TempTable;

-- Creating a Global Temporary Table
CREATE TABLE ##GlobalTempTable
(
    ID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT
);

CREATE TABLE #TempEmployees
(
    EmployeeID INT,
    EmployeeName NVARCHAR(50),
    Department NVARCHAR(50)
);

-- Inserting into temporary table
INSERT INTO #TempEmployees (EmployeeID, EmployeeName, Department)
VALUES (1, 'John', 'HR'), (2, 'Emily', 'Finance');

-- Select from temporary table
SELECT * FROM #TempEmployees;

-- The table will be dropped when the session ends or explicitly using:
DROP TABLE #TempEmployees;

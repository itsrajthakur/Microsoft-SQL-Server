CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    CONSTRAINT CK_Employees1_Age CHECK (Age >= 18) -- Check constraint on Age
);--Check Constraint During Table Creation

CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    CONSTRAINT CK_Employees2_Salary CHECK (Salary >= 5000 AND Age > 18)
);--Check Constraint on Multiple Columns

ALTER TABLE Employees2
ADD CONSTRAINT CK_Employees2_Age CHECK (Age >= 18);--Adding a Check Constraint to an Existing Table

ALTER TABLE Employees2
DROP CONSTRAINT CK_Employees_Age;--Droping a Check Constraint

CREATE TABLE Employees3 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    Age INT,
    CONSTRAINT CK_Employees3_Age CHECK (Age >= 18)
);

INSERT INTO Employees3 (EmployeeID, EmployeeName, Age)
VALUES (1, 'John Doe', 25);--Valid Inserting Data with a Check Constraint

INSERT INTO Employees3 (EmployeeID, EmployeeName, Age)
VALUES (2, 'Jane Smith', 154);--Invalid Inserting Data with a Check Constraint

SELECT * FROM Employees3;

--Viewing Check Constraints
SELECT OBJECT_NAME(OBJECT_ID) AS TableName, name AS ConstraintName, definition
FROM sys.check_constraints
WHERE parent_object_id = OBJECT_ID('Employees3');

DROP TABLE Employees3;

DROP DATABASE demo;
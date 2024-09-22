CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    HireDate DATE DEFAULT GETDATE(),-- Current date
    IsActive BIT -- default value '1' (true)
);-- Default Constraint in Table Creation

ALTER TABLE Employees
ADD CONSTRAINT DF_Employees_IsActive DEFAULT 1 FOR IsActive;--Adding a Default Constraint to an Existing Table

ALTER TABLE Employees
DROP CONSTRAINT DF_Employees_IsActive;--Dropping a Default Constraint

INSERT INTO Employees (EmployeeID, EmployeeName)
VALUES (3, 'Jane Smith');--Inserting Data Using Default Constraints

SELECT OBJECT_NAME(object_id) AS TableName, name AS ConstraintName, definition
FROM sys.default_constraints
WHERE parent_object_id = OBJECT_ID('Employees');--Viewing Default Constraints

SELECT * FROM Employees;

DROP TABLE Employees;
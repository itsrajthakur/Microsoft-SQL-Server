--Creating a Table with a Unique Key Constraint
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeEmail NVARCHAR(100),
    EmployeeName NVARCHAR(50),
    CONSTRAINT UQ_EmployeeEmail UNIQUE (EmployeeEmail) -- Unique constraint on Email
);

--Adding a Unique Key Constraint to an Existing Table
ALTER TABLE Employees
ADD CONSTRAINT EmployeeName UNIQUE (EmployeeName);

--Dropping a Unique Key Constraint
ALTER TABLE Employees
DROP CONSTRAINT UQ_EmployeeEmail;

--Inserting Data with a Unique Key Constraint
INSERT INTO Employees (EmployeeID, EmployeeEmail, EmployeeName)
VALUES (4, 'jTohn.doe@example.com', 'John Doe');

INSERT INTO Employees (EmployeeID, EmployeeEmail, EmployeeName)
VALUES (2, 'jane.smith@example.com', 'Jane Smith');

SELECT * FROM Employees;

--Viewing Unique Key Constraints
SELECT 
    OBJECT_NAME(object_id) AS TableName,
    name AS ConstraintName
FROM 
    sys.key_constraints
WHERE 
    type = 'UQ' AND 
    OBJECT_NAME(parent_object_id) = 'Employees';


DELETE FROM Employees;

DROP TABLE Employees;
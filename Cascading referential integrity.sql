CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'IT'), (2, 'HR');

SELECT * FROM Departments;

DELETE FROM Departments WHERE DepartmentID = 1;

UPDATE Departments SET DepartmentID = 3 WHERE DepartmentID = 2;

DELETE FROM Departments;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    DepartmentID INT,
    CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
    ON DELETE CASCADE--or ON DELETE SET NULL or ON DELETE SET DEFAULT
    ON UPDATE CASCADE--or ON UPDATE SET NULL or ON UPDATE SET DEFAULT
);

-- ON DELETE CASCADE If you delete a department from the Departments table, the related employees in the Employees table will also be deleted.
-- ON UPDATE CASCADE If you update the DepartmentID of a department in the Departments table, the DepartmentID of the related employees will be updated as well.
-- ON DELETE SET NULL / ON UPDATE SET NULL when a department is deleted or updated, the DepartmentID in the Employees table will be set to NULL for the corresponding records.
-- ON DELETE SET DEFAULT / ON UPDATE SET DEFAULT when the parent row is deleted or updated, the DepartmentID in the Employees table will be set to the default value (in this case, 0).

INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES (1, 'John Doe', 1), (2, 'Jane Smith', 2);

ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Departments;--Dropping a Foreign Key Constraint

SELECT * FROM Employees;

DELETE FROM Employees;

--Viewing and Dropping Foreign Key Constraints with Cascade
SELECT 
    f.name AS ForeignKey,
    OBJECT_NAME(f.parent_object_id) AS ChildTable,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ChildColumn,
    OBJECT_NAME(f.referenced_object_id) AS ParentTable,
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS ParentColumn
FROM 
    sys.foreign_keys AS f
JOIN 
    sys.foreign_key_columns AS fc 
    ON f.object_id = fc.constraint_object_id
WHERE 
    OBJECT_NAME(f.parent_object_id) = 'Employees';

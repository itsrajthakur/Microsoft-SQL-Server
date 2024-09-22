CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    HireDate DATE
);--Creating a table with an identity column


INSERT INTO Employees (EmployeeName, HireDate)
VALUES ('John Doe', '2023-01-15');

INSERT INTO Employees (EmployeeName, HireDate)
VALUES ('Jane Smith', '2023-01-16');

DELETE FROM Employees WHERE EmployeeID = 6;

SELECT * FROM Employees;

--You cannot alter a column to become an identity column after the table is created. However, you can create a new table with the identity column, copy the data over, and then drop the old table if needed.

--The DBCC CHECKIDENT command can be used to manually set or reseed the identity value. This is useful if you need to reset the identity value or if you've deleted records and want to close the gap.
DBCC CHECKIDENT (Employees, RESEED, 5);


SELECT IDENT_CURRENT('Employees') AS CurrentIdentityValue;--Viewing Identity Values (This will return the last identity value generated for the Employees table.)

--If you need to insert a specific value into an identity column, you can temporarily allow this by setting the IDENTITY_INSERT property to ON.
SET IDENTITY_INSERT Employees ON;

INSERT INTO Employees (EmployeeID, EmployeeName, HireDate)
VALUES (4, 'Alice Brown', '2023-01-17');

SET IDENTITY_INSERT Employees OFF;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName NVARCHAR(50),
    DepartmentID INT
);

INSERT INTO Employee (EmployeeName, DepartmentID) VALUES
('John Doe', 1),
('Jane Smith', 1),
('Mike Johnson', 2);


CREATE PROCEDURE GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT EmployeeID, EmployeeName
    FROM Employee
    WHERE DepartmentID = @DepartmentID;
END;

select * from Employee;
EXEC GetEmployeesByDepartment @DepartmentID = 1;

CREATE PROCEDURE CountEmployeesByDepartment
    @DepartmentID INT,
    @EmployeeCount INT OUTPUT
AS
BEGIN
    SELECT @EmployeeCount = COUNT(*)
    FROM Employee
    WHERE DepartmentID = @DepartmentID;
END;

DECLARE @Count INT;
EXEC CountEmployeesByDepartment @DepartmentID = 1, @EmployeeCount = @Count OUTPUT;
SELECT @Count AS EmployeeCount;

CREATE PROCEDURE SafeInsertEmployee
    @EmployeeName NVARCHAR(50),
    @DepartmentID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Employee (EmployeeName, DepartmentID)
        VALUES (@EmployeeName, @DepartmentID);
    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

drop table Employee;
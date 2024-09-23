CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName NVARCHAR(50),
    DepartmentID INT
);

INSERT INTO Employee (EmployeeName, DepartmentID) VALUES
('John Doe', 1),
('Jane Smith', 1),
('Mike Johnson', 2),
('Emily Davis', 2);

--Create the Stored Procedure
CREATE PROCEDURE GetEmployeeDetails
    @DepartmentID INT,
    @EmployeeCount INT OUTPUT
AS
BEGIN
    -- Get the total number of employees in the department
    SELECT @EmployeeCount = COUNT(*)
    FROM Employee
    WHERE DepartmentID = @DepartmentID;

    -- Retrieve employee details
    SELECT EmployeeID, EmployeeName
    FROM Employee
    WHERE DepartmentID = @DepartmentID;
END;

-- Execute the Stored Procedure
DECLARE @Count INT;

-- Execute the stored procedure
EXEC GetEmployeeDetails @DepartmentID = 1, @EmployeeCount = @Count OUTPUT;

-- Display the results
SELECT @Count AS EmployeeCount;

drop table employee;
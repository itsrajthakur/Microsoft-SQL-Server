DECLARE @EmployeeID NVARCHAR(10) = 'EMP1234567';

-- Extract 'EMP' using LEFT
SELECT LEFT(@EmployeeID, 3) AS EmployeePrefix;  -- Output: 'EMP'

-- Extract '4567' using RIGHT
SELECT RIGHT(@EmployeeID, 4) AS EmployeeNumber;  -- Output: '4567'

-- Find position of '123' using CHARINDEX
SELECT CHARINDEX('123', @EmployeeID) AS PositionOf123;  -- Output: 4

-- Extract '1234' using SUBSTRING
SELECT SUBSTRING(@EmployeeID, 4, 4) AS EmployeeCode;  -- Output: '1234'

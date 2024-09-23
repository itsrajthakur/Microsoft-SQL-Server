CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(100),
    HireDate DATE
);

-- Creating a non-clustered index on LastName and FirstName
CREATE NONCLUSTERED INDEX IX_Employees_Name ON Employees (LastName, FirstName);

-- This query will utilize the IX_Employees_Name index
SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE LastName = 'Doe';

--Viewing Index Information
SELECT name AS IndexName, type_desc AS IndexType, is_unique, is_primary_key
FROM sys.indexes
WHERE object_id = OBJECT_ID('Employees');


CREATE CLUSTERED INDEX IX_Employees_ID ON Employees (EmployeeID);

CREATE NONCLUSTERED INDEX IX_Employees_Name ON Employees (LastName);

CREATE UNIQUE INDEX IX_Employees_Email ON Employees (Email);

CREATE INDEX IX_Orders_Customer_OrderDate ON Orders (CustomerID, OrderDate);

CREATE FULLTEXT INDEX ON Products (ProductDescription) 
KEY INDEX PK_Products;

CREATE NONCLUSTERED INDEX IX_Orders_OpenOrders 
ON Orders (OrderDate)
WHERE Status = 'Open';

CREATE PRIMARY XML INDEX IX_XML_Products ON Products (ProductDetails);


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATETIME,
    Amount DECIMAL(10, 2),
    CustomerID INT
);

CREATE VIEW vw_SalesSummary
WITH SCHEMABINDING
AS
SELECT 
    CustomerID,
    COUNT(*) AS TotalSales,
    SUM(Amount) AS TotalAmount
FROM dbo.Sales
GROUP BY CustomerID;

-- Create a unique clustered index on the view
CREATE UNIQUE CLUSTERED INDEX IX_SalesSummary
ON vw_SalesSummary (CustomerID);

SELECT * FROM vw_SalesSummary;

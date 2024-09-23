CREATE TABLE Sales2023 (
    Product NVARCHAR(50),
    Amount DECIMAL(10, 2)
);

CREATE TABLE Sales2024 (
    Product NVARCHAR(50),
    Amount DECIMAL(10, 2)
);

INSERT INTO Sales2023 (Product, Amount) VALUES
('Laptop', 1500.00),
('Mouse', 25.00),
('Keyboard', 75.00);

INSERT INTO Sales2024 (Product, Amount) VALUES
('Laptop', 1600.00),
('Mouse', 25.00),
('Monitor', 300.00);

--Use UNION when you need a distinct list of values.
SELECT Product
FROM Sales2023
UNION
SELECT Product
FROM Sales2024;
  
--Use UNION ALL when you want to retain all records, including duplicates.
SELECT Product
FROM Sales2023
UNION ALL
SELECT Product
FROM Sales2024;

DECLARE @ProductCode NVARCHAR(20) = 'PROD1234';

-- Repeat the product code 3 times using REPLICATE
SELECT REPLICATE(@ProductCode, 3);  -- Output: 'PROD1234PROD1234PROD1234'

-- Add 5 spaces between 'Product' and 'Code' using SPACE
SELECT 'Product' + SPACE(5) + 'Code';  -- Output: 'Product     Code'

-- Find the position of '123' in the product code using PATINDEX
SELECT PATINDEX('%123%', @ProductCode);  -- Output: 5

-- Replace '1234' with '5678' in the product code using REPLACE
SELECT REPLACE(@ProductCode, '1234', '5678');  -- Output: 'PROD5678'

-- Replace '1234' with '5678' by deleting and inserting using STUFF
SELECT STUFF(@ProductCode, 5, 4, '5678');  -- Output: 'PROD5678'

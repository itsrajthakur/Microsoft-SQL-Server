CREATE FUNCTION dbo.CalculateCircleArea (@radius FLOAT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @area FLOAT;
    SET @area = PI() * POWER(@radius, 2);-- pi * radius^2
    RETURN @area;
END;

SELECT dbo.CalculateCircleArea(5);  -- Returns the area of a circle with radius 5

CREATE FUNCTION dbo.GetDiscount (@price DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @discount DECIMAL(10, 2);
    
    IF @price > 100
        SET @discount = @price * 0.1;  -- 10% discount
    ELSE
        SET @discount = 0;             -- No discount

    RETURN @discount;
END;

SELECT dbo.GetDiscount(150);  -- Returns 15 (10% of 150)
SELECT dbo.GetDiscount(90);   -- Returns 0 (no discount for prices <= 100)

SELECT ProductID, Price, dbo.GetDiscount(Price) AS Discount
FROM Products;

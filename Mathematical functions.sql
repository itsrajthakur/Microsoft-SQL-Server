--1. ABS() Returns the absolute value of a number.
SELECT ABS(-10) AS AbsoluteValue;  -- Output: 10

--2. CEILING() Returns the smallest integer greater than or equal to a given number.
SELECT CEILING(4.3) AS CeilingValue;  -- Output: 5
SELECT CEILING(-4.3) AS CeilingValue; -- Output: -4

--3. FLOOR() Returns the largest integer less than or equal to a given number.
SELECT FLOOR(4.7) AS FloorValue;  -- Output: 4
SELECT FLOOR(-4.7) AS FloorValue; -- Output: -5

--4. ROUND() Rounds a number to a specified number of decimal places.
SELECT ROUND(123.4567, 2) AS RoundedValue;  -- Output: 123.46
SELECT ROUND(123.4567, 0) AS RoundedValue;  -- Output: 123

--5. POWER() Returns the value of a number raised to the power of another number.
SELECT POWER(2, 3) AS PowerValue;  -- Output: 8 (2^3)

--6. SQRT() Returns the square root of a specified float or numeric expression.
SELECT SQRT(16) AS SquareRoot;  -- Output: 4

--7. EXP() Returns e raised to the power of a specified number.
SELECT EXP(1) AS ExponentialValue;  -- Output: Approximately 2.7183

--8. LOG() Returns the natural logarithm of a specified float or numeric expression.
SELECT LOG(10) AS NaturalLog;  -- Output: Approximately 2.3026

--9. LOG10() Returns the base-10 logarithm of a specified float or numeric expression.
SELECT LOG10(100) AS LogBase10;  -- Output: 2 (because 10^2 = 100)

--10. RADIANS() Converts degrees to radians.
SELECT RADIANS(180) AS RadianValue;  -- Output: 3.14159

--11. DEGREES() Converts radians to degrees.
SELECT DEGREES(PI()) AS DegreeValue;  -- Output: 180

--12. SIN(), COS(), TAN() Returns the sine, cosine, or tangent of an angle, specified in radians.
SELECT SIN(PI()/2) AS SineValue;  -- Output: 1
SELECT COS(0) AS CosineValue;     -- Output: 1
SELECT TAN(PI()/4) AS TangentValue; -- Output: 1

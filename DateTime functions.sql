--GETDATE Returns the current system date and time (without time zone).
SELECT GETDATE(); -- Output: '2024-09-23 15:45:30.123' (example format)

--SYSDATETIME Returns the current system date and time, including fractional seconds with higher precision than `GETDATE`.
SELECT SYSDATETIME(); -- Output: '2024-09-23 15:45:30.1234567'

--CURRENT_TIMESTAMP This is an ANSI SQL equivalent of `GETDATE()` and returns the current date and time.
SELECT CURRENT_TIMESTAMP; -- Output: '2024-09-23 15:45:30.123'

--DATEADD Adds a specified number of units (days, months, years, etc.) to a date.
SELECT DATEADD(day, 5, '2024-09-23'); -- Output: '2024-09-28'

--DATEDIFF Calculates the difference between two dates in terms of the specified date part (days, months, years, etc.).
SELECT DATEDIFF(day, '2024-09-01', '2024-09-23'); -- Output: 22


--DATENAME Returns a string representing the specified part of a date (like day, month, year, etc.).
SELECT DATENAME(month, '2024-09-23'); -- Output: 'September'

--DATEPART Returns an integer that represents the specified part of a date (like day, month, year, etc.).

SELECT DATEPART(month, '2024-09-23'); -- Output: 9

--FORMAT Formats a date according to a specified format pattern.
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd'); -- Output: '2024-09-23'

--CONVERT Converts a value from one data type to another, commonly used for date formatting.
SELECT CONVERT(VARCHAR, GETDATE(), 103); -- Output: '23/09/2024' (UK date format)

--ISDATE Determines whether an expression is a valid date.
SELECT ISDATE('2024-09-23');  -- Output: 1 (True, it's a valid date)
SELECT ISDATE('abc');         -- Output: 0 (False, not a valid date)

--GETDATE, SYSDATETIME, CURRENT_TIMESTAMP: Retrieve the current date and time.
--DATEADD: Add or subtract from a date.
--DATEDIFF: Calculate the difference between two dates.
--DATENAME, DATEPART: Extract specific parts of a date.
--FORMAT: Format dates into specific string representations.
--CONVERT: Convert between data types, commonly used to format dates.
--ISDATE: Validate whether a value is a date.
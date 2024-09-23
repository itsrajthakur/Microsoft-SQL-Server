--CAST Function The CAST function is used to convert an expression from one data type to another. It is part of the ANSI SQL standard.
-- Convert an integer to a varchar
SELECT CAST(12345 AS VARCHAR(10)) AS StringValue; -- Output: '12345'

-- Convert a date to a string
SELECT CAST(GETDATE() AS VARCHAR(20)) AS DateString; -- Output: 'Sep 23 2024 1:15PM'

--CONVERT Function The CONVERT function is used to convert an expression from one data type to another, but it also allows for formatting when converting to certain data types, like dates.

-- Convert an integer to a varchar
SELECT CONVERT(VARCHAR(10), 12345) AS StringValue; -- Output: '12345'

-- Convert a date to a string in different formats
SELECT CONVERT(VARCHAR(10), GETDATE(), 101) AS DateString1; -- Output: '09/23/2024' (MM/DD/YYYY)
SELECT CONVERT(VARCHAR(10), GETDATE(), 103) AS DateString2; -- Output: '23/09/2024' (DD/MM/YYYY)

--Converting an Integer to a String
-- Using CAST
SELECT CAST(100 AS VARCHAR(5)) AS ConvertedValue;

-- Using CONVERT
SELECT CONVERT(VARCHAR(5), 100) AS ConvertedValue;


--Converting a Date to a String with Formatting
-- Using CAST (default format)
SELECT CAST(GETDATE() AS VARCHAR(30)) AS DateString;

-- Using CONVERT with different styles
SELECT CONVERT(VARCHAR(10), GETDATE(), 101) AS US_Format;  -- MM/DD/YYYY
SELECT CONVERT(VARCHAR(10), GETDATE(), 103) AS UK_Format;  -- DD/MM/YYYY


-- Converting a String to a Date
-- Using CAST (default behavior)
SELECT CAST('2024-09-23' AS DATETIME) AS ConvertedDate;

-- Using CONVERT with style for flexibility
SELECT CONVERT(DATETIME, '09/23/2024', 101) AS US_Style_Date; -- MM/DD/YYYY
SELECT CONVERT(DATETIME, '23/09/2024', 103) AS UK_Style_Date; -- DD/MM/YYYY

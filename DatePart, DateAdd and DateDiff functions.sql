--DATEPART Function The DATEPART function returns an integer representing the specified part (year, month, day, etc.) of a given date.
-- Extract the year, month, and day from a date
SELECT DATEPART(year, '2024-09-23') AS YearPart, -- Output: 2024
       DATEPART(month, '2024-09-23') AS MonthPart, -- Output: 9
       DATEPART(day, '2024-09-23') AS DayPart; -- Output: 23

--DATEADD Function The DATEADD function adds or subtracts a specified number of units (days, months, years, etc.) to/from a date.
-- Add 5 days, subtract 2 months, and add 1 year to the current date
SELECT DATEADD(day, 5, GETDATE()) AS AddDays, -- Adds 5 days
       DATEADD(month, -2, GETDATE()) AS SubtractMonths, -- Subtracts 2 months
       DATEADD(year, 1, GETDATE()) AS AddYear; -- Adds 1 year

--DATEDIFF Function The DATEDIFF function returns the difference between two dates in terms of the specified date part (years, months, days, etc.).
-- Calculate the difference in days, months, and years between two dates
SELECT DATEDIFF(day, '2024-09-01', '2024-09-23') AS DayDifference, -- Output: 22
       DATEDIFF(month, '2023-09-01', '2024-09-01') AS MonthDifference, -- Output: 12
       DATEDIFF(year, '2020-01-01', '2024-01-01') AS YearDifference; -- Output: 4


-- Assume we have an event happening on '2024-09-23', and we want to find out:
-- 1. How many days have passed since '2024-09-01'.
-- 2. Add 3 months to that event date.
-- 3. Extract the year and month from the new date.

DECLARE @EventDate DATE = '2024-09-23';

-- 1. Calculate days passed between two dates
SELECT DATEDIFF(day, '2024-09-01', @EventDate) AS DaysPassed;

-- 2. Add 3 months to the event date
SELECT DATEADD(month, 3, @EventDate) AS NewDate;

-- 3. Extract the year and month from the new date
SELECT DATEPART(year, DATEADD(month, 3, @EventDate)) AS YearPart,
       DATEPART(month, DATEADD(month, 3, @EventDate)) AS MonthPart;

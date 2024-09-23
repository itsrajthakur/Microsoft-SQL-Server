--ISDATE Function The ISDATE function is used to check if a given expression is a valid date or time.

SELECT ISDATE('2024-09-23');  -- Output: 1 (Valid date)
SELECT ISDATE('2024-13-23');  -- Output: 0 (Invalid date)
SELECT ISDATE('abc');         -- Output: 0 (Not a date)

--DAY Function The DAY function extracts the day of the month from a date value.
SELECT DAY('2024-09-23'); -- Output: 23
SELECT DAY(GETDATE());    -- Output: Current day (e.g., 23)

--MONTH Function The MONTH function extracts the month from a date value.
SELECT MONTH('2024-09-23'); -- Output: 9
SELECT MONTH(GETDATE());    -- Output: Current month (e.g., 9 for September)

--YEAR Function The YEAR function extracts the year from a date value.
SELECT YEAR('2024-09-23'); -- Output: 2024
SELECT YEAR(GETDATE());    -- Output: Current year (e.g., 2024)

--DATENAME Function The DATENAME function returns the name of the specified part of a date, such as the day of the week, month, or year.
SELECT DATENAME(month, '2024-09-23');  -- Output: 'September'
SELECT DATENAME(weekday, '2024-09-23'); -- Output: 'Monday'

-- Get the current day, month, and year
SELECT DAY(GETDATE()) AS CurrentDay,
       MONTH(GETDATE()) AS CurrentMonth,
       YEAR(GETDATE()) AS CurrentYear;

-- Check if a string is a valid date, and then extract the day, month, and year if valid
SELECT 
  CASE WHEN ISDATE('2024-09-23') = 1 
       THEN DAY('2024-09-23') 
       ELSE NULL 
  END AS DayPart,
  CASE WHEN ISDATE('2024-09-23') = 1 
       THEN MONTH('2024-09-23') 
       ELSE NULL 
  END AS MonthPart,
  CASE WHEN ISDATE('2024-09-23') = 1 
       THEN YEAR('2024-09-23') 
       ELSE NULL 
  END AS YearPart;

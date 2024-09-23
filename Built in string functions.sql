--LEN – Returns the length of a string
SELECT LEN('SQL Server'); -- Output: 10

--LEFT – Returns the left part of a string
SELECT LEFT('SQL Server', 3); -- Output: 'SQL'

--RIGHT – Returns the right part of a string
SELECT RIGHT('SQL Server', 6); -- Output: 'Server'

--CHARINDEX – Finds the position of a substring
SELECT CHARINDEX('Server', 'SQL Server'); -- Output: 5

--SUBSTRING – Extracts a portion of a string
SELECT SUBSTRING('SQL Server', 5, 6); -- Output: 'Server'

--UPPER – Converts a string to uppercase
SELECT UPPER('sql server'); -- Output: 'SQL SERVER'

--LOWER – Converts a string to lowercase
SELECT LOWER('SQL SERVER'); -- Output: 'sql server'

--LTRIM – Removes leading spaces from a string
SELECT LTRIM('   SQL Server'); -- Output: 'SQL Server'

--RTRIM – Removes trailing spaces from a string
SELECT RTRIM('SQL Server   '); -- Output: 'SQL Server'

--REPLACE – Replaces occurrences of a substring
SELECT REPLACE('SQL Server 2019', '2019', '2022'); -- Output: 'SQL Server 2022'

--REPLICATE – Repeats a string a specified number of times
SELECT REPLICATE('*', 5); -- Output: '*****'

--PATINDEX – Returns the starting position of a pattern in a
PATINDEX('%pattern%', string_expression)

--SPACE – Inserts a specified number of spaces
SELECT 'SQL' + SPACE(3) + 'Server'; -- Output: 'SQL   Server'

--STUFF – Deletes a part of a string and inserts another string
SELECT STUFF('SQL Server 2019', 11, 4, '2022'); -- Output: 'SQL Server 2022'

--FORMAT – Formats a string based on the specified format
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy', 'en-US'); -- Output: '23/09/2024'

--CONCAT – Concatenates strings
SELECT CONCAT('SQL', ' ', 'Server'); -- Output: 'SQL Server'

--STRING_AGG – Concatenates strings with a separator
SELECT STRING_AGG(Name, ', ') AS EmployeeNames FROM Employees;-- Output: 'John, Jane, Michael, Sara'

--ASCII – Returns the ASCII code of the first character of a
SELECT ASCII('A'); -- Output: 65

--CHAR – Converts an ASCII code to a character
SELECT CHAR(65); -- Output: 'A'

--REVERSE – Reverses a string
SELECT REVERSE('SQL Server'); -- Output: 'reverS LQS'

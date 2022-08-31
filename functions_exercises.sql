use employees;

-- Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.
SELECT CONCAT(first_name, ' ' , last_name) AS Employees
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
ORDER BY emp_no;

SELECT CONCAT(first_name, ' ' , last_name) AS Employees
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
ORDER BY emp_no DESC;

-- Find all employees born on Christmas [842 rows]
SELECT CONCAT(first_name, ' ' , last_name) AS Christmas_Employees
FROM employees
WHERE MONTH(birth_date) = 12
    AND DAY(birth_date) = 25;

-- Find all employees hired in the 90s and born on Christmas [362 rows]
SELECT CONCAT(first_name, ' ' , last_name) AS 90s_Christmas_Employees
FROM employees
WHERE (MONTH(birth_date) = 12
    AND DAY(birth_date) = 25)
    AND YEAR(hire_date) BETWEEN 1990 AND 1999;

-- Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. [Khun Bernini]
SELECT CONCAT(first_name, ' ' , last_name) AS 90s_Christmas_Employees
FROM employees
WHERE (MONTH(birth_date) = 12
    AND DAY(birth_date) = 25)
    AND YEAR(hire_date) BETWEEN 1990 AND 1999
ORDER BY birth_date, hire_date DESC;

-- For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company [Hint: You might also need to use now() or curdate()]
SELECT CONCAT(first_name, ' ' , last_name) AS 90s_Christmas_Employees,
       DATEDIFF(CURDATE(), hire_date) AS Tenure
FROM employees
WHERE (MONTH(birth_date) = 12
    AND DAY(birth_date) = 25)
  AND YEAR(hire_date) BETWEEN 1990 AND 1999;
use employees;

-- In your script, use DISTINCT to find the unique titles in the titles table
SELECT DISTINCT title AS Job_Titles
FROM titles;

-- Find your query for employees whose last names start and end with 'E'. Update the query to find just the unique last names that start and end with 'E' using GROUP BY
SELECT last_name AS E
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%E'
GROUP BY last_name;

-- Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E' [846 rows]
SELECT first_name,last_name AS E
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
GROUP BY first_name,last_name;

-- Find the unique last names with a 'q' but not 'qu'
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND NOT last_name LIKE '%qu%'
GROUP BY last_name;


-- Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others
SELECT COUNT(*) AS count ,last_name
FROM employees
WHERE last_name LIKE '%q%'
  AND NOT last_name LIKE '%qu%'
GROUP BY last_name
ORDER BY COUNT(*);

-- Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*) and GROUP BY to find the number of employees for each gender with those names
SELECT gender , COUNT(*) AS name_count
FROM employees
WHERE (first_name = 'Irena' || first_name = 'Vidya' || first_name =  'Maya')
GROUP BY gender;
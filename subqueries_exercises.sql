USE employees;

-- Find all the employees with the same hire date as employee 101010 using a subquery [69 Rows]
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name FROM employees
WHERE e.hire_date IN
    (SELECT e.hire_date
    FROM employees e
    WHERE e.emp_no = 101010);

-- Find all the titles held by all employees with the first name Aamod
-- [314 total titles, 6 unique titles]

SELECT t.title, COUNT(emp_no) AS employees
FROM titles t
WHERE t.emp_no IN
  (SELECT emp_no
    FROM employees e
    WHERE e.first_name = 'Aamod')
GROUP BY title;

-- Find all the current department managers that are female
SELECT e.first_name AS First_name, e.last_name AS Last_name
FROM employees
WHERE e.gender = 'F' AND e.emp_no IN
    (SELECT dm.emp_no
    FROM dept_manager dm
    WHERE to_date = '9999-01-01');

-- Find all the department names that currently have female managers
SELECT dept_name
FROM departments
WHERE dept_no IN
    (SELECT dm.dept_no
    FROM dept_manager dm
    WHERE YEAR(dm.to_date) = 9999 AND emp_no IN
(SELECT emp_no
FROM employees e
WHERE e.gender = 'F');

-- Find the first and last name of the employee with the highest salary
SELECT e.first_name AS first_name, e.last_name AS last_name
FROM employees e
WHERE emp_no IN
    (SELECT emp_no
    FROM salaries
    WHERE salary IN
      (SELECT MAX(salary)
        FROM salaries));


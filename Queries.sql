-- Queries 

SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

--#1

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
FROM employees 
JOIN salaries ON employees.emp_no=salaries.emp_no;

--#2

SELECT
	first_name, last_name, hire_date
FROM employees WHERE employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--#3

SELECT
	departments.dept_no, 
	departments.dept_name, 
	dept_manager.emp_no, 
	employees.last_name, 
	employees.first_name, 
	dept_manager.from_date, 
	dept_manager.to_date
FROM departments
JOIN dept_manager ON departments.dept_no=dept_manager.dept_no
JOIN employees ON dept_manager.emp_no=employees.emp_no;

--#4

SELECT
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no=employees.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no;

--#5

SELECT
	employees.first_name,
	employees.last_name
FROM employees 
WHERE employees.first_name LIKE 'Hercules' and employees.last_name LIKE 'B%'

--#6

SELECT 
	departments.dept_name, 
	dept_emp.emp_no,
	employees.first_name, 
	employees.last_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no=employees.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name LIKE 'Sales';

--#7

SELECT 
	departments.dept_name, 
	dept_emp.emp_no,
	employees.first_name, 
	employees.last_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no=employees.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name LIKE 'Sales' OR departments.dept_name LIKE 'Development';

--#8

SELECT last_name,
COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY 
COUNT(last_name) DESC;
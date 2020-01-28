---Data Analysis (PART 3):

--Import Tables:
SELECT * from employees;
SELECT * from departments;
SELECT * from department_employees;
SELECT * from department_manager;
SELECT * from salaries;
SELECT * from titles;

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender,salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

--2. List employees who were hired in 1986.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT department_manager.dept_no,departments.dept_name,department_manager.emp_no,employees.last_name,employees.first_name,department_manager.from_date,department_manager.to_date
FROM department_manager
INNER JOIN departments ON department_manager.dept_no = departments.dept_no
INNER JOIN Employees ON department_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN department_manager ON employees.emp_no = department_manager.emp_no
INNER JOIN departments ON department_manager.dept_no = departments.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'; 

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON employees.emp_no = department_employees.emp_no
INNER JOIN departments ON department_employees.dept_no = departments.dept_no 
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON employees.emp_no = department_employees.emp_no
INNER JOIN departments ON department_employees.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
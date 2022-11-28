--Data Analysis
--1. List the employee number, last name, first name, sex, and salary of each employee 

SELECT employees.emp_no AS Employee_Number, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT departments.dept_no AS department_number, departments.dept_name,employees.emp_no As employee_number, employees.last_name, 
	employees.first_name
FROM employees
	JOIN dept_manager
	ON employees.emp_no=dept_manager.emp_no
		JOIN departments
		ON departments.dept_no=dept_manager.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no As employee_number, employees.last_name, employees.first_name, departments.dept_name As department_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no as employee_number, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON (e.emp_no=de.emp_no)
		JOIN departments as d
		ON (de.dept_no=d.dept_no)
		WHERE d.dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no AS employee_number, employees.last_name, employees.first_name, departments.dept_name 
FROM employees
	JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
		JOIN departments
		ON (departments.dept_no = dept_emp.dept_no)
		WHERE departments.dept_name='Sales' OR departments.dept_name='Development';
		
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "frequency counts"
FROM employees
GROUP BY last_name
ORDER BY "frequency counts" DESC;
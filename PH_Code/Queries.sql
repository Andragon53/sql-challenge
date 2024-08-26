-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal ON
emp.emp_no = sal.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT mngr.dept_no, departments.dept_name, mngr.emp_no, employees.last_name, employees.first_name
FROM departmentmanager AS mngr
INNER JOIN departments ON mngr.dept_no = departments.dept_no
INNER JOIN employees ON mngr.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dep.dept_no, emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp
INNER JOIN employeedepartments AS junction ON emp.emp_no = junction.emp_no
INNER JOIN departments AS dep ON junction.dept_no = dep.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT dep.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
INNER JOIN employeedepartments AS junction ON emp.emp_no = junction.emp_no
INNER JOIN departments AS dep ON junction.dept_no = dep.dept_no
WHERE dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp
INNER JOIN employeedepartments AS junction ON emp.emp_no = junction.emp_no
INNER JOIN departments AS dep ON junction.dept_no = dep.dept_no
WHERE dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "employee_count"
FROM employees
GROUP BY last_name
ORDER BY "employee_count" DESC;

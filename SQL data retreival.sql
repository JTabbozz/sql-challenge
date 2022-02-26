--Data Analysis

/* Once you have a complete database, do the following:
	
	List the following details of each employee: employee number, last name, first name, sex, and salary.
*/

Show datestyle;

SELECT employee.emp_noid, employee.last_name, employee.first_name, employee.sex, salaries.salary
FROM employee
JOIN salaries
ON employee.emp_noid = salaries.emp_no_id;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employee
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT department.dept_noid, department.dept_name, dept_manager.emp_no_id, employee.last_name, employee.first_name
FROM department
JOIN dept_manager
ON department.dept_noid = dept_manager.dept_no_id
JOIN employee
ON dept_manager.emp_no_id = employee.emp_noid;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no_id, employee.last_name, employee.first_name, department.dept_name
FROM dept_emp
JOIN employee
ON dept_emp.emp_no_id = employee.emp_noid
JOIN department
ON dept_emp.dep_no_id = department.dept_noid;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employee.first_name, employee.last_name, employee.sex
FROM employee
WHERE first_name = 'Hercules'
AND last_name Like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT department.dept_name, employee.last_name, employee.first_name
FROM dept_emp
JOIN employee
ON dept_emp.emp_no_id = employee.emp_noid
JOIN department
ON dept_emp.dep_no_id = department.dept_noid
WHERE department.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employee.emp_noid, employee.last_name, employee.first_name, department.dept_name 
FROM dept_emp
JOIN employee
ON dept_emp.emp_no_id = employee.emp_noid
JOIN department
ON dept_emp.dep_no_id = department.dept_noid
WHERE department.dept_name = 'Sales' 
OR department.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employee
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

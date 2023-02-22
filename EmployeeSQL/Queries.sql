-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, 
	"Salaries".salary
FROM "Employees"
JOIN "Salaries"
	ON "Employees".emp_no = "Salaries".emp_no
;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees" 
	WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'
	ORDER BY hire_date
;

-- List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
SELECT "Dept_manager".dept_no, "Departments".dept_name, "Dept_manager".emp_no, 
	"Employees".last_name, "Employees".first_name
FROM "Dept_manager"
JOIN "Departments"
	ON "Dept_manager".dept_no = "Departments".dept_no
JOIN "Employees"
	ON "Dept_manager".emp_no = "Employees".emp_no
;

-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT "Dept_emp".dept_no, "Dept_emp".emp_no, "Employees".last_name, "Employees".first_name,
	"Departments".dept_name
FROM "Dept_emp"
JOIN "Employees"
	ON "Dept_emp".emp_no = "Employees".emp_no
JOIN "Departments"
	ON "Dept_emp".dept_no = "Departments".dept_no
ORDER BY emp_no
;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose 
-- last name begins with the letter B.
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND LEFT(last_name, 1) = 'B'
;

-- List each employee in the Sales department, including their employee number, last name, 
-- and first name.
SELECT "Dept_emp".emp_no, "Employees".last_name, "Employees".first_name 
FROM "Dept_emp"
INNER JOIN "Employees"
	ON "Employees".emp_no = "Dept_emp".emp_no
WHERE "Dept_emp".dept_no = 'd007'
;

-- List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
INNER JOIN "Dept_emp"
	ON "Dept_emp".emp_no = "Employees".emp_no
	JOIN  "Departments"
		ON "Departments".dept_no = "Dept_emp".dept_no
WHERE "Dept_emp".dept_no = 'd005' OR "Dept_emp".dept_no = 'd007'		
;

-- List the frequency counts, in descending order, of all the employee last names (that is, how 
-- many employees share each last name).
SELECT last_name, COUNT(*) AS count
FROM "Employees"
GROUP BY last_name
ORDER BY count DESC
;

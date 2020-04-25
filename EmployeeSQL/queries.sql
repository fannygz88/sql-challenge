/*List the following details of each employee: 
	employee number, last name, first name, gender, and salary.*/
	
select emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
from employees as emp 
join salaries as sal
	on emp.emp_no = sal.emp_no;

/* List employees who were hired in 1986.*/

select * 
from employees
where extract(year from hire_date) = 1986;

/*List the manager of each department with the following information:
	department number, department name, the manager's employee number, 
	last name, first name, and start and end employment dates.*/

select dm.dept_no, d.dept_name,dm.emp_no, e.first_name, e.last_name,
		dm.from_date,dm.to_date
from dept_manager as dm
join departments as d
	on dm.dept_no = d.dept_no
join employees as e
	on dm.emp_no = e.emp_no;
	

/*List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/
select e.emp_no, e.last_name , e.first_name, d.dept_name
from employees as e
join dept_emp as de
	on e.emp_no = de.emp_no
join departments as d
	on d.dept_no = de.dept_no;

/*List all employees whose first name is "Hercules" 
and last names begin with "B."*/

select * 
from employees
where first_name = 'Hercules'
and last_name LIKE 'B%';

/*List all employees in the Sales department, 
including their employee number, last name, first name,and 
department name.*/

select e.emp_no, e.last_name , e.first_name, d.dept_name
from employees as e
join dept_emp as de
	on e.emp_no = de.emp_no
join departments as d
	on d.dept_no = de.dept_no
where d.dept_name = 'Sales';


/*List all employees in the Sales and Development departments, 
including their employee number, last name, first name, 
and department name.*/
select e.emp_no, e.last_name , e.first_name, d.dept_name
from employees as e
join dept_emp as de
	on e.emp_no = de.emp_no
join departments as d
	on d.dept_no = de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

/*In descending order, 
list the frequency count of employee last names, 
i.e., how many employees share each last name.*/

select last_name, count(last_name) as "Count"
from employees
group by last_name
order by "Count" DESC;
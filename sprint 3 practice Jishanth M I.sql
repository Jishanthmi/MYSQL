USE hr;

-- Task1 List the IDs, first names, and last names of the employees working in the IT department

select departments.department_name, employees.employee_id, employees.manager_id, employees.department_id, employees.first_name, employees.last_name from employees 
join departments on employees.department_id=departments.department_id where departments.department_name= 'IT';

-- Task2 Extract the minimum and maximum salaries for each department

select departments.department_name, min(employees.salary), max(employees.salary) from employees
join departments on employees.department_id=departments.department_id group by departments.department_name;

-- Task3 Identify the top 10 cities that have the highest number of employees

create view employees_departments_info as select departments.location_id, employees.employee_id, employees.first_name, employees.last_name from employees
join departments on employees.department_id=departments.department_id;
select locations.city, count(employees_departments_info.employee_id) from employees_departments_info join locations on employees_departments_info.location_id=locations.location_id
group by locations.city order by count(employees_departments_info.employee_id) desc;

-- Task4 List the employee IDs, first names, and last names of all those employees whose last working day in the organization was 1999-12-31

select employees.employee_id, employees.first_name, employees.last_name from employees 
join job_history on employees.employee_id=job_history.employee_id where end_date= '1999-12-31';

-- Task5 Extract the employee IDs, first names, department names, and total experience of all those employees who have completed at least 25 years in the organization

select departments.department_name, employees.employee_id, employees.first_name, employees.last_name, (year(job_history.end_date)- year(job_history.start_date)) as totel_experience 
from employees join departments on employees.department_id=departments.department_id join job_history on employees.department_id=job_history.department_id  
order by totel_experience >25;
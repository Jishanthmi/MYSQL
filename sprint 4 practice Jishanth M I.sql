use hr;
select * from employees;
select * from job_history;
select * from jobs;
select * from countries;
select * from locations;

-- Task1 Display the employee ID, first names, last names, and department names of all employees using subquery

select employee_id,first_name,last_name, (select department_name from departments 
where departments.department_id=employees.department_id) as department_name from employees;

-- Task2 Display the first names, last names, and salaries of the employees whose salaries are greater than the average salary of all employees, grouped by the department IDs.

select first_name, last_name, salary from employees where salary> all(select avg(salary) from employees group by department_id);

-- Task3 Display the first names and last names of those employees of the sales department who have a salary less than the average salary of all employees of the sales department

select first_name, last_name from employees where salary< (select avg(salary) from employees 
where department_id in (select department_id from departments  where department_name= 'sales'));

 -- Task4 Display the first names, last names, and salaries of the employees who have a salary higher then the salaries of all IT programmers Display the details of the employees in the ascending order of salary, using subqueries

select first_name, last_name, salary from employees where salary> any (select salary from employees  where job_id = 'IT_PROG')
order by salary asc;

-- Task5 Display the records of the employee(s) with the minimum salary in the employees table, grouped by the job_id column and arranged in ascending order of salaries

select * from employees where salary in (select min(salary) from employees group by job_id) order by salary asc;

-- Task6 Display the first names, last names, and department IDs of the employees whose salory is greater than 60% of the sum of the salaries of all employees of their respective departments

select first_name, last_name, department_id from employees where salary >0.6* 
(select sum(salary) from employees as employees1 where employees1.department_id=employees.department_id);

-- Task7 Display the first names and last names of all those employees who have their managers bosed out of UK, using subquery

select first_name, last_name from employees where manager_id in (select employee_id from employees as employees2
join departments on employees2.department_id=departments.department_id join locations on departments.location_id=locations.location_id
where locations.country_id = 'UK');

-- Task8 Display the first names, last names, and salaries of the top 5 highest-paid employees and export the output as a CSV file Use data export technique.

select first_name, last_name, salary from employees order by salary desc limit 5;
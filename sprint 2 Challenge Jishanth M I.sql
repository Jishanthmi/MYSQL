USE hr;
select * from employees;
select * from departments;

-- Task1 Find the count of all the employees in the organization

select count(*) as employee_id from employees;

-- Task2 Find the department ID-wise count of employees in the organization

select department_name, count(*) as employee_id from departments group by department_name;

-- task3 Find the first names, last names, and salaries of those employees whose salary is greater than $6,000.

select first_name, last_name, salary from employees where salary>6000;

-- task4 Determine the count of employees who are earning a salary greater than $20,000.

select count(*) as employee_id from employees where salary>20000;

-- task5 List the details of those employees who get a commission, to decide the percentage of bonus they should receive

select * from employees where commission_pct is not null;

-- task6 The HR department wants to send an invite to all the employees who get a commission. The invites will address the employees with their full names. How will you extract the full names of these employees?

select concat(first_name,'  ', last_name) from employees where commission_pct is not null;

-- Task7 Fetch the following details of employees who get a commission: Employee ID, Employee Name, Email ID, Phone Number.

select employee_id, concat(first_name,'  ', last_name), email, phone_number from employees where commission_pct is not null;

-- Task8 Identify the top three department IDs that have the highest total salary of employees.

select department_id, salary from employees order by salary desc limit 3;

-- Task9 List the details of employees from the IT department. (All the columns of the employee table must be displayed.)

select * from employees join departments on departments.department_id=employees.department_id  where departments.department_name= 'IT';

-- Task10 Find the count of all the employees in the IT department and their average salary.

select count(employee_id), avg(salary) from employees join departments on departments.department_id=employees.department_id 
where departments.department_name= 'IT';

-- Task11 Identify the department IDs and the number of employees for the departments in which employee salaries range from $7,000 to $10,000. The output should contain the following columns

select department_id, count(employee_id) from employees where salary between 7000 and 10000 group by department_id;





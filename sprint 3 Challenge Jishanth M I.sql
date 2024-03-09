use hr;

-- Task1 Identify the top five cities that have the maximum number of employees.

select locations.city, count(employees.employee_id) from employees join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id  group by locations.city order by  count(employees.employee_id) desc limit 5;

-- Task2 List the first names, last names, countries, cities, departments, and salaries of the employees from the top five cities Identified in Task 1

select employees.first_name, employees.last_name, countries.country_name, locations.city, departments.department_name from employees 
join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id join countries on locations.country_id=countries.country_id
where locations.city in('South San Francisco','Oxford','Seattle','Southlake','Toronto');

-- Task3 List the cities in which the number of employees is less than 10

select locations.city, count(employees.employee_id) from employees join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id group by locations.city having count(employees.employee_id)<10;

-- Task4 Find the average experience (in years) of the employees of each city identified in Task 3.

select locations.city, avg(year(employees.hire_date)) ,count(employees.employee_id) from employees join departments on employees.department_id=departments.department_id 
join locations on departments.location_id=locations.location_id group by locations.city having count(employees.employee_id)<10;

/* Task5 The company wants to communicate the work from home policy to those employees who are from the cities identified in Task 1 and have also completed 10 years in the organization
Find the below mentioned details of such employees:
First name
Last name 
Email
Phone number*/

select employees.first_name, employees.last_name, employees.email,employees.phone_number, (year(current_date())-year(employees.hire_date)) from employees
join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id 
where locations.city in('South San Francisco','Oxford','Seattle','Southlake','Toronto') order by (year(current_date())-year(employees.hire_date))>10;

-- Task6 List the IDs of the managers of the employees identified in Task 5.

select departments.manager_id,employees.last_name, employees.email,employees.phone_number,(year(current_date())-year(employees.hire_date))  from employees
join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id 
where locations.city in('South San Francisco','Oxford','Seattle','Southlake','Toronto') order by (year(current_date())-year(employees.hire_date))>10;

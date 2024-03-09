-- Task 1 Create a database to store employees' records and name it techmac_db. Use the techmac_db database to store database objects such as tables.
create database techmac_db;
use techmac_db;

/* Task 2 Create three tables to store the details of the employees of the three start-ups. Name the tables as techhyve employees, techcloud_employees, and techsoft employees. Each table must be designed to store employee ID, first name, last name, gender, and age.
 1. Each record should be identified uniquely. So, alter the Employee ID column with the primary key constraint
 2. The age of the employees should be between 21 and 55. So, alter the Age column structure with the check constraint.*/
 
create table techhyve_employees(
employee_id char(100),
first_name char(100), 
last_name char(100), 
gender char(100), 
age int);
create table techcloud_employees(
employee_id char(100),
first_name char(100), 
last_name char(100), 
gender char(100), 
age int);
create table techsoft_employees(
employee_id char(100), 
first_name char(100), 
last_name char(100),
gender char(100), 
age int);

alter table techhyve_employees modify column employee_id char(100) primary key;
alter table techcloud_employees modify column employee_id char(100) primary key;
alter table techsoft_employees modify column employee_id char(100) primary key;

alter table techhyve_employees modify column age int check(21<age<55);
alter table techcloud_employees modify column age int check(21<age<55);
alter table techsoft_employees modify column age int check(21<age<55);

/*Task 3 The organization has suggested to store the communication proficiency level of employees, ranging from 1 to 5. Alter the three tables and add a new column,Communication_Proficieny.
Alter the Communication_Proficiency column with the check constraint and set the default value of this column as 1.*/

alter table techhyve_employees add column communication_proficience int check (1<communication_proficience<5);
alter table techcloud_employees add column communication_proficience int check (1<communication_proficience<5);
alter table techsoft_employees add column communication_proficience int check (1<communication_proficience<5);


-- Task 4 Insert the employee data in the three tables, techhyve employees, techcloud_employees, and techsoft_employees by using the INSERT INTO command.

insert into techhyve_employees values
("TH0001","Eli","Evans","Male",26,1),
("TH0002","Carlos","Simmons","Male",32,  2),
("TH0003","Kathie","Bryant","Female",25,1),
("TH0004","Joey","Hughes","Male",41,4),
("TH0005","Alice","Matthews","Female",52,4);

insert into techcloud_employees values
("TH0001","Eli","Evans","Male",26,1),
("TH0002","Carlos","Simmons","Male",32,  2),
("TH0003","Kathie","Bryant","Female",25,1),
("TH0004","Joey","Hughes","Male",41,4),
("TH0005","Alice","Matthews","Female",52,4);

insert into techsoft_employees values
("TH0001","Eli","Evans","Male",26,1),
("TH0002","Carlos","Simmons","Male",32,  2),
("TH0003","Kathie","Bryant","Female",25,1),
("TH0004","Joey","Hughes","Male",41,4),
("TH0005","Alice","Matthews","Female",52,4);

-- Task 5 Back up the three tables, techhyve_employees, techcloud_employees, and techsoft_employees, and name them as techhyve_employees_bkp, techcloud_employees bkp, and techsoft employees bkp, respectively.

create table techhyve_employees_backup select * from techhyve_employees;
create table techcloud_employees_backup select * from techcloud_employees;
create table techsoft_employees_backup select * from techsoft_employees;
create database backup_techmac_db;
use backup_techmac_db;
create table techhyve_employees_backup select * from techmac_db.techhyve_employees;
create table techcloud_employees_backup select * from techmac_db.techcloud_employees;
create table techsoft_employees_backup select * from techmac_db.techsoft_employees;

-- Task 6 The employees with the following employee IDs from TechHyve and TechCloud have resigned THO003, THO005, TC0001, and TC0004. Delete the data of these employees from the original table and retain it in the backup database.
use techmac_db;
delete from techhyve_employees where employee_id in ("TH0001","TH0002","TH0003","TH0004","TH0005");
delete from techcloud_employees where employee_id in ("TH0001","TH0002","TH0003","TH0004","TH0005");
delete from techsoft_employees where employee_id in ("TH0001","TH0002","TH0003","TH0004","TH0005");


-- Task 7 The organization has decided to merge TechHyve and TechCloud. Merge the data of these two start-ups in a new table called techhyvecloud_employees. Then, delete the records from the tables techhyve employees and techcloud_employees and retain them in the backup database.

insert into techhyve_employees (employee_id, First_name, Last_name, Gender, Age,Communication_Proficience)
select employee_id, First_name, Last_name, gender, Age, Communication_Proficience from techcloud_employees;

truncate table techcloud_employees;
alter table techhyve_employees rename to techhyvecloud_employees;
create table techhyve_employees(employee_id char(100) primary key,first_name char(100), last_name char(100), gender char(100), age int);
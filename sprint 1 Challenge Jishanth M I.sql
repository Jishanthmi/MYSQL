-- task 1 Create a database to store and manage sales records. Name the database as stylexcarz_db and use it to store database objects. such as tables.

create database stylexcarz_db;
use stylexcarz_db;
-- task 2 Create three tables to store the details of salespersons, customers, and orders of car sales. Name these tables as salesperson,customers, and orders, respectively.

create table salesperson (salesperson_id int primary key, sealsperson_name char(100), salesperson_city char(100), commission_rate int);
create table customer (customer_id int primary key, customer_firstname char(100), customer_lastname char(100), customer_city char(100), customer_rating int);
create table orders (order_id int primary key, amount int, order_date date, salesperson_id int, customer_id int);

-- task 3 Insert the data in the salespersons, customers, and orders tables by using the car sales data downloaded earlier

insert into salesperson values (1001,	'William',	'New York',	12),
(1002,	'Liam',	'New Jersey',	13),
(1003,	'Axelrod',	'San Jose',	10),
(1004,	'James',	'San Diego',	11),
(1005,	'Fran',	'Austin',	26),
(1007,	'Oliver',	'New York',	15),
(1008,	'John',	'Atlanta',	2),
(1009,	'Charles',	'New Jersey',	2);

insert into customer values (2001,	'Hoffman',	'Anny',	'New York',	1),
(2002,	'Giovanni',	'Jenny',	'New Jersey',	2),
(2003,	'Liu',	'Williams',	'San Jose',	3),
(2004,	'Grass',	'Harry',	'San Diego',	3),
(2005,	'Clemens',	'John',	'Austin',	4),
(2006,	'Cisneros',	'Fanny',	'New York',	4),
(2007,	'Pereira',	'Jonathan',	'Atlanta',	3);

insert into orders values (3001, 23, '2021-02-21', 1009, 2007),
  (3002, 20, '2021-02-23', 1007, 2007),
  (3003, 89, '2021-03-06', 1002, 2002),
  (3004, 67, '2021-04-02', 1004, 2002),
  (3005, 30, '2021-07-30', 1001, 2007),
  (3006, 35, '2021-09-30', 1001, 2004),
  (3007, 19, '2021-10-02', 1001, 2001),
  (3008, 21, '2021-10-09', 1003, 2003),
  (3009, 45, '2021-10-10', 1009, 2005);

-- task 4 The company's salespersons need to meet their targets to get their commission. To motivate their sales staff, the company wants to increase the commission to 15% for all those whose commission is below 15%.
  
select * from salesperson where commission_rate<15;
update salesperson set commission_rate=15 where commission_rate<15;
select * from salesperson where commission_rate>=15;
 
 -- task 5 To prevent any loss of data, create a backup of the orders table and name it as orders_bkp.
 
create table orders_backup select * from orders;
create database backup_orders_db;
use backup_orders_db;
create table orders_backup select * from stylexcarz_db.orders;

-- task 6 The company has a practice of rating its customers. This rating would help the customers to obtain discounts during the car service. Increase the rating by three points of those customers who haveplaced an order more than once.

use stylexcarz_db;
update customer set customer_rating = customer_rating + 3
where customer_id in (
select customer_id from orders
group by customer_id
having count(order_id) > 1);

  
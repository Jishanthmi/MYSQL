use sakila;
select * from customer;
select * from film;
select * from film_category;
select * from category;

-- Task1 Extract the data of customers who are inactive

select * from customer where active=0;

-- Task2 Identify the first name, last name, and emails of inactive customers

select first_name, last_name, email, active from customer where active=0;

-- Task3 Identify the store_id having the highest number of inactive customers

select store_id, active from customer where active=0 order by store_id desc limit 1;

-- Task4 Identify the names of movies that are rated as PG- 13

select title as movies, rating from film where rating= 'PG-13';

-- Task5 Identify the top three movies with PG-13 rating that have the longest running time

select title as movies, rating, length from film where rating= 'PG-13' order by length desc limit 3;

-- Task6 Find the most popular PG-13 movies based on rental duration

select title as movies, rating, rental_duration from film where rating= 'PG-13' order by rental_duration desc;

-- Task7 Find the average rental cost of the movies

select avg(rental_rate) from film;

-- Task8 Find the total replacement cost of all movies

select sum(replacement_cost) from film;

-- TAsk9 identify the number of films from the following categones: Animation, Children

select category_id, name from category where name in ('Animation', 'children');
select count(*) as Animation from film_category where category_id= 3;
select count(*) as children from film_category where category_id= 4;


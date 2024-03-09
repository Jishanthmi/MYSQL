use sakila;
select * from film;
select * from actor;
select * from category;

-- Task1 The Sakila rental store management wants to know the names of all the actors in their movie collection.
--         Display the first names, last names, actor IDs, and the details of the last updated column.

select actor_id,first_name,last_name,last_update from actor;

-- Task2 Many actors have adopted attractive screen names, mostly at the behest of producers and directors. The management wants to know the followinga 
--       a.Display the full names of all actors. 
--       b. Display the first names of actors along with the count of repeated first names.
--       C.Display the last name of actors along with the count of repeated last names

select concat(first_name,'  ',last_name) from actor;
select first_name, count(*) from actor group by first_name;
select last_name, count(*) from actor group by last_name;

-- Task3 Display the count of movies grouped by the ratings.

select rating, count(film_id) as count_of_movies from film group by rating;

-- Task4 Calculate and display the average rental rates based on the movie ratings

select rating, avg(rental_rate) as average_rentel_rate from film group by rating;

-- Task5 The management wants the data about replacement cost of movies. Replacement cost is the amount of money required to replace an existing asset (DVD/blue ray disc) with an equally valued or similar asset at the current market price.
--       A.Display the movie titles where the replacement cost is up to $9.
--       B.Display the movie titles where the replacement cost is between $15 and $20 
--       c.Display the movie titles with the highest replacement cost and the lowest rental cost

select title from film where replacement_cost <=9;
select title from film where replacement_cost between 15 and 20;
select title from film where replacement_cost in (select max(replacement_cost)from film) or rental_rate in (select min(rental_rate) from film);

-- Task6 The management needs to know the list all the movies along with the number of actors sted for each movie

select film.film_id as movies, count(actor.actor_id) from film join film_actor on film.film_id=film_actor.film_id
join actor on film_actor.actor_id=actor.actor_id group by film.film_id;

-- Task7 Display the movie tites starting with the letters K and "Q

select title from film where title like 'k%' or title like 'q%' ;

-- Task8 The movie 'AGENT TRUMAN' has been a great success. Display the first names and last names of all actors who are a part of this movie.

select first_name,last_name from actor join film_actor on actor.actor_id=film_actor.actor_id
join film on film_actor.film_id=film.film_id where title = 'AGENT TRUMAN' ;

-- Task9 Sales has been down among the family audience with kids. The management wants to promote the movies that fall under the children category. 
--       Identify and display the names of the movies in the family category

select film.title, category.name from film join film_category on film.film_id=film_category.film_id 
join category on film_category.category_id=category.category_id where category.name= 'children';

-- Task10 Display the names of the most frequently rented moves in descending order, so that the management can maintain more copies of such movies

select title, count(rental_id) from film join inventory on film.film_id=inventory.film_id
join rental on inventory.inventory_id=rental.inventory_id group by title order by count(rental_id) desc;

-- Task11 Calculate and display the number of movie categories where the average difference between the movie replacement cost and the rental rate is greater than $15.

select name,count(title) as movie_count, avg(film.replacement_cost-film.rental_rate) from film join film_category on film.film_id=film_category.film_id 
join category on film_category.category_id=category.category_id group by category.category_id having avg(film.replacement_cost-film.rental_rate)>15;

-- Task12 The management wants to identify all the genres that consist of 60-70 movies. The genre details are captured in the category column, 
--        Display the names of these categories/genres and the number of movies per category/genre, sorted by the number of movies.

select  category.name as category_name, count(title) as movie_count from film join film_category on film.film_id=film_category.film_id 
join category on film_category.category_id=category.category_id group by category.category_id
having movie_count between 60 and 70 order by movie_count;
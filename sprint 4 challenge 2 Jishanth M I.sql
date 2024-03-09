-- sakila database
use sakila;
select * from film;
select * from category; 

-- Task 1 Movie rental companies usually maintain multiple physical copies of the most popular and trending movies.
--        Identify and display the film/movie IDs and the existing numberof copies for the following movies: 1. Brotherhood blanket 2. Soup Wisdom

select film_id, count(inventory_id) from inventory where film_id in 
(select film_id from film where title ='Brotherhood Blanket' or title='soup wisdom') group by film_id;

-- Task 2 Calculate and display the total number of movies in each genre.

select category_id,count(film_id) as no_of_movies from film_category group by category_id;

-- Task 3 Display the first names and last names of the top 3 actors whose movies have the highest replacement cost

select first_name, last_name,replacement_cost from actor join film_actor on actor.actor_id=film_actor.actor_id
join film on film_actor.film_id=film.film_id  order by replacement_cost desc limit 3;

-- Task 4 Movies can be based on actual incidents, political issues, mystery, fiction, etc. Calculate and display the total sale amount for each type of movie.

select name as movies_type, sum(amount) as total_sales from payment
join rental on rental.rental_id=payment.rental_id
join inventory on inventory.inventory_id=rental.inventory_id
join film_category on film_category.film_id=inventory.film_id
join category on category.category_id=film_category.category_id
group by movies_type;

-- Task 5 Display the top 10 genre of movies based on their revenues sorted in descending order.Save the result in a CSV file and present the result visually using a bar graph and a pie chart.

select name as movies_type, sum(amount) as total_sales from payment
join rental on rental.rental_id=payment.rental_id
join inventory on inventory.inventory_id=rental.inventory_id
join film_category on film_category.film_id=inventory.film_id
join category on category.category_id=film_category.category_id
group by movies_type order by  total_sales desc;

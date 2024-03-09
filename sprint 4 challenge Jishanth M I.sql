-- world database
use world;
select * from country;
select * from countrylanguage;

-- Task1 Display all rows from the Country table and calculate the number of rows in this table. 
  --     Display the country names and the population of countries with the codes (USA', 'GBR', 'ARE').

select * from country; 
select count(*) from country;
select Name,Population from country where Code  in ('USA','GBR','ARE');

-- Task2 Display the continent names and the sum of population of all countries in the continents in descending order.

select continent,sum(population) as total_population from country group by Continent order by total_population desc ;

-- Task3 Display the names of those countries of the European continent where the language spoken is French.

select Name,Continent,Language from country join countrylanguage on country.Code=countrylanguage.CountryCode 
where  Language = 'French' and Continent= 'Europe';

select name from country where code in (select countrycode from countrylanguage where Language= 'French') and Continent= 'Europe';

-- Task 4 Display the name of the country with the highest population from each continent in the database

select name , Continent, population from country where (population,Continent) in 
(select max(population),Continent from country group by Continent) order by population desc;


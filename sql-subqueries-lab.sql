
use sakila;
-- Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
select
	f.title as Film_Title,
	count(s.store_id) as Number_of_Films  
from store as s
join inventory as i on s.store_id = i.store_id
join film as f on i.film_id = f.film_id
where f.title = "Academy Dinosaur"
group by Film_Title;

-- List all films whose length is longer than the average length of all the films in the Sakila database.
select
	*
from film 
where length > 
(select
	avg(floor(length))
from film);

-- Use a subquery to display all actors who appear in the film "Alone Trip".

select
	first_name,
    last_name
from actor
where actor_id in
(select 
	actor_id
from film_actor
where film_id in (select 
    film_id
from film
where title like "%Alone Trip%"));


-- Sales have been lagging among young families, and you want to target family movies for a promotion. 
-- Identify all movies categorized as family films.

select
	title
from film
where film_id in    
(select
	film_id
from film_category
where category_id in (select
    category_id
from category
where name like "%Family%"));

-- Retrieve the name and email of customers from Canada using both subqueries and joins. 
-- To use joins, you will need to identify the relevant tables and their primary and foreign keys.

select
	first_name,
    last_name,
    email
from customer as cu
join address as a on cu.address_id = a.address_id
join city as c on a.city_id = c.city_id
join country as cou on c.country_id = cou.country_id
where cou.country like "%Canada%"


-- Determine which films were starred by the most prolific actor in the Sakila database. 
-- a prolific actor is defined as the actor who has acted in the most number of films. 
-- First, you will need to find the most prolific actor and then use that actor_id to find the different films that he or she starred in.









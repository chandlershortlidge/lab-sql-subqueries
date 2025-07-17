
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

-- Error Code: 1054. Unknown column 'category_id' in 'IN/ALL/ANY subquery'




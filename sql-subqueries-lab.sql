
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
from film)





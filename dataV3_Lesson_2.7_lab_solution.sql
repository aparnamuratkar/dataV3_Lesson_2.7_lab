
use sakila;
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select * from sakila.film;
select * from sakila.category;

select c.name, count(fc.film_id) as no_of_film_per_category from sakila.category c
join sakila.film_category fc on 
c.category_id = fc.category_id
group by name;

-- join 
-- sakila.film f on 
-- fc.film_id = f.film_id
-- group by name;


-- 2. Display the total amount rung up by each staff member in August of 2005.
select * from staff;
select * from payment;
select p.staff_id, s.first_name, s.last_name, p.payment_date, p.amount 
from staff s join payment p on
s.staff_id = p.staff_id and payment_date like '2005-08%'
order by amount desc; 

-- 3. Which actor has appeared in the most films?
select concat(a.first_name, ' ', a.last_name) as "Actor Name", count(fa.film_id) as "no. of films" from sakila.actor a
right join sakila.film_actor fa
on a.actor_id = fa.actor_id
group by a.actor_id
order by count(fa.film_id) desc limit 1;

-- 4. Most active customer (the customer that has rented the most number of films)
select c.customer_id, count(*) as Total_Rentals
from rental as r
left join customer as cust on r.customer_id = cust.customer_id
group by cust.customer_id;

-- 5. Display the first and last names, as well as the address, of each staff member.
select concat(s.first_name, ' ', s.last_name) as "Employee Name", a.address
from staff s join address a
on s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.
select f.title as 'Film Title', count(fa.actor_id) as `Number of Actors`
from film_actor fa
join film f 
on fa.film_id= f.film_id
group by f.title;

-- 7. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select concat(c.first_name, ' ', c.last_name) as  "customer name", sum(p.amount) as `Total payment`
from customer c
join payment p 
on c.customer_id= p.customer_id
group by concat(c.first_name, ' ', c.last_name)
order by `Total payment` desc;

-- 8. List number of films per `category`. 
select c.name, count(fc.category_id) as `Films_per_Category`
from film_category fc join category c
on fc.category_id = c .category_id
group by fc.category_id
having `Films_per_Category` 
order by `Films_per_Category` desc;

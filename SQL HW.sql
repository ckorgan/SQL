Use sakila;

#1a.
SELECT first_name,last_name FROM actor;


#1b.
SELECT CONCAT(first_name, ' ',last_name) AS Actor FROM actor; 


#2a.
SELECT actor_id,first_name,last_name FROM actor WHERE first_name = 'Joe'; 


#2b.
SELECT first_name,last_name FROM actor WHERE last_name LIKE '%%GEN%%'; 


#2c.
SELECT first_name,last_name FROM actor WHERE last_name LIKE '%%LI%%' ORDER BY last_name,first_name; 


#2d.
SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');


#3a.
ALTER TABLE actor ADD description BLOB; 


#3b.
ALTER TABLE actor DROP COLUMN description;


#4a.
SELECT last_name , COUNT(last_name) AS count FROM actor GROUP BY last_name; 


#4b.
SELECT last_name , COUNT(last_name) AS count_num FROM actor GROUP BY last_name HAVING count_num >= 2; 


#4c.
UPDATE actor SET first_name ='HARPO',last_name='WILLIAMS' WHERE concat(first_name,' ',last_name)= 'GROUCHO WILLIAMS'; 


#4d.
UPDATE actor SET first_name ='GROUCHO',last_name='WILLIAMS' WHERE concat(first_name,' ',last_name)= 'HARPO WILLIAMS'; 


#5a.
desc address 


#6a.
SELECT address.address_id, staff.first_name, staff.last_name FROM staff INNER JOIN address ON address.address_id=staff.address_id ;


#6b.
SELECT concat(staff.first_name,' ', staff.last_name) AS name , sum(payment.amount) AS TotalAmount FROM staff INNER JOIN payment ON payment.staff_id=staff.staff_id WHERE payment.payment_date LIKE '%%2005-08%%' GROUP BY name


#6c.
SELECT film.title, count(film_actor.actor_id) AS totalActor FROM film INNER JOIN film_actor ON film.film_id=film_actor.film_id GROUP BY film.film_id


#6d. 
SELECT film.title, count(inventory.inventory_id) FROM film INNER JOIN inventory WHERE film.title= "Hunchback Impossible" AND film.film_id=inventory.film_id  

#6e.
SELECT customer.first_name, customer.last_name , sum(payment.amount) AS "Total Amount Paid" FROM customer INNER JOIN payment ON payment.customer_id=customer.customer_id GROUP BY payment.customer_id ORDER BY last_name;


#7a.
SELECT title AS "Title of Movies" FROM film WHERE title LIKE "K%" OR title LIKE "Q%" AND language_id=(SELECT language_id FROM language WHERE name='English');


#7b.
SELECT concat(first_name, ' ',last_name) AS "Full Name" FROM actor WHERE actor_id IN (SELECT actor_id FROM film_actor WHERE film_id 
IN (SELECT film_id FROM film WHERE title="ALONE TRIP"))


#7c.
SELECT first_name, last_name, email FROM customer JOIN address ON (customer.address_id = address.address_id) JOIN city ON (address.city_id=city.city_id) JOIN country country ON (city.country_id=country.country_id);


#7d.

SELECT title AS "Movie Name" FROM film JOIN film_category on (film.film_id=film_category.film_id)
JOIN category on (film_category.category_id=category.category_id);


#7e.
SELECT title, COUNT(film.film_id) AS "Most Frequently Rented Movies" FROM  film JOIN inventory ON (film.film_id= inventory.film_id) JOIN rental ON (inventory.inventory_id=rental.inventory_id) GROUP BY title ORDER BY "Most Frequently Rented Movies" DESC;


#7f.
SELECT store_id, city, country FROM store JOIN address ON (store.address_id=address.address_id)
JOIN city ON (address.city_id=city.city_id)
JOIN country ON (city.country_id=country.country_id);


#7h.
SELECT c.name AS "Top Five", SUM(p.amount) AS "Gross" FROM category c 
JOIN film_category fc ON (c.category_id=fc.category_id)
JOIN inventory i ON (fc.film_id=i.film_id)
JOIN rental r ON (i.inventory_id=r.inventory_id)
JOIN payment p ON (r.rental_id=p.rental_id)
GROUP BY c.name ORDER BY Gross  LIMIT 5;

#8a.
CREATE VIEW Top5 AS SELECT c.name AS "Top Five", SUM(p.amount) AS "Gross" FROM category c JOIN film_category fc ON (c.category_id=fc.category_id) JOIN inventory i ON (fc.film_id=i.film_id) JOIN rental r ON (i.inventory_id=r.inventory_id) JOIN payment p ON (r.rental_id=p.rental_id) GROUP BY c.name ORDER BY Gross LIMIT 5 

#8b.
SELECT * FROM Top5

#8c.
DROP VIEW Top5
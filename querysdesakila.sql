#1
SELECT city.city ,customer.first_name, customer.last_name, customer.email, address.address
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE city.city_id = 312;

#2
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genero 
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Comedy';

#3
SELECT *
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id = 5;

#4
SELECT store.store_id, city.city_id, customer.first_name, customer.last_name, customer.email, address.address
FROM customer
JOIN store ON customer.store_id = store.store_id
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE store.store_id = 1 AND city.city_id IN (1, 42, 312, 459);

#5
SELECT film.title, film.description, film.release_year, film.rating, film.special_features 
FROM film
JOIN film_actor ON film_actor.film_id = film.film_id
WHERE film.rating = "G" AND actor_id = 15 AND film.special_features LIKE "%Behind the Scenes";

#6
SELECT film.film_id, film.title, actor.actor_id, concat(actor.first_name, actor.last_name) as actor 
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film_actor.film_id= 369;

#7
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name as genre, film.rental_rate
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE film.rental_rate = 2.99 AND category.name='drama';

#8
SELECT CONCAT(actor.first_name, ' ', actor.last_name) AS actor_name, film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE category.name = 'action' AND actor.first_name ='Sandra' AND actor.last_name = 'Kilmer';
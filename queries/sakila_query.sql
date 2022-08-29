-- PRACTICA: Utilizando la base de datos Sakila, completa las siguientes consultas.
select * from address;
select * from customer;
select * from film;
select * from actor;
SELECT * FROM store;
select * from film_actor;
select * from rental;
select * from payment;

select COUNT(actor.actor_id) 
from film_actor
JOIN actor ON film_actor.actor_id = actor.actor_id
where actor.actor_id = 15;

-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de ciudad_id = 312? Tu consulta debe devolver el nombre, apellido, 
-- correo electrónico y dirección del cliente.

SELECT address.city_id, customer.first_name AS Nombre, customer.last_name AS Apellido, customer.email AS Email, address.address AS Direccion,  address.district
FROM address
JOIN customer ON address.address_id = customer.address_id
WHERE address.city_id = 312;

-- 2. ¿Qué consulta ejecutarías para obtener todas las películas de comedias? Tu consulta debe devolver el título de la 
-- película, la descripción, el año de lanzamiento,  la clasificación, las características especiales y el género (categoría).

SELECT film.film_id, film.title, film.description, film.release_year, film.rating, category.name AS Categoria
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE category.name LIKE '%comedy%';

-- 3. ¿Qué consulta ejecutarías para obtener todas las películas por actor_id=5? Tu consulta debe devolver el id del actor, 
-- el nombre del actor, el título de la película, la descripción y el año de lanzamiento.

SELECT actor.actor_id, CONCAT(actor.first_name, ' ', actor.last_name) AS Nombre, film.title, film.description, film.release_year
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id = 5;

-- 4. ¿Qué consulta ejecutarías para obtener todos los clientes en store_id=1 y dentro de estas ciudades (1, 42, 312 y 459)? 
-- Tu consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS Nombre, customer.email, address.address
FROM address
JOIN customer ON address.address_id = customer.address_id
JOIN store ON store.store_id = customer.store_id
WHERE store.store_id = 1 and address.city_id IN (1, 42, 312, 459);

-- 5. ¿Qué consulta ejecutarías para obtener todas las películas con una "calificación = G" y una "característica especial = detrás de escena", 
-- unidas por actor_id = 15?  Tu consulta debe devolver el título de la película, la descripción, el año de lanzamiento, 
-- la clasificación y la característica especial. Sugerencia: puede usar la función LIKE para obtener la parte “detrás de escena”.

SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film
JOIN film_actor ON 	film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id = 15 and rating = 'G' and special_features LIKE '%behind the scenes';

-- 6. ¿Qué consulta ejecutarías para obtener todos los actores que se unieron al film_id = 369? 
-- Tu consulta debe devolver film_id, título, actor_id y actor_name.

SELECT film.film_id, film.title, actor.actor_id ,CONCAT(actor.first_name, ' ', actor.last_name) AS Nombre
FROM actor 
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE film.film_id = 369;

-- 7. ¿Qué consulta ejecutarías para obtener todas las películas de drama con una tarifa de arriendo de 2,99? Tu consulta
--  debe devolver el título de la película, la descripción, el año de lanzamiento, la clasificación, las características 
-- especiales y el género (categoría).

 SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS Categoria, payment.amount
 FROM film
 JOIN film_category ON film.film_id = film_category.film_id
 join category ON category.category_id = film_category.category_id
 JOIN inventory ON film.film_id = inventory.film_id
 join rental ON inventory.inventory_id = rental.inventory_id
 join payment ON rental.rental_id = payment.rental_id
 WHERE payment.amount > 2.99 and category.name LIKE '%drama%'
 GROUP BY title;

-- 8. ¿Qué consulta ejecutarías para obtener todas las películas de acción que estén unidas por SANDRA KILMER? 
-- Tu consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la clasificación,
-- las características especiales, el género (categoría) y el nombre y apellido del actor
	
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS Categoria, CONCAT(actor.first_name, ' ', actor.last_name) AS Nombre_Actor
FROM film
join film_category ON film.film_id = film_category.film_id
join category ON film_category.category_id = category.category_id
join film_actor ON film.film_id = film_actor.film_id
join actor ON film_actor.actor_id = actor.actor_id
WHERE CONCAT(actor.first_name, ' ', actor.last_name) LIKE "%sandra kilmer%" and category.name LIKE "%action%"
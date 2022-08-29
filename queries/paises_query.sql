-- Practica: Paises, practicar consulta myql MYSQL.

-- 1. ¿Qué consulta ejecutarías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, 
-- el idioma y el porcentaje de habla del idioma.  Tu consulta debe ordenar el resultado por porcentaje de habla del idioma en orden 
-- descendente. (1)
SELECT countries.name, languages.Language, languages.percentage 
FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE language = 'SLOVENE'
ORDER BY percentage DESC;

-- 2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades de cada país?  Tu consulta debe devolver el nombre del país y
--  el número total de ciudades. Tu consulta debe ordenar el resultado por el número de ciudades en orden descendente. (3)
SELECT countries.name AS Pais, COUNT(cities.id) AS Total_ciudades
FROM countries
JOIN cities ON countries.id = cities.country_id
GROUP by countries.id
ORDER BY Total_ciudades DESC;

-- 3. ¿Qué consulta ejecutarías para obtener todos ciudades de México con una población mayor a 500,000? Tu consulta debe ordenar 
-- el resultado por población en orden descendente. (1)

SELECT countries.name AS Pais, cities.name AS Ciudad, cities.population AS Cantidad_habitantes, cities.country_id
FROM countries
JOIN cities ON countries.id = cities.country_id
WHERE countries.name LIKE '%mexico%' and cities.population > 500000
ORDER BY cities.population DESC;
	
-- 4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje de habla mayor a 89%? Tu 
-- consulta debe ordenar el resultado por porcentaje de habla en orden descendente. (1)
SELECT countries.name AS Pais, languages.language AS Idioma, languages.percentage AS Porcentaje
FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE percentage > 89
ORDER BY percentage DESC;

-- 5. ¿Qué consulta ejecutarías para obtener todos los países con un área de superficie menor a 501 y población 
-- mayor a 100,000? (2)

SELECT countries.name AS Pais, countries.surface_area AS Superficie_total, countries.population AS Cantidad_habitantes
FROM countries
WHERE population > 100000 and surface_area < 501
ORDER BY surface_area DESC;

-- 6. ¿Qué consulta ejecutarías para obtener países solo con monarquía constitucional, un capital superior a 200 
-- y una esperanza de vida mayor a 75 años?  (1)

SELECT countries.name AS Pais,  countries.government_form AS Forma_gobierno, countries.capital AS Capital, countries.life_expectancy AS Esperanza_vida
FROM countries
WHERE government_form LIKE '%constitutional monarchy%' and capital > 200 and life_expectancy > 75;

-- 7. ¿Qué consulta ejecutarías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires
-- con una población mayor a 500,000 habitantes?  La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población.  (2)

SELECT countries.name AS Pais, cities.name AS Ciudad, cities.district AS Distrito, cities.population AS Poblacion
From countries
join cities ON countries.id = cities.country_id
WHERE district LIKE '%buenos aires%' and cities.population > 500000;

-- 8. ¿Qué consulta ejecutarías para resumir el número de países en cada región? Tu consulta debe mostrar el nombre de la 
-- región y el número de países. Además, debe  ordenar el resultado por el número de países en orden descendente. (2)

SELECT countries.region AS Region, COUNT(countries.id) AS Numero_paises
FROM countries
GROUP BY region
ORDER BY COUNT(countries.id) DESC;


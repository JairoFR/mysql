-- PRACTICA: USUARIOS.-
-- OBJETIVOS: Practicar el uso de MySQL Workbench para ejecutar comandos SQL para manipular nuestra base de datos.

-- Consulta: crea 3 usuarios nuevos
INSERT INTO users (first_name, last_name, email, created_at, update_at)
VALUES('Karla', 'Santander', 'karla@gmail.com', NOW(), NOW()),
	  ('Jairo', 'Flores', 'jairo@gmail.com', NOW(), NOW()),
      ('Lucas', 'Locatelli', 'Lucas@gmail.com', NOW(), NOW());

-- Consulta: recupera todos los usuarios
SELECT * 
FROM users;

-- Consulta: recupera el primer usuario que usa su dirección de correo electrónico
SELECT users.email
FROM users
where id = 1;

-- Consulta: recupera el último usuario que usa su id
SELECT * 
FROM users
ORDER BY users.id 
DESC LIMIT 1;

-- Consulta: cambia el usuario con id=3 para que su apellido sea Panqueques
UPDATE users
SET last_name = 'Panqueques'
WHERE id = 3;

-- Consulta: elimina el usuario con id=2 de la base de datos
DELETE FROM users
WHERE id = 2;

-- Consulta: obtén todos los usuarios, ordenados por su nombre
SELECT * 
FROM users
ORDER BY users.first_name;

-- Consulta BONUS: obtén todos los usuarios, ordenados por su nombre en orden descendente
SELECT * 
FROM users
ORDER BY users.first_name DESC;
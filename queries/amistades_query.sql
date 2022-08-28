-- PRACTICA: Ejercicio amistades, Practicar la creación de bases de datos y practicar consultas SQL y autouniones

SELECT *
FROM users;
SELECT * 
FROM amistades;

-- Consulta: crea 6 usuarios nuevos
INSERT INTO users(nombre, apellido, created_at, update_at)
VALUES('Karla', 'Santander', NOW(), NOW()),
	  ('Jairo', 'Flores',   NOW(), NOW()),
      ('Catalina', 'Rojas', NOW(), NOW()),
      ('Lucas', 'Rojas', NOW(), NOW()),
      ('Sara', 'Allende', NOW(), NOW()),
      ('Carlos', 'Aracena', NOW(), NOW());

-- Consulta: haz que el usuario 1 sea amigo del usuario 2, 4 y 6
INSERT INTO amistades(user_id, friend_id)
VALUES(1,2), (1,4), (1,6);

-- Consulta: haz que el usuario 2 sea amigo del usuario 1, 3 y 5
INSERT INTO amistades(user_id, friend_id)
VALUES(2,1), (2,3), (2,5);

-- Consulta: haz que el usuario 3 sea amigo del usuario 2 y 5
INSERT INTO amistades(user_id, friend_id)
VALUES(3,2), (3,5);

-- Consulta: haz que el usuario 4 sea amigo del usuario 3
INSERT INTO amistades(user_id, friend_id)
VALUES(4,3);

-- Consulta: haz que el usuario 5 sea amigo del usuario 1 y 6
INSERT INTO amistades(user_id, friend_id)
VALUES(5,1), (5,6);

-- Consulta: haz que el usuario 6 sea amigo del usuario 2 y 3
INSERT INTO amistades(user_id, friend_id)
VALUES(6,2), (6,3);

-- Consulta: muestra las relaciones creadas como se muestra en la imagen de arriba
SELECT users.id, users.nombre, users.apellido , users2.id, users2.nombre AS Nombre_amigo, users2.apellido AS Apellido_amigo
FROM users
JOIN amistades ON users.id = amistades.user_id
LEFT JOIN users as users2 ON users2.id = amistades.friend_id;


-- Consulta NINJA: Devuelve todos los usuarios que son amigos del primer usuario, asegúrate de que sus nombres se muestren en los resultados.
SELECT users.nombre, users.apellido , users2.nombre AS Nombre_amigo, users2.apellido AS Apellido_amigo
FROM users
JOIN amistades ON users.id = amistades.user_id
LEFT JOIN users as users2 ON users2.id = amistades.friend_id
WHERE users.id = 1;

-- Consulta NINJA: averigua quién tiene más amigos y devuelve la cuenta de sus amigos.



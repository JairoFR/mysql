-- Practica: relacion uno a muchos con el esquema_dojos_ninjas

SELECT * FROM dojos;
SELECT * FROM ninjas;

-- Consulta: crea 3 dojos nuevos
INSERT INTO dojos (nombre, update_at, created_at)
VALUES(	'Aguila negra', NOW(), NOW()),
	('TEMPLECODE', NOW(), NOW()),
	('CODING DOJO', NOW(), NOW());

-- Consulta: elimina los 3 dojos que acabas de crear
DELETE FROM dojos;
SET SQL_SAFE_UPDATES = 0;

-- Consulta: crea 3 dojos nuevos
INSERT INTO dojos (nombre, update_at, created_at)
VALUES(	'Aguila negra', NOW(), NOW()),
	('TEMPLECODE', NOW(), NOW()),
	('CODING DOJO', NOW(), NOW());
    
-- Consulta: crea 3 ninjas que pertenezcan al primer dojo
INSERT INTO ninjas (dojo_id, nombre, apellido, edad, update_at, created_at)
VALUES(	4, 'jairo', 'Rivera', 45, NOW(), NOW()),
	(4, 'Robin', 'Araya', 15,  NOW(), NOW()),
	(4, 'Nelson', 'Gonzalez', 10,  NOW(), NOW());

-- Consulta: crea 3 ninjas que pertenezcan al segundo dojo
INSERT INTO ninjas (dojo_id, nombre, apellido, edad, update_at, created_at)
VALUES(	5, 'Karla', 'Santander', 30, NOW(), NOW()),
	(5, 'Jose', 'Alcayaga', 25,  NOW(), NOW()),
	(5, 'Julian', 'Contreras', 12,  NOW(), NOW());

-- Consulta: crea 3 ninjas que pertenezcan al tercer dojo
    INSERT INTO ninjas (dojo_id, nombre, apellido, edad, update_at, created_at)
VALUES(	6, 'Pancracio', 'Del Rosario', 30, NOW(), NOW()),
	(6, 'Clemente', 'Araya', 45,  NOW(), NOW()),
	(6, 'Juan', 'Cortes', 72,  NOW(), NOW());

-- Consulta: recupera todos los ninjas del primer dojo
SELECT ninjas.nombre, ninjas.apellido
FROM dojos	
JOIN ninjas ON dojos.id = dojo_id
where dojo_id = 4;

-- Consulta: recupera todos los ninjas del último dojo
SELECT ninjas.nombre, ninjas.apellido
FROM dojos	
JOIN ninjas ON dojos.id = dojo_id
WHERE dojos.id = 6;	

-- Consulta: recupera el dojo del último ninja
SELECT dojos.nombre
FROM dojos
JOIN ninjas ON dojos.id = dojo_id
ORDER BY ninjas.id 
DESC LIMIT 1;

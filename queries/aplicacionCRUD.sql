-- Practica: probar las consultas que se necesita para realizar una aplicacion CRUD(crear, leer, actualizar, eliminar)
USE esquema_usuarios;
SELECT * FROM usuarios;

-- Comando para crear un registro 
INSERT INTO usuarios (nombre, apellido, cumpleaños, edad, created_at, update_at)
VALUES('Marck', 'Flores',STR_TO_DATE('20-Sep-1989', '%d-%M-%Y'), '44', NOW(), NOW());

-- LEER REGISTRO 
SELECT usuarios.nombre, usuarios.apellido, usuarios.cumpleaños, usuarios.edad
FROM usuarios
WHERE id = 3;

-- ACTUALIZAR REGISTRO
UPDATE esquema_usuarios.usuarios
SET nombre = 'claudia'
WHERE id=2;

-- BORRAR REGISTROS
DELETE FROM usuarios 
WHERE id = 4;
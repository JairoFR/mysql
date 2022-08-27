-- Practica: Libros 
-- Sec creara una base de datos con relaciones de muchos a muchos, se obtendran los datos de las tablas relacionales a traves de sentencias JOIN.



SELECT * FROM libros;
SELECT * FROM libros_favoritos;
-- Consulta: crea 5 usuarios diferentes: Jane Austen, Emily Dickinson, Fyodor Dostoevsky, William Shakespeare, Lau Tzu
INSERT INTO usuarios(nombre, apellido, created_at, update_at)
VALUES('Jane', 'Austen', NOW(), NOW()),
	('Emily', 'Dickinson', NOW(), NOW()),
    ('Fyodor', 'Dostoevsky', NOW(), NOW()),
    ('William', 'Shakespeare', NOW(), NOW()),
    ('Lau', 'Tzu', NOW(), NOW());
    
-- Consulta: crea 5 libros con los siguientes nombres: C Sharp, Java, Python, PHP, Ruby
INSERT INTO libros(titulo, num_pagina, created_st, update_at)
VALUES('C Sharp', 400, NOW(), NOW()),
	('Java', 200, NOW(), NOW()),
    ('Python', 500, NOW(), NOW()),
    ('PHP', 400, NOW(), NOW()),
    ('RUBY', 200, NOW(), NOW());

-- Consulta: cambia el nombre del libro de C Sharp a C#
UPDATE libros 
SET titulo = 'C#'
WHERE id = 1;

-- Consulta: cambia el nombre del cuarto usuario a Bill
UPDATE usuarios
SET nombre = 'Bill'
Where id = 4;

-- Consulta: haz que el primer usuario marque como favorito los 2 primeros libros
-- Consulta: haz que el segundo usuario marque como favorito los primeros 3 libros
-- Consulta: haz que el tercer usuario marque como favorito los 4 primeros libros
-- Consulta: Haz que el cuarto usuario marque como favorito todos los libros
INSERT INTO libros_favoritos(usuario_id, libro_id)
VALUES(1, 1), (1,2), (2,1), (2,2), (2,3), (3,1), (3,2), (3,3), (3,4), (4,1), (4,2), (4,3), (4,4), (4,5);

-- Consulta: recupera todos los usuarios que marcaron como favorito el tercer libro (relacion mucho a mucho)
SELECT *
FROM usuarios
JOIN libros_favoritos ON usuarios.id = libros_favoritos.usuario_id
JOIN libros ON libros.id = libros_favoritos.libro_id
WHERE libro_id	 = 3;

-- Consulta: elimina el primer usuario de los favoritos del tercer libro
DELETE FROM libros_favoritos
WHERE libro_id = 3
AND usuario_id = 2;

-- Consulta: Haz que el quinto usuario marque como favorito el segundo libro
INSERT INTO libros_favoritos(usuario_id, libro_id)
VALUES(5,2);

-- Encuentra todos los libros que el tercer usuario marcó como favoritos
SELECT * 
FROM libros
JOIN libros_favoritos ON libros.id = libros_favoritos.libro_id
join usuarios ON usuarios.id = libros_favoritos.usuario_id
WHERE usuarios.id = 3;

-- Consulta: encuentra todos los usuarios que marcaron como favorito el quinto libro
SELECT *
FROM usuarios
JOIN libros_favoritos ON usuarios.id = libros_favoritos.usuario_id
JOIN libros ON libros.id = libros_favoritos.libro_id
WHERE libro_id	 = 5;
-- Ejercicios de practica consultas mysql

SELECT * FROM billing;
SELECT * FROM clients;
SELECT * FROM leads;
SELECT * FROM sites;
-- JOINING TABLES 
-- JOIN 
-- ENCUENTRA TODOS LOS CLIENTES (NOMBRES Y APELLIDOS) y los importes de facturacion y fecha de cobro
SELECT clients.first_name, clients.last_name, billing.amount, billing.charged_datetime
FROM clients
JOIN billing ON clients.id = billing.clients_id;

-- LISTA TODOS LOS NOMBRE DE DOMINIOS Y PROSPECTOS(NOMBRES Y APELLIDOS) POR CADA SITIO
SELECT sites.domain_name, leads.first_name AS Nombre_prospecto, leads.last_name AS Apellido_prospecto
FROM sites 
JOIN leads ON sites.id = leads.sites_id;

-- JOIN ON MULTIPLE TABLES
-- OBTIENE EL NOMBRE DE LOS CLIENTES , SU NOMBRE DE DOMINIO Y EL PRIMER NOMBRE DE TODOS LOS LEADS GENERADOS  DESDE ESTOS SITIOS
SELECT clients.first_name AS Nombre_clientes,  sites.domain_name, leads.first_name AS Nombre_lead	
FROM clients
JOIN sites ON clients.id = sites.clients_id
JOIN leads ON sites.id = leads.sites_id;																			

-- LEFT @ RIGHT JOIN 
-- LISTA TODOS LOS CLIENTES Y LOS SITIOS QUE CADA CLIENTE TUVO, INCLUSO SI EL CLIENTE NO A CONSEGUIDO UN SITIO AUN.
SELECT clients.first_name, clients.last_name, sites.domain_name
FROM clients
RIGHT JOIN sites ON clients.id = sites.clients_id;

-- GROUPING ROWS
-- GROUP BY 
-- SUM, MIN, MAX, AVG
-- ENCUENTRA TODOS LOS CLIENTES(NOMBRE Y APELLIDO) Y SU TOTAL IMPORTE DE FACTURACION 
SELECT clients.first_name, clients.last_name, SUM(billing.amount) 
FROM clients
JOIN billing ON clients.id = billing.clients_id
GROUP BY clients.id; 	

-- GROUP CONCAT 
-- Listar todos los nombres de dominio asociados con cada clientes 
SELECT clients.first_name AS Nombre_cliente, GROUP_CONCAT(' ', sites.domain_name)
FROM clients
JOIN sites ON clients.id = sites.clients_id
GROUP BY clients.id;

-- COUNT
-- Encuentra el total de numeros de prospectos de cada sitio
SELECT sites.domain_name, COUNT(leads.id) AS Total_prospectos
FROM sites
JOIN leads ON sites.id = leads.sites_id
GROUP BY sites.id;






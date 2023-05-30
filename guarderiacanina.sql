-- GUARDERIA CANINA--
-- creacion base de datos
CREATE DATABASE guarderia_can;

-- Creacion de tabla propietario
CREATE TABLE propietario(
    id_propietario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    telefono INT  UNSIGNED NOT NULL,
    direccion VARCHAR (50) NOT NULL);
    
    CREATE DATABASE guarderia_ca;
--nuevi
-- Creación de tabla propietario
CREATE TABLE propietario (
    id_propietario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único del propietario
    nombre VARCHAR(50) NOT NULL, -- Nombre del propietario
    telefono INT UNSIGNED NOT NULL, -- Teléfono del propietario
    direccion VARCHAR(50) NOT NULL -- Dirección del propietario
);

-- Creacion de tabla servicio
CREATE TABLE servicio (
    id_servicio INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    precio INT UNSIGNED NOT NULL);

--nuevvo
-- Creación de tabla servicio
CREATE TABLE servicio (
    id_servicio INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único del servicio
    nombre VARCHAR(50) NOT NULL, -- Nombre del servicio
    precio INT UNSIGNED NOT NULL -- Precio del servicio
);

--nuevo
CREATE TABLE empleado (
    id_empleado INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único del empleado
    nombre VARCHAR(50) NOT NULL, -- Nombre del empleado
    telefono INT UNSIGNED NOT NULL, -- Teléfono del empleado
    estado BOOLEAN NOT NULL -- Estado del empleado (activo/inactivo)
);

-- Creación de tabla empleado



-- Creacion de tabla empleado
CREATE TABLE empleado (
    id_empleado INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    telefono INT UNSIGNED NOT NULL,
    estado BOOLEAN NOT NULL);

-- Creacion de tabla factura 
CREATE TABLE factura (
    id_factura INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_servicio INT UNSIGNED NOT NULL,
    total INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio));
 


-- Creacion de tabla mascota
CREATE TABLE  mascota (
    id_mascota INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    raza VARCHAR(50) NOT NULL,
    tipo VARCHAR (50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    estado BOOLEAN  NOT NULL,
    id_propietario INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_propietario) REFERENCES propietario(id_propietario));
    
    
-- Creacion de tabla solicitud 
CREATE TABLE solicitud (
    id_solicitud INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fecha_ejecucion DATE NOT NULL,
    fecha_final DATE NOT NULL,
    numero_horas INT UNSIGNED NOT NULL,
    pago_horas INT UNSIGNED NOT NULL,
    id_servicio INT UNSIGNED NOT NULL,
    id_mascota INT UNSIGNED NOT NULL,
    id_empleado INT UNSIGNED NOT NULL,
    id_factura INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio),
    FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura));


-- Inserciones para la tabla 'propietario'
INSERT INTO propietario(nombre, telefono,direccion) VALUES
    ('samuel andres peña' , 3254567876, 'centro'),
    ('julian garcia ossa' , 3204567876, 'cadillal'),
    ('anyi katerine bolaños' , 3234567876, 'la paz'),
    ('yeison andrey jimenez' , 3234567876, 'el uvo'),
    ('santiago moreno' , 3214567876, 'el mirador'),
    ('alejando vega' , 3214567876, 'belen'),
    ('maikol nieto' , 3294567876, 'arenal'),
    ('paola meneses' , 3214567876, 'esmeralda'),
    ('laura gutierrez' , 3264567876, 'obando'),
    ('anderson peña' , 3214567876, 'las ferias'),
    ('camilo murillo' , 3244567876, 'la victoria'),
    ('daniela molano' , 3274567876, 'el ortigal'),
    ('diego perez' , 3234567908, 'la maria'),
    ('esteban medina' , 323456567, 'chapinero'),
    ('fabian muñoz' , 3144567876, '31 mayo');
    
        -- Inserciones para la tabla 'servicio'
INSERT INTO servicio (nombre,precio) VALUES
    ('Paseo', 25000),
    ('Peluqueria',30000),
    ('Guarderia',50000),
    ('Paseo',25000),
    ('Peluqueria',30000),
    ('Guarderia',50000),
    ('Paseo',25000),
    ('Peluqueria',30000),
    ('Guarderia',50000),
    ('Paseo',25000),
    ('Paseo', 25000),
    ('Peluqueria',30000),
    ('Guarderia',50000),
    ('Paseo',25000),
    ('Peluqueria',30000);


INSERT INTO empleado (nombre, telefono, estado) VALUES
    ('Paola andrea gomez ', 31456778,TRUE),
    ('Maria muñoz', 324354637,TRUE),
    ('James Rodriguez ', 314143536,TRUE),
    ('Erika Peña', 31554678, TRUE),
    ('Laura Gutierrez', 3142525, FALSE),
    ('Michael nieto', 31566788,TRUE),
    ('Raul moreno', 312978987,TRUE),
    ('Robert cuaran', 318191766, TRUE),
    ('Camilo murillo', 3199375454,FALSE),
    ('yanfrit Astaiza', 31414256,TRUE),
    ('Cindy Lopez', 33435353636,TRUE),
    ('Marta Benavides', 3353653,FALSE),
    ('Rodrigo cueltan', 345325,TRUE),
    ('fabiola meneses', 317183783,FALSE),
    ('Andres Daza', 320735464,TRUE);

    
-- Inserciones para la tabla 'factura'
INSERT INTO factura( id_servicio, total) VALUES
    (1 , 25000),
    (2 , 30000),
    (3, 50000),
    (4 , 25000),
    (5 , 30000),
    (6, 50000),
    (7 , 25000),
    (8 , 30000),
    (9, 50000),
    (10 , 25000),
    (11 , 30000),
    (12, 50000),
    (13 , 25000),
    (14 , 30000),
    (15, 50000);

  -- Inserciones para la tabla 'mascota'
INSERT INTO mascota(nombre, raza, tipo, estado,id_propietario) VALUES
    ('oso', 'Affenpinscher','perro' , TRUE,1),
    ('rocky', 'Pastor alemán','perro' , FALSE,2),
    ('toby', 'Golden retriever','perro' , TRUE,3),
    ('paloma', 'Affenpinscher','perra' , FALSE,4),
    ('linda','pinscher','perra' , TRUE,5),
    ('luna','Maine Coon','gato' , TRUE,6),
    ('zeus', 'Labrador','perro' , FALSE,7),
    ('orejas',' Affenpinscher','perro' , FALSE,8),
    ('matias', 'Border Collie','perro' , TRUE,9),
    ('mateo', 'Labrador','perro' , FALSE,10),
    ('mailon', 'Affenpinscher','perro' , TRUE,11),     
    ('charly', 'Doberman','perro' , FALSE,12),
    ('pulguis','Labrador','perro' , TRUE,13),
    ('noa', 'Labrador retriever','perro' , FALSE,14),
    ('mona', 'Labrador retriever','perra', TRUE,15);


    -- Inserciones para la tabla 'solicitud'
INSERT INTO solicitud( numero_horas, pago_horas,id_servicio,id_mascota,id_empleado,id_factura) VALUES
    (2 , 25000,1,31,1,1),
    (1 , 30000,2,32,2,2),
    (3, 50000,3,33,3,3),
    (4 , 45000,4,34,4,4),
    (5 , 55000,5,35,5,5),
    (6, 65000,6,36,6,6),
    (7 , 75000,7,37,7,7),
    (8 , 83000,8,38,3,8),
    (9, 95000,9,39,9,9),
    (10 , 125000,10,40,10,10),
    (11 , 130000,11,41,11,11),
    (12, 150000,12,42,12,12),
    (13 , 225000,13,43,13,13),
    (14 , 330000,14,44,14,14),
    (15, 450000,15,45,15,15);

-- Consultas 
SELECT * FROM `servicio` WHERE precio >= 25000 GROUP BY precio; --Servicio que tiene un precio mayor o igual a 25000

SELECT * FROM `servicio` WHERE precio <= 40000 GROUP BY precio; ---Servicio que tiene un precio menor o igual a 40000

SELECT * FROM `servicio` WHERE precio = 50000 GROUP BY precio;--Servicio que tiene como precio 50000

SELECT * FROM servicio WHERE precio =(SELECT MAX(precio) FROM servicio);--Servicios  mas costosos 

SELECT * FROM servicio WHERE precio =(SELECT MIN(precio) FROM servicio);--servicio mas  economico

SELECT mascota.id_mascota, mascota.nombre, mascota.raza
FROM mascota;--Muestra el identificador de la mascota, nombre y  su raza 

SELECT empleado.id_empleado, empleado.nombre, empleado.estado
FROM empleado;--Muestra el identificador del empleado, nombre y su estado

SELECT * FROM empleado WHERE nombre LIKE 'A%';--Todos los nombres que empiezan con la letra A

SELECT * FROM mascota WHERE nombre LIKE 'P%';--Todos los nombres que empiezan con la letra P

SELECT * FROM propietario WHERE nombre LIKE '%z';--Todos los nombres que terminan con la letra Z


--Joins

SELECT * FROM mascota INNER JOIN propietario ON mascota.id_propietario = propietario.id_propietario WHERE propietario.nombre = 'samuel andres peña';--Mascotas que pertenecen a Samuel andres peña

SELECT * FROM solicitud INNER JOIN empleado ON solicitud.id_empleado = empleado.id_empleado WHERE empleado.nombre = 'maria muñoz';--las solicitudes que pertenecen a la empleada maria muñoz

SELECT * FROM mascota INNER JOIN propietario ON mascota.id_mascota = propietario.id_propietario WHERE propietario.nombre = 'Camilo murillo';--Las mascotas que pertenecen al propietario camilo murillo

SELECT factura.total,servicio. FROM factura RIGHT JOIN servicio ON factura.id_factura = servicio.id_servicio WHERE factuta.id factura; en la tabla muestra el nombre sel servicio y el total

SELECT * FROM mascota RIGHT JOIN propietario ON mascota.id_propietario= propietario.id_propietario ;-- la tabla comparacion de l tabla mascota y propietario

SELECT * FROM `mascota` LEFT JOIN propietario ON mascota.id_mascota =propietario.id_propietario WHERE propietario.id_propietario ;-- tabla mascota y su propietario

SELECT * FROM `factura` LEFT JOIN servicio ON factura.id_factura =servicio.id_servicio WHERE servicio.id_servicio;--Muestra la factura con el servicio,nombre y precio correspondiente

SELECT * FROM `factura` LEFT JOIN servicio ON factura.id_factura =servicio.id_servicio WHERE servicio.id_servicio IS NULL;--Los campos nulos en la factura

SELECT mascota.nombre,propietario.nombre FROM mascota INNER JOIN propietario ON mascota.id_mascota = propietario.id_propietario WHERE propietario.nombre != 'samuel andres peña';--Las mascotas que pertenecen a un propietario menos a samuel andres peña

SELECT factura.total,servicio.nombre FROM factura INNER JOIN servicio ON factura.id_factura = servicio.id_servicio WHERE servicio.nombre != 'Guarderia';--Las facturas con los servicios excepto las que tinenen guarderia 


CREATE DATABASE guarderia_can;

-- Creación de tabla propietario
CREATE TABLE propietario (
    id_propietario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único del propietario
    nombre VARCHAR(50) NOT NULL, -- Nombre del propietario
    telefono INT UNSIGNED NOT NULL, -- Teléfono del propietario
    direccion VARCHAR(50) NOT NULL -- Dirección del propietario
);

-- Creación de tabla servicio
CREATE TABLE servicio (
    id_servicio INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único del servicio
    nombre VARCHAR(50) NOT NULL, -- Nombre del servicio
    precio INT UNSIGNED NOT NULL -- Precio del servicio
);

-- Creación de tabla empleado
CREATE TABLE empleado (
    id_empleado INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único del empleado
    nombre VARCHAR(50) NOT NULL, -- Nombre del empleado
    telefono INT UNSIGNED NOT NULL, -- Teléfono del empleado
    estado BOOLEAN NOT NULL -- Estado del empleado (activo/inactivo)
);

-- Creación de tabla factura 
CREATE TABLE factura (
    id_factura INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la factura
    id_servicio INT UNSIGNED NOT NULL, -- Identificador del servicio asociado a la factura
    total INT UNSIGNED NOT NULL, -- Total de la factura
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio) -- Clave foránea que referencia la tabla servicio
);
 
-- Creación de tabla mascota
CREATE TABLE mascota (
    id_mascota INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la mascota
    nombre VARCHAR(50) NOT NULL, -- Nombre de la mascota
    raza VARCHAR(50) NOT NULL, -- Raza de la mascota
    tipo VARCHAR(50) NOT NULL, -- Tipo de mascota (perro, gato, etc.)
    fecha_nacimiento DATE NOT NULL, -- Fecha de nacimiento de la mascota
    estado BOOLEAN NOT NULL, -- Estado de la mascota (activo/inactivo)
    id_propietario INT UNSIGNED NOT NULL, -- Identificador del propietario de la mascota
    FOREIGN KEY (id_propietario) REFERENCES propietario(id_propietario) -- Clave foránea que referencia la tabla propietario
);

-- Creación de tabla solicitud 
CREATE TABLE solicitud (
    id_solicitud INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la solicitud
    fecha_ejecucion DATE NOT NULL, -- Fecha de inicio de la solicitud
    fecha_final DATE NOT NULL, -- Fecha de finalización de la solicitud
    numero_horas INT UNSIGNED NOT NULL, -- Número de horas de la solicitud
    pago_horas INT UNSIGNED NOT NULL, -- Pago por horas de la solicitud
    id_servicio INT UNSIGNED NOT NULL, -- Identificador del servicio asociado a la solicitud
    id_mascota INT UNSIGNED NOT NULL, -- Identificador de la mascota asociada a la solicitud
    id_empleado INT UNSIGNED NOT NULL, -- Identificador del empleado asociado a la solicitud
    id_factura INT UNSIGNED NOT NULL, -- Identificador de la factura asociada a la solicitud
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio), -- Clave foránea que referencia la tabla servicio
    FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota), -- Clave foránea que referencia la tabla mascota
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado))--Clave foranea que referencia la tabla empleado

-- Insertar datos en la tabla propietario
INSERT INTO propietario (nombre, telefono, direccion)
VALUES
    ('Juan Pérez', 123456789, 'Calle Principal 123'),
    ('María García', 987654321, 'Avenida Central 456'),
    ('Carlos López', 456789123, 'Calle Secundaria 789'),
    ('Laura Martínez', 321654987, 'Plaza Mayor 246'),
    ('Pedro Hernández', 654321987, 'Calle Tranquila 135'),
    ('Ana Torres', 789123456, 'Avenida Principal 789'),
    ('Sofía Rodríguez', 234567891, 'Calle Central 753'),
    ('Javier Ramírez', 918273645, 'Calle Principal 987'),
    ('Valeria Silva', 567891234, 'Avenida Secundaria 642'),
    ('Gabriel Vargas', 876543219, 'Calle Tranquila 753');

-- Insertar datos en la tabla servicio
INSERT INTO servicio (nombre, precio)
VALUES
    ('Paseo', 10),
    ('Baño', 20),
    ('Corte de pelo', 15),
    ('Guardería', 30),
    ('Vacunación', 25),
    ('Desparasitación', 12),
    ('Alimentación', 8),
    ('Adiestramiento', 40),
    ('Consulta veterinaria', 35),
    ('Corte de uñas', 10);

-- Insertar datos en la tabla empleado
INSERT INTO empleado (nombre, telefono, estado)
VALUES
    ('Luisa Morales', 654789123, 1),
    ('Andrés Castro', 321987654, 1),
    ('Fernanda Ríos', 789456123, 1),
    ('Diego Mendoza', 987123456, 1),
    ('Carolina Guzmán', 456321789, 1),
    ('Roberto Sánchez', 918546372, 1),
    ('Daniela Navarro', 273645189, 1),
    ('Martín Castro', 981237465, 1),
    ('Isabella Méndez', 546372918, 1),
    ('Ricardo Guerra', 546189273, 1);

-- Insertar datos en la tabla factura
INSERT INTO factura (id_servicio, total)
VALUES
    (1, 10),
    (2, 20),
    (3, 15),
    (4, 30),
    (5, 25),
    (6, 12),
    (7, 8),
    (8, 40),
    (9, 35),
    (10, 10);

-- Insertar datos en la tabla mascota
INSERT INTO mascota (nombre, raza, tipo, fecha_nacimiento, estado, id_propietario)
VALUES
    ('Max', 'Labrador Retriever', 'Perro', '2019-01-15', 1, 1),
    ('Luna', 'Persa', 'Gato', '2020-03-10', 1, 1),
    ('Rocky', 'Bulldog Francés', 'Perro', '2018-06-20', 1, 2),
    ('Milo', 'Siames', 'Gato', '2021-02-05',1,3);

/* Insertar datos en la tabla solicitud*/
INSERT INTO solicitud (fecha_ejecucion, fecha_final, numero_horas, pago_horas, id_servicio, id_mascota, id_empleado, id_factura)
VALUES 
       ('2022-05-20', '2022-05-25', 5, 50, 1, 1, 1, 1), 
       ('2023-05-22', '2023-05-23', 3, 30, 2, 2, 2, 2);
       ('2023-04-20', '2021-05-25', 5, 50, 1, 1, 1, 1), 
       ('2023-01-22', '2022-05-23', 3, 30, 2, 2, 2, 2);
       ('2023-04-20', '2022-05-25', 5, 50, 1, 1, 1, 1), 
       ('2023-05-22', '2023-02-23', 3, 30, 2, 2, 2, 2);
       ('2023-04-20', '2023-03-25', 5, 50, 1, 1, 1, 1), 
       ('2023-05-22', '2023-08-23', 3, 30, 2, 2, 2, 2);
       ('2023-03-20', '2023-09-25', 5, 50, 1, 1, 1, 1), 
       ('2023-05-22', '2023-05-23', 3, 30, 2, 2, 2, 2);

-- Consultas 
SELECT * FROM propietario;--Esta consulta selecciona todos los registros de la tabla "propietario" y muestra todos los campos de cada registro

SELECT nombre, precio FROM servicio;--consulta nombre y precio de la tabla servicio

SELECT * FROM empleado WHERE estado = 1;--Muestra la tabla empleado donde estado es igual a 1

SELECT *
FROM solicitud
WHERE id_mascota = <id_mascota>;--Consulta solicitud donde el id mascota debe coincidir con el id mascota

SELECT nombre, telefono FROM propietario ORDER BY nombre;--Esta consulta selecciona los campos "nombre" y "telefono" de la tabla "propietario" y los ordena en orden ascendente segun el nombre

SELECT precio FROM servicio WHERE nombre = 'nombre_servicio';--Esta consulta selecciona el campo "precio" de la tabla "servicio" donde el nombre del servicio coincide con el valor proporcionado ('nombre_servicio')

SELECT nombre, telefono FROM empleado WHERE estado = true;--Esta consulta selecciona los campos "nombre" y "telefono" de la tabla "empleado" donde el estado del empleado es verdadero (activo)

SELECT nombre, raza FROM mascota WHERE id_propietario = id_propietario_especifico;--Esta consulta selecciona los campos "nombre" y "raza" de la tabla "mascota" donde el identificador del propietario coincide con el valor proporcionado (id_propietario_especifico)

SELECT SUM(numero_horas) AS total_horas_trabajadas FROM solicitud WHERE id_empleado = id_empleado_especifico;--Esta consulta utiliza la función SUM para calcular la suma de las horas (campo "numero_horas") de la tabla "solicitud" donde el identificador del empleado coincide con el valor proporcionado (id_empleado_especifico). El resultado se muestra con el alias "total_horas_trabajadas"

SELECT fecha_nacimiento FROM mascota ORDER BY fecha_nacimiento DESC;-- extrae la columna "fecha_nacimiento" de la tabla "mascota" y ordena los resultados en orden descendente (desde la fecha más reciente hasta la más antigua)



--Joins
SELECT * FROM mascota
INNER JOIN propietario ON mascota.id_propietario = propietario.id_propietario;--combina las filas de las tablas "mascota" y "propietario" solo cuando hay una coincidencia en el id_propietario. Devolverá solo las filas donde haya una relación entre una mascota y su propietario

SELECT * FROM mascota
LEFT JOIN propietario ON mascota.id_propietario = propietario.id_propietario;--devuelve todas las filas de la tabla "mascota" y las filas coincidentes de la tabla "propietario". Si no hay una coincidencia, se devolverá NULL para las columnas de "propietario"

SELECT * FROM mascota
RIGHT JOIN propietario ON mascota.id_propietario = propietario.id_propietario;--devuelve todas las filas de la tabla "propietario" y las filas coincidentes de la tabla "mascota". Si no hay una coincidencia, se devolverá NULL para las columnas de "mascota"

SELECT * FROM mascota
FULL OUTER JOIN propietario ON mascota.id_propietario = propietario.id_propietario;--devuelve todas las filas de ambas tablas, "mascota" y "propietario". Si no hay una coincidencia, se devolverá NULL para las columnas correspondientes

SELECT * FROM mascota
CROSS JOIN propietario;--combina cada fila de la tabla "mascota" con todas las filas de la tabla "propietario".

SELECT m1.nombre, m2.nombre FROM mascota m1
INNER JOIN mascota m2 ON m1.id_propietario = m2.id_propietario;-- se utiliza cuando deseas combinar filas dentro de una misma tabla. En este ejemplo, estamos uniendo la tabla "mascota" consigo misma para encontrar las mascotas que tienen el mismo propietario

SELECT * FROM mascota
NATURAL JOIN propietario;-- se utiliza cuando las columnas de unión tienen el mismo nombre en ambas tablas. Realiza una unión implícita basada en las columnas coincidentes y devuelve solo una columna para cada par de columnas coincidentes

SELECT * FROM mascota
LEFT JOIN propietario ON mascota.id_propietario = propietario.id_propietario
UNION
SELECT * FROM mascota
RIGHT JOIN propietario ON mascota.id_propietario = propietario.id_propietario;--combina los resultados de dos consultas SELECT diferentes utilizando la cláusula UNION. En este ejemplo, se unen los resultados de un LEFT JOIN y un RIGHT JOIN entre las tablas "mascota" y "propietario"

SELECT m1.nombre, m2.nombre FROM mascota m1
LEFT JOIN mascota m2 ON m1.id_propietario = m2.id_propietario;--Este join es similar al SELF JOIN, pero en este caso, se utiliza un LEFT JOIN para incluir todas las filas de la tabla "mascota" y las filas coincidentes de la tabla "mascota" para el mismo propietario

SELECT * FROM mascota
INNER JOIN propietario ON mascota.id_propietario = propietario.id_propietario
INNER JOIN servicio ON mascota.id_servicio = servicio.id_servicio;--combina las filas de las tablas "mascota", "propietario" y "servicio" solo cuando hay coincidencias en las columnas de unión especificadas. En este ejemplo, se unen las tres tablas basándose en las relaciones establecidas por los identificadores de propietario y servicio


--Triggers

    -- Trigger para la tabla propietario: antes de la inserción, modificación o eliminación
-- Verifica que el teléfono sea un número de 9 dígitos y la dirección no esté vacía
CREATE TRIGGER propietario_validacion
BEFORE INSERT OR UPDATE ON propietario
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.telefono) != 9 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El teléfono debe ser un número de 9 dígitos';
    END IF;
    IF NEW.direccion = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La dirección no puede estar vacía';
    END IF;
END;

-- Trigger para la tabla servicio: después de la inserción, modificación o eliminación
-- Actualiza el precio máximo de los servicios en la tabla propietario
CREATE TRIGGER servicio_actualizar_precio_max
AFTER INSERT OR UPDATE OR DELETE ON servicio
FOR EACH ROW
BEGIN
    UPDATE propietario
    SET precio_maximo = (SELECT MAX(precio) FROM servicio);
END;

-- Trigger para la tabla empleado: después de la eliminación
-- Elimina las solicitudes asociadas al empleado eliminado
CREATE TRIGGER empleado_eliminar_solicitudes
AFTER DELETE ON empleado
FOR EACH ROW
BEGIN
    DELETE FROM solicitud WHERE id_empleado = OLD.id_empleado;
END;

-- Trigger para la tabla factura: antes de la inserción
-- Calcula el total de la factura como el precio del servicio multiplicado por el número de horas
CREATE TRIGGER factura_calcular_total
BEFORE INSERT ON factura
FOR EACH ROW
BEGIN
    SET NEW.total = (SELECT precio FROM servicio WHERE id_servicio = NEW.id_servicio) * (SELECT numero_horas FROM solicitud WHERE id_factura = NEW.id_factura);
END;

-- Trigger para la tabla mascota: antes de la eliminación
-- Verifica que la mascota no esté asociada a ninguna solicitud antes de eliminarla
CREATE TRIGGER mascota_verificar_solicitudes
BEFORE DELETE ON mascota
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM solicitud WHERE id_mascota = OLD.id_mascota) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La mascota está asociada a una solicitud y no puede ser eliminada';
    END IF;
END;

-- Trigger para la tabla solicitud: después de la inserción o modificación
-- Actualiza el estado del propietario de la mascota si la solicitud está completada
CREATE TRIGGER solicitud_actualizar_estado_propietario
AFTER INSERT OR UPDATE ON solicitud
FOR EACH ROW
BEGIN
    DECLARE estado_propietario BOOLEAN;
    SET estado_propietario = (SELECT estado FROM mascota WHERE id_mascota = NEW.id_mascota);
    
    IF NEW.fecha_final < CURRENT_DATE AND NEW.estado = 1 THEN
        UPDATE mascota SET estado = 0 WHERE id_mascota = NEW.id_mascota;
    ELSEIF NEW.fecha_final >= CURRENT_DATE AND NEW.estado = 0 AND estado_propietario = 1 THEN
        UPDATE mascota SET estado = 1 WHERE id_mascota = NEW.id_mascota;
    END IF;
END;


-- Trigger para actualizar la columna direccion cuando se actualiza la columna telefono
CREATE TRIGGER actualizar_direccion
AFTER 
AFTER
UPDATE ON propietario
FOR EACH ROW
BEGIN
    IF NEW.telefono 
    IF NEW.telefono
<> OLD.telefono THEN
        UPDATE propietario SET direccion = CONCAT(NEW.direccion, ' - Teléfono actualizado') WHERE id_propietario = NEW.id_propietario;

END IF;
END;

-- Este trigger se ejecuta después de que se actualiza una fila en la tabla "propietario". Verifica si el número de teléfono ha cambiado y, de ser así, actualiza la columna "direccion" concatenando el nuevo número de teléfono.

-- Trigger para eliminar las mascotas asociadas cuando se elimina un propietario
CREATE TRIGGER eliminar_mascotas
AFTER 
AFTER
DELETE ON propietario
FOR EACH ROW
BEGIN
    DELETE FROM mascota WHERE id_propietario = OLD.id_propietario;
END;
-- Este trigger se ejecuta después de que se elimina una fila de la tabla "propietario". Elimina todas las filas correspondientes en la tabla "mascota" que estén asociadas al propietario eliminado.

-- Trigger para evitar la inserción de un servicio con un precio menor que 0
CREATE TRIGGER verificar_precio
BEFORE 
BE
INSERT ON servicio
FOR EACH ROW
BEGIN
    IF NEW.precio 
    IF
< 0 THEN
        SIGNAL 
       
SQLSTATE '45000' SET MESSAGE_TEXT = 'Precio inválido. El precio debe ser mayor o igual a 0.';
    
   
END IF;

END;
-- Este trigger se ejecuta antes de insertar una fila en la tabla "servicio". Verifica si el precio es menor que 0 y, de ser así, genera un error.

-- Trigger para actualizar el total en la tabla "factura" cuando se actualiza el precio en la tabla "servicio"
CREATE TRIGGER actualizar_total_factura
AFTER UPDATE ON servicio
FOR EACH ROW
BEGIN
    
   
UPDATE factura SET total = NEW.precio WHERE id_servicio = NEW.id_servicio;
END;
-- Este trigger se ejecuta después de actualizar una fila en la tabla "servicio". Actualiza el campo "total" en la tabla "factura" con el nuevo precio del servicio correspondiente.

-- Trigger para establecer el estado como "inactivo" cuando se elimina un empleado
CREATE TRIGGER establecer_estado_inactivo
BEFORE DELETE ON empleado
FOR EACH ROW
BEGIN
    UPDATE empleado SET estado = FALSE WHERE id_empleado = OLD.id_empleado;
END;
-- Este trigger se ejecuta antes de eliminar una fila de la tabla "empleado". Establece el estado del empleado como "inactivo" antes de la eliminación.

-- Trigger para evitar la actualización del estado de un empleado a NULL
CREATE TRIGGER evitar_null_estado
BEFORE UPDATE ON empleado
FOR EACH ROW
BEGIN
    IF NEW.estado 
    IF
IS NULL THEN
        SIGNAL 
        SIGNAL
SQLSTATE '45000' SET MESSAGE_TEXT = 'El estado no puede ser NULL.';
    END IF;
END;
-- Este trigger se ejecuta antes de actualizar una fila en la tabla "empleado". Verifica si el nuevo valor del estado es NULL y, de ser así, genera un error.

--Trigger para actualizar la columna direccion cuando se actualiza la columna telefono
CREATE TRIGGER actualizar_direccion
AFTER UPDATE ON propietario
FOR EACH ROW
BEGIN
    IF NEW.telefono <> OLD.telefono THEN
        UPDATE propietario SET direccion = CONCAT(NEW.direccion, ' - Teléfono actualizado') WHERE id_propietario = NEW.id_propietario;
    END IF;
END;
-- Este trigger se ejecuta después de que se actualiza una fila en la tabla "propietario". Verifica si el número de teléfono ha cambiado y, de ser así, actualiza la columna "direccion" concatenando el nuevo número de teléfono.

-- Trigger para eliminar las mascotas asociadas cuando se elimina un propietario
CREATE TRIGGER eliminar_mascotas
AFTER DELETE ON propietario
FOR EACH ROW
BEGIN
    DELETE FROM mascota WHERE id_propietario = OLD.id_propietario;
END;
-- Este trigger se ejecuta después de que se elimina una fila de la tabla "propietario". Elimina todas las filas correspondientes en la tabla "mascota" que estén asociadas al propietario eliminado.

-- Trigger para evitar la inserción de un servicio con un precio menor que 0
CREATE TRIGGER verificar_precio
BEFORE INSERT ON servicio
FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Precio inválido. El precio debe ser mayor o igual a 0.';
    END IF;
END;
-- Este trigger se ejecuta antes de insertar una fila en la tabla "servicio". Verifica si el precio es menor que 0 y, de ser así, genera un error.

-- Trigger para actualizar el total en la tabla "factura" cuando se actualiza el precio en la tabla "servicio"
CREATE TRIGGER actualizar_total_factura
AFTER UPDATE ON servicio
FOR EACH ROW
BEGIN
    UPDATE factura SET total = NEW.precio WHERE id_servicio = NEW.id_servicio;
END;
-- Este trigger se ejecuta después de actualizar una fila en la tabla "servicio". Actualiza el campo "total" en la tabla "factura" con el nuevo precio del servicio correspondiente.

-- Trigger para establecer el estado como "inactivo" cuando se elimina un empleado
CREATE TRIGGER establecer_estado_inactivo
BEFORE DELETE ON empleado
FOR EACH ROW
BEGIN
    UPDATE empleado SET estado = FALSE WHERE id_empleado = OLD.id_empleado;
END;
-- Este trigger se ejecuta antes de eliminar una fila de la tabla "empleado". Establece el estado del empleado como "inactivo" antes de la eliminación.

-- Trigger para evitar la actualización del estado de un empleado a NULL
CREATE TRIGGER evitar_null_estado
BEFORE UPDATE ON empleado
FOR EACH ROW
BEGIN
    IF NEW.estado IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El estado no puede ser NULL.';
    END IF;
END;
-- Este trigger se ejecuta antes de actualizar una fila en la tabla "empleado". Verifica si el nuevo valor del estado es NULL y, de ser así, genera un error.


--Vistas

CREATE VIEW vista_mascota AS
SELECT nombre,raza,fecha_nacimiento 
FROM mascota;
--vista que muestra una lista de las mascotas con su respectivo nombre, raza y fecha de naciemiento 



CREATE VIEW vista_propietario AS
SELECT propietario.id_propietario AS id_propietario, propietario.nombre AS propietario_nombre, mascota.id_mascota AS mascota_id, mascota.nombre
AS mascota_nombre
FROM propietario
JOIN mascota  ON propietario.id_propietario = mascota.id_mascota;   --esta vista muestra una lista de todos los propietarios que estan asociados con las mascotas mostrando su nombre y su identificador 


CREATE VIEW vista_empleados_disponibles AS
SELECT empleado.id_empleado AS empleado_id, empleado.nombre AS empleado_nombre, estado 
FROM empleado;                   --esta vista va a mostrar los empleados que estan disponibles y los que no estan ocupados


CREATE VIEW vista_solicitud AS 
SELECT mascota.id_mascota AS mascota_id, mascota.nombre AS mascota_nombre, propietario.id_propietario, propietario.nombre 
AS propietario_nombre, solicitud.fecha_ejecucion, solicitud.fecha_final
FROM mascota
INNER JOIN solicitud ON mascota.id_mascota = solicitud.id_mascota
INNER JOIN propietario ON propietario.id_propietario = mascota.id_propietario;  --esta vista muestra las solicitudes que hace cada mascota incluyendo detalles como la fecha de ejecucion y la fecha final 


CREATE VIEW vista_precio AS
SELECT servicio.id_servicio, nombre, precio
FROM servicio;                              
 --esta vista muestra el precio de todos los servicios de la guarderia 



CREATE VIEW vista_telefono_propietario AS
SELECT propietario.id_propietario AS propietario_id, propietario.nombre AS nombre_propietario, propietario.telefono AS telefono_propietario
FROM propietario;  -- esta vista muestra el numero de telefono de cada propietario perteneciente de las mascotas junto con su nombre

CREATE VIEW vista_factura_total AS SELECT factura.id_factura, factura.total, mascota.nombre AS nombre_mascota, mascota.raza AS nombre_propietario, propietario.nombre FROM factura JOIN mascota ON factura.id_factura= mascota.id_mascota JOIN propietario ON mascota.id_propietario= propietario.id_propietario;
-- esta vista muestra el total de la factura de cada mascota y mostrando su respectivo propietario de cada una


CREATE VIEW vista_servicios AS
SELECT servicio.id_servicio, servicio.nombre AS nombre_servicio
FROM servicio
JOIN solicitud ON servicio.id_servicio = solicitud.id_servicio
-- esta vista muestra todos los servicios disponibles que tiene la guarderia canina


CREATE VIEW vista_horas_solicitud AS
SELECT solicitud.numero_horas AS hora_solicitud, mascota.nombre AS nombre_mascota, propietario.nombre AS nombre_propietario
FROM solicitud 
JOIN mascota  ON solicitud.id_mascota = mascota.id_mascota
JOIN propietario ON mascota.id_propietario =  propietario.id_propietario;
--esta vista te muestra la hora en la que el propietario hizo una solicitud 



CREATE VIEW vista_direccion_prop AS
SELECT propietario.direccion, propietario.nombre 
FROM mascota
JOIN propietario ON mascota.id_propietario = propietario.id_propietario;
--esta vista muestra la direccion de cada propietario dando el barrio de cada uno 

--Funciones Y procedimientos 
Función "agregar_propietario"--: Enunciado: Esta función permite agregar un nuevo propietario a la base de datos. Parámetros de entrada: nombre (cadena de caracteres), teléfono (entero sin signo), dirección (cadena de caracteres). Parámetro de salida: Ninguno.
Función "agregar_servicio"--: Enunciado: Esta función permite agregar un nuevo servicio a la base de datos. Parámetros de entrada: nombre (cadena de caracteres), precio (entero sin signo). Parámetro de salida: Ninguno.
Función "agregar_empleado"--: Enunciado: Esta función permite agregar un nuevo empleado a la base de datos. Parámetros de entrada: nombre (cadena de caracteres), teléfono (entero sin signo), estado (booleano). Parámetro de salida: Ninguno.
Función "agregar_factura"--: Enunciado: Esta función permite agregar una nueva factura a la base de datos.
Función "agregar_mascota"--: Enunciado: Esta función permite agregar una nueva mascota a la base de datos. Parámetros de entrada: nombre (cadena de caracteres), raza (cadena de caracteres), tipo (cadena de caracteres), fecha_n
Función "agregar_solicitud"--: Enunciado: Esta función
Procedimiento "actualizar_propietario"--: Enunciado: Este procedimiento
Procedimiento "actualizar_servicio"--: Enunciado: Este procedimiento permite actualizar los datos de un servicio existente en la base de datos. Parámetros de entrada: id_servicio (entero sin signo), nombre (cadena de caracteres), precio (entero sin signo). Parámetro de salida: Ninguno.
Procedimiento "actualizar_empleado"--: Enunciado: Este procedimiento permite actualizar los datos de un empleado existente en la base de datos. Parámetros de entrada: id_empleado (entero sin signo), nombre (cadena de caracteres), telefono (entero sin signo), estado (booleano). Parámetro de salida: Ninguno.
Procedimiento "actualizar_mascota"--: Enunciado: Este procedimiento permite actualizar los datos de una mascota existente en la base de datos.
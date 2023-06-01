--Disparador para asegurarse de que el nombre del propietario no esté vacío
DELIMITER //
CREATE TRIGGER tr_nombre_propietario_not_empty
BEFORE INSERT ON propietario
FOR EACH ROW
BEGIN
    IF NEW.nombre = '' OR NEW.nombre IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre del propietario no puede estar vacío.';
    END IF;
END //
DELIMITER ;

--Disparador para verificar que el teléfono del propietario sea un número positivo:

DELIMITER //
CREATE TRIGGER tr_telefono_propietario_positive
BEFORE INSERT ON propietario
FOR EACH ROW
BEGIN
    IF NEW.telefono <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El teléfono del propietario debe ser un número positivo.';
    END IF;
END //
DELIMITER ;

--Disparador para asegurarse de que el precio del servicio sea un número positivo:
DELIMITER //
CREATE TRIGGER tr_precio_servicio_positive
BEFORE INSERT ON servicio
FOR EACH ROW
BEGIN
    IF NEW.precio <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio del servicio debe ser un número positivo.';
    END IF;
END //
DELIMITER ;

--Disparador para validar el estado del empleado (solo permitir activo o inactivo):
DELIMITER //
CREATE TRIGGER tr_estado_empleado_valid
BEFORE INSERT ON empleado
FOR EACH ROW
BEGIN
    IF NEW.estado != 0 AND NEW.estado != 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El estado del empleado debe ser 0 (inactivo) o 1 (activo).';
    END IF;
END //
DELIMITER ;

--Disparador para asegurarse de que el total de la factura sea un número positivo:
DELIMITER //
CREATE TRIGGER tr_total_factura_positive
BEFORE INSERT ON factura
FOR EACH ROW
BEGIN
    IF NEW.total <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El total de la factura debe ser un número positivo.';
    END IF;
END //
DELIMITER ;
--Disparador para validar el tipo de mascota (solo permitir "perro", "gato" u "otros"):
DELIMITER //
CREATE TRIGGER tr_tipo_mascota_valid
BEFORE INSERT ON mascota
FOR EACH ROW
BEGIN
    IF NEW.tipo != 'perro' AND NEW.tipo != 'gato' AND NEW.tipo != 'otros' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo de mascota debe ser "perro", "gato" u "otros".';
    END IF;
END //
DELIMITER ;
--Disparador para asegurarse de que la fecha de nacimiento de la mascota no sea futura:
DELIMITER //
CREATE TRIGGER tr_fecha_nacimiento_mascota_past
BEFORE INSERT ON mascota
FOR EACH ROW
BEGIN
    IF NEW.fecha_nacimiento > CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de nacimiento de la mascota no puede ser futura.';
    END IF;
END //
DELIMITER ;

--Disparador para asegurarse de que el número de horas de la solicitud sea un número positivo:
DELIMITER //
CREATE TRIGGER tr_numero_horas_solicitud_positive
BEFORE INSERT ON solicitud
FOR EACH ROW
BEGIN
    IF NEW.numero_horas <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El número de horas de la solicitud debe ser un número positivo.';
    END IF;
END //
DELIMITER ;
--Disparador para asegurarse de que el pago por horas de la solicitud sea un número positivo:
DELIMITER //
CREATE TRIGGER tr_pago_horas_solicitud_positive
BEFORE INSERT ON solicitud
FOR EACH ROW
BEGIN
    IF NEW.pago_horas <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El pago por horas de la solicitud debe ser un número positivo.';
    END IF;
END //
DELIMITER ;

  --Disparador para validar que la fecha final de la solicitud sea posterior a la fecha de ejecución:


DELIMITER //
CREATE TRIGGER tr_fecha_final_solicitud_valid
BEFORE INSERT ON solicitud
FOR EACH ROW
BEGIN
    IF NEW.fecha_final <= NEW.fecha_ejecucion THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha final de la solicitud debe ser posterior a la fecha de ejecución.';
    END IF;
END //
DELIMITER ;




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

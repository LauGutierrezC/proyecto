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
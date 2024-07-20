-- CREAR STORE PROCEDURE
DELIMITER //

CREATE PROCEDURE sp_saludar_nombre(IN nombre VARCHAR(50))
BEGIN
    SELECT CONCAT("Hola ", nombre) AS saludo;

END //

DELIMITER ;

-- EJECUTAR STORE PROCEDURE
CALL sp_saludar_nombre("Mi nombre");

-- EJECUTAR STORE PROCEDURE CON UNA VARIABLE
SET @nombre = "Mi nombre";
CALL saludar_nombre(@nombre);
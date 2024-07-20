-- CREAR FUNCION
DELIMITER //

CREATE FUNCTION get_numero_factura(_id INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN 
	DECLARE numero VARCHAR(10);
	
	SELECT CONCAT(serie, '-', folio) INTO numero FROM facturas WHERE id = _id;
	
	RETURN numero;
END //

DELIMITER ;

-- EJECUTAR FUNCIÓN
SELECT get_numero_factura(id) AS numero FROM facturas WHERE id = 2;
SELECT id, serie, folio, get_numero_factura(id), total AS numero FROM facturas WHERE id = 2;
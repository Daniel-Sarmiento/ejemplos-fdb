-- CREAR STORE PROCEDURE
DELIMITER //

CREATE PROCEDURE sp_registrar_pago(IN _monto DECIMAL(10, 2), IN _factura_id INT)
BEGIN 
	DECLARE monto_pagado_fact DECIMAL(10, 2); 
	DECLARE total_fact DECIMAL(10, 2);
	
	INSERT INTO pagos(monto, fecha, factura_id) VALUES (_monto, NOW(), _factura_id);
	
	UPDATE facturas 
	SET monto_pagado = monto_pagado + _monto
	WHERE id = _factura_id;
	
	SELECT monto_pagado INTO monto_pagado_fact FROM facturas WHERE id = _factura_id;
	SELECT total INTO total_fact FROM facturas WHERE id = _factura_id;

	-- SELECT monto_pagado, total INTO monto_pagado_fact, total_fact FROM facturas WHERE id = _factura_id;
	
	IF monto_pagado_fact >= total_fact THEN
		UPDATE facturas
		SET pagado = TRUE
		WHERE id = _factura_id;
	END IF;
END //

DELIMITER ;

-- EJECUTAR STORE PROCEDURE
CALL sp_registrar_pago(44256.12, 1);
CALL sp_registrar_pago(100000, 1);
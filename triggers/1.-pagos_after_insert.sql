-- CREAR TRIGGER
DELIMITER //

CREATE TRIGGER pagos_after_insert 
	AFTER INSERT ON pagos
	FOR EACH ROW
BEGIN
   DECLARE monto_pagado_fact DECIMAL(10, 2); 
	DECLARE total_fact DECIMAL(10, 2);
	
	UPDATE facturas 
	SET monto_pagado = monto_pagado + NEW.monto
	WHERE id = NEW.factura_id;
	
	SELECT monto_pagado INTO monto_pagado_fact FROM facturas WHERE id = NEW.factura_id;
	SELECT total INTO total_fact FROM facturas WHERE id = NEW.factura_id;

	-- SELECT monto_pagado, total INTO monto_pagado_fact, total_fact FROM facturas WHERE id = NEW.factura_id;
	
	IF monto_pagado_fact >= total_fact THEN 
		UPDATE facturas 
		SET pagado = TRUE 
		WHERE id = NEW.factura_id;
	END IF;
		
END //

DELIMITER ;

-- INSERTAR PAGOS PARA QUE SE EJECUTE EL TRIGGER
INSERT INTO pagos (monto, fecha, factura_id)
VALUES (321.05, NOW(), 3);

INSERT INTO pagos (monto, fecha, factura_id)
VALUES (256000, NOW(), 3);
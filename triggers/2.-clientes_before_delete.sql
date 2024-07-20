-- CREAR TRIGGER
DELIMITER //

CREATE TRIGGER clientes_before_delete
	BEFORE DELETE ON clientes
	FOR EACH ROW
BEGIN 
	DECLARE facts_no_pagadas INT;
	
	SELECT COUNT(*) INTO facts_no_pagadas FROM facturas WHERE cliente_id = OLD.id AND pagado = 0;
	
	IF facts_no_pagadas > 0 THEN
		SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'No se puede eliminar un cliente que tiene deuda';
	END IF;
	
END //

DELIMITER ;
CREATE DATABASE ejemplos_bd;
USE ejemplos_bd;

-- CLIENTES
CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(50),
    created_at DATETIME NOT NULL DEFAULT NOW(),
    updated_at DATETIME DEFAULT NULL ON UPDATE NOW()
);

#Insertar datos demo clientes
INSERT INTO clientes(nombre, telefono, email) 
VALUES
('Juan García', '31256231', 'juang@gmail.com'),
('Paola Ochoa', '25689411', 'paol@gmail.com'),
('Margarita Lopez', '32569854', 'margarlop@gmail.com'),
('Johan Monsalve', '121212365', 'monsajh@gmail.com');

-- FACTURAS
CREATE TABLE facturas (
	 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    serie CHAR(1),
    folio VARCHAR(30),
    total DECIMAL(10,2),
    monto_pagado DECIMAL(10,2),
    pagado BOOLEAN,
    fecha_emision DATE,
    cliente_id INT,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    updated_at DATETIME DEFAULT NULL ON UPDATE NOW()
);

INSERT INTO facturas(serie, folio, total, monto_pagado, pagado, fecha_emision, cliente_id)
VALUES
('A', '1234', 144256.12, 0, false, '2024-07-01', 4),
('B', '7434', 256321.05, 0, false, '2024-06-19', 2),
('A', '5634', 8560.00, 0, false, '2024-06-22', 3),
('C', '4134', 35689.23, 0, false, '2024-06-28', 1);

-- PAGOS
CREATE TABLE pagos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    monto DECIMAL(10,2),
    fecha DATETIME,
    factura_id INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    updated_at DATETIME DEFAULT NULL ON UPDATE NOW()
);
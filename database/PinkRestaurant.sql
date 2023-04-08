CREATE DATABASE PinkRestaurant_DB_v2;
USE PinkRestaurant_DB_v2;

-- Tablas sin llaves foranéas

CREATE TABLE Producto (
	id_producto  INTEGER NOT NULL,
    nombre_producto VARCHAR(150) NOT NULL,
    detalles_producto VARCHAR(300) NOT NULL,
    tipo_producto  VARCHAR(50) NOT NULL,
    costo_producto DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY (id_producto)
);

CREATE TABLE Ingrediente (
	id_ingrediente  INTEGER NOT NULL,
    nombre_ingrediente VARCHAR(150) NOT NULL,
    CONSTRAINT pk_ingrediente PRIMARY KEY (id_ingrediente)
);

CREATE TABLE Cliente (
	id_cliente  INTEGER NOT NULL,
    nombre_cliente VARCHAR(50) NOT NULL,
    apellido_p_cliente VARCHAR(50) NOT NULL,
    apellido_m_cliente VARCHAR(50) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE Forma_Pago (
	id_pago INTEGER NOT NULL,
    forma_de_pago VARCHAR(50) NOT NULL,
    CONSTRAINT pk_pago PRIMARY KEY (id_pago)
);

CREATE TABLE Horario (
	id_horario  INTEGER NOT NULL,
    apertura TIME NOT NULL,
    cerrada TIME NOT NULL,
    CONSTRAINT pk_horario PRIMARY KEY (id_horario)
);


CREATE TABLE Estado (
	id_estado  INTEGER NOT NULL,
    nombre_estado VARCHAR(50) NOT NULL,
    CONSTRAINT pk_estado PRIMARY KEY (id_estado)
);

CREATE TABLE Contacto (
	contacto_id INTEGER NOT NULL,
	lada INT NOT NULL,
    tel INT NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT pk_contacto PRIMARY KEY (contacto_id)
);

-- Tablas con llaves foranéas

CREATE TABLE Detalle_Ingrediente (
	d_producto_id  INTEGER NOT NULL,
    d_ingrediente_id INTEGER NOT NULL,
    cantidad  INT,
    CONSTRAINT pk_detalle_ingrediente PRIMARY KEY (d_producto_id, d_ingrediente_id ),
    CONSTRAINT fk_d_producto FOREIGN KEY (d_producto_id) REFERENCES Producto(id_producto),
    CONSTRAINT fk_d_ingrediente FOREIGN KEY (d_ingrediente_id) REFERENCES Ingrediente(id_ingrediente)
);

CREATE TABLE Domicilio (
	domicilio_id  INTEGER NOT NULL,
    calle VARCHAR(50) NOT NULL,
    num_ext INT NOT NULL,
    num_int INT,
    colonia VARCHAR(50) NOT NULL,
    municipio VARCHAR(50) NOT NULL,
    cp_domicilio INT NOT NULL,
    d_estado_id INTEGER NOT NULL, 
    CONSTRAINT pk_domicilio PRIMARY KEY (domicilio_id),
    CONSTRAINT fk_d_estado FOREIGN KEY (d_estado_id) REFERENCES Estado(id_estado)
);


CREATE TABLE Sucursal (
	sucursal_id  INTEGER NOT NULL,
    nombre_sucursal VARCHAR(50) NOT NULL,
    horario_sucursal_id INTEGER NOT NULL,
    domicilio_sucursal_id INTEGER NOT NULL,
    contacto_sucursal_id INTEGER NOT NULL,
    CONSTRAINT pk_sucursal PRIMARY KEY (sucursal_id ),
    CONSTRAINT fk_horario_sucursal FOREIGN KEY (horario_sucursal_id) REFERENCES Horario(id_horario),
    CONSTRAINT fk_domicilio_sucursal FOREIGN KEY (domicilio_sucursal_id) REFERENCES Domicilio(domicilio_id),
    CONSTRAINT fk_contacto_sucursal FOREIGN KEY (contacto_sucursal_id) REFERENCES Contacto(contacto_id)
);

CREATE TABLE Empleado (
	id_empleado  INTEGER NOT NULL,
    nombre_empleado VARCHAR(50) NOT NULL,
    apellido_p_empleado VARCHAR(50) NOT NULL,
    apellido_m_empleado VARCHAR(50) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    contacto_empleado_id INTEGER NOT NULL,
    domicilio_empleado_id INTEGER NOT NULL,
    sucursal_empleado_id INTEGER NOT NULL,
    CONSTRAINT pk_empleado PRIMARY KEY (id_empleado),
    CONSTRAINT fk_contacto_empleado FOREIGN KEY (contacto_empleado_id) REFERENCES Contacto(contacto_id),
    CONSTRAINT fk_domicilio_empleado FOREIGN KEY (domicilio_empleado_id) REFERENCES Domicilio(domicilio_id),
    CONSTRAINT fk_sucursal_empleado FOREIGN KEY (sucursal_empleado_id) REFERENCES Sucursal(sucursal_id)
);

CREATE TABLE Pedido (
	id_pedido  INTEGER NOT NULL,
    num_mesa INT NOT NULL,
    pedido_fecha DATE NOT NULL,
    pedido_empleado_id  INTEGER NOT NULL,
    pedido_forma_pago_id INTEGER NOT NULL,
    pedido_cliente_id  INTEGER NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedido_empleado FOREIGN KEY (pedido_empleado_id) REFERENCES Empleado(id_empleado),
    CONSTRAINT fk_pedido_forma_pago FOREIGN KEY (pedido_forma_pago_id) REFERENCES Forma_Pago(id_pago),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (pedido_cliente_id) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Detalle_Pedido (
	d_pedido_id  INTEGER NOT NULL,
	cantidad_pedido INT NOT NULL,
    d_pedido_pedido_id INTEGER NOT NULL,
    d_peidido_producto_id INTEGER NOT NULL,
    CONSTRAINT pk_detalle_pedido PRIMARY KEY (d_pedido_id),
    CONSTRAINT fk_d_pedido_pedido FOREIGN KEY (d_pedido_pedido_id) REFERENCES Pedido(id_pedido),
    CONSTRAINT fk_d_peidido_producto FOREIGN KEY (d_peidido_producto_id) REFERENCES Producto(id_producto)
);

-- LLENAR DATOS
INSERT INTO Producto (  id_producto , nombre_producto, detalles_producto, tipo_producto, costo_producto) VALUES (
	'1', 'Chilaquiles Verdes', 'Chilaquiles Verdes is a traditional Mexican dish made from lightly fried corn tortillas covered in a bright and flavorful salsa verde.', 'Desayuno', 130.00);
    
-- INGREDIENTES
INSERT INTO Ingrediente (  id_ingrediente , nombre_ingrediente) VALUES (
	1, 'Tomate');

INSERT INTO Ingrediente (  id_ingrediente , nombre_ingrediente) VALUES (
	2, 'Cebolla');

INSERT INTO Ingrediente (  id_ingrediente , nombre_ingrediente) VALUES (
	3, 'Pimiento Verde');

INSERT INTO Ingrediente (  id_ingrediente , nombre_ingrediente) VALUES (
	4, 'Ajo');

INSERT INTO Ingrediente (  id_ingrediente , nombre_ingrediente) VALUES (
	5, 'Tortilla');

INSERT INTO Ingrediente (  id_ingrediente , nombre_ingrediente) VALUES (
	6, 'Queso Panela');
    
INSERT INTO Ingrediente (  id_ingrediente , nombre_ingrediente) VALUES (
	7, 'Pollo');
    
    -- CLIENTES
INSERT INTO Cliente (  id_cliente , nombre_cliente, apellido_p_cliente,  apellido_m_cliente ) VALUES (
	1, 'Ximena', 'Toledo', 'Rivera');

INSERT INTO Cliente (  id_cliente , nombre_cliente, apellido_p_cliente,  apellido_m_cliente ) VALUES (
	2, 'Moisés Isaí', 'Arroyo', 'Rodríguez');    

-- FORMA DE PAGO
INSERT INTO Forma_Pago (  id_pago , forma_de_pago ) VALUES (
	1, 'Efectivo'); 

INSERT INTO Forma_Pago (  id_pago , forma_de_pago ) VALUES (
	2, 'Tarjeta de débito');    
    
INSERT INTO Forma_Pago (  id_pago , forma_de_pago ) VALUES (
	3, 'Tarjeta de Crédito');    
    
INSERT INTO Forma_Pago (  id_pago , forma_de_pago ) VALUES (
	4, 'Tarjeta de prepago'); 

INSERT INTO Forma_Pago (  id_pago , forma_de_pago ) VALUES (
	5, 'Cheques');    
    
-- HORARIO
INSERT INTO Horario ( id_horario , apertura,  cerrada) VALUES (
	1, '08:30','20:30' );  
    
INSERT INTO Horario ( id_horario , apertura,  cerrada) VALUES (
	2, '07:30','19:30' );  

-- ESTADOS
INSERT INTO Estado ( id_estado , nombre_estado) VALUES (
	1, 'Estado de México' );  
    
INSERT INTO Estado ( id_estado , nombre_estado) VALUES (
	2, 'Puebla' );  

-- CONTACTO
INSERT INTO Contacto ( contacto_id , lada,  tel , email) VALUES (
	1, '52','0101010101', 'sucursal1@gmail.com' ); 
    
INSERT INTO Contacto ( contacto_id , lada,  tel , email) VALUES (
	2, '52','0202020202', 'sucursal2@gmail.com' ); 
    
INSERT INTO Contacto ( contacto_id , lada,  tel , email) VALUES (
	3, '52','0303030303', 'persona1@gmail.com' );
    
INSERT INTO Contacto ( contacto_id , lada,  tel , email) VALUES (
	4, '52','0404040404', 'persona2@gmail.com' ); 

-- Detalle Ingrediente
INSERT INTO Detalle_Ingrediente ( d_producto_id , d_ingrediente_id,  cantidad) VALUES (
	1, 1, 1); 
INSERT INTO Detalle_Ingrediente ( d_producto_id , d_ingrediente_id,  cantidad) VALUES (
	1, 2, 2 ); 
INSERT INTO Detalle_Ingrediente ( d_producto_id , d_ingrediente_id,  cantidad) VALUES (
	1, 3,1 ); 
INSERT INTO Detalle_Ingrediente ( d_producto_id , d_ingrediente_id,  cantidad) VALUES (
	1, 4,1 ); 
INSERT INTO Detalle_Ingrediente ( d_producto_id , d_ingrediente_id,  cantidad) VALUES (
	1, 5,1 );
    
-- DOMICILIO
INSERT INTO Domicilio ( domicilio_id  , calle,  num_ext, num_int, colonia, municipio, cp_domicilio ,d_estado_id ) VALUES (
	1, 'Álvaro Obregon',1,11, 'Centro', 'Juarez',11111, 1); 
    
INSERT INTO Domicilio ( domicilio_id  , calle,  num_ext, num_int, colonia, municipio, cp_domicilio ,d_estado_id ) VALUES (
	2, 'Riva Palacios',2,22, 'Centro', 'Iguala',22222, 2); 
    
-- Sucursal
INSERT INTO Sucursal ( sucursal_id, nombre_sucursal, horario_sucursal_id, domicilio_sucursal_id , contacto_sucursal_id ) VALUES (
	1, 'Sucursal Obregon',1,1,1); 
    
INSERT INTO Sucursal ( sucursal_id, nombre_sucursal, horario_sucursal_id, domicilio_sucursal_id , contacto_sucursal_id ) VALUES (
	2, 'Sucursal Rivas',2,2,2); 

-- Empleado

INSERT INTO Empleado ( id_empleado, nombre_empleado, apellido_p_empleado, apellido_m_empleado, rfc , rol, contacto_empleado_id , domicilio_empleado_id,  sucursal_empleado_id ) VALUES (
	1, 'Jorge', 'Toledano', 'Martínez', 1234567890123, 'Camarero', 3, 1,1); 

INSERT INTO Empleado ( id_empleado, nombre_empleado, apellido_p_empleado, apellido_m_empleado, rfc , rol, contacto_empleado_id , domicilio_empleado_id,  sucursal_empleado_id ) VALUES (
	2, 'Mar', 'Lorell', 'Rivas', 1234567890124, 'Cajero', 4, 2,2); 

-- Pedido
INSERT INTO Pedido ( id_pedido,  num_mesa , pedido_fecha, pedido_empleado_id, pedido_forma_pago_id , pedido_cliente_id   ) VALUES (
	1,  2, '2022-10-3', 1, 1, 1); 
    
INSERT INTO Pedido ( id_pedido,  num_mesa , pedido_fecha, pedido_empleado_id, pedido_forma_pago_id , pedido_cliente_id   ) VALUES (
	2,  3, '2022-9-3', 2, 2, 2); 

-- Detalle del pedido
INSERT INTO Detalle_Pedido  (  d_pedido_id, cantidad_pedido, d_pedido_pedido_id, d_peidido_producto_id ) VALUES (
	1,  2, 1,1); 

INSERT INTO Detalle_Pedido  (  d_pedido_id, cantidad_pedido, d_pedido_pedido_id, d_peidido_producto_id ) VALUES (
	2,  4, 2,1); 
    

    
    


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


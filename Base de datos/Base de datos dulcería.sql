DROP DATABASE Dulceria;

CREATE DATABASE Dulceria;

USE Dulceria;

CREATE TABLE TipoProducto
(
	IdTipoProducto INT PRIMARY KEY auto_increment,
	Marca VARCHAR(150) NOT NULL,
	Nombre VARCHAR(150) NOT NULL
);

CREATE TABLE Producto
(
IdProducto INT PRIMARY KEY auto_increment,
Nombre VARCHAR(100) NOT NULL,
Referencia VARCHAR(150) NOT NULL,
Cantidad INT NOT NULL,
Costo DECIMAL NOT NULL,
IdTipoProducto Int,
 foreign key(IdTipoProducto) References TipoProducto(IdTipoProducto)
);

CREATE TABLE Mensaje
(
IdMensaje INT PRIMARY KEY auto_increment,
Fecha DATE NOT NULL,
Encabezado VARCHAR(200) NOT NULL,
Cuerpo VARCHAR(500) NOT NULL
);

CREATE TABLE Cliente
(
IdCliente INT PRIMARY KEY auto_increment, 
Identificacion VARCHAR(50) NOT NULL,
Nombre VARCHAR(100) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
Celular VARCHAR(20),
CorreoElectronico VARCHAR(100)
);

CREATE TABLE Pedido
(
IdPedido INT PRIMARY KEY auto_increment,
Fecha DATETIME NOT NULL,
Proveedor VARCHAR(150) NOT NULL,
NumeroFactura VARCHAR(80) NOT NULL,
Cantidad INT NOT NULL,
IdCliente INT, 
 foreign key(IdCliente) References Cliente(IdCliente)
);

CREATE TABLE ClienteMensaje
(
IdClienteMensaje INT PRIMARY KEY auto_increment,
IdCliente INT,
IdMensaje INT, 
 foreign key(IdCliente) References Cliente(IdCliente),
 foreign key(IdMensaje) References Mensaje(IdMensaje)
);

CREATE TABLE PedidoProducto
(
IdPedidoProducto INT PRIMARY KEY auto_increment,
IdProducto INT, 
 foreign key(IdProducto) References Producto(IdProducto),
IdPedido INT, 
 foreign key(IdPedido) References Pedido(IdPedido)
);


insert into tipoproducto (Marca, nombre) values ('Colombina','caramelos');
insert into tipoproducto (Marca, nombre) values ('Trululu','gomas');
insert into tipoproducto (Marca, nombre) values ('ramo','ponques');
insert into tipoproducto (Marca, nombre) values ('superricas','papas');
insert into tipoproducto (Marca, nombre) values ('kinder','chocolates');
insert into tipoproducto (Marca, nombre) values ('colombina','bon bon bum');
insert into tipoproducto (Marca, nombre) values ('margarita','papas');
insert into tipoproducto (Marca, nombre) values ('nestle','galletas');
insert into tipoproducto (Marca, nombre) values ('Jet','chocolatess');
insert into tipoproducto (Marca, nombre) values ('noel','galletas');

select * from tipoproducto;


insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('aros de goma', 'KAC12', 120, 5000, 2);
insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('Jet blanca', 'KAC45', 300, 6000, 9);
insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('ponque ramo', 'KAC72', 420, 8000, 3);
insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('Chocorramo', 'KAC21', 150, 2500, 3);
insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('gansito', 'KAC98', 220, 1500, 3);
insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('gomas dinosaurio', 'KAC452', 100, 5100, 2);
insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('jet en crema', 'KAC25', 850, 10000, 9);
insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('chocolatina kinder', 'KAC14', 230, 3000, 5);
insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('huevo kinder', 'KAC234', 150, 8000, 5);
insert into producto (nombre, referencia, cantidad, costo, idtipoproducto) values ('papas de limòn', 'KAC297', 520, 2500, 7);


select * from producto; 

insert into Mensaje (Fecha, encabezado, cuerpo) values ('2023/02/12','GRAN INAUGURACION', 'Tenemos el gusto de invitarlos a la gran inauguraciòn de nuestra tienda, tendremos excelentes actividades y descuentos');
insert into Mensaje (Fecha, encabezado, cuerpo) values ('2023/02/28','GRAN PROMOCION', 'Apreciados clientes, tenemos el gusto de infromarles que nuestra tienda cuenta con un 20% de descuento el dìa de hoy en sus productos');
insert into Mensaje (Fecha, encabezado, cuerpo) values ('2023/03/10','EVENTO', 'El dìa de mañana tendremos descuento en productos seleccionados');

select * from mensaje; 

insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (1109840257, 'Alexandra', 'Prada Oyola', 3025234476, 'alexandraprada91@gmail.com');
insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (1014976577, 'Camila', 'Sora Matinez', 3223600883, 'ncamilasora@gmail.com');
insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (1016944349, 'Karen', 'Bermùdez Duràn', 3228249906, 'karenb1407@hotmail.com');
insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (65791058, 'Yuri', 'Oyola', 321525906, 'yor1982@hotmail.com');
insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (1254620530, 'Felipe', 'Ramirez', 3145236451, 'framirez12@hotmail.com');
insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (45219710, 'Andrea', 'Castro', 3215468523, 'castro@gmail.com');
insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (4563201252, 'Juan', 'Orozco', 3002456325, 'juanito@hotmail.com');
insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (10236525, 'Andres',' Arias', 3012546523, 'andresarias11@hotmail.com');
insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (1210366578, 'Camilo', 'Perez', 3144324149, 'cperez@hotmail.com');
insert into cliente (identificacion, nombre, apellido, celular, correoelectronico) values (65742534, 'Alexander', 'Prada', 3163345002, 'alprada@gmail.com');

select * from cliente;

insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/02/12','Dulces magicos', '12524', '15', '4');
insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/02/15','Dulces deliciosos', '12785', '25', '3');
insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/02/15','Dulces magicos', '12789', '21', '1');
insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/02/19','Dulcilandia', '12885', '25', '4');
insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/02/24','colombina', '12889', '13', '3');
insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/02/27','jet', '12954', '18', '8');
insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/03/01','Dulces magicos', '12964', '23', '10');
insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/03/02','candyjobs', '12675', '5', '1');
insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/03/12','magico mundo', '12775', '26', '6');
insert into pedido (fecha, proveedor, numerofactura, cantidad, idcliente) values ('2023/03/15','candyjobs', '12784', '35', '2');

select * from pedido;

insert into clientemensaje (idcliente, idmensaje) values ('3','1');
insert into clientemensaje (idcliente, idmensaje) values ('10','1');
insert into clientemensaje (idcliente, idmensaje) values ('4','1');
insert into clientemensaje (idcliente, idmensaje) values ('6','3');
insert into clientemensaje (idcliente, idmensaje) values ('8','3');
insert into clientemensaje (idcliente, idmensaje) values ('3','2');
insert into clientemensaje (idcliente, idmensaje) values ('5','1');
insert into clientemensaje (idcliente, idmensaje) values ('7','2');
insert into clientemensaje (idcliente, idmensaje) values ('10','2');
insert into clientemensaje (idcliente, idmensaje) values ('9','3');
insert into clientemensaje (idcliente, idmensaje) values ('2','1');

select * from clientemensaje;

insert into pedidoproducto (idproducto, idpedido) values ('3','5');
insert into pedidoproducto (idproducto, idpedido) values ('2','4');
insert into pedidoproducto (idproducto, idpedido) values ('5','9');
insert into pedidoproducto (idproducto, idpedido) values ('7','4');
insert into pedidoproducto (idproducto, idpedido) values ('2','7');
insert into pedidoproducto (idproducto, idpedido) values ('5','1');
insert into pedidoproducto (idproducto, idpedido) values ('8','3');
insert into pedidoproducto (idproducto, idpedido) values ('5','5');
insert into pedidoproducto (idproducto, idpedido) values ('7','6');
insert into pedidoproducto (idproducto, idpedido) values ('6','4');
insert into pedidoproducto (idproducto, idpedido) values ('1','5');

select * from pedido producto
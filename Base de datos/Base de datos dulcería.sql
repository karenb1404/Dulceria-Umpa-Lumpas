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


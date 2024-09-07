DROP SCHEMA IF EXISTS asopros_ventas;
CREATE DATABASE asopros_ventas;
USE asopros_ventas;

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    imagen_url VARCHAR(255),
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion TEXT NOT NULL
);

CREATE TABLE ordenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_orden DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE detalles_orden (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (orden_id) REFERENCES ordenes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT NOT NULL,
    fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    metodo_pago VARCHAR(50) NOT NULL,
    cantidad_pagada DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (orden_id) REFERENCES ordenes(id)
);

INSERT INTO productos (nombre, descripcion, imagen_url, precio, stock)
VALUES 
('Chocolate Orgánico', 'Chocolate 100% cacao orgánico', 'producto1.jpg', 20.00, 100),
('Miel de Musílago', 'Jalea natural de musílago de cacao', 'producto2.jpg', 5.00, 50),
('Cocada', 'Cocada mezclada con chocolate', 'producto3.jpg', 2.00, 40);

INSERT INTO clientes (nombre, email, telefono, direccion)
VALUES 
('Juan Pérez', 'juan@gmail.com', '3145653312', 'Primero de Enero, Mocoa'),
('Ana García', 'ana@gmail.com', '3214537281', 'Puerto Rosario, Puerto Guzmán'),
('Maria Rosales', 'maria@gmail.com', '3115459816', 'La Unión, Mocoa');

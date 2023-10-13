-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2023 a las 18:55:42
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mini_market`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `ID_Almacen` int(11) NOT NULL,
  `Nombre_Almacen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`ID_Almacen`, `Nombre_Almacen`) VALUES
(1, 'Principal'),
(2, 'Almacén Central'),
(3, 'Almacen 3'),
(4, 'Almacen 4'),
(5, 'Almacen 5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL,
  `Nombre_Categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_Categoria`, `Nombre_Categoria`) VALUES
(1001, 'LACTEOS'),
(1002, 'Productos Empacados'),
(1003, 'REFRIGERADOS'),
(1004, 'BEBIDAS'),
(1005, 'CARNES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nombre`, `Apellido`, `Correo_Electronico`, `Telefono`, `Direccion`) VALUES
(1013, 'Juan Carlos', 'Lopez', 'juan.carlos@gmail.com', '313578489', 'Carrera 10'),
(1014, 'Diego Hernandez', 'Martinez', 'DHERNANDEZ@gmail.com', '315784521', 'Calle 5'),
(1015, 'Alejandro Valderrama', 'Garcia', 'AVALDE@gmail.com', '318794221', 'Avenida 8'),
(1016, 'Laura Morales', 'Perez', 'laura@gmail.com', '317456789', 'Calle 15'),
(1017, 'Roberto Gomez', 'Lopez', 'roberto@gmail.com', '312345678', 'Carrera 12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_de_ventas`
--

CREATE TABLE `detalle_de_ventas` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Venta` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad_Vendida` int(11) NOT NULL,
  `Precio_Unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_de_ventas`
--

INSERT INTO `detalle_de_ventas` (`ID_Detalle`, `ID_Venta`, `ID_Producto`, `Cantidad_Vendida`, `Precio_Unitario`) VALUES
(1010, 110, 103, 5, 6.70),
(1011, 111, 102, 3, 2.20),
(1012, 112, 101, 2, 5.50),
(1013, 113, 103, 3, 6.70),
(1014, 114, 102, 4, 2.20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `ID_Rol` int(11) DEFAULT NULL,
  `Salario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`ID_Empleado`, `Nombre`, `Apellido`, `Fecha_Nacimiento`, `Direccion`, `Telefono`, `Correo_Electronico`, `ID_Rol`, `Salario`) VALUES
(101, 'Juan', 'Perez', '1990-05-15', 'Calle 123', '555-987-6543', 'juan.perez@example.com', 1, 2500.00),
(102, 'Maria', 'Lopez', '1994-05-05', 'AV principal', '321-123-4564', 'maria.lopez@example.com', 2, 3500.00),
(103, 'Carlos', 'Garcia', '1997-04-25', 'Calle 43', '319-123-4567', 'carlos.garcia@example.com', 3, 2000.00),
(104, 'Laura', 'Martinez', '1992-11-11', 'Carrera 7', '318-456-7890', 'laura.martinez@example.com', 1, 2800.00),
(105, 'Ana', 'Rodriguez', '1988-08-08', 'Calle 22', '314-789-1234', 'ana.rodriguez@example.com', 2, 3200.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `ID_Producto` int(11) NOT NULL,
  `Cantidad_Fisica` int(11) NOT NULL,
  `Fecha_Actualizacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`ID_Producto`, `Cantidad_Fisica`, `Fecha_Actualizacion`) VALUES
(101, 200, '2023-08-01'),
(102, 300, '2023-08-01'),
(103, 50, '2023-08-01'),
(104, 100, '2023-08-01'),
(105, 200, '2023-08-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `Nombre_Producto` varchar(100) NOT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `ID_Categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Producto`, `Nombre_Producto`, `Descripcion`, `Precio`, `ID_Categoria`) VALUES
(101, 'Jamon', 'Producto Frio', 6.70, 1003),
(102, 'Papas de limon', 'Producto Empacado', 2.20, 1002),
(103, 'Leche', 'Producto Lacteo', 6.00, 1001),
(104, 'Refresco de cola', 'Bebida carbonatada', 2.00, 1004),
(105, 'Filete de pollo', 'Carne de pollo', 5.00, 1005);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `ID_Promocion` int(11) NOT NULL,
  `Nombre_Promocion` varchar(100) NOT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`ID_Promocion`, `Nombre_Promocion`, `Descripcion`, `Fecha_Inicio`, `Fecha_Final`) VALUES
(601, 'Oferta Verano', 'Descuento especial en bebidas de verano', '2023-06-15', '2023-07-15'),
(602, 'Limpieza Total', 'Compra un producto de limpieza y lleva otro con descuento', '2023-09-01', '2023-09-30'),
(603, 'Descuento en Carnes', 'Especial de carnes frescas', '2023-08-01', '2023-08-15'),
(604, 'Promo Frutas', 'Oferta en frutas de temporada', '2023-07-10', '2023-07-31'),
(605, 'Dulces a Mitad de Precio', 'Todos los dulces con 50% de descuento', '2023-08-20', '2023-09-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_Proveedor` int(11) NOT NULL,
  `Nombre_Proveedor` varchar(100) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ID_Proveedor`, `Nombre_Proveedor`, `Direccion`, `Correo_Electronico`, `Telefono`) VALUES
(1, 'Distribuidora ABC', 'Carrera 15', 'manuela@gmail.com', '315768123'),
(2, 'Jorge Olmedo', 'Avenida 6', 'jorge@gmail.com', '317712364'),
(3, 'Maria Rojas', 'Calle 25', 'maria@gmail.com', '317802313');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_Rol` int(11) NOT NULL,
  `Nombre_Rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID_Rol`, `Nombre_Rol`) VALUES
(1, 'Asistente de Ventas'),
(2, 'Gerente'),
(3, 'Almacen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_Venta` int(11) NOT NULL,
  `Fecha_Venta` date NOT NULL,
  `Total_Venta` decimal(10,2) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID_Venta`, `Fecha_Venta`, `Total_Venta`, `ID_Cliente`, `ID_Empleado`) VALUES
(110, '2023-08-14', 35.50, 1013, 101),
(111, '2023-08-13', 44.20, 1014, 102),
(112, '2023-08-14', 12.00, 1015, 103),
(113, '2023-08-15', 16.50, 1013, 101),
(114, '2023-08-15', 8.00, 1014, 102);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`ID_Almacen`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `detalle_de_ventas`
--
ALTER TABLE `detalle_de_ventas`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Venta` (`ID_Venta`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD KEY `ID_Rol` (`ID_Rol`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`ID_Promocion`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_Rol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Empleado` (`ID_Empleado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_de_ventas`
--
ALTER TABLE `detalle_de_ventas`
  ADD CONSTRAINT `detalle_de_ventas_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `ventas` (`ID_Venta`),
  ADD CONSTRAINT `detalle_de_ventas_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`ID_Rol`) REFERENCES `roles` (`ID_Rol`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

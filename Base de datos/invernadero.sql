-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2025 a las 22:09:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `invernadero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id` int(11) NOT NULL,
  `tipo` enum('ORDEN','MANUAL') NOT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `funcion` varchar(255) DEFAULT NULL,
  `fertilizante` varchar(10) DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id`, `tipo`, `orden_id`, `producto`, `cantidad`, `nombre`, `funcion`, `fertilizante`, `notas`, `fecha`) VALUES
(1, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:09:09'),
(2, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:09:09'),
(3, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:09:10'),
(4, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:09:10'),
(5, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:09:10'),
(6, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:10:40'),
(7, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:10:41'),
(8, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:10:41'),
(9, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:10:42'),
(10, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:10:42'),
(11, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:10:42'),
(12, 'ORDEN', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:10:42'),
(13, 'MANUAL', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:11:14'),
(14, 'MANUAL', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:11:14'),
(15, 'MANUAL', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:11:15'),
(16, 'MANUAL', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:11:15'),
(17, 'MANUAL', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:11:15'),
(18, 'MANUAL', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:11:15'),
(19, 'MANUAL', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:11:15'),
(20, 'MANUAL', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:11:16'),
(21, 'MANUAL', NULL, NULL, NULL, '', '', '', '', '2025-11-07 20:14:33'),
(22, 'MANUAL', NULL, NULL, NULL, 'sc', 'sc', 'si', 'sc', '2025-11-07 20:14:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_compra`
--

CREATE TABLE `ordenes_compra` (
  `id` int(11) NOT NULL,
  `emisor` varchar(100) DEFAULT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `dias_credito` int(11) DEFAULT NULL,
  `moneda` varchar(20) DEFAULT NULL,
  `consumir` int(11) DEFAULT NULL,
  `factura` varchar(50) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `recibe` varchar(100) DEFAULT NULL,
  `solicita` varchar(100) DEFAULT NULL,
  `embarque` varchar(200) DEFAULT NULL,
  `notas_internas` text DEFAULT NULL,
  `notas_proveedor` text DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `impuestos` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(20) DEFAULT 'EN DEUDA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes_compra`
--

INSERT INTO `ordenes_compra` (`id`, `emisor`, `proveedor`, `dias_credito`, `moneda`, `consumir`, `factura`, `cargo`, `recibe`, `solicita`, `embarque`, `notas_internas`, `notas_proveedor`, `subtotal`, `impuestos`, `total`, `fecha`, `estado`) VALUES
(1, 'vsv', 'vdV', 3, 'vcx', 0, '', '', '', '', '', '', '', 37.00, 5.92, 42.92, '2025-11-07 16:58:15', 'PAGADO'),
(2, 'arely', 'juan', 2, 'mexican', 0, '23', 'arely', 'arely', 'evelyn', 'hola', 'hola', 'hola', 546.00, 87.36, 633.36, '2025-11-07 17:12:34', 'PAGADO'),
(3, 'Arely', 'Juan', 12, 'mexicana', 0, '34', 'Arely', 'Arely', 'Arely', '', 'hola', 'Hola', 234.00, 42.12, 276.12, '2025-11-07 17:18:44', 'PAGADO'),
(4, 'eve', 'luis', 7, 'mexicana', 0, '2', 'arely', 'arely', 'benito', '', '', '', 78.00, 12.48, 90.48, '2025-11-07 18:28:35', 'PAGADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_detalle`
--

CREATE TABLE `ordenes_detalle` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes_detalle`
--
ALTER TABLE `ordenes_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_id` (`orden_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ordenes_detalle`
--
ALTER TABLE `ordenes_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ordenes_detalle`
--
ALTER TABLE `ordenes_detalle`
  ADD CONSTRAINT `ordenes_detalle_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_compra` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

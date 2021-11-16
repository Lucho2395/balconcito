-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2021 a las 17:06:26
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `balconcito_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `id_almacen` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `almacen_nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almacen_capacidad` int(100) NOT NULL,
  `almacen_estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id_asistencia` int(11) NOT NULL,
  `id_persona_turno` int(11) NOT NULL,
  `asistencia_fecha` date NOT NULL,
  `asistencia_hora` time NOT NULL,
  `asistencia_hora_salida` time DEFAULT NULL COMMENT 'Para registrar Salida',
  `asistencia_valor` int(11) NOT NULL,
  `asistencia_horas` int(11) NOT NULL DEFAULT 0,
  `asistencia_observacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asistencia_tipo` tinyint(2) DEFAULT NULL COMMENT '0 entrada, 1 salida',
  `asistencia_estado` tinyint(4) NOT NULL,
  `asistencia_proyectada` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_fecha`
--

CREATE TABLE `asistencia_fecha` (
  `id_asistencia_fecha` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `id_caja_numero` int(11) NOT NULL,
  `caja_fecha` date NOT NULL,
  `id_usuario_apertura` int(11) NOT NULL,
  `caja_apertura` decimal(10,2) NOT NULL,
  `caja_fecha_apertura` datetime NOT NULL,
  `id_usuario_cierre` int(11) DEFAULT NULL,
  `caja_cierre` decimal(10,2) DEFAULT NULL,
  `caja_fecha_cierre` datetime DEFAULT NULL,
  `caja_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_caja`, `id_turno`, `id_caja_numero`, `caja_fecha`, `id_usuario_apertura`, `caja_apertura`, `caja_fecha_apertura`, `id_usuario_cierre`, `caja_cierre`, `caja_fecha_cierre`, `caja_estado`) VALUES
(9, 1, 1, '2021-10-28', 14, '104.70', '2021-10-28 16:39:20', 14, '662.70', '2021-10-28 23:27:10', 0),
(10, 1, 1, '2021-10-29', 14, '512.70', '2021-10-29 16:14:42', 14, '755.10', '2021-10-30 01:00:25', 0),
(11, 1, 1, '2021-10-30', 14, '115.20', '2021-10-30 17:01:39', 14, '1176.60', '2021-10-31 03:09:01', 0),
(12, 1, 1, '2021-10-31', 14, '106.70', '2021-10-31 17:23:41', 14, '109.70', '2021-10-31 18:05:31', 0),
(13, 1, 1, '2021-11-02', 14, '41.70', '2021-11-02 18:15:40', 14, '69.00', '2021-11-02 22:35:30', 0),
(14, 1, 1, '2021-11-03', 14, '134.00', '2021-11-03 17:17:26', 14, '236.00', '2021-11-03 23:01:10', 0),
(15, 1, 1, '2021-11-05', 14, '86.00', '2021-11-05 18:34:50', 14, '231.50', '2021-11-05 23:35:43', 0),
(16, 1, 1, '2021-11-06', 14, '231.50', '2021-11-06 18:38:41', 14, '167.00', '2021-11-06 23:35:10', 0),
(17, 1, 1, '2021-11-07', 14, '167.00', '2021-11-07 19:44:57', 14, '65.00', '2021-11-07 21:01:37', 0),
(18, 1, 1, '2021-11-09', 14, '65.00', '2021-11-09 18:11:22', 14, '114.00', '2021-11-09 23:32:16', 0),
(19, 1, 1, '2021-11-10', 14, '114.00', '2021-11-10 19:16:46', 14, '224.00', '2021-11-11 00:02:52', 0),
(20, 1, 1, '2021-11-11', 14, '224.00', '2021-11-11 18:34:06', 14, '419.20', '2021-11-12 01:09:04', 0),
(21, 1, 1, '2021-11-12', 14, '419.20', '2021-11-12 18:49:49', 14, '234.70', '2021-11-13 03:09:14', 0),
(22, 1, 1, '2021-11-13', 14, '44.00', '2021-11-13 22:28:48', 14, '284.50', '2021-11-14 00:24:56', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_numero`
--

CREATE TABLE `caja_numero` (
  `id_caja_numero` int(11) NOT NULL,
  `caja_numero_nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `caja_numero_fecha` datetime NOT NULL,
  `caja_numero_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `caja_numero`
--

INSERT INTO `caja_numero` (`id_caja_numero`, `caja_numero_nombre`, `caja_numero_fecha`, `caja_numero_estado`) VALUES
(1, 'Caja 1', '2021-07-23 00:00:00', 1),
(2, 'Caja 2', '2021-07-23 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria_nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `categoria_fecha_registro` datetime NOT NULL,
  `categoria_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria_nombre`, `categoria_fecha_registro`, `categoria_estado`) VALUES
(3, 'GENERAL', '2021-05-11 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_negocio`
--

CREATE TABLE `categorias_negocio` (
  `id_categoria_negocio` int(11) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `recurso_categoria_estado` tinyint(1) NOT NULL,
  `recurso_categoria_fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias_negocio`
--

INSERT INTO `categorias_negocio` (`id_categoria_negocio`, `id_usuario_creacion`, `id_negocio`, `id_categoria`, `recurso_categoria_estado`, `recurso_categoria_fecha`) VALUES
(4, 1, 3, 3, 1, '2021-03-24 14:27:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `ciudad_nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ciudad_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `ciudad_nombre`, `ciudad_estado`) VALUES
(1, 'Iquitos', 1),
(2, 'Nauta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `id_tipodocumento` int(11) NOT NULL,
  `cliente_razonsocial` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_nombre` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_numero` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_correo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_direccion_2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_telefono` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_fecha` datetime NOT NULL,
  `cliente_estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_tipodocumento`, `cliente_razonsocial`, `cliente_nombre`, `cliente_numero`, `cliente_correo`, `cliente_direccion`, `cliente_direccion_2`, `cliente_telefono`, `cliente_fecha`, `cliente_estado`) VALUES
(3, 2, '', 'Anonimo', '11111111', 'anonimo@gmail.com', 'Calle S/n', '', '999999999', '2021-03-26 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda`
--

CREATE TABLE `comanda` (
  `id_comanda` int(11) NOT NULL,
  `id_mesa` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `comanda_nombre_delivery` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comanda_direccion_delivery` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comanda_telefono_delivery` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comanda_cantidad_personas` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comanda_correlativo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `comanda_total` decimal(10,2) NOT NULL,
  `comanda_fecha_registro` datetime NOT NULL,
  `comanda_estado` tinyint(2) NOT NULL,
  `comanda_codigo` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comanda`
--

INSERT INTO `comanda` (`id_comanda`, `id_mesa`, `id_usuario`, `id_cliente`, `comanda_nombre_delivery`, `comanda_direccion_delivery`, `comanda_telefono_delivery`, `comanda_cantidad_personas`, `comanda_correlativo`, `comanda_total`, `comanda_fecha_registro`, `comanda_estado`, `comanda_codigo`) VALUES
(1383, 12, 13, NULL, NULL, NULL, NULL, '1', '281021-1', '167.00', '2021-10-28 19:08:02', 1, '1635466082.7926'),
(1384, 13, 13, NULL, NULL, NULL, NULL, '1', '281021-2', '50.00', '2021-10-28 19:53:23', 1, '1635468803.3402'),
(1385, 7, 14, NULL, NULL, NULL, NULL, '1', '281021-3', '19.00', '2021-10-28 20:01:02', 1, '1635469262.0466'),
(1386, 6, 14, NULL, NULL, NULL, NULL, '1', '281021-4', '3.00', '2021-10-28 20:01:59', 1, '1635469319.6439'),
(1387, 7, 13, NULL, NULL, NULL, NULL, '1', '281021-5', '129.00', '2021-10-28 20:29:17', 1, '1635470957.5492'),
(1388, 13, 13, NULL, NULL, NULL, NULL, '1', '281021-6', '142.00', '2021-10-28 20:52:10', 1, '1635472330.9295'),
(1389, 0, 14, 3, 'ANONIMO', '', '', '1', '281021-7', '50.00', '2021-10-28 20:58:58', 1, '1635472738.986'),
(1390, 11, 14, NULL, NULL, NULL, NULL, '1', '281021-8', '117.00', '2021-10-28 21:08:31', 1, '1635473311.9507'),
(1391, 6, 14, NULL, NULL, NULL, NULL, '1', '281021-9', '28.00', '2021-10-28 22:23:54', 1, '1635477834.8383'),
(1392, 13, 14, NULL, NULL, NULL, NULL, '1', '281021-10', '8.00', '2021-10-28 22:27:18', 1, '1635478038.3186'),
(1393, 6, 14, NULL, NULL, NULL, NULL, '1', '281021-11', '8.00', '2021-10-28 23:10:27', 1, '1635480627.8834'),
(1394, 6, 14, NULL, NULL, NULL, NULL, '1', '281021-12', '8.00', '2021-10-28 23:18:35', 1, '1635481115.5788'),
(1395, 6, 14, NULL, NULL, NULL, NULL, '1', '291021-1', '8.00', '2021-10-29 19:25:24', 1, '1635553524.0868'),
(1396, 6, 14, NULL, NULL, NULL, NULL, '1', '291021-2', '8.00', '2021-10-29 19:27:32', 1, '1635553652.2934'),
(1397, 16, 14, NULL, NULL, NULL, NULL, '1', '291021-3', '3.00', '2021-10-29 19:48:29', 1, '1635554909.8048'),
(1398, 6, 14, NULL, NULL, NULL, NULL, '1', '291021-4', '10.00', '2021-10-29 19:57:43', 1, '1635555463.9454'),
(1399, 11, 13, NULL, NULL, NULL, NULL, '1', '291021-5', '38.00', '2021-10-29 20:24:10', 1, '1635557050.4615'),
(1400, 10, 13, NULL, NULL, NULL, NULL, '1', '291021-6', '47.00', '2021-10-29 20:51:19', 1, '1635558679.7385'),
(1401, 13, 13, NULL, NULL, NULL, NULL, '1', '291021-7', '151.00', '2021-10-29 21:23:37', 1, '1635560617.2924'),
(1402, 15, 13, NULL, NULL, NULL, NULL, '1', '291021-8', '143.00', '2021-10-29 21:31:04', 1, '1635561064.0238'),
(1403, 12, 13, NULL, NULL, NULL, NULL, '1', '291021-9', '101.00', '2021-10-29 21:37:09', 1, '1635561429.2637'),
(1404, 6, 13, NULL, NULL, NULL, NULL, '1', '291021-10', '68.00', '2021-10-29 21:52:49', 1, '1635562369.9686'),
(1405, 8, 14, NULL, NULL, NULL, NULL, '1', '291021-11', '56.00', '2021-10-29 22:01:48', 1, '1635562908.44'),
(1406, 7, 2, NULL, NULL, NULL, NULL, '1', '291021-12', '9.00', '2021-10-29 22:16:53', 1, '1635563813.8403'),
(1407, 9, 14, NULL, NULL, NULL, NULL, '1', '291021-13', '74.00', '2021-10-29 22:24:22', 1, '1635564262.5655'),
(1408, 10, 13, NULL, NULL, NULL, NULL, '1', '291021-14', '112.00', '2021-10-29 22:27:09', 1, '1635564429.7282'),
(1409, 11, 14, NULL, NULL, NULL, NULL, '1', '291021-15', '52.00', '2021-10-29 22:30:08', 1, '1635564608.4927'),
(1410, 7, 13, NULL, NULL, NULL, NULL, '1', '291021-16', '56.00', '2021-10-29 22:45:15', 1, '1635565515.2947'),
(1411, 16, 14, NULL, NULL, NULL, NULL, '1', '291021-17', '16.00', '2021-10-29 22:55:54', 1, '1635566154.0649'),
(1412, 16, 14, NULL, NULL, NULL, NULL, '1', '291021-18', '3.00', '2021-10-29 23:04:02', 1, '1635566642.8057'),
(1413, 16, 14, NULL, NULL, NULL, NULL, '1', '291021-19', '16.00', '2021-10-29 23:21:20', 1, '1635567680.5082'),
(1414, 16, 14, NULL, NULL, NULL, NULL, '1', '291021-20', '3.00', '2021-10-29 23:22:17', 1, '1635567737.0946'),
(1415, 16, 14, NULL, NULL, NULL, NULL, '1', '291021-21', '24.00', '2021-10-29 23:29:19', 1, '1635568159.3692'),
(1416, 16, 14, NULL, NULL, NULL, NULL, '1', '291021-22', '16.00', '2021-10-29 23:47:58', 1, '1635569278.0689'),
(1417, 16, 14, NULL, NULL, NULL, NULL, '1', '291021-23', '16.00', '2021-10-29 23:56:16', 1, '1635569776.5364'),
(1418, 16, 14, NULL, NULL, NULL, NULL, '1', '301021-1', '8.00', '2021-10-30 00:09:18', 1, '1635570558.7435'),
(1419, 16, 14, NULL, NULL, NULL, NULL, '1', '301021-2', '8.00', '2021-10-30 00:11:41', 1, '1635570701.3637'),
(1420, 16, 14, NULL, NULL, NULL, NULL, '1', '301021-3', '16.00', '2021-10-30 00:33:51', 1, '1635572031.2877'),
(1421, 16, 14, NULL, NULL, NULL, NULL, '1', '301021-4', '3.00', '2021-10-30 17:18:33', 1, '1635632313.7475'),
(1422, 10, 13, NULL, NULL, NULL, NULL, '1', '301021-5', '30.00', '2021-10-30 18:42:27', 1, '1635637347.8242'),
(1423, 16, 14, NULL, NULL, NULL, NULL, '1', '301021-6', '53.00', '2021-10-30 19:05:40', 1, '1635638740.9877'),
(1424, 10, 13, NULL, NULL, NULL, NULL, '1', '301021-7', '60.00', '2021-10-30 19:39:46', 1, '1635640786.2829'),
(1425, 11, 13, NULL, NULL, NULL, NULL, '1', '301021-8', '263.00', '2021-10-30 20:38:10', 1, '1635644290.6143'),
(1426, 6, 13, NULL, NULL, NULL, NULL, '1', '301021-9', '381.00', '2021-10-30 20:51:08', 1, '1635645068.4655'),
(1427, 15, 13, NULL, NULL, NULL, NULL, '1', '301021-10', '168.00', '2021-10-30 21:40:27', 1, '1635648027.622'),
(1428, 10, 13, NULL, NULL, NULL, NULL, '1', '301021-11', '54.00', '2021-10-30 21:54:35', 1, '1635648875.0283'),
(1429, 13, 14, NULL, NULL, NULL, NULL, '1', '301021-12', '246.00', '2021-10-30 22:02:38', 1, '1635649358.5814'),
(1430, 10, 13, NULL, NULL, NULL, NULL, '1', '301021-13', '109.00', '2021-10-30 22:04:39', 1, '1635649479.0569'),
(1431, 8, 14, NULL, NULL, NULL, NULL, '1', '301021-14', '81.00', '2021-10-30 22:11:22', 1, '1635649882.3224'),
(1432, 7, 14, NULL, NULL, NULL, NULL, '1', '301021-15', '162.00', '2021-10-30 22:27:06', 1, '1635650826.816'),
(1433, 6, 13, NULL, NULL, NULL, NULL, '1', '301021-16', '98.00', '2021-10-30 22:28:14', 1, '1635650894.1753'),
(1434, 12, 14, NULL, NULL, NULL, NULL, '1', '301021-17', '90.00', '2021-10-30 22:39:09', 1, '1635651549.5316'),
(1435, 9, 14, NULL, NULL, NULL, NULL, '1', '301021-18', '46.00', '2021-10-30 22:47:49', 1, '1635652069.7167'),
(1436, 10, 14, NULL, NULL, NULL, NULL, '1', '301021-19', '45.00', '2021-10-30 23:59:56', 1, '1635656396.4054'),
(1437, 10, 14, NULL, NULL, NULL, NULL, '1', '311021-1', '39.00', '2021-10-31 00:00:53', 1, '1635656453.1803'),
(1438, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-2', '3.00', '2021-10-31 00:18:09', 1, '1635657489.3529'),
(1439, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-3', '10.00', '2021-10-31 00:21:25', 1, '1635657685.1631'),
(1440, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-4', '48.00', '2021-10-31 00:24:09', 1, '1635657849.6593'),
(1441, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-5', '55.00', '2021-10-31 00:36:22', 1, '1635658582.8253'),
(1442, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-6', '16.00', '2021-10-31 00:46:36', 1, '1635659196.2625'),
(1443, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-7', '3.00', '2021-10-31 00:51:54', 1, '1635659514.0708'),
(1444, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-8', '45.00', '2021-10-31 00:58:44', 1, '1635659924.691'),
(1445, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-9', '45.00', '2021-10-31 01:00:09', 1, '1635660009.0239'),
(1446, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-10', '60.00', '2021-10-31 01:05:26', 1, '1635660326.8334'),
(1447, 12, 14, NULL, NULL, NULL, NULL, '1', '311021-11', '74.00', '2021-10-31 01:09:54', 1, '1635660594.1875'),
(1448, 9, 14, NULL, NULL, NULL, NULL, '1', '311021-12', '3.00', '2021-10-31 01:16:49', 1, '1635661009.623'),
(1449, 6, 2, NULL, NULL, NULL, NULL, '1', '311021-13', '9.00', '2021-10-31 01:24:10', 1, '1635661450.9462'),
(1450, 14, 14, NULL, NULL, NULL, NULL, '1', '311021-14', '18.00', '2021-10-31 01:25:17', 1, '1635661517.4913'),
(1451, 14, 2, NULL, NULL, NULL, NULL, '1', '311021-15', '64.00', '2021-10-31 01:40:30', 1, '1635662430.5728'),
(1452, 14, 2, NULL, NULL, NULL, NULL, '1', '311021-16', '0.00', '2021-10-31 01:43:10', 1, '1635662590.0701'),
(1453, 14, 2, NULL, NULL, NULL, NULL, '1', '311021-17', '10.00', '2021-10-31 01:45:28', 1, '1635662728.2329'),
(1454, 6, 14, NULL, NULL, NULL, NULL, '1', '311021-18', '40.00', '2021-10-31 01:50:17', 1, '1635663017.3274'),
(1455, 6, 14, NULL, NULL, NULL, NULL, '1', '311021-19', '64.00', '2021-10-31 02:03:19', 1, '1635663799.017'),
(1456, 8, 14, NULL, NULL, NULL, NULL, '1', '311021-20', '48.00', '2021-10-31 02:06:09', 1, '1635663969.3178'),
(1457, 9, 14, NULL, NULL, NULL, NULL, '1', '311021-21', '9.00', '2021-10-31 02:12:07', 1, '1635664327.4459'),
(1458, 13, 14, NULL, NULL, NULL, NULL, '1', '311021-22', '45.00', '2021-10-31 02:20:44', 1, '1635664844.5663'),
(1459, 8, 14, NULL, NULL, NULL, NULL, '1', '311021-23', '9.00', '2021-10-31 02:22:36', 1, '1635664956.1611'),
(1460, 7, 14, NULL, NULL, NULL, NULL, '1', '311021-24', '134.00', '2021-10-31 02:37:00', 1, '1635665820.6555'),
(1461, 7, 14, NULL, NULL, NULL, NULL, '1', '311021-25', '3.00', '2021-10-31 18:04:23', 1, '1635721463.6472'),
(1462, 6, 14, NULL, NULL, NULL, NULL, '1', '021121-1', '0.00', '2021-11-02 18:16:52', 1, '1635895012.4681'),
(1463, 6, 14, NULL, NULL, NULL, NULL, '1', '021121-2', '0.00', '2021-11-02 18:59:59', 1, '1635897599.5155'),
(1464, 6, 13, NULL, NULL, NULL, NULL, '1', '021121-3', '0.00', '2021-11-02 19:10:57', 1, '1635898257.492'),
(1465, 6, 14, NULL, NULL, NULL, NULL, '1', '021121-4', '0.00', '2021-11-02 19:19:10', 1, '1635898750.0718'),
(1466, 7, 14, NULL, NULL, NULL, NULL, '1', '021121-5', '0.00', '2021-11-02 19:34:47', 1, '1635899687.5234'),
(1467, 6, 14, NULL, NULL, NULL, NULL, '1', '031121-1', '47.00', '2021-11-03 19:20:39', 1, '1635985239.26'),
(1468, 13, 14, NULL, NULL, NULL, NULL, '1', '031121-2', '176.00', '2021-11-03 20:31:14', 1, '1635989474.1032'),
(1469, 6, 14, NULL, NULL, NULL, NULL, '1', '031121-3', '0.00', '2021-11-03 20:34:34', 1, '1635989674.1294'),
(1470, 13, 14, NULL, NULL, NULL, NULL, '1', '051121-1', '42.00', '2021-11-05 19:19:16', 1, '1636157956.4024'),
(1471, 6, 14, NULL, NULL, NULL, NULL, '1', '051121-2', '0.00', '2021-11-05 19:42:20', 1, '1636159340.7685'),
(1472, 7, 14, NULL, NULL, NULL, NULL, '1', '051121-3', '48.00', '2021-11-05 20:06:00', 1, '1636160760.8702'),
(1473, 14, 14, NULL, NULL, NULL, NULL, '1', '051121-4', '55.00', '2021-11-05 21:14:19', 1, '1636164859.1924'),
(1474, 12, 14, NULL, NULL, NULL, NULL, '1', '051121-5', '100.00', '2021-11-05 21:32:20', 1, '1636165940.1782'),
(1475, 6, 14, NULL, NULL, NULL, NULL, '1', '051121-6', '0.00', '2021-11-05 21:32:44', 1, '1636165964.9939'),
(1476, 11, 14, NULL, NULL, NULL, NULL, '1', '051121-7', '23.00', '2021-11-05 21:48:39', 1, '1636166919.496'),
(1477, 13, 14, NULL, NULL, NULL, NULL, '1', '051121-8', '0.00', '2021-11-05 22:34:15', 1, '1636169655.1769'),
(1478, 15, 14, NULL, NULL, NULL, NULL, '1', '051121-9', '44.00', '2021-11-05 22:34:18', 1, '1636169658.2244'),
(1479, 9, 14, NULL, NULL, NULL, NULL, '1', '061121-1', '80.00', '2021-11-06 18:56:54', 1, '1636243014.0324'),
(1480, 6, 14, NULL, NULL, NULL, NULL, '1', '061121-2', '0.00', '2021-11-06 20:59:49', 1, '1636250389.6324'),
(1481, 6, 12, NULL, NULL, NULL, NULL, '1', '061121-3', '0.00', '2021-11-06 22:39:20', 1, '1636256360.6642'),
(1482, 6, 14, NULL, NULL, NULL, NULL, '1', '061121-4', '0.00', '2021-11-06 23:24:42', 1, '1636259082.6225'),
(1483, 6, 14, NULL, NULL, NULL, NULL, '1', '071121-1', '8.00', '2021-11-07 19:45:48', 1, '1636332348.1979'),
(1484, 6, 14, NULL, NULL, NULL, NULL, '1', '091121-1', '0.00', '2021-11-09 18:12:18', 1, '1636499538.177'),
(1485, 6, 14, NULL, NULL, NULL, NULL, '1', '091121-2', '41.00', '2021-11-09 21:28:13', 1, '1636511293.5131'),
(1486, 7, 14, NULL, NULL, NULL, NULL, '1', '091121-3', '15.00', '2021-11-09 22:02:35', 1, '1636513355.429'),
(1487, 9, 14, NULL, NULL, NULL, NULL, '1', '101121-1', '84.00', '2021-11-10 19:21:00', 1, '1636590060.1554'),
(1488, 10, 14, NULL, NULL, NULL, NULL, '1', '101121-2', '0.00', '2021-11-10 19:23:14', 1, '1636590194.2878'),
(1489, 11, 12, NULL, NULL, NULL, NULL, '1', '101121-3', '61.00', '2021-11-10 20:56:42', 1, '1636595802.3215'),
(1490, 6, 14, NULL, NULL, NULL, NULL, '1', '101121-4', '0.00', '2021-11-10 22:08:41', 1, '1636600121.0775'),
(1491, 6, 14, NULL, NULL, NULL, NULL, '1', '101121-5', '0.00', '2021-11-10 23:45:50', 1, '1636605950.1486'),
(1492, 6, 14, NULL, NULL, NULL, NULL, '1', '111121-1', '0.00', '2021-11-11 18:45:04', 1, '1636674304.7094'),
(1493, 11, 13, NULL, NULL, NULL, NULL, '1', '111121-2', '0.00', '2021-11-11 19:14:53', 1, '1636676093.3055'),
(1494, 10, 14, NULL, NULL, NULL, NULL, '1', '111121-3', '0.00', '2021-11-11 19:39:30', 1, '1636677570.2004'),
(1495, 6, 13, NULL, NULL, NULL, NULL, '1', '111121-4', '0.00', '2021-11-11 20:40:13', 1, '1636681213.317'),
(1496, 11, 13, NULL, NULL, NULL, NULL, '1', '111121-5', '66.00', '2021-11-11 20:49:57', 1, '1636681797.5469'),
(1497, 13, 13, NULL, NULL, NULL, NULL, '1', '111121-6', '0.00', '2021-11-11 21:02:09', 1, '1636682529.6262'),
(1498, 9, 13, NULL, NULL, NULL, NULL, '1', '111121-7', '28.00', '2021-11-11 21:20:37', 1, '1636683637.5446'),
(1499, 12, 13, NULL, NULL, NULL, NULL, '1', '111121-8', '254.00', '2021-11-11 21:23:30', 1, '1636683810.7433'),
(1500, 14, 13, NULL, NULL, NULL, NULL, '1', '111121-9', '23.00', '2021-11-11 21:23:59', 1, '1636683839.314'),
(1501, 6, 13, NULL, NULL, NULL, NULL, '1', '111121-10', '37.00', '2021-11-11 21:25:56', 1, '1636683956.8917'),
(1502, 16, 14, NULL, NULL, NULL, NULL, '1', '111121-11', '0.00', '2021-11-11 21:43:34', 1, '1636685014.7748'),
(1503, 16, 14, NULL, NULL, NULL, NULL, '1', '111121-12', '0.00', '2021-11-11 22:06:01', 1, '1636686361.1939'),
(1504, 6, 14, NULL, NULL, NULL, NULL, '1', '111121-13', '0.00', '2021-11-11 23:00:11', 1, '1636689611.0204'),
(1505, 6, 14, NULL, NULL, NULL, NULL, '1', '121121-1', '0.00', '2021-11-12 18:54:30', 1, '1636761270.8855'),
(1506, 11, 13, NULL, NULL, NULL, NULL, '1', '121121-2', '57.00', '2021-11-12 19:04:34', 1, '1636761874.4978'),
(1507, 16, 14, NULL, NULL, NULL, NULL, '1', '121121-3', '0.00', '2021-11-12 19:57:09', 1, '1636765029.4971'),
(1508, 11, 13, NULL, NULL, NULL, NULL, '1', '121121-4', '263.00', '2021-11-12 21:09:47', 1, '1636769387.167'),
(1509, 16, 13, NULL, NULL, NULL, NULL, '1', '121121-5', '116.00', '2021-11-12 21:57:48', 1, '1636772268.7949'),
(1510, 10, 13, NULL, NULL, NULL, NULL, '1', '121121-6', '225.00', '2021-11-12 22:24:00', 1, '1636773840.333'),
(1511, 12, 14, NULL, NULL, NULL, NULL, '1', '121121-7', '0.00', '2021-11-12 22:35:32', 1, '1636774532.0234'),
(1512, 7, 14, NULL, NULL, NULL, NULL, '1', '121121-8', '0.00', '2021-11-12 22:44:41', 1, '1636775081.0281'),
(1513, 12, 13, NULL, NULL, NULL, NULL, '1', '121121-9', '272.00', '2021-11-12 22:54:20', 1, '1636775660.7003'),
(1514, 13, 14, NULL, NULL, NULL, NULL, '1', '121121-10', '72.00', '2021-11-12 22:58:28', 1, '1636775908.1771'),
(1515, 15, 14, NULL, NULL, NULL, NULL, '1', '121121-11', '0.00', '2021-11-12 23:01:45', 1, '1636776105.4164'),
(1516, 9, 13, NULL, NULL, NULL, NULL, '1', '121121-12', '104.00', '2021-11-12 23:12:29', 1, '1636776749.144'),
(1517, 15, 14, NULL, NULL, NULL, NULL, '1', '121121-13', '45.00', '2021-11-12 23:18:35', 1, '1636777115.5402'),
(1518, 7, 14, NULL, NULL, NULL, NULL, '1', '121121-14', '0.00', '2021-11-12 23:23:51', 1, '1636777431.6759'),
(1519, 7, 14, NULL, NULL, NULL, NULL, '1', '121121-15', '0.00', '2021-11-12 23:25:22', 1, '1636777522.0436'),
(1520, 7, 14, NULL, NULL, NULL, NULL, '1', '121121-16', '0.00', '2021-11-12 23:29:07', 1, '1636777747.6689'),
(1521, 7, 14, NULL, NULL, NULL, NULL, '1', '121121-17', '0.00', '2021-11-12 23:32:08', 1, '1636777928.7055'),
(1522, 6, 14, NULL, NULL, NULL, NULL, '1', '121121-18', '24.00', '2021-11-12 23:35:03', 1, '1636778103.0387'),
(1523, 7, 14, NULL, NULL, NULL, NULL, '1', '121121-19', '0.00', '2021-11-12 23:36:30', 1, '1636778190.6328'),
(1524, 7, 14, NULL, NULL, NULL, NULL, '1', '121121-20', '0.00', '2021-11-12 23:48:20', 1, '1636778900.1969'),
(1525, 7, 14, NULL, NULL, NULL, NULL, '1', '121121-21', '0.00', '2021-11-12 23:56:47', 1, '1636779407.3809'),
(1526, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-1', '36.00', '2021-11-13 00:02:52', 1, '1636779772.7142'),
(1527, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-2', '0.00', '2021-11-13 00:07:56', 1, '1636780076.9682'),
(1528, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-3', '0.00', '2021-11-13 00:10:03', 1, '1636780203.7519'),
(1529, 8, 14, NULL, NULL, NULL, NULL, '1', '131121-4', '0.00', '2021-11-13 00:20:30', 1, '1636780830.3128'),
(1530, 6, 14, NULL, NULL, NULL, NULL, '1', '131121-5', '0.00', '2021-11-13 00:31:38', 1, '1636781498.8315'),
(1531, 8, 14, NULL, NULL, NULL, NULL, '1', '131121-6', '0.00', '2021-11-13 00:35:11', 1, '1636781711.6112'),
(1532, 8, 14, NULL, NULL, NULL, NULL, '1', '131121-7', '0.00', '2021-11-13 00:55:39', 1, '1636782939.1916'),
(1533, 8, 14, NULL, NULL, NULL, NULL, '1', '131121-8', '0.00', '2021-11-13 00:58:24', 1, '1636783104.1075'),
(1534, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-9', '0.00', '2021-11-13 01:01:11', 1, '1636783271.6564'),
(1535, 6, 14, NULL, NULL, NULL, NULL, '1', '131121-10', '68.00', '2021-11-13 01:06:15', 1, '1636783575.6198'),
(1536, 15, 14, NULL, NULL, NULL, NULL, '1', '131121-11', '104.00', '2021-11-13 01:07:41', 1, '1636783661.1994'),
(1537, 6, 14, NULL, NULL, NULL, NULL, '1', '131121-12', '0.00', '2021-11-13 01:46:25', 1, '1636785985.1685'),
(1538, 6, 14, NULL, NULL, NULL, NULL, '1', '131121-13', '0.00', '2021-11-13 01:58:41', 1, '1636786721.0454'),
(1539, 6, 14, NULL, NULL, NULL, NULL, '1', '131121-14', '0.00', '2021-11-13 02:05:11', 1, '1636787111.7064'),
(1540, 6, 14, NULL, NULL, NULL, NULL, '1', '131121-15', '28.00', '2021-11-13 02:28:33', 1, '1636788513.9367'),
(1541, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-16', '24.00', '2021-11-13 02:32:51', 1, '1636788771.6876'),
(1542, 16, 13, NULL, NULL, NULL, NULL, '1', '131121-17', '0.00', '2021-11-13 13:21:25', 1, '1636827685.2049'),
(1543, 6, 13, NULL, NULL, NULL, NULL, '1', '131121-18', '9.00', '2021-11-13 18:02:42', 1, '1636844562.6954'),
(1544, 9, 13, NULL, NULL, NULL, NULL, '1', '131121-19', '0.00', '2021-11-13 18:23:31', 1, '1636845811.1578'),
(1545, 12, 13, NULL, NULL, NULL, NULL, '1', '131121-20', '24.00', '2021-11-13 19:45:57', 1, '1636850757.5346'),
(1546, 11, 12, NULL, NULL, NULL, NULL, '1', '131121-21', '115.00', '2021-11-13 20:05:31', 1, '1636851931.1666'),
(1547, 9, 13, NULL, NULL, NULL, NULL, '1', '131121-22', '62.00', '2021-11-13 20:51:53', 1, '1636854713.3782'),
(1548, 7, 12, NULL, NULL, NULL, NULL, '1', '131121-23', '0.00', '2021-11-13 21:34:01', 1, '1636857241.4867'),
(1549, 11, 13, NULL, NULL, NULL, NULL, '1', '131121-24', '41.00', '2021-11-13 21:44:39', 1, '1636857879.9892'),
(1550, 13, 12, NULL, NULL, NULL, NULL, '1', '131121-25', '26.00', '2021-11-13 22:00:58', 1, '1636858858.9034'),
(1551, 10, 13, NULL, NULL, NULL, NULL, '1', '131121-26', '49.00', '2021-11-13 22:26:52', 1, '1636860412.5022'),
(1552, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-27', '0.00', '2021-11-13 22:43:26', 1, '1636861406.9396'),
(1553, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-28', '0.00', '2021-11-13 22:49:28', 1, '1636861768.5136'),
(1554, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-29', '0.00', '2021-11-13 22:50:24', 1, '1636861824.834'),
(1555, 8, 14, NULL, NULL, NULL, NULL, '1', '131121-30', '0.00', '2021-11-13 22:53:28', 1, '1636862008.7685'),
(1556, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-31', '0.00', '2021-11-13 22:56:18', 1, '1636862178.1593'),
(1557, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-32', '0.00', '2021-11-13 22:57:48', 1, '1636862268.8715'),
(1558, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-33', '0.00', '2021-11-13 23:01:03', 1, '1636862463.7861'),
(1559, 16, 14, NULL, NULL, NULL, NULL, '1', '131121-34', '20.00', '2021-11-13 23:15:24', 1, '1636863324.5205'),
(1560, 7, 14, NULL, NULL, NULL, NULL, '1', '131121-35', '22.00', '2021-11-13 23:21:29', 1, '1636863689.2355'),
(1561, 6, 14, NULL, NULL, NULL, NULL, '1', '141121-1', '0.00', '2021-11-14 00:20:08', 1, '1636867208.6199');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda_detalle`
--

CREATE TABLE `comanda_detalle` (
  `id_comanda_detalle` int(11) NOT NULL,
  `id_comanda` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `comanda_detalle_precio` decimal(10,2) NOT NULL,
  `comanda_detalle_cantidad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `comanda_detalle_despacho` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `comanda_detalle_total` decimal(10,2) NOT NULL,
  `comanda_detalle_descuento` decimal(10,2) DEFAULT NULL,
  `comanda_detalle_observacion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comanda_detalle_eliminacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comanda_detalle_fecha_eliminacion` datetime DEFAULT NULL,
  `comanda_detalle_fecha_registro` datetime NOT NULL,
  `comanda_detalle_estado` tinyint(4) NOT NULL,
  `comanda_detalle_estado_venta` tinyint(2) NOT NULL DEFAULT 0,
  `comanda_detalle_hora_entrega` time DEFAULT NULL,
  `comanda_detalle_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comanda_detalle`
--

INSERT INTO `comanda_detalle` (`id_comanda_detalle`, `id_comanda`, `id_producto`, `comanda_detalle_precio`, `comanda_detalle_cantidad`, `comanda_detalle_despacho`, `comanda_detalle_total`, `comanda_detalle_descuento`, `comanda_detalle_observacion`, `comanda_detalle_eliminacion`, `comanda_detalle_fecha_eliminacion`, `comanda_detalle_fecha_registro`, `comanda_detalle_estado`, `comanda_detalle_estado_venta`, `comanda_detalle_hora_entrega`, `comanda_detalle_usuario`) VALUES
(4790, 1383, 31, '35.00', '1', 'Salon', '35.00', NULL, '-bbq, acevichada, picante', NULL, NULL, '2021-10-28 19:08:02', 1, 1, NULL, NULL),
(4791, 1383, 49, '8.00', '11', 'Salon', '88.00', NULL, '-', NULL, NULL, '2021-10-28 19:08:02', 1, 1, NULL, NULL),
(4792, 1383, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', 'prueba', '2021-10-28 19:23:19', '2021-10-28 19:21:06', 0, 0, NULL, NULL),
(4793, 1384, 17, '12.00', '1', 'Salon', '12.00', NULL, '-', NULL, NULL, '2021-10-28 19:53:23', 1, 1, NULL, NULL),
(4794, 1384, 19, '15.00', '1', 'Salon', '15.00', NULL, '-', NULL, NULL, '2021-10-28 19:53:23', 1, 1, NULL, NULL),
(4795, 1384, 39, '10.00', '2', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-28 19:53:23', 1, 1, NULL, NULL),
(4796, 1385, 16, '16.00', '1', 'Salon', '16.00', NULL, '-papas fritas', NULL, NULL, '2021-10-28 20:01:02', 1, 1, NULL, NULL),
(4797, 1386, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-28 20:01:59', 1, 1, NULL, NULL),
(4798, 1385, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-28 20:04:53', 1, 1, NULL, NULL),
(4799, 1384, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-28 20:14:13', 1, 1, NULL, NULL),
(4800, 1387, 19, '15.00', '1', 'Salon', '15.00', NULL, '-', 'FALTA DE INSUMOS', '2021-10-28 20:49:55', '2021-10-28 20:29:17', 0, 0, NULL, NULL),
(4801, 1387, 17, '12.00', '1', 'Salon', '12.00', NULL, '-', NULL, NULL, '2021-10-28 20:29:17', 1, 1, NULL, NULL),
(4802, 1387, 21, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-28 20:29:17', 1, 1, NULL, NULL),
(4803, 1387, 1, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-28 20:29:17', 1, 1, NULL, NULL),
(4804, 1387, 39, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-28 20:29:17', 1, 1, NULL, NULL),
(4805, 1387, 42, '3.00', '2', 'Salon', '6.00', NULL, '-', NULL, NULL, '2021-10-28 20:29:17', 1, 1, NULL, NULL),
(4806, 1387, 37, '4.00', '1', 'Salon', '4.00', NULL, '-', NULL, NULL, '2021-10-28 20:29:17', 1, 1, NULL, NULL),
(4807, 1387, 26, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-28 20:29:17', 1, 1, NULL, NULL),
(4808, 1387, 1, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-28 20:29:17', 1, 1, NULL, NULL),
(4809, 1383, 31, '35.00', '1', 'Salon', '35.00', NULL, '-bbq, picante, Acevichada', NULL, NULL, '2021-10-28 20:33:07', 1, 1, NULL, NULL),
(4810, 1387, 18, '14.00', '1', 'Salon', '14.00', NULL, '-', NULL, NULL, '2021-10-28 20:40:42', 1, 1, NULL, NULL),
(4811, 1383, 42, '3.00', '3', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-28 20:42:53', 1, 1, NULL, NULL),
(4812, 1388, 32, '25.00', '1', 'Salon', '25.00', NULL, '-', NULL, NULL, '2021-10-28 20:52:10', 1, 1, NULL, NULL),
(4813, 1388, 35, '6.00', '1', 'Salon', '6.00', NULL, '-', NULL, NULL, '2021-10-28 20:52:10', 1, 1, NULL, NULL),
(4814, 1388, 3, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-28 20:52:10', 1, 1, NULL, NULL),
(4815, 1388, 2, '17.00', '1', 'Salon', '17.00', NULL, '-', NULL, NULL, '2021-10-28 20:52:10', 1, 1, NULL, NULL),
(4816, 1388, 15, '20.00', '1', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-28 20:52:10', 1, 1, NULL, NULL),
(4817, 1389, 6, '17.00', '1', 'Delivery', '17.00', NULL, '-', NULL, NULL, '2021-10-28 20:58:58', 1, 1, NULL, NULL),
(4818, 1389, 17, '12.00', '1', 'Delivery', '12.00', NULL, '-', NULL, NULL, '2021-10-28 20:58:58', 1, 1, NULL, NULL),
(4819, 1389, 3, '21.00', '1', 'Delivery', '21.00', NULL, '-', NULL, NULL, '2021-10-28 20:58:58', 1, 1, NULL, NULL),
(4820, 1387, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-28 21:04:26', 1, 1, NULL, NULL),
(4821, 1388, 47, '13.00', '1', 'Salon', '13.00', NULL, '-', NULL, NULL, '2021-10-28 21:07:05', 1, 1, NULL, NULL),
(4822, 1390, 50, '10.00', '3', 'Salon', '30.00', NULL, '-', NULL, NULL, '2021-10-28 21:08:31', 1, 1, NULL, NULL),
(4823, 1390, 3, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-28 21:09:41', 1, 1, NULL, NULL),
(4824, 1388, 49, '8.00', '5', 'Salon', '40.00', NULL, '-', NULL, NULL, '2021-10-28 21:11:42', 1, 1, NULL, NULL),
(4825, 1390, 1, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-28 22:08:37', 1, 1, NULL, NULL),
(4826, 1390, 1, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-28 22:08:37', 1, 1, NULL, NULL),
(4827, 1390, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-28 22:09:25', 1, 1, NULL, NULL),
(4828, 1391, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-28 22:23:54', 1, 1, NULL, NULL),
(4829, 1392, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-28 22:27:18', 1, 1, NULL, NULL),
(4830, 1390, 49, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-28 22:33:25', 1, 1, NULL, NULL),
(4831, 1391, 50, '10.00', '2', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-28 22:40:29', 1, 1, NULL, NULL),
(4832, 1393, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-28 23:10:27', 1, 1, NULL, NULL),
(4833, 1394, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-28 23:18:35', 1, 1, NULL, NULL),
(4834, 1395, 52, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-29 19:25:24', 1, 1, NULL, NULL),
(4835, 1396, 53, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-29 19:27:32', 1, 1, NULL, NULL),
(4836, 1397, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 19:48:29', 1, 1, NULL, NULL),
(4837, 1398, 26, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-29 19:57:43', 1, 1, NULL, NULL),
(4838, 1399, 17, '12.00', '1', 'Salon', '12.00', NULL, '-', NULL, NULL, '2021-10-29 20:24:10', 1, 1, NULL, NULL),
(4839, 1399, 20, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 20:24:10', 1, 1, NULL, NULL),
(4840, 1399, 39, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-29 20:24:10', 1, 1, NULL, NULL),
(4841, 1400, 31, '35.00', '1', 'Salon', '35.00', NULL, 'Crispy, picante, acevichado', NULL, NULL, '2021-10-29 20:51:19', 1, 1, NULL, NULL),
(4842, 1400, 41, '3.00', '4', 'Salon', '12.00', NULL, '-', NULL, NULL, '2021-10-29 20:54:01', 1, 1, NULL, NULL),
(4843, 1401, 31, '35.00', '1', 'Salon', '35.00', NULL, 'Bbq, acevichada, crispy.... Cortesi', NULL, NULL, '2021-10-29 21:23:37', 1, 1, NULL, NULL),
(4844, 1402, 31, '35.00', '1', 'Salon', '35.00', NULL, 'Bbq, 2 crispy', NULL, NULL, '2021-10-29 21:31:04', 1, 1, NULL, NULL),
(4845, 1402, 2, '17.00', '1', 'Salon', '17.00', NULL, '-', NULL, NULL, '2021-10-29 21:31:04', 1, 1, NULL, NULL),
(4846, 1402, 18, '14.00', '1', 'Salon', '14.00', NULL, '-', NULL, NULL, '2021-10-29 21:31:04', 1, 1, NULL, NULL),
(4847, 1402, 18, '14.00', '1', 'Salon', '14.00', NULL, '-', NULL, NULL, '2021-10-29 21:31:04', 1, 1, NULL, NULL),
(4848, 1402, 41, '3.00', '4', 'Salon', '12.00', NULL, '-', NULL, NULL, '2021-10-29 21:31:04', 1, 1, NULL, NULL),
(4849, 1401, 19, '15.00', '1', 'Salon', '15.00', NULL, '-', NULL, NULL, '2021-10-29 21:34:22', 1, 1, NULL, NULL),
(4850, 1401, 35, '6.00', '1', 'Salon', '6.00', NULL, '-', NULL, NULL, '2021-10-29 21:34:22', 1, 1, NULL, NULL),
(4851, 1401, 9, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-29 21:34:22', 1, 1, NULL, NULL),
(4852, 1401, 41, '3.00', '6', 'Salon', '18.00', NULL, '-', 'EGAYA', '2021-10-29 23:55:29', '2021-10-29 21:34:22', 0, 0, NULL, NULL),
(4853, 1403, 3, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-29 21:37:09', 1, 1, NULL, NULL),
(4854, 1403, 11, '20.00', '1', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-29 21:37:09', 1, 1, NULL, NULL),
(4855, 1403, 45, '10.00', '2', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-29 21:37:09', 1, 1, NULL, NULL),
(4856, 1403, 1, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-29 21:37:09', 1, 1, NULL, NULL),
(4857, 1401, 20, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 21:49:52', 1, 1, NULL, NULL),
(4858, 1401, 12, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 21:51:49', 1, 1, NULL, NULL),
(4859, 1404, 20, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 21:52:49', 1, 1, NULL, NULL),
(4860, 1404, 3, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-29 21:52:49', 1, 1, NULL, NULL),
(4861, 1404, 42, '3.00', '2', 'Salon', '6.00', NULL, '-', NULL, NULL, '2021-10-29 21:52:49', 1, 1, NULL, NULL),
(4862, 1403, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 21:54:07', 1, 1, NULL, NULL),
(4863, 1404, 2, '17.00', '1', 'Salon', '17.00', NULL, '-', NULL, NULL, '2021-10-29 21:57:37', 1, 1, NULL, NULL),
(4864, 1405, 49, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 22:01:48', 1, 1, NULL, NULL),
(4865, 1405, 26, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-29 22:04:18', 1, 1, NULL, NULL),
(4866, 1405, 17, '12.00', '2', 'Salon', '24.00', NULL, '-', NULL, NULL, '2021-10-29 22:05:09', 1, 1, NULL, NULL),
(4867, 1401, 3, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-29 22:07:12', 1, 1, NULL, NULL),
(4868, 1403, 49, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 22:08:36', 1, 1, NULL, NULL),
(4869, 1406, 42, '3.00', '3', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-29 22:16:53', 1, 1, NULL, NULL),
(4870, 1407, 52, '8.00', '5', 'Salon', '40.00', NULL, '-', NULL, NULL, '2021-10-29 22:24:22', 1, 1, NULL, NULL),
(4871, 1407, 32, '25.00', '1', 'Salon', '25.00', NULL, '-', NULL, NULL, '2021-10-29 22:25:31', 1, 1, NULL, NULL),
(4872, 1408, 4, '17.00', '1', 'Salon', '17.00', NULL, '-', NULL, NULL, '2021-10-29 22:27:09', 1, 1, NULL, NULL),
(4873, 1408, 20, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 22:27:09', 1, 1, NULL, NULL),
(4874, 1408, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 22:27:09', 1, 1, NULL, NULL),
(4875, 1409, 49, '8.00', '5', 'Salon', '40.00', NULL, '-', NULL, NULL, '2021-10-29 22:30:08', 1, 1, NULL, NULL),
(4876, 1402, 49, '8.00', '6', 'Salon', '48.00', NULL, '-', NULL, NULL, '2021-10-29 22:30:35', 1, 1, NULL, NULL),
(4877, 1409, 18, '14.00', '1', 'Salon', '14.00', NULL, '-', 'EGAYA', '2021-10-29 23:22:41', '2021-10-29 22:31:13', 0, 0, NULL, NULL),
(4878, 1405, 41, '3.00', '2', 'Salon', '6.00', NULL, '-', NULL, NULL, '2021-10-29 22:37:49', 1, 1, NULL, NULL),
(4879, 1401, 43, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 22:40:31', 1, 1, NULL, NULL),
(4880, 1408, 15, '20.00', '1', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-29 22:41:17', 1, 1, NULL, NULL),
(4881, 1408, 39, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-29 22:41:17', 1, 1, NULL, NULL),
(4882, 1408, 49, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 22:42:54', 1, 1, NULL, NULL),
(4883, 1408, 43, '3.00', '2', 'Salon', '6.00', NULL, '-', 'EGAYA', '2021-10-30 00:04:31', '2021-10-29 22:43:59', 0, 0, NULL, NULL),
(4884, 1410, 53, '8.00', '4', 'Salon', '32.00', NULL, '-', NULL, NULL, '2021-10-29 22:45:15', 1, 1, NULL, NULL),
(4885, 1404, 52, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-29 22:49:32', 1, 1, NULL, NULL),
(4886, 1411, 49, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 22:55:54', 1, 1, NULL, NULL),
(4887, 1412, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 23:04:02', 1, 1, NULL, NULL),
(4888, 1408, 27, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 23:07:27', 1, 1, NULL, NULL),
(4889, 1413, 49, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 23:21:20', 1, 1, NULL, NULL),
(4890, 1414, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 23:22:17', 1, 1, NULL, NULL),
(4891, 1407, 42, '3.00', '3', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-29 23:26:52', 1, 1, NULL, NULL),
(4892, 1409, 17, '12.00', '1', 'Salon', '12.00', NULL, '-', NULL, NULL, '2021-10-29 23:26:53', 1, 1, NULL, NULL),
(4893, 1415, 49, '8.00', '3', 'Salon', '24.00', NULL, '-', NULL, NULL, '2021-10-29 23:29:19', 1, 1, NULL, NULL),
(4894, 1416, 49, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 23:47:58', 1, 1, NULL, NULL),
(4895, 1401, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 23:53:46', 1, 1, NULL, NULL),
(4896, 1401, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 23:53:59', 1, 1, NULL, NULL),
(4897, 1401, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 23:54:12', 1, 1, NULL, NULL),
(4898, 1401, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 23:54:30', 1, 1, NULL, NULL),
(4899, 1401, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 23:54:40', 1, 1, NULL, NULL),
(4900, 1401, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-29 23:54:49', 1, 1, NULL, NULL),
(4901, 1417, 49, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-29 23:56:16', 1, 1, NULL, NULL),
(4902, 1408, 43, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 00:04:02', 1, 1, NULL, NULL),
(4903, 1408, 43, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 00:04:16', 1, 1, NULL, NULL),
(4904, 1408, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-30 00:06:40', 1, 1, NULL, NULL),
(4905, 1418, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-30 00:09:18', 1, 1, NULL, NULL),
(4906, 1419, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-30 00:11:41', 1, 1, NULL, NULL),
(4907, 1402, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 00:12:08', 1, 1, NULL, NULL),
(4908, 1410, 53, '8.00', '3', 'Salon', '24.00', NULL, '-', NULL, NULL, '2021-10-30 00:18:13', 1, 1, NULL, NULL),
(4909, 1420, 49, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-30 00:33:51', 1, 1, NULL, NULL),
(4910, 1420, 53, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-30 00:33:51', 1, 1, NULL, NULL),
(4911, 1421, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 17:18:33', 1, 1, NULL, NULL),
(4912, 1422, 3, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-30 18:42:27', 1, 1, NULL, NULL),
(4913, 1422, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 18:42:27', 1, 1, NULL, NULL),
(4914, 1423, 52, '8.00', '1', 'Salon', '8.00', NULL, '-LOYDI', NULL, NULL, '2021-10-30 19:05:40', 1, 1, NULL, NULL),
(4915, 1424, 2, '17.00', '2', 'Salon', '34.00', NULL, '-', NULL, NULL, '2021-10-30 19:39:46', 1, 1, NULL, NULL),
(4916, 1424, 15, '20.00', '1', 'Salon', '20.00', NULL, '-papa frita', NULL, NULL, '2021-10-30 19:39:46', 1, 1, NULL, NULL),
(4917, 1424, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 19:39:46', 1, 1, NULL, NULL),
(4918, 1424, 43, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 19:39:46', 1, 1, NULL, NULL),
(4919, 1425, 20, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-30 20:38:10', 1, 1, NULL, NULL),
(4920, 1425, 43, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 20:38:10', 1, 1, NULL, NULL),
(4921, 1425, 35, '6.00', '1', 'Salon', '6.00', NULL, '-', NULL, NULL, '2021-10-30 20:38:10', 1, 1, NULL, NULL),
(4922, 1425, 32, '25.00', '1', 'Salon', '25.00', NULL, '-', NULL, NULL, '2021-10-30 20:49:59', 1, 1, NULL, NULL),
(4923, 1426, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 20:51:08', 1, 1, NULL, NULL),
(4924, 1426, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 20:51:08', 1, 1, NULL, NULL),
(4925, 1426, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 20:51:08', 1, 1, NULL, NULL),
(4926, 1425, 43, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 20:54:31', 1, 1, NULL, NULL),
(4927, 1425, 17, '12.00', '1', 'Salon', '12.00', NULL, '-', NULL, NULL, '2021-10-30 21:21:50', 1, 1, NULL, NULL),
(4928, 1426, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 21:28:05', 1, 1, NULL, NULL),
(4929, 1427, 11, '20.00', '1', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-30 21:40:27', 1, 1, NULL, NULL),
(4930, 1427, 26, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-30 21:40:27', 1, 1, NULL, NULL),
(4931, 1427, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 21:40:27', 1, 1, NULL, NULL),
(4932, 1426, 9, '21.00', '1', 'Salon', '21.00', NULL, '-', 'EQUIVOCACION', '2021-10-30 21:48:34', '2021-10-30 21:44:02', 0, 0, NULL, NULL),
(4933, 1426, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', 'EQUIVOCACION LUIS', '2021-10-30 21:48:56', '2021-10-30 21:44:02', 0, 0, NULL, NULL),
(4934, 1425, 9, '21.00', '1', 'Salon', '21.00', NULL, '-', NULL, NULL, '2021-10-30 21:46:49', 1, 1, NULL, NULL),
(4935, 1425, 43, '3.00', '1', 'Salon', '3.00', NULL, '-', 'Cambiar por coca', '2021-10-30 21:56:05', '2021-10-30 21:46:49', 0, 0, NULL, NULL),
(4936, 1426, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 21:52:19', 1, 1, NULL, NULL),
(4937, 1428, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 21:54:35', 1, 1, NULL, NULL),
(4938, 1425, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 21:56:25', 1, 1, NULL, NULL),
(4939, 1428, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 21:59:31', 1, 1, NULL, NULL),
(4940, 1428, 33, '25.00', '1', 'Salon', '25.00', NULL, '-', NULL, NULL, '2021-10-30 22:00:12', 1, 1, NULL, NULL),
(4941, 1428, 4, '17.00', '1', 'Salon', '17.00', NULL, '-', NULL, NULL, '2021-10-30 22:01:43', 1, 1, NULL, NULL),
(4942, 1428, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:01:51', 1, 1, NULL, NULL),
(4943, 1429, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 22:02:38', 1, 1, NULL, NULL),
(4944, 1430, 31, '35.00', '1', 'Salon', '35.00', NULL, 'Bbq, acevichada, picante', NULL, NULL, '2021-10-30 22:04:39', 1, 1, NULL, NULL),
(4945, 1430, 40, '5.00', '1', 'Salon', '5.00', NULL, '-', NULL, NULL, '2021-10-30 22:04:39', 1, 1, NULL, NULL),
(4946, 1430, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:04:39', 1, 1, NULL, NULL),
(4947, 1429, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:05:10', 1, 1, NULL, NULL),
(4948, 1429, 12, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-30 22:05:16', 1, 1, NULL, NULL),
(4949, 1429, 11, '20.00', '1', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-30 22:05:35', 1, 1, NULL, NULL),
(4950, 1426, 29, '18.00', '1', 'Salon', '18.00', NULL, '-', NULL, NULL, '2021-10-30 22:06:53', 1, 1, NULL, NULL),
(4951, 1426, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:06:53', 1, 1, NULL, NULL),
(4952, 1426, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 22:08:21', 1, 1, NULL, NULL),
(4953, 1425, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:09:51', 1, 1, NULL, NULL),
(4954, 1425, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 22:09:51', 1, 1, NULL, NULL),
(4955, 1431, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 22:11:22', 1, 1, NULL, NULL),
(4956, 1431, 29, '18.00', '1', 'Salon', '18.00', NULL, '-', NULL, NULL, '2021-10-30 22:14:47', 1, 1, NULL, NULL),
(4957, 1429, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:16:01', 1, 1, NULL, NULL),
(4958, 1430, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 22:17:26', 1, 1, NULL, NULL),
(4959, 1430, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 22:17:36', 1, 1, NULL, NULL),
(4960, 1428, 41, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:17:57', 1, 1, NULL, NULL),
(4961, 1430, 19, '15.00', '1', 'Salon', '15.00', NULL, '-', NULL, NULL, '2021-10-30 22:18:39', 1, 1, NULL, NULL),
(4962, 1426, 27, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-30 22:19:05', 1, 1, NULL, NULL),
(4963, 1426, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:19:13', 1, 1, NULL, NULL),
(4964, 1426, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 22:22:18', 1, 1, NULL, NULL),
(4965, 1432, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 22:27:06', 1, 1, NULL, NULL),
(4966, 1432, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:27:06', 1, 1, NULL, NULL),
(4967, 1433, 4, '17.00', '1', 'Salon', '17.00', NULL, '-', NULL, NULL, '2021-10-30 22:28:14', 1, 1, NULL, NULL),
(4968, 1433, 52, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-30 22:28:14', 1, 1, NULL, NULL),
(4969, 1433, 6, '17.00', '1', 'Salon', '17.00', NULL, '-', NULL, NULL, '2021-10-30 22:28:14', 1, 1, NULL, NULL),
(4970, 1432, 31, '35.00', '1', 'Salon', '35.00', NULL, 'Acevichada, picante, bbq', NULL, NULL, '2021-10-30 22:35:12', 1, 1, NULL, NULL),
(4971, 1432, 27, '16.00', '1', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-30 22:35:43', 1, 1, NULL, NULL),
(4972, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 22:39:09', 1, 1, NULL, NULL),
(4973, 1429, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 22:44:01', 1, 1, NULL, NULL),
(4974, 1435, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-30 22:47:49', 1, 1, NULL, NULL),
(4975, 1426, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 22:48:43', 1, 1, NULL, NULL),
(4976, 1435, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 22:49:19', 1, 1, NULL, NULL),
(4977, 1430, 17, '12.00', '1', 'Salon', '12.00', NULL, '-', NULL, NULL, '2021-10-30 22:52:54', 1, 1, NULL, NULL),
(4978, 1432, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 22:53:36', 1, 1, NULL, NULL),
(4979, 1426, 2, '17.00', '1', 'Salon', '17.00', NULL, '-', NULL, NULL, '2021-10-30 22:54:45', 1, 1, NULL, NULL),
(4980, 1430, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 22:56:14', 1, 1, NULL, NULL),
(4981, 1431, 49, '9.00', '2', 'Salon', '18.00', NULL, '-', NULL, NULL, '2021-10-30 22:58:27', 1, 1, NULL, NULL),
(4982, 1423, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 22:59:04', 1, 1, NULL, NULL),
(4983, 1429, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 23:01:32', 1, 1, NULL, NULL),
(4984, 1426, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 23:05:21', 1, 1, NULL, NULL),
(4985, 1430, 43, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 23:05:37', 1, 1, NULL, NULL),
(4986, 1433, 52, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-30 23:09:25', 1, 1, NULL, NULL),
(4987, 1433, 52, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-30 23:09:25', 1, 1, NULL, NULL),
(4988, 1435, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-30 23:09:54', 1, 1, NULL, NULL),
(4989, 1432, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 23:12:41', 1, 1, NULL, NULL),
(4990, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 23:13:00', 1, 1, NULL, NULL),
(4991, 1426, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 23:13:26', 1, 1, NULL, NULL),
(4992, 1425, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 23:15:47', 1, 1, NULL, NULL),
(4993, 1432, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 23:17:08', 1, 1, NULL, NULL),
(4994, 1430, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 23:34:00', 1, 1, NULL, NULL),
(4995, 1435, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-30 23:35:10', 1, 1, NULL, NULL),
(4996, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 23:35:31', 1, 1, NULL, NULL),
(4997, 1429, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 23:39:32', 1, 1, NULL, NULL),
(4998, 1425, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', 'Confundio', '2021-10-31 01:06:35', '2021-10-30 23:40:01', 0, 0, NULL, NULL),
(4999, 1432, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 23:42:40', 1, 1, NULL, NULL),
(5000, 1432, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-30 23:42:40', 1, 1, NULL, NULL),
(5001, 1427, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 23:47:56', 1, 1, NULL, NULL),
(5002, 1427, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', 'EGAYA', '2021-10-31 02:28:40', '2021-10-30 23:47:56', 0, 0, NULL, NULL),
(5003, 1435, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-30 23:50:18', 1, 1, NULL, NULL),
(5004, 1436, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-30 23:59:56', 1, 1, NULL, NULL),
(5005, 1437, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:00:53', 1, 1, NULL, NULL),
(5006, 1432, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:04:53', 1, 1, NULL, NULL),
(5007, 1433, 52, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-31 00:07:42', 1, 1, NULL, NULL),
(5008, 1433, 52, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-31 00:07:42', 1, 1, NULL, NULL),
(5009, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:08:39', 1, 1, NULL, NULL),
(5010, 1425, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:10:20', 1, 1, NULL, NULL),
(5011, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:14:05', 1, 1, NULL, NULL),
(5012, 1429, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 00:14:45', 1, 1, NULL, NULL),
(5013, 1437, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 00:15:07', 1, 1, NULL, NULL),
(5014, 1438, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 00:18:09', 1, 1, NULL, NULL),
(5015, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:20:48', 1, 1, NULL, NULL),
(5016, 1439, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-31 00:21:25', 1, 1, NULL, NULL),
(5017, 1440, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 00:24:09', 1, 1, NULL, NULL),
(5018, 1440, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 00:24:09', 1, 1, NULL, NULL),
(5019, 1432, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:28:41', 1, 1, NULL, NULL),
(5020, 1425, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:28:59', 1, 1, NULL, NULL),
(5021, 1435, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-31 00:31:38', 1, 1, NULL, NULL),
(5022, 1437, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:32:51', 1, 1, NULL, NULL),
(5023, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:33:50', 1, 1, NULL, NULL),
(5024, 1441, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-31 00:36:22', 1, 1, NULL, NULL),
(5025, 1441, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 00:38:12', 1, 1, NULL, NULL),
(5026, 1429, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:38:47', 1, 1, NULL, NULL),
(5027, 1429, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 00:41:17', 1, 1, NULL, NULL),
(5028, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:44:28', 1, 1, NULL, NULL),
(5029, 1432, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:45:11', 1, 1, NULL, NULL),
(5030, 1437, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:45:34', 1, 1, NULL, NULL),
(5031, 1442, 42, '3.00', '2', 'Salon', '6.00', NULL, '-', NULL, NULL, '2021-10-31 00:46:36', 1, 1, NULL, NULL),
(5032, 1442, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-31 00:47:45', 1, 1, NULL, NULL),
(5033, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 00:49:17', 1, 1, NULL, NULL),
(5034, 1443, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 00:51:54', 1, 1, NULL, NULL),
(5035, 1433, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-31 00:55:29', 1, 1, NULL, NULL),
(5036, 1433, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 00:55:29', 1, 1, NULL, NULL),
(5037, 1444, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 00:58:44', 1, 1, NULL, NULL),
(5038, 1445, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 01:00:09', 1, 1, NULL, NULL),
(5039, 1427, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 01:01:43', 1, 1, NULL, NULL),
(5040, 1446, 52, '8.00', '2', 'Salon', '16.00', NULL, '-', NULL, NULL, '2021-10-31 01:05:26', 1, 1, NULL, NULL),
(5041, 1434, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 01:06:15', 1, 1, NULL, NULL),
(5042, 1437, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 01:07:06', 1, 1, NULL, NULL),
(5043, 1447, 50, '10.00', '2', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-31 01:09:54', 1, 1, NULL, NULL),
(5044, 1446, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 01:15:30', 1, 1, NULL, NULL),
(5045, 1448, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 01:16:49', 1, 1, NULL, NULL),
(5046, 1446, 50, '10.00', '2', 'Salon', '20.00', NULL, '-', NULL, NULL, '2021-10-31 01:18:52', 1, 1, NULL, NULL),
(5047, 1446, 44, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 01:19:19', 1, 1, NULL, NULL),
(5048, 1446, 49, '9.00', '2', 'Salon', '18.00', NULL, '-', NULL, NULL, '2021-10-31 01:19:44', 1, 1, NULL, NULL),
(5049, 1447, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 01:22:24', 1, 1, NULL, NULL),
(5050, 1447, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 01:23:11', 1, 1, NULL, NULL),
(5051, 1425, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 01:24:03', 1, 1, NULL, NULL),
(5052, 1449, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 01:24:10', 1, 0, NULL, NULL),
(5053, 1450, 49, '9.00', '2', 'Salon', '18.00', NULL, '-', NULL, NULL, '2021-10-31 01:25:17', 1, 1, NULL, NULL),
(5054, 1433, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 01:36:06', 1, 1, NULL, NULL),
(5055, 1429, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 01:36:47', 1, 1, NULL, NULL),
(5056, 1432, 42, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 01:37:27', 1, 1, NULL, NULL),
(5057, 1432, 49, '9.00', '2', 'Salon', '18.00', NULL, '-', NULL, NULL, '2021-10-31 01:37:54', 1, 1, NULL, NULL),
(5058, 1451, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-31 01:40:30', 1, 1, NULL, NULL),
(5059, 1451, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 01:40:30', 1, 1, NULL, NULL),
(5060, 1451, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 01:41:15', 1, 1, NULL, NULL),
(5061, 1452, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', 'EGAYA', '2021-10-31 01:44:24', '2021-10-31 01:43:10', 0, 0, NULL, NULL),
(5062, 1453, 50, '10.00', '1', 'Salon', '10.00', NULL, '-', NULL, NULL, '2021-10-31 01:45:28', 1, 1, NULL, NULL),
(5063, 1432, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 01:49:14', 1, 1, NULL, NULL),
(5064, 1432, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 01:49:56', 1, 1, NULL, NULL),
(5065, 1454, 52, '8.00', '5', 'Salon', '40.00', NULL, '-', NULL, NULL, '2021-10-31 01:50:17', 1, 1, NULL, NULL),
(5066, 1425, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 01:52:24', 1, 1, NULL, NULL),
(5067, 1427, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 01:53:09', 1, 1, NULL, NULL),
(5068, 1425, 58, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 01:54:37', 1, 1, NULL, NULL),
(5069, 1455, 53, '8.00', '8', 'Salon', '64.00', NULL, '-', NULL, NULL, '2021-10-31 02:03:19', 1, 1, NULL, NULL),
(5070, 1456, 53, '8.00', '6', 'Salon', '48.00', NULL, '-', NULL, NULL, '2021-10-31 02:06:09', 1, 1, NULL, NULL),
(5071, 1457, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 02:12:07', 1, 1, NULL, NULL),
(5072, 1458, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 02:20:44', 1, 1, NULL, NULL),
(5073, 1459, 49, '9.00', '1', 'Salon', '9.00', NULL, '-', NULL, NULL, '2021-10-31 02:22:36', 1, 1, NULL, NULL),
(5074, 1460, 42, '3.00', '4', 'Salon', '12.00', NULL, '-', NULL, NULL, '2021-10-31 02:37:00', 1, 1, NULL, NULL),
(5075, 1460, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 02:37:00', 1, 1, NULL, NULL),
(5076, 1460, 60, '45.00', '1', 'Salon', '45.00', NULL, '-', NULL, NULL, '2021-10-31 02:37:00', 1, 1, NULL, NULL),
(5077, 1460, 53, '8.00', '1', 'Salon', '8.00', NULL, '-', NULL, NULL, '2021-10-31 02:37:00', 1, 1, NULL, NULL),
(5078, 1460, 52, '8.00', '3', 'Salon', '24.00', NULL, '-', NULL, NULL, '2021-10-31 02:37:00', 1, 1, NULL, NULL),
(5079, 1461, 43, '3.00', '1', 'Salon', '3.00', NULL, '-', NULL, NULL, '2021-10-31 18:04:23', 1, 1, NULL, NULL),
(5080, 1462, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-02 18:16:52', 1, 1, NULL, NULL),
(5081, 1463, 19, '15.00', '1', 'SALON', '15.00', '0.00', '-', NULL, NULL, '2021-11-02 18:59:59', 1, 1, NULL, NULL),
(5082, 1463, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-02 18:59:59', 1, 1, NULL, NULL),
(5083, 1464, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-02 19:10:57', 1, 1, NULL, NULL),
(5084, 1465, 3, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-02 19:19:10', 1, 1, NULL, NULL),
(5085, 1465, 24, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-02 19:19:10', 1, 1, NULL, NULL),
(5086, 1465, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-02 19:19:10', 1, 1, NULL, NULL),
(5087, 1466, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-02 19:34:47', 1, 1, NULL, NULL),
(5088, 1467, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-03 19:20:39', 1, 1, NULL, NULL),
(5089, 1467, 24, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-03 19:20:39', 1, 1, NULL, NULL),
(5090, 1467, 44, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-03 19:20:39', 1, 1, NULL, NULL),
(5091, 1467, 41, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-03 19:20:39', 1, 1, NULL, NULL),
(5092, 1467, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-03 19:49:48', 1, 1, NULL, NULL),
(5093, 1468, 4, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-03 20:31:14', 1, 1, NULL, NULL),
(5094, 1468, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-03 20:31:14', 1, 1, NULL, NULL),
(5095, 1468, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-03 20:31:14', 1, 1, NULL, NULL),
(5096, 1468, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-03 20:32:47', 1, 1, NULL, NULL),
(5097, 1468, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-03 20:32:47', 1, 1, NULL, NULL),
(5098, 1468, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-03 20:32:47', 1, 1, NULL, NULL),
(5099, 1468, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-03 20:33:05', 1, 1, NULL, NULL),
(5100, 1469, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-03 20:34:34', 1, 1, NULL, NULL),
(5101, 1469, 24, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-03 20:34:34', 1, 1, NULL, NULL),
(5102, 1468, 49, '8.00', '2', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-03 20:42:09', 1, 1, NULL, NULL),
(5103, 1468, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-03 20:42:24', 1, 1, NULL, NULL),
(5104, 1468, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-03 21:01:45', 1, 1, NULL, NULL),
(5105, 1468, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-03 21:04:01', 1, 1, NULL, NULL),
(5106, 1468, 24, '20.00', '1', 'SALON', '20.00', '0.00', '-SE VENDIO BROASTER AL PRECIO DE CHAUFA REGIONAL', NULL, NULL, '2021-11-03 21:08:07', 1, 1, NULL, NULL),
(5107, 1468, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-03 21:09:03', 1, 1, NULL, NULL),
(5108, 1468, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-03 21:26:05', 1, 1, NULL, NULL),
(5109, 1468, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-03 21:34:19', 1, 1, NULL, NULL),
(5110, 1468, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-03 21:47:26', 1, 1, NULL, NULL),
(5111, 1468, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-03 21:49:35', 1, 1, NULL, NULL),
(5112, 1468, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-03 22:14:03', 1, 1, NULL, NULL),
(5113, 1468, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-03 22:28:11', 1, 1, NULL, NULL),
(5114, 1468, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-03 22:39:51', 1, 1, NULL, NULL),
(5115, 1470, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-05 19:19:16', 1, 1, NULL, NULL),
(5116, 1471, 31, '35.00', '2', 'SALON', '70.00', '0.00', '-', NULL, NULL, '2021-11-05 19:42:20', 1, 1, NULL, NULL),
(5117, 1471, 11, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-05 19:42:20', 1, 1, NULL, NULL),
(5118, 1471, 35, '6.00', '1', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-05 19:42:20', 1, 1, NULL, NULL),
(5119, 1471, 45, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-05 19:42:20', 1, 1, NULL, NULL),
(5120, 1471, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-05 19:42:20', 1, 1, NULL, NULL),
(5121, 1470, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-05 19:45:39', 1, 1, NULL, NULL),
(5122, 1472, 20, '16.00', '2', 'SALON', '32.00', '0.00', '-', NULL, NULL, '2021-11-05 20:06:00', 1, 1, NULL, NULL),
(5123, 1472, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-05 20:06:00', 1, 1, NULL, NULL),
(5124, 1470, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-05 20:18:10', 1, 1, NULL, NULL),
(5125, 1472, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-05 20:19:03', 1, 1, NULL, NULL),
(5126, 1470, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-05 20:35:11', 1, 1, NULL, NULL),
(5127, 1470, 50, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-05 21:10:52', 1, 1, NULL, NULL),
(5128, 1473, 12, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-05 21:14:19', 1, 1, NULL, NULL),
(5129, 1473, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-05 21:14:19', 1, 1, NULL, NULL),
(5130, 1473, 53, '8.00', '2', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-05 21:14:19', 1, 1, NULL, NULL),
(5131, 1473, 42, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-05 21:15:35', 1, 1, NULL, NULL),
(5132, 1474, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-05 21:32:20', 1, 1, NULL, NULL),
(5133, 1475, 52, '8.00', '2', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-05 21:32:44', 1, 1, NULL, NULL),
(5134, 1474, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-05 21:37:09', 1, 1, NULL, NULL),
(5135, 1474, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-05 21:37:26', 1, 1, NULL, NULL),
(5136, 1474, 44, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-05 21:38:22', 1, 1, NULL, NULL),
(5137, 1474, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-05 21:38:32', 1, 1, NULL, NULL),
(5138, 1474, 8, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-05 21:47:16', 1, 1, NULL, NULL),
(5139, 1476, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-05 21:48:39', 1, 1, NULL, NULL),
(5140, 1476, 41, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-05 21:48:39', 1, 1, NULL, NULL),
(5141, 1474, 41, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-05 22:01:17', 1, 1, NULL, NULL),
(5142, 1474, 24, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-05 22:02:56', 1, 1, NULL, NULL),
(5143, 1474, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-05 22:12:47', 1, 1, NULL, NULL),
(5144, 1474, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-05 22:19:22', 1, 1, NULL, NULL),
(5145, 1477, 39, '10.00', '1', 'SALON', '10.00', '0.00', '-', 'Confundió de mesa ', '2021-11-05 22:41:27', '2021-11-05 22:34:15', 0, 0, NULL, NULL),
(5146, 1478, 2, '17.00', '2', 'SALON', '34.00', '0.00', '-', NULL, NULL, '2021-11-05 22:34:18', 1, 1, NULL, NULL),
(5147, 1476, 53, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-05 22:39:19', 1, 1, NULL, NULL),
(5148, 1478, 39, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-05 22:40:17', 1, 1, NULL, NULL),
(5149, 1479, 134, '70.00', '1', 'SALON', '70.00', '0.00', '-', NULL, NULL, '2021-11-06 18:56:54', 1, 1, NULL, NULL),
(5150, 1479, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-06 18:57:34', 1, 1, NULL, NULL),
(5151, 1479, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-06 18:57:34', 1, 1, NULL, NULL),
(5152, 1479, 36, '4.00', '1', 'SALON', '4.00', '0.00', '-', NULL, NULL, '2021-11-06 19:23:39', 1, 1, NULL, NULL),
(5153, 1480, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-06 20:59:49', 1, 1, NULL, NULL),
(5154, 1481, 33, '25.00', '1', 'SALON', '25.00', '0.00', '-', NULL, NULL, '2021-11-06 22:39:20', 1, 1, NULL, NULL),
(5155, 1481, 4, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-06 22:39:20', 1, 1, NULL, NULL),
(5156, 1481, 45, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-06 22:39:20', 1, 1, NULL, NULL),
(5157, 1481, 11, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-06 22:39:20', 1, 1, NULL, NULL),
(5158, 1482, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-06 23:24:42', 1, 1, NULL, NULL),
(5159, 1483, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-07 19:45:48', 1, 1, NULL, NULL),
(5160, 1484, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-09 18:12:18', 1, 1, NULL, NULL),
(5161, 1485, 12, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-09 21:28:13', 1, 1, NULL, NULL),
(5162, 1485, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-09 21:28:29', 1, 1, NULL, NULL),
(5163, 1485, 36, '4.00', '1', 'SALON', '4.00', '0.00', '-', NULL, NULL, '2021-11-09 21:46:26', 1, 1, NULL, NULL),
(5164, 1485, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-09 21:53:35', 1, 1, NULL, NULL),
(5165, 1485, 19, '15.00', '1', 'SALON', '15.00', '0.00', '-', NULL, NULL, '2021-11-09 22:02:02', 1, 1, NULL, NULL),
(5166, 1486, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-09 22:02:35', 1, 1, NULL, NULL),
(5167, 1486, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-09 22:27:41', 1, 1, NULL, NULL),
(5168, 1487, 4, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-10 19:21:00', 1, 1, NULL, NULL),
(5169, 1487, 24, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-10 19:21:00', 1, 1, NULL, NULL),
(5170, 1487, 34, '25.00', '1', 'SALON', '25.00', '0.00', '-', NULL, NULL, '2021-11-10 19:21:00', 1, 1, NULL, NULL),
(5171, 1487, 44, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-10 19:21:00', 1, 1, NULL, NULL),
(5172, 1488, 3, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-10 19:23:14', 1, 1, NULL, NULL),
(5173, 1488, 15, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-10 19:23:14', 1, 1, NULL, NULL),
(5174, 1488, 39, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-10 19:23:14', 1, 1, NULL, NULL),
(5175, 1487, 52, '8.00', '2', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-10 19:32:50', 1, 1, NULL, NULL),
(5176, 1489, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-10 20:56:42', 1, 1, NULL, NULL),
(5177, 1489, 31, '35.00', '1', 'SALON', '35.00', '0.00', '-', NULL, NULL, '2021-11-10 20:56:42', 1, 1, NULL, NULL),
(5178, 1489, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-10 21:18:19', 1, 1, NULL, NULL),
(5179, 1489, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-10 21:18:46', 1, 1, NULL, NULL),
(5180, 1489, 36, '4.00', '1', 'SALON', '4.00', '0.00', '-', NULL, NULL, '2021-11-10 21:25:50', 1, 1, NULL, NULL),
(5181, 1490, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-10 22:08:41', 1, 1, NULL, NULL),
(5182, 1491, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-10 23:45:50', 1, 1, NULL, NULL),
(5183, 1492, 45, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-11 18:45:04', 1, 1, NULL, NULL),
(5184, 1492, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 18:45:04', 1, 1, NULL, NULL),
(5185, 1492, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 18:45:04', 1, 1, NULL, NULL),
(5186, 1493, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-11 19:14:53', 1, 1, NULL, NULL),
(5187, 1493, 16, '16.00', '1', 'SALON', '16.00', '0.00', '-papa dorada', NULL, NULL, '2021-11-11 19:14:53', 1, 1, NULL, NULL),
(5188, 1493, 39, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-11 19:14:53', 1, 1, NULL, NULL),
(5189, 1494, 24, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-11 19:39:30', 1, 1, NULL, NULL),
(5190, 1495, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-11 20:40:13', 1, 1, NULL, NULL),
(5191, 1495, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 20:40:13', 1, 1, NULL, NULL),
(5192, 1496, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-chaufa servido aparte', NULL, NULL, '2021-11-11 20:49:57', 1, 1, NULL, NULL),
(5193, 1496, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-11 20:49:57', 1, 1, NULL, NULL),
(5194, 1496, 14, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-11 20:49:57', 1, 1, NULL, NULL),
(5195, 1496, 43, '3.00', '3', 'SALON', '9.00', '0.00', '-', NULL, NULL, '2021-11-11 20:49:57', 1, 1, NULL, NULL),
(5196, 1497, 18, '14.00', '1', 'SALON', '14.00', '0.00', '-', NULL, NULL, '2021-11-11 21:02:09', 1, 1, NULL, NULL),
(5197, 1497, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 21:02:09', 1, 1, NULL, NULL),
(5198, 1498, 27, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-11 21:20:37', 1, 1, NULL, NULL),
(5199, 1499, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-11 21:23:30', 1, 1, NULL, NULL),
(5200, 1499, 27, '16.00', '1', 'SALON', '16.00', '0.00', '-', 'CAMBIO A OTRA MESA', '2021-11-11 22:58:44', '2021-11-11 21:23:30', 0, 0, NULL, NULL),
(5201, 1499, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 21:23:30', 1, 1, NULL, NULL),
(5202, 1499, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 21:23:30', 1, 1, NULL, NULL),
(5203, 1499, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-11 21:23:30', 1, 1, NULL, NULL),
(5204, 1499, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', 'CAMBIO A OTRA MESA', '2021-11-11 22:59:08', '2021-11-11 21:23:30', 0, 0, NULL, NULL),
(5205, 1499, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', 'CAMBIO A OTRA MESA', '2021-11-11 22:58:20', '2021-11-11 21:23:30', 0, 0, NULL, NULL),
(5206, 1499, 18, '14.00', '1', 'SALON', '14.00', '0.00', '-', NULL, NULL, '2021-11-11 21:23:30', 1, 1, NULL, NULL),
(5207, 1500, 11, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-11 21:23:59', 1, 1, NULL, NULL),
(5208, 1501, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 21:25:56', 1, 1, NULL, NULL),
(5209, 1501, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-11 21:25:56', 1, 1, NULL, NULL),
(5210, 1501, 26, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-11 21:25:56', 1, 1, NULL, NULL),
(5211, 1498, 35, '6.00', '1', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-11 21:28:46', 1, 1, NULL, NULL),
(5212, 1500, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 21:34:04', 1, 1, NULL, NULL),
(5213, 1496, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 21:41:34', 1, 1, NULL, NULL),
(5214, 1502, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-11 21:43:34', 1, 1, NULL, NULL),
(5215, 1499, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', 'CAMBIO A OTRA MESA', '2021-11-11 22:59:34', '2021-11-11 21:46:21', 0, 0, NULL, NULL),
(5216, 1499, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 21:54:37', 1, 1, NULL, NULL),
(5217, 1501, 36, '4.00', '1', 'SALON', '4.00', '0.00', '-', NULL, NULL, '2021-11-11 21:59:18', 1, 1, NULL, NULL),
(5218, 1498, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 22:01:35', 1, 1, NULL, NULL),
(5219, 1498, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 22:02:32', 1, 1, NULL, NULL),
(5220, 1503, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-11 22:06:01', 1, 1, NULL, NULL),
(5221, 1501, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 22:12:31', 1, 1, NULL, NULL),
(5222, 1499, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-11 22:31:49', 1, 1, NULL, NULL),
(5223, 1499, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-11 22:31:49', 1, 1, NULL, NULL),
(5224, 1499, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 22:31:49', 1, 1, NULL, NULL),
(5225, 1499, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-11 22:51:11', 1, 1, NULL, NULL),
(5226, 1499, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-11 22:51:11', 1, 1, NULL, NULL);
INSERT INTO `comanda_detalle` (`id_comanda_detalle`, `id_comanda`, `id_producto`, `comanda_detalle_precio`, `comanda_detalle_cantidad`, `comanda_detalle_despacho`, `comanda_detalle_total`, `comanda_detalle_descuento`, `comanda_detalle_observacion`, `comanda_detalle_eliminacion`, `comanda_detalle_fecha_eliminacion`, `comanda_detalle_fecha_registro`, `comanda_detalle_estado`, `comanda_detalle_estado_venta`, `comanda_detalle_hora_entrega`, `comanda_detalle_usuario`) VALUES
(5227, 1504, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-11 23:00:11', 1, 1, NULL, NULL),
(5228, 1504, 27, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-11 23:00:11', 1, 1, NULL, NULL),
(5229, 1504, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 23:00:11', 1, 1, NULL, NULL),
(5230, 1504, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-11 23:00:11', 1, 1, NULL, NULL),
(5231, 1499, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-11 23:03:43', 1, 1, NULL, NULL),
(5232, 1499, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-11 23:03:43', 1, 1, NULL, NULL),
(5233, 1499, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-11 23:24:39', 1, 1, NULL, NULL),
(5234, 1499, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-11 23:43:03', 1, 1, NULL, NULL),
(5235, 1499, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 00:23:52', 1, 1, NULL, NULL),
(5236, 1499, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 00:51:13', 1, 1, NULL, NULL),
(5237, 1505, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 18:54:30', 1, 1, NULL, NULL),
(5238, 1505, 52, '8.00', '5', 'SALON', '40.00', '0.00', '-', NULL, NULL, '2021-11-12 18:54:30', 1, 1, NULL, NULL),
(5239, 1505, 53, '8.00', '5', 'SALON', '40.00', '0.00', '-', NULL, NULL, '2021-11-12 18:54:30', 1, 1, NULL, NULL),
(5240, 1506, 18, '14.00', '1', 'SALON', '14.00', '0.00', '-', NULL, NULL, '2021-11-12 19:04:34', 1, 1, NULL, NULL),
(5241, 1506, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-12 19:04:34', 1, 1, NULL, NULL),
(5242, 1506, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-12 19:04:34', 1, 1, NULL, NULL),
(5243, 1506, 43, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-12 19:04:34', 1, 1, NULL, NULL),
(5244, 1506, 35, '6.00', '1', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-12 19:15:05', 1, 1, NULL, NULL),
(5245, 1506, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 19:28:01', 1, 1, NULL, NULL),
(5246, 1507, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-12 19:57:09', 1, 1, NULL, NULL),
(5247, 1508, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', 'CAMBIO DE PEDIDO', '2021-11-12 21:45:51', '2021-11-12 21:09:47', 0, 0, NULL, NULL),
(5248, 1508, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 21:41:32', 1, 1, NULL, NULL),
(5249, 1508, 134, '70.00', '1', 'SALON', '70.00', '0.00', '-acevichada, búfalo, bbq', NULL, NULL, '2021-11-12 21:45:54', 1, 1, NULL, NULL),
(5250, 1509, 15, '20.00', '1', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-12 21:57:48', 1, 1, NULL, NULL),
(5251, 1509, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-12 21:57:48', 1, 1, NULL, NULL),
(5252, 1508, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 22:04:41', 1, 1, NULL, NULL),
(5253, 1508, 134, '70.00', '1', 'SALON', '70.00', '0.00', '-2 bbq 1 acevichado', NULL, NULL, '2021-11-12 22:06:36', 1, 1, NULL, NULL),
(5254, 1509, 25, '15.00', '1', 'SALON', '15.00', '0.00', '-', NULL, NULL, '2021-11-12 22:12:01', 1, 1, NULL, NULL),
(5255, 1509, 3, '21.00', '1', 'SALON', '21.00', '0.00', '-', 'ERROR', '2021-11-13 01:52:58', '2021-11-12 22:14:45', 0, 0, NULL, NULL),
(5256, 1509, 35, '6.00', '1', 'SALON', '6.00', '0.00', '-', 'ERROR', '2021-11-13 01:54:15', '2021-11-12 22:14:45', 0, 0, NULL, NULL),
(5257, 1509, 35, '6.00', '1', 'SALON', '6.00', '0.00', '-con huevo frito montado', 'ERROR DE PEDIDO', '2021-11-12 22:31:52', '2021-11-12 22:14:45', 0, 0, NULL, NULL),
(5258, 1509, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', 'ERROR', '2021-11-13 01:55:02', '2021-11-12 22:14:45', 0, 0, NULL, NULL),
(5259, 1509, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', 'ERROR', '2021-11-13 01:55:18', '2021-11-12 22:14:45', 0, 0, NULL, NULL),
(5260, 1509, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 22:16:22', 1, 1, NULL, NULL),
(5261, 1509, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', 'CAMBIODE MESA', '2021-11-12 22:47:14', '2021-11-12 22:16:36', 0, 0, NULL, NULL),
(5262, 1510, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-12 22:24:00', 1, 1, NULL, NULL),
(5263, 1510, 33, '25.00', '1', 'SALON', '25.00', '0.00', '-', NULL, NULL, '2021-11-12 22:24:00', 1, 1, NULL, NULL),
(5264, 1510, 36, '4.00', '1', 'SALON', '4.00', '0.00', '-', NULL, NULL, '2021-11-12 22:24:00', 1, 1, NULL, NULL),
(5265, 1510, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 22:24:00', 1, 1, NULL, NULL),
(5266, 1509, 16, '16.00', '1', 'SALON', '16.00', '0.00', '-', 'ERROR ', '2021-11-13 01:54:40', '2021-11-12 22:26:52', 0, 0, NULL, NULL),
(5267, 1509, 41, '3.00', '1', 'SALON', '3.00', '0.00', '-', 'ERROR', '2021-11-13 01:56:19', '2021-11-12 22:26:52', 0, 0, NULL, NULL),
(5268, 1509, 25, '15.00', '1', 'SALON', '15.00', '0.00', '-', 'ERROR', '2021-11-12 23:17:10', '2021-11-12 22:32:27', 0, 0, NULL, NULL),
(5269, 1509, 25, '15.00', '1', 'SALON', '15.00', '0.00', '-', 'CAMBIO DE MESA', '2021-11-12 23:45:21', '2021-11-12 22:34:52', 0, 0, NULL, NULL),
(5270, 1511, 31, '35.00', '1', 'SALON', '35.00', '0.00', '-', 'NO HAY', '2021-11-12 22:49:32', '2021-11-12 22:35:32', 0, 0, NULL, NULL),
(5271, 1509, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-12 22:42:41', 1, 1, NULL, NULL),
(5272, 1512, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 22:44:41', 1, 1, NULL, NULL),
(5273, 1513, 27, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-12 22:54:20', 1, 1, NULL, NULL),
(5274, 1513, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 22:54:20', 1, 1, NULL, NULL),
(5275, 1513, 41, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-12 22:54:20', 1, 1, NULL, NULL),
(5276, 1509, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-12 22:57:25', 1, 1, NULL, NULL),
(5277, 1509, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-12 22:57:37', 1, 1, NULL, NULL),
(5278, 1514, 52, '8.00', '4', 'SALON', '32.00', '0.00', '-', 'ERROR', '2021-11-13 00:40:31', '2021-11-12 22:58:28', 0, 0, NULL, NULL),
(5279, 1514, 52, '8.00', '5', 'SALON', '40.00', '0.00', '-', NULL, NULL, '2021-11-12 22:58:28', 1, 1, NULL, NULL),
(5280, 1515, 49, '8.00', '2', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-12 23:01:45', 1, 1, NULL, NULL),
(5281, 1515, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 23:01:45', 1, 1, NULL, NULL),
(5282, 1509, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 23:04:18', 1, 1, NULL, NULL),
(5283, 1509, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 23:04:18', 1, 1, NULL, NULL),
(5284, 1510, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 23:07:43', 1, 1, NULL, NULL),
(5285, 1516, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 23:12:29', 1, 1, NULL, NULL),
(5286, 1516, 53, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-12 23:12:29', 1, 1, NULL, NULL),
(5287, 1508, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 23:13:10', 1, 1, NULL, NULL),
(5288, 1517, 25, '15.00', '1', 'SALON', '15.00', '0.00', '-', 'ERROR', '2021-11-12 23:52:57', '2021-11-12 23:18:35', 0, 0, NULL, NULL),
(5289, 1517, 43, '3.00', '2', 'SALON', '6.00', '0.00', '-', 'ERROR', '2021-11-12 23:53:16', '2021-11-12 23:18:35', 0, 0, NULL, NULL),
(5290, 1517, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', 'ERROR', '2021-11-12 23:53:47', '2021-11-12 23:18:35', 0, 0, NULL, NULL),
(5291, 1517, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', 'ERROR', '2021-11-12 23:55:27', '2021-11-12 23:18:35', 0, 0, NULL, NULL),
(5292, 1518, 49, '8.00', '3', 'SALON', '24.00', '0.00', '-', NULL, NULL, '2021-11-12 23:23:51', 1, 1, NULL, NULL),
(5293, 1519, 49, '8.00', '3', 'SALON', '24.00', '0.00', '-', NULL, NULL, '2021-11-12 23:25:22', 1, 1, NULL, NULL),
(5294, 1520, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 23:29:07', 1, 1, NULL, NULL),
(5295, 1521, 60, '45.00', '2', 'SALON', '90.00', '0.00', '-', NULL, NULL, '2021-11-12 23:32:08', 1, 1, NULL, NULL),
(5296, 1522, 49, '8.00', '3', 'SALON', '24.00', '0.00', '-', NULL, NULL, '2021-11-12 23:35:03', 1, 1, NULL, NULL),
(5297, 1523, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 23:36:30', 1, 1, NULL, NULL),
(5298, 1514, 52, '8.00', '4', 'SALON', '32.00', '0.00', '-', NULL, NULL, '2021-11-12 23:39:43', 1, 1, NULL, NULL),
(5299, 1513, 27, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-12 23:41:21', 1, 1, NULL, NULL),
(5300, 1513, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 23:41:21', 1, 1, NULL, NULL),
(5301, 1513, 42, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-12 23:41:21', 1, 1, NULL, NULL),
(5302, 1516, 25, '15.00', '1', 'SALON', '15.00', '0.00', '-', NULL, NULL, '2021-11-12 23:43:37', 1, 1, NULL, NULL),
(5303, 1516, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-12 23:43:37', 1, 1, NULL, NULL),
(5304, 1516, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 23:43:37', 1, 1, NULL, NULL),
(5305, 1516, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 23:44:13', 1, 1, NULL, NULL),
(5306, 1516, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-12 23:44:13', 1, 1, NULL, NULL),
(5307, 1508, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 23:47:00', 1, 1, NULL, NULL),
(5308, 1524, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-12 23:48:20', 1, 1, NULL, NULL),
(5309, 1510, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 23:50:38', 1, 1, NULL, NULL),
(5310, 1517, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 23:54:30', 1, 1, NULL, NULL),
(5311, 1525, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-12 23:56:47', 1, 1, NULL, NULL),
(5312, 1526, 50, '10.00', '2', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-13 00:02:52', 1, 1, NULL, NULL),
(5313, 1526, 49, '8.00', '2', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-13 00:02:52', 1, 1, NULL, NULL),
(5314, 1527, 60, '45.00', '2', 'SALON', '90.00', '0.00', '-', NULL, NULL, '2021-11-13 00:07:56', 1, 1, NULL, NULL),
(5315, 1516, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-13 00:08:36', 1, 1, NULL, NULL),
(5316, 1528, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-13 00:10:03', 1, 1, NULL, NULL),
(5317, 1529, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', 'ERROR', '2021-11-13 00:28:00', '2021-11-13 00:20:30', 0, 0, NULL, NULL),
(5318, 1508, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-13 00:29:57', 1, 1, NULL, NULL),
(5319, 1530, 50, '10.00', '2', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-13 00:31:38', 1, 1, NULL, NULL),
(5320, 1530, 49, '8.00', '2', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-13 00:31:38', 1, 1, NULL, NULL),
(5321, 1516, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-13 00:32:39', 1, 1, NULL, NULL),
(5322, 1516, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 00:32:39', 1, 1, NULL, NULL),
(5323, 1531, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 00:35:11', 1, 1, NULL, NULL),
(5324, 1509, 52, '8.00', '2', 'SALON', '16.00', '0.00', '-BALDE DE CORONA', NULL, NULL, '2021-11-13 00:36:54', 1, 1, NULL, NULL),
(5325, 1510, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-13 00:46:42', 1, 1, NULL, NULL),
(5326, 1513, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 00:47:45', 1, 1, NULL, NULL),
(5327, 1516, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-13 00:54:14', 1, 1, NULL, NULL),
(5328, 1532, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 00:55:39', 1, 1, NULL, NULL),
(5329, 1533, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-', 'ERROR', '2021-11-13 01:17:21', '2021-11-13 00:58:24', 0, 0, NULL, NULL),
(5330, 1534, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-13 01:01:11', 1, 1, NULL, NULL),
(5331, 1535, 49, '8.00', '2', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-13 01:06:15', 1, 1, NULL, NULL),
(5332, 1535, 50, '10.00', '2', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-13 01:06:15', 1, 1, NULL, NULL),
(5333, 1536, 52, '8.00', '8', 'SALON', '64.00', '0.00', '-', NULL, NULL, '2021-11-13 01:07:41', 1, 1, NULL, NULL),
(5334, 1513, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-13 01:11:39', 1, 1, NULL, NULL),
(5335, 1509, 52, '8.00', '1', 'SALON', '8.00', '0.00', '-PIANISTA', 'ERROR', '2021-11-13 01:53:15', '2021-11-13 01:12:56', 0, 0, NULL, NULL),
(5336, 1535, 52, '8.00', '4', 'SALON', '32.00', '0.00', '-', NULL, NULL, '2021-11-13 01:17:53', 1, 1, NULL, NULL),
(5337, 1516, 52, '8.00', '2', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-13 01:19:26', 1, 1, NULL, NULL),
(5338, 1508, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', 'ERROR', '2021-11-13 01:59:22', '2021-11-13 01:37:25', 0, 0, NULL, NULL),
(5339, 1513, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-13 01:40:49', 1, 1, NULL, NULL),
(5340, 1537, 50, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-13 01:46:25', 1, 1, NULL, NULL),
(5341, 1509, 41, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 01:50:22', 1, 1, NULL, NULL),
(5342, 1538, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 01:58:41', 1, 1, NULL, NULL),
(5343, 1508, 52, '8.00', '3', 'SALON', '24.00', '0.00', '-', NULL, NULL, '2021-11-13 01:59:36', 1, 1, NULL, NULL),
(5344, 1539, 50, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-13 02:05:11', 1, 1, NULL, NULL),
(5345, 1540, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-13 02:28:33', 1, 1, NULL, NULL),
(5346, 1540, 50, '10.00', '2', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-13 02:28:33', 1, 1, NULL, NULL),
(5347, 1536, 52, '8.00', '5', 'SALON', '40.00', '0.00', '-', NULL, NULL, '2021-11-13 02:31:23', 1, 1, NULL, NULL),
(5348, 1541, 52, '8.00', '3', 'SALON', '24.00', '0.00', '-', NULL, NULL, '2021-11-13 02:32:51', 1, 1, NULL, NULL),
(5349, 1513, 60, '45.00', '1', 'SALON', '45.00', '0.00', '-', NULL, NULL, '2021-11-13 02:41:25', 1, 1, NULL, NULL),
(5350, 1542, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 13:21:25', 1, 1, NULL, NULL),
(5351, 1543, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', 'ERROR', '2021-11-13 23:19:43', '2021-11-13 18:02:42', 0, 0, NULL, NULL),
(5352, 1544, 17, '12.00', '3', 'SALON', '36.00', '0.00', '-', NULL, NULL, '2021-11-13 18:23:31', 1, 1, NULL, NULL),
(5353, 1544, 43, '3.00', '3', 'SALON', '9.00', '0.00', '-', NULL, NULL, '2021-11-13 18:23:31', 1, 1, NULL, NULL),
(5354, 1543, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', 'ERROR', '2021-11-13 23:20:09', '2021-11-13 19:21:38', 0, 0, NULL, NULL),
(5355, 1545, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-13 19:45:57', 1, 1, NULL, NULL),
(5356, 1545, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 19:50:19', 1, 1, NULL, NULL),
(5357, 1543, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 20:00:42', 1, 1, NULL, NULL),
(5358, 1546, 18, '14.00', '3', 'SALON', '42.00', '0.00', '-', NULL, NULL, '2021-11-13 20:05:31', 1, 1, NULL, NULL),
(5359, 1546, 2, '17.00', '2', 'SALON', '34.00', '0.00', '-', NULL, NULL, '2021-11-13 20:05:31', 1, 1, NULL, NULL),
(5360, 1546, 47, '13.00', '1', 'SALON', '13.00', '0.00', '-', NULL, NULL, '2021-11-13 20:05:31', 1, 1, NULL, NULL),
(5361, 1546, 50, '10.00', '2', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-13 20:13:09', 1, 1, NULL, NULL),
(5362, 1547, 55, '7.00', '1', 'SALON', '7.00', '0.00', '-', NULL, NULL, '2021-11-13 20:51:53', 1, 1, NULL, NULL),
(5363, 1547, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 20:51:53', 1, 1, NULL, NULL),
(5364, 1546, 35, '6.00', '1', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-13 20:52:20', 1, 1, NULL, NULL),
(5365, 1547, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-13 20:53:56', 1, 1, NULL, NULL),
(5366, 1547, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-13 20:53:56', 1, 1, NULL, NULL),
(5367, 1547, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-13 20:53:56', 1, 1, NULL, NULL),
(5368, 1547, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 20:57:49', 1, 1, NULL, NULL),
(5369, 1548, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-13 21:34:01', 1, 1, NULL, NULL),
(5370, 1543, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 21:41:21', 1, 1, NULL, NULL),
(5371, 1549, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-13 21:44:39', 1, 1, NULL, NULL),
(5372, 1549, 50, '10.00', '2', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-13 21:44:39', 1, 1, NULL, NULL),
(5373, 1543, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 21:54:34', 1, 1, NULL, NULL),
(5374, 1550, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-13 22:00:58', 1, 1, NULL, NULL),
(5375, 1550, 43, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-13 22:00:58', 1, 1, NULL, NULL),
(5376, 1551, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-13 22:26:52', 1, 1, NULL, NULL),
(5377, 1551, 49, '8.00', '4', 'SALON', '32.00', '0.00', '-', NULL, NULL, '2021-11-13 22:26:52', 1, 1, NULL, NULL),
(5378, 1550, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 22:32:32', 1, 1, NULL, NULL),
(5379, 1552, 44, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-13 22:43:26', 1, 1, NULL, NULL),
(5380, 1553, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 22:49:28', 1, 1, NULL, NULL),
(5381, 1553, 50, '10.00', '1', 'SALON', '10.00', '0.00', '-', NULL, NULL, '2021-11-13 22:49:28', 1, 1, NULL, NULL),
(5382, 1553, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-13 22:49:28', 1, 1, NULL, NULL),
(5383, 1553, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-13 22:49:28', 1, 1, NULL, NULL),
(5384, 1553, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-13 22:49:28', 1, 1, NULL, NULL),
(5385, 1553, 43, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 22:49:28', 1, 1, NULL, NULL),
(5386, 1554, 49, '8.00', '1', 'SALON', '8.00', '0.00', '-', NULL, NULL, '2021-11-13 22:50:24', 1, 1, NULL, NULL),
(5387, 1555, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-13 22:53:28', 1, 1, NULL, NULL),
(5388, 1555, 47, '13.00', '1', 'SALON', '13.00', '0.00', '-', NULL, NULL, '2021-11-13 22:53:28', 1, 1, NULL, NULL),
(5389, 1555, 18, '14.00', '1', 'SALON', '14.00', '0.00', '-', NULL, NULL, '2021-11-13 22:53:28', 1, 1, NULL, NULL),
(5390, 1555, 50, '10.00', '2', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-13 22:53:28', 1, 1, NULL, NULL),
(5391, 1555, 35, '6.00', '1', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-13 22:53:28', 1, 1, NULL, NULL),
(5392, 1555, 2, '17.00', '1', 'SALON', '17.00', '0.00', '-', NULL, NULL, '2021-11-13 22:53:28', 1, 1, NULL, NULL),
(5393, 1555, 18, '14.00', '2', 'SALON', '28.00', '0.00', '-', NULL, NULL, '2021-11-13 22:53:28', 1, 1, NULL, NULL),
(5394, 1556, 1, '21.00', '1', 'SALON', '21.00', '0.00', '-', NULL, NULL, '2021-11-13 22:56:18', 1, 1, NULL, NULL),
(5395, 1556, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 22:56:18', 1, 1, NULL, NULL),
(5396, 1557, 17, '12.00', '1', 'SALON', '12.00', '0.00', '-', NULL, NULL, '2021-11-13 22:57:48', 1, 1, NULL, NULL),
(5397, 1557, 17, '12.00', '2', 'SALON', '24.00', '0.00', '-', NULL, NULL, '2021-11-13 22:57:48', 1, 1, NULL, NULL),
(5398, 1557, 43, '3.00', '3', 'SALON', '9.00', '0.00', '-', NULL, NULL, '2021-11-13 22:57:48', 1, 1, NULL, NULL),
(5399, 1558, 44, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-13 23:01:03', 1, 1, NULL, NULL),
(5400, 1559, 50, '10.00', '2', 'SALON', '20.00', '0.00', '-', NULL, NULL, '2021-11-13 23:15:24', 1, 1, NULL, NULL),
(5401, 1560, 20, '16.00', '1', 'SALON', '16.00', '0.00', '-', NULL, NULL, '2021-11-13 23:21:29', 1, 1, NULL, NULL),
(5402, 1560, 43, '3.00', '2', 'SALON', '6.00', '0.00', '-', NULL, NULL, '2021-11-13 23:32:22', 1, 1, NULL, NULL),
(5403, 1561, 42, '3.00', '1', 'SALON', '3.00', '0.00', '-', NULL, NULL, '2021-11-14 00:20:08', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conversiones`
--

CREATE TABLE `conversiones` (
  `id_conversion` int(11) NOT NULL,
  `id_recurso_sede` int(11) NOT NULL,
  `conversion_cantidad` decimal(10,2) NOT NULL,
  `conversion_unidad_medida` int(11) NOT NULL,
  `conversion_fecha_registro` datetime NOT NULL,
  `conversion_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correlativos`
--

CREATE TABLE `correlativos` (
  `id_correlativo` int(11) NOT NULL,
  `correlativo_b` int(11) NOT NULL,
  `correlativo_f` int(11) NOT NULL,
  `correlativo_in` int(11) NOT NULL,
  `correlativo_out` int(11) NOT NULL,
  `correlativo_nc` int(11) NOT NULL,
  `correlativo_nd` int(11) NOT NULL,
  `correlativo_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `correlativos`
--

INSERT INTO `correlativos` (`id_correlativo`, `correlativo_b`, `correlativo_f`, `correlativo_in`, `correlativo_out`, `correlativo_nc`, `correlativo_nd`, `correlativo_venta`) VALUES
(2, 6, 3, 100000, 100001, 2, 1, 100030);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int(11) NOT NULL,
  `id_orden_compra` int(11) NOT NULL,
  `id_recurso_sede` int(11) NOT NULL,
  `detalle_compra_cantidad` float NOT NULL,
  `detalle_compra_cantidad_recibida` float DEFAULT NULL,
  `detalle_compra_precio_compra` decimal(10,2) NOT NULL,
  `detalle_compra_total_pedido` decimal(10,2) NOT NULL,
  `detalle_compra_tipo_moneda` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detalle_compra_tipo_cambio` decimal(10,5) DEFAULT NULL,
  `detalle_compra_total_dolares` decimal(10,2) DEFAULT 0.00,
  `detalle_compra_total_pagado` decimal(10,2) DEFAULT NULL,
  `detalle_compra_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_recetas`
--

CREATE TABLE `detalle_recetas` (
  `id_detalle_receta` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `id_recursos_sede` int(11) NOT NULL,
  `detalle_receta_unidad_medida` int(11) DEFAULT NULL,
  `detalle_receta_cantidad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle_receta_precio` decimal(10,2) NOT NULL,
  `detalle_receta_estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_recetas`
--

INSERT INTO `detalle_recetas` (`id_detalle_receta`, `id_receta`, `id_recursos_sede`, `detalle_receta_unidad_medida`, `detalle_receta_cantidad`, `detalle_receta_precio`, `detalle_receta_estado`) VALUES
(1, 1, 1, NULL, '1', '0.00', 1),
(2, 2, 2, NULL, '1', '0.00', 1),
(3, 3, 3, NULL, '1', '0.00', 1),
(4, 4, 4, NULL, '1', '0.00', 1),
(5, 5, 5, NULL, '1', '0.00', 1),
(6, 6, 6, NULL, '1', '0.00', 1),
(7, 7, 7, NULL, '1', '0.00', 1),
(8, 8, 8, NULL, '1', '0.00', 1),
(9, 9, 9, NULL, '1', '0.00', 1),
(10, 10, 10, NULL, '1', '0.00', 1),
(11, 11, 11, NULL, '1', '0.00', 1),
(12, 12, 12, NULL, '1', '0.00', 1),
(13, 13, 13, NULL, '1', '0.00', 1),
(14, 14, 14, NULL, '1', '0.00', 1),
(15, 15, 15, NULL, '1', '0.00', 1),
(16, 16, 16, NULL, '1', '0.00', 1),
(17, 17, 17, NULL, '1', '0.00', 1),
(18, 18, 18, NULL, '1', '0.00', 1),
(19, 19, 19, NULL, '1', '0.00', 1),
(20, 20, 20, NULL, '1', '0.00', 1),
(21, 21, 21, NULL, '1', '0.00', 1),
(22, 22, 22, NULL, '1', '0.00', 1),
(23, 23, 23, NULL, '1', '0.00', 1),
(24, 24, 24, NULL, '1', '0.00', 1),
(25, 25, 25, NULL, '1', '0.00', 1),
(26, 26, 26, NULL, '1', '0.00', 1),
(27, 27, 27, NULL, '1', '0.00', 1),
(28, 28, 28, NULL, '1', '0.00', 1),
(29, 29, 29, NULL, '1', '0.00', 1),
(30, 30, 30, NULL, '1', '0.00', 1),
(31, 31, 31, NULL, '1', '0.00', 1),
(32, 32, 32, NULL, '1', '0.00', 1),
(33, 33, 33, NULL, '1', '0.00', 1),
(34, 34, 34, NULL, '1', '0.00', 1),
(35, 35, 35, NULL, '1', '0.00', 1),
(36, 36, 36, NULL, '1', '0.00', 1),
(37, 37, 37, NULL, '1', '0.00', 1),
(38, 38, 38, NULL, '1', '0.00', 1),
(39, 39, 39, NULL, '1', '0.00', 1),
(40, 40, 40, NULL, '1', '0.00', 1),
(41, 41, 41, NULL, '1', '0.00', 1),
(42, 42, 42, NULL, '1', '0.00', 1),
(43, 43, 43, NULL, '1', '0.00', 1),
(44, 44, 44, NULL, '1', '0.00', 1),
(45, 45, 45, NULL, '1', '0.00', 1),
(46, 46, 46, NULL, '1', '0.00', 1),
(47, 47, 47, NULL, '1', '0.00', 1),
(48, 48, 48, NULL, '1', '0.00', 1),
(49, 49, 49, NULL, '1', '0.00', 1),
(50, 50, 50, NULL, '1', '0.00', 1),
(51, 51, 51, NULL, '1', '0.00', 1),
(52, 52, 52, NULL, '1', '0.00', 1),
(53, 53, 53, NULL, '1', '0.00', 1),
(54, 54, 54, NULL, '1', '0.00', 1),
(55, 55, 55, NULL, '1', '0.00', 1),
(56, 56, 56, NULL, '1', '0.00', 1),
(57, 57, 57, NULL, '1', '0.00', 1),
(58, 58, 53, NULL, '6', '0.00', 1),
(59, 59, 54, NULL, '6', '0.00', 1),
(60, 60, 52, NULL, '6', '0.00', 1),
(61, 204, 52, 0, '1', '0.00', 1),
(62, 205, 53, 0, '2', '0.00', 1),
(63, 206, 52, 0, '6', '0.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_adjunto` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `documento_nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `documento_fechainicio` date NOT NULL,
  `documento_fechafin` date NOT NULL,
  `documento_fecha_registro` datetime NOT NULL,
  `documento_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `empresa_razon_social` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `empresa_nombrecomercial` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa_descrpcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa_ruc` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `empresa_domiciliofiscal` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `empresa_pais` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `empresa_departamento` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `empresa_provincia` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `empresa_distrito` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `empresa_ubigeo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa_telefono1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa_telefono2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa_celular1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa_celular2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa_foto` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa_correo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa_usuario_sol` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `empresa_clave_sol` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `empresa_fechayhora` datetime NOT NULL DEFAULT current_timestamp(),
  `empresa_estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `empresa_razon_social`, `empresa_nombrecomercial`, `empresa_descrpcion`, `empresa_ruc`, `empresa_domiciliofiscal`, `empresa_pais`, `empresa_departamento`, `empresa_provincia`, `empresa_distrito`, `empresa_ubigeo`, `empresa_telefono1`, `empresa_telefono2`, `empresa_celular1`, `empresa_celular2`, `empresa_foto`, `empresa_correo`, `empresa_usuario_sol`, `empresa_clave_sol`, `empresa_fechayhora`, `empresa_estado`) VALUES
(1, 'BALCONCITO RESTAURANT', 'BALCONCITO RESTAURANT', 'BALCONCITO RESTAURANT', '74324133', 'AV GUARDIA CIVIL 1331', 'PE', 'LORETO', 'MAYNAS', 'SAN JUAN BAUTISTA', '160101', NULL, NULL, NULL, NULL, NULL, NULL, 'MODDATOS', 'MODDATOS', '2021-04-23 11:08:42', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio_resumen`
--

CREATE TABLE `envio_resumen` (
  `id_envio_resumen` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL DEFAULT 1,
  `envio_resumen_fecha` date NOT NULL,
  `envio_resumen_serie` varchar(20) NOT NULL,
  `envio_resumen_correlativo` varchar(20) NOT NULL,
  `envio_resumen_nombreXML` varchar(200) DEFAULT NULL,
  `envio_resumen_nombreCDR` varchar(200) DEFAULT NULL,
  `envio_resumen_estado` tinyint(4) NOT NULL DEFAULT 0,
  `envio_resumen_estadosunat` varchar(2000) DEFAULT NULL,
  `envio_resumen_estadosunat_consulta` varchar(2000) DEFAULT NULL,
  `envio_resumen_ticket` varchar(100) NOT NULL,
  `envio_sunat_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `envio_resumen`
--

INSERT INTO `envio_resumen` (`id_envio_resumen`, `id_empresa`, `envio_resumen_fecha`, `envio_resumen_serie`, `envio_resumen_correlativo`, `envio_resumen_nombreXML`, `envio_resumen_nombreCDR`, `envio_resumen_estado`, `envio_resumen_estadosunat`, `envio_resumen_estadosunat_consulta`, `envio_resumen_ticket`, `envio_sunat_datetime`) VALUES
(19, 1, '2021-08-19', '20210819', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210819-1.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107606235021', '2021-08-19 18:52:30'),
(20, 1, '2021-08-20', '20210821', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210821-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210821-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107615986430', '2021-08-21 10:13:25'),
(21, 1, '2021-08-21', '20210823', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210823-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210823-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107626744604', '2021-08-23 11:01:47'),
(22, 1, '2021-08-22', '20210823', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210823-2.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210823-2.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107626760480', '2021-08-23 11:04:29'),
(23, 1, '2021-08-23', '20210827', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210827-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210827-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107656019899', '2021-08-27 17:47:10'),
(24, 1, '2021-08-25', '20210827', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210827-2.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210827-2.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107656046344', '2021-08-27 17:50:56'),
(25, 1, '2021-08-26', '20210827', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20210827-3.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210827-3.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107656053712', '2021-08-27 17:51:47'),
(26, 1, '2021-08-27', '20210827', '4', 'libs/ApiFacturacion/xml/20606320796-RC-20210827-4.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210827-4.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107656076551', '2021-08-27 17:54:40'),
(27, 1, '2021-08-30', '20210830', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210830-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210830-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107670150653', '2021-08-30 16:26:59'),
(28, 1, '2021-08-28', '20210830', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210830-2.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107670154205', '2021-08-30 16:28:19'),
(29, 1, '2021-08-29', '20210830', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20210830-3.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210830-3.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107670239566', '2021-08-30 16:58:45'),
(30, 1, '2021-09-01', '20210903', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210903-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210903-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107693382566', '2021-09-03 15:50:57'),
(31, 1, '2021-09-05', '20210905', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210905-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210905-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107705864536', '2021-09-05 16:58:15'),
(32, 1, '2021-09-03', '20210905', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210905-2.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210905-2.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107705875003', '2021-09-05 17:00:42'),
(33, 1, '2021-09-04', '20210905', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20210905-3.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210905-3.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107705879334', '2021-09-05 17:01:26'),
(34, 1, '2021-09-02', '20210905', '4', 'libs/ApiFacturacion/xml/20606320796-RC-20210905-4.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210905-4.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107705883967', '2021-09-05 17:02:25'),
(35, 1, '2021-08-31', '20210905', '5', 'libs/ApiFacturacion/xml/20606320796-RC-20210905-5.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210905-5.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107705898124', '2021-09-05 17:05:10'),
(36, 1, '2021-09-06', '20210906', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210906-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210906-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107711971734', '2021-09-06 17:06:16'),
(37, 1, '2021-09-08', '20210909', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210909-1.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107731976183', '2021-09-09 16:19:45'),
(38, 1, '2021-09-07', '20210911', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210911-1.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107744227927', '2021-09-11 13:58:32'),
(39, 1, '2021-09-09', '20210911', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210911-2.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210911-2.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107744239978', '2021-09-11 14:00:42'),
(40, 1, '2021-09-10', '20210911', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20210911-3.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107744242143', '2021-09-11 14:01:08'),
(41, 1, '2021-09-10', '20210911', '4', 'libs/ApiFacturacion/xml/20606320796-RC-20210911-4.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107744267275', '2021-09-11 14:05:26'),
(42, 1, '2021-09-10', '20210911', '5', 'libs/ApiFacturacion/xml/20606320796-RC-20210911-5.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107744269380', '2021-09-11 14:05:46'),
(43, 1, '2021-09-11', '20210912', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210912-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210912-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107750313706', '2021-09-12 16:35:56'),
(46, 1, '2021-09-08', '20210913', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210913-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210913-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107755958414', '2021-09-13 17:35:37'),
(48, 1, '2021-09-09', '20210913', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210913-2.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210913-2.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107756025919', '2021-09-13 17:45:21'),
(49, 1, '2021-09-10', '20210913', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20210913-3.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210913-3.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107756106296', '2021-09-13 17:56:16'),
(50, 1, '2021-09-11', '20210913', '4', 'libs/ApiFacturacion/xml/20606320796-RC-20210913-4.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210913-4.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107756129841', '2021-09-13 18:00:15'),
(51, 1, '2021-09-12', '20210913', '5', 'libs/ApiFacturacion/xml/20606320796-RC-20210913-5.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210913-5.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107756198243', '2021-09-13 18:08:40'),
(52, 1, '2021-09-12', '20210913', '6', 'libs/ApiFacturacion/xml/20606320796-RC-20210913-6.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210913-6.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107756207274', '2021-09-13 18:10:28'),
(53, 1, '2021-09-13', '20210913', '7', 'libs/ApiFacturacion/xml/20606320796-RC-20210913-7.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210913-7.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107756221252', '2021-09-13 18:12:25'),
(54, 1, '2021-09-14', '20210920', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210920-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210920-1.XML', 1, 'TICKET ENVIADO', 'Ha sido aceptado', '202107796472250', '2021-09-20 08:58:48'),
(55, 1, '2021-09-15', '20210920', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210920-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210920-1.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20210920-1, ha sido aceptado', '202107796498821', '2021-09-20 09:03:17'),
(56, 1, '2021-09-17', '20210920', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210920-2.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210920-2.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20210920-2, ha sido aceptado', '202107796588200', '2021-09-20 09:19:49'),
(57, 1, '2021-09-18', '20210920', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20210920-3.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210920-3.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20210920-3, ha sido aceptado', '202107796623989', '2021-09-20 09:25:51'),
(58, 1, '2021-09-18', '20210920', '4', 'libs/ApiFacturacion/xml/20606320796-RC-20210920-4.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210920-4.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20210920-4, ha sido aceptado', '202107796640653', '2021-09-20 09:28:47'),
(59, 1, '2021-09-19', '20210920', '5', 'libs/ApiFacturacion/xml/20606320796-RC-20210920-5.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210920-5.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20210920-5, ha sido aceptado', '202107796654677', '2021-09-20 09:31:14'),
(60, 1, '2021-09-22', '20210924', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210924-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210924-1.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20210924-1, ha sido aceptado', '202107825059054', '2021-09-24 11:30:49'),
(61, 1, '2021-09-21', '20210924', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210924-2.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107825146498', '2021-09-24 11:45:22'),
(62, 1, '2021-09-23', '20210924', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20210924-3.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107825238643', '2021-09-24 12:00:24'),
(63, 1, '2021-09-20', '20210924', '4', 'libs/ApiFacturacion/xml/20606320796-RC-20210924-4.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107825243794', '2021-09-24 12:01:09'),
(64, 1, '2021-09-24', '20210925', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210925-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210925-1.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20210925-1, ha sido aceptado', '202107831981368', '2021-09-25 11:52:14'),
(65, 1, '2021-09-25', '20210927', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210927-1.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107841944828', '2021-09-27 13:54:39'),
(66, 1, '2021-09-26', '20210927', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210927-2.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210927-2.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20210927-2, ha sido aceptado', '202107842943735', '2021-09-27 16:17:08'),
(67, 1, '2021-09-27', '20210929', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20210929-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210929-1.XML', 1, 'TICKET ENVIADO', 'El código ingresado como estado del ítem no existe en el catálogo - El código ingresado como estado del ítem no existe en el catálogo\n		         Detalle:xxx.xxx.xxx value=\'ticket: 202107856051211 error: : 2896: Valor no se encuentra en el catalogo: 19 (nodo: \"cac:Status/cbc:ConditionCode\" valor: \"0\")\'', '202107856051211', '2021-09-29 16:12:17'),
(68, 1, '2021-09-28', '20210929', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20210929-2.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20210929-2.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20210929-2, ha sido aceptado', '202107856054824', '2021-09-29 16:12:53'),
(69, 1, '2021-09-29', '20210929', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20210929-3.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107856057811', '2021-09-29 16:13:18'),
(70, 1, '2021-09-27', '20211001', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20211001-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211001-1.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211001-1, ha sido aceptado', '202107868112864', '2021-10-01 12:22:55'),
(71, 1, '2021-09-30', '20211001', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20211001-2.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211001-2.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211001-2, ha sido aceptado', '202107868140519', '2021-10-01 12:27:29'),
(72, 1, '2021-09-30', '20211001', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20211001-3.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211001-3.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211001-3, ha sido aceptado', '202107868151130', '2021-10-01 12:29:16'),
(76, 1, '2021-10-01', '20211002', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20211002-1.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107874886889', '2021-10-02 14:20:15'),
(77, 1, '2021-10-10', '20211010', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211010-1.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211010-1, ha sido aceptado', '202107921054322', '2021-10-10 16:31:26'),
(78, 1, '2021-10-05', '20211010', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-2.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107921055676', '2021-10-10 16:31:54'),
(79, 1, '2021-10-04', '20211010', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-3.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211010-3.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211010-3, ha sido aceptado', '202107921061114', '2021-10-10 16:33:38'),
(80, 1, '2021-10-03', '20211010', '4', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-4.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211010-4.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211010-4, ha sido aceptado', '202107921063582', '2021-10-10 16:34:22'),
(81, 1, '2021-10-03', '20211010', '5', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-5.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107921068800', '2021-10-10 16:36:22'),
(82, 1, '2021-10-03', '20211010', '6', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-6.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211010-6.XML', 1, 'TICKET ENVIADO', ' - No se puede leer (parsear) el archivo XML\n		         Detalle:http://xxx.xxx.xxx/: cvc-particle 2.1: in element {urn:sunat:names:specification:ubl:peru:schema:xsd:SummaryDocuments-1}SummaryDocuments of type {urn:sunat:names:specification:ubl:peru:schema:xsd:SummaryDocuments-1}SummaryDocumentsType, found </SummaryDocuments> (in namespace urn:sunat:names:specification:ubl:peru:schema:xsd:SummaryDocuments-1), but next item should be {urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1}SummaryDocumentsLine', '202107921069881', '2021-10-10 16:36:44'),
(83, 1, '2021-10-02', '20211010', '7', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-7.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211010-7.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211010-7, ha sido aceptado', '202107921074560', '2021-10-10 16:38:09'),
(84, 1, '2021-10-06', '20211010', '8', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-8.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107921077708', '2021-10-10 16:38:58'),
(85, 1, '2021-10-07', '20211010', '9', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-9.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211010-9.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211010-9, ha sido aceptado', '202107921082885', '2021-10-10 16:40:38'),
(86, 1, '2021-10-08', '20211010', '10', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-10.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211010-10.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211010-10, ha sido aceptado', '202107921100221', '2021-10-10 16:46:28'),
(87, 1, '2021-10-09', '20211010', '11', 'libs/ApiFacturacion/xml/20606320796-RC-20211010-11.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211010-11.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211010-11, ha sido aceptado', '202107921119128', '2021-10-10 16:52:09'),
(88, 1, '2021-10-10', '20211011', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20211011-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211011-1.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211011-1, ha sido aceptado', '202107924821299', '2021-10-11 11:32:03'),
(89, 1, '2021-10-11', '20211013', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20211013-1.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211013-1.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211013-1, ha sido aceptado', '202107939826260', '2021-10-13 14:39:41'),
(90, 1, '2021-10-11', '20211013', '2', 'libs/ApiFacturacion/xml/20606320796-RC-20211013-2.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107939843400', '2021-10-13 14:42:10'),
(91, 1, '2021-10-12', '20211013', '3', 'libs/ApiFacturacion/xml/20606320796-RC-20211013-3.XML', 'libs/ApiFacturacion/cdr/R-20606320796-RC-20211013-3.XML', 1, 'TICKET ENVIADO', 'El Comprobante RC-20211013-3, ha sido aceptado', '202107939847871', '2021-10-13 14:42:43'),
(92, 1, '2021-10-13', '20211014', '1', 'libs/ApiFacturacion/xml/20606320796-RC-20211014-1.XML', NULL, 1, 'TICKET ENVIADO', NULL, '202107944944894', '2021-10-14 10:35:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio_resumen_detalle`
--

CREATE TABLE `envio_resumen_detalle` (
  `id_envio_resumen_detalle` int(11) NOT NULL,
  `id_envio_resumen` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `envio_resumen_detalle_condicion` tinyint(4) NOT NULL COMMENT '1-Creacion, 2-Actualizacion, 3-Baja'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `envio_resumen_detalle`
--

INSERT INTO `envio_resumen_detalle` (`id_envio_resumen_detalle`, `id_envio_resumen`, `id_venta`, `envio_resumen_detalle_condicion`) VALUES
(30, 19, 1, 1),
(31, 19, 2, 1),
(32, 19, 3, 1),
(33, 19, 4, 1),
(34, 19, 5, 1),
(35, 19, 6, 1),
(36, 19, 7, 1),
(37, 19, 8, 1),
(38, 19, 9, 1),
(39, 19, 10, 1),
(40, 19, 11, 1),
(41, 19, 12, 1),
(42, 19, 13, 1),
(43, 19, 14, 1),
(44, 19, 15, 1),
(45, 19, 16, 1),
(46, 19, 17, 1),
(47, 19, 18, 1),
(48, 19, 19, 1),
(49, 20, 20, 1),
(50, 20, 21, 1),
(51, 20, 22, 1),
(52, 20, 23, 1),
(53, 20, 24, 1),
(54, 20, 25, 1),
(55, 20, 26, 1),
(56, 20, 27, 1),
(57, 20, 28, 1),
(58, 20, 29, 1),
(59, 20, 30, 1),
(60, 20, 31, 1),
(61, 20, 32, 1),
(62, 20, 33, 1),
(63, 20, 34, 1),
(64, 20, 35, 1),
(65, 20, 36, 1),
(66, 20, 37, 1),
(67, 20, 38, 1),
(68, 20, 40, 1),
(69, 20, 41, 1),
(70, 20, 42, 1),
(71, 20, 43, 1),
(72, 20, 44, 1),
(73, 20, 45, 1),
(74, 20, 46, 1),
(75, 20, 47, 1),
(76, 20, 48, 1),
(77, 20, 50, 1),
(78, 21, 51, 1),
(79, 21, 52, 1),
(80, 21, 53, 1),
(81, 21, 54, 1),
(82, 21, 55, 1),
(83, 21, 56, 1),
(84, 21, 57, 1),
(85, 21, 58, 1),
(86, 21, 59, 1),
(87, 21, 60, 1),
(88, 21, 61, 1),
(89, 21, 62, 1),
(90, 21, 63, 1),
(91, 21, 64, 1),
(92, 21, 65, 1),
(93, 21, 66, 1),
(94, 21, 68, 1),
(95, 21, 69, 1),
(96, 21, 70, 1),
(97, 21, 71, 1),
(98, 21, 72, 1),
(99, 21, 73, 1),
(100, 21, 74, 1),
(101, 21, 75, 1),
(102, 21, 76, 1),
(103, 21, 77, 1),
(104, 21, 78, 1),
(105, 21, 79, 1),
(106, 21, 80, 1),
(107, 21, 81, 1),
(108, 22, 82, 1),
(109, 22, 83, 1),
(110, 22, 84, 1),
(111, 22, 85, 1),
(112, 22, 86, 1),
(113, 22, 87, 1),
(114, 22, 88, 1),
(115, 22, 89, 1),
(116, 22, 90, 1),
(117, 22, 91, 1),
(118, 22, 92, 1),
(119, 22, 93, 1),
(120, 22, 94, 1),
(121, 22, 95, 1),
(122, 22, 96, 1),
(123, 22, 97, 1),
(124, 22, 98, 1),
(125, 22, 99, 1),
(126, 22, 100, 1),
(127, 22, 101, 1),
(128, 22, 102, 1),
(129, 22, 103, 1),
(130, 22, 104, 1),
(131, 22, 105, 1),
(132, 22, 106, 1),
(133, 22, 107, 1),
(134, 23, 108, 1),
(135, 23, 109, 1),
(136, 23, 110, 1),
(137, 23, 111, 1),
(138, 23, 112, 1),
(139, 23, 113, 1),
(140, 23, 114, 1),
(141, 23, 115, 1),
(142, 23, 116, 1),
(143, 23, 117, 1),
(144, 23, 118, 1),
(145, 23, 119, 1),
(146, 23, 120, 1),
(147, 23, 121, 1),
(148, 23, 122, 1),
(149, 23, 123, 1),
(150, 23, 124, 1),
(151, 23, 125, 1),
(152, 23, 126, 1),
(153, 23, 127, 1),
(154, 23, 128, 1),
(155, 23, 130, 1),
(156, 23, 131, 1),
(157, 23, 132, 1),
(158, 24, 134, 1),
(159, 24, 135, 1),
(160, 24, 136, 1),
(161, 24, 137, 1),
(162, 24, 138, 1),
(163, 24, 139, 1),
(164, 24, 140, 1),
(165, 24, 141, 1),
(166, 24, 142, 1),
(167, 24, 143, 1),
(168, 24, 144, 1),
(169, 24, 145, 1),
(170, 24, 146, 1),
(171, 24, 147, 1),
(172, 24, 148, 1),
(173, 24, 149, 1),
(174, 24, 150, 1),
(175, 24, 151, 1),
(176, 25, 153, 1),
(177, 25, 154, 1),
(178, 25, 157, 1),
(179, 25, 158, 1),
(180, 25, 159, 1),
(181, 25, 160, 1),
(182, 25, 161, 1),
(183, 25, 162, 1),
(184, 25, 163, 1),
(185, 25, 164, 1),
(186, 25, 165, 1),
(187, 25, 166, 1),
(188, 25, 167, 1),
(189, 25, 168, 1),
(190, 25, 169, 1),
(191, 25, 170, 1),
(192, 25, 171, 1),
(193, 25, 172, 1),
(194, 26, 173, 1),
(195, 26, 174, 1),
(196, 26, 175, 1),
(197, 26, 176, 1),
(198, 26, 177, 1),
(199, 26, 178, 1),
(200, 26, 179, 1),
(201, 26, 180, 1),
(202, 26, 181, 1),
(203, 26, 182, 1),
(204, 26, 183, 1),
(205, 26, 184, 1),
(206, 26, 185, 1),
(207, 26, 186, 1),
(208, 26, 187, 1),
(209, 26, 188, 1),
(210, 26, 189, 1),
(211, 26, 190, 1),
(212, 26, 191, 1),
(213, 26, 192, 1),
(214, 26, 193, 1),
(215, 26, 194, 1),
(216, 26, 195, 1),
(217, 26, 196, 1),
(218, 26, 197, 1),
(219, 26, 198, 1),
(220, 26, 199, 1),
(221, 27, 247, 1),
(222, 27, 248, 1),
(223, 27, 249, 1),
(224, 27, 250, 1),
(225, 27, 251, 1),
(226, 27, 252, 1),
(227, 27, 253, 1),
(228, 27, 254, 1),
(229, 27, 255, 1),
(230, 27, 256, 1),
(231, 27, 259, 1),
(232, 27, 260, 1),
(233, 27, 261, 1),
(234, 27, 262, 1),
(235, 27, 263, 1),
(236, 27, 264, 1),
(237, 27, 265, 1),
(238, 27, 266, 1),
(239, 28, 200, 1),
(240, 28, 201, 1),
(241, 28, 202, 1),
(242, 28, 203, 1),
(243, 28, 204, 1),
(244, 28, 205, 1),
(245, 28, 206, 1),
(246, 28, 207, 1),
(247, 28, 208, 1),
(248, 28, 209, 1),
(249, 28, 210, 1),
(250, 28, 211, 1),
(251, 28, 212, 1),
(252, 28, 213, 1),
(253, 28, 215, 1),
(254, 28, 216, 1),
(255, 29, 217, 1),
(256, 29, 218, 1),
(257, 29, 219, 1),
(258, 29, 220, 1),
(259, 29, 221, 1),
(260, 29, 222, 1),
(261, 29, 223, 1),
(262, 29, 224, 1),
(263, 29, 225, 1),
(264, 29, 226, 1),
(265, 29, 227, 1),
(266, 29, 228, 1),
(267, 29, 229, 1),
(268, 29, 230, 1),
(269, 29, 231, 1),
(270, 29, 232, 1),
(271, 29, 233, 1),
(272, 29, 234, 1),
(273, 29, 235, 1),
(274, 29, 236, 1),
(275, 29, 237, 1),
(276, 29, 238, 1),
(277, 29, 239, 1),
(278, 29, 240, 1),
(279, 29, 241, 1),
(280, 29, 242, 1),
(281, 29, 243, 1),
(282, 29, 244, 1),
(283, 29, 245, 1),
(284, 29, 246, 1),
(285, 30, 282, 1),
(286, 30, 283, 1),
(287, 30, 284, 1),
(288, 30, 285, 1),
(289, 30, 286, 1),
(290, 30, 287, 1),
(291, 30, 288, 1),
(292, 30, 289, 1),
(293, 30, 290, 1),
(294, 30, 291, 1),
(295, 30, 292, 1),
(296, 30, 293, 1),
(297, 30, 294, 1),
(298, 30, 295, 1),
(299, 30, 296, 1),
(300, 30, 297, 1),
(301, 30, 298, 1),
(302, 30, 299, 1),
(303, 30, 300, 1),
(304, 31, 361, 1),
(305, 31, 362, 1),
(306, 31, 363, 1),
(307, 31, 364, 1),
(308, 31, 365, 1),
(309, 31, 366, 1),
(310, 31, 367, 1),
(311, 31, 368, 1),
(312, 31, 369, 1),
(313, 31, 370, 1),
(314, 31, 372, 1),
(315, 31, 373, 1),
(316, 31, 374, 1),
(317, 31, 375, 1),
(318, 31, 377, 1),
(319, 31, 378, 1),
(320, 31, 379, 1),
(321, 31, 380, 1),
(322, 31, 381, 1),
(323, 31, 382, 1),
(324, 31, 383, 1),
(325, 31, 384, 1),
(326, 31, 385, 1),
(327, 31, 386, 1),
(328, 31, 387, 1),
(329, 32, 317, 1),
(330, 32, 318, 1),
(331, 32, 319, 1),
(332, 32, 320, 1),
(333, 32, 321, 1),
(334, 32, 322, 1),
(335, 32, 323, 1),
(336, 32, 324, 1),
(337, 32, 325, 1),
(338, 32, 326, 1),
(339, 32, 327, 1),
(340, 32, 328, 1),
(341, 32, 329, 1),
(342, 32, 330, 1),
(343, 32, 331, 1),
(344, 32, 332, 1),
(345, 32, 333, 1),
(346, 32, 334, 1),
(347, 33, 335, 1),
(348, 33, 336, 1),
(349, 33, 337, 1),
(350, 33, 338, 1),
(351, 33, 339, 1),
(352, 33, 340, 1),
(353, 33, 341, 1),
(354, 33, 342, 1),
(355, 33, 343, 1),
(356, 33, 344, 1),
(357, 33, 345, 1),
(358, 33, 346, 1),
(359, 33, 347, 1),
(360, 33, 348, 1),
(361, 33, 349, 1),
(362, 33, 350, 1),
(363, 33, 351, 1),
(364, 33, 352, 1),
(365, 33, 353, 1),
(366, 33, 354, 1),
(367, 33, 355, 1),
(368, 33, 356, 1),
(369, 33, 357, 1),
(370, 33, 358, 1),
(371, 33, 359, 1),
(372, 33, 360, 1),
(373, 34, 301, 1),
(374, 34, 302, 1),
(375, 34, 303, 1),
(376, 34, 304, 1),
(377, 34, 305, 1),
(378, 34, 306, 1),
(379, 34, 307, 1),
(380, 34, 308, 1),
(381, 34, 309, 1),
(382, 34, 310, 1),
(383, 34, 311, 1),
(384, 34, 312, 1),
(385, 34, 313, 1),
(386, 34, 314, 1),
(387, 34, 315, 1),
(388, 34, 316, 1),
(389, 35, 267, 1),
(390, 35, 268, 1),
(391, 35, 269, 1),
(392, 35, 270, 1),
(393, 35, 271, 1),
(394, 35, 272, 1),
(395, 35, 273, 1),
(396, 35, 275, 1),
(397, 35, 276, 1),
(398, 35, 277, 1),
(399, 35, 278, 1),
(400, 35, 279, 1),
(401, 35, 280, 1),
(402, 35, 281, 1),
(403, 36, 388, 1),
(404, 36, 389, 1),
(405, 36, 390, 1),
(406, 36, 391, 1),
(407, 36, 392, 1),
(408, 36, 393, 1),
(409, 36, 394, 1),
(410, 36, 395, 1),
(411, 36, 396, 1),
(412, 36, 397, 1),
(413, 36, 398, 1),
(414, 36, 399, 1),
(415, 36, 400, 1),
(416, 36, 401, 1),
(417, 36, 402, 1),
(418, 37, 419, 1),
(419, 37, 420, 1),
(420, 37, 421, 1),
(421, 37, 422, 1),
(422, 37, 423, 1),
(423, 37, 424, 1),
(424, 37, 425, 1),
(425, 37, 426, 1),
(426, 37, 427, 1),
(427, 37, 428, 1),
(428, 37, 429, 1),
(429, 37, 430, 1),
(430, 37, 431, 1),
(431, 37, 432, 1),
(432, 38, 403, 1),
(433, 38, 404, 1),
(434, 38, 405, 1),
(435, 38, 406, 1),
(436, 38, 407, 1),
(437, 38, 408, 1),
(438, 38, 409, 1),
(439, 38, 410, 1),
(440, 38, 411, 1),
(441, 38, 412, 1),
(442, 38, 413, 1),
(443, 38, 414, 1),
(444, 38, 415, 1),
(445, 38, 416, 1),
(446, 38, 417, 1),
(447, 38, 418, 1),
(448, 39, 433, 1),
(449, 39, 434, 1),
(450, 39, 435, 1),
(451, 39, 436, 1),
(452, 39, 437, 1),
(453, 39, 438, 1),
(454, 39, 439, 1),
(455, 39, 440, 1),
(456, 39, 441, 1),
(457, 39, 442, 1),
(458, 39, 443, 1),
(459, 39, 444, 1),
(460, 39, 445, 1),
(461, 39, 446, 1),
(462, 39, 447, 1),
(463, 39, 448, 1),
(464, 39, 449, 1),
(465, 39, 450, 1),
(466, 40, 451, 1),
(467, 40, 453, 1),
(468, 40, 454, 1),
(469, 40, 455, 1),
(470, 40, 456, 1),
(471, 40, 457, 1),
(472, 40, 458, 1),
(473, 40, 459, 1),
(474, 40, 460, 1),
(475, 40, 461, 1),
(476, 40, 462, 1),
(477, 40, 463, 1),
(478, 40, 464, 1),
(479, 40, 465, 1),
(480, 40, 466, 1),
(481, 40, 467, 1),
(482, 40, 468, 1),
(483, 40, 469, 1),
(484, 40, 470, 1),
(485, 40, 471, 1),
(486, 40, 472, 1),
(487, 40, 473, 1),
(488, 40, 474, 1),
(489, 43, 475, 1),
(490, 43, 476, 1),
(491, 43, 477, 1),
(492, 43, 478, 1),
(493, 43, 479, 1),
(494, 43, 480, 1),
(495, 43, 481, 1),
(496, 43, 482, 1),
(497, 43, 483, 1),
(498, 43, 484, 1),
(499, 43, 485, 1),
(500, 43, 486, 1),
(501, 43, 487, 1),
(502, 43, 488, 1),
(503, 43, 489, 1),
(504, 43, 490, 1),
(505, 43, 492, 1),
(506, 43, 493, 1),
(507, 43, 494, 1),
(508, 43, 495, 1),
(509, 43, 496, 1),
(510, 43, 497, 1),
(511, 43, 498, 1),
(512, 43, 499, 1),
(513, 43, 500, 1),
(514, 43, 501, 1),
(543, 46, 419, 1),
(544, 46, 420, 1),
(545, 46, 421, 1),
(546, 46, 422, 1),
(547, 46, 423, 1),
(548, 46, 424, 1),
(549, 46, 425, 1),
(550, 46, 426, 1),
(551, 46, 427, 1),
(552, 46, 428, 1),
(553, 46, 429, 1),
(554, 46, 430, 1),
(555, 46, 431, 1),
(556, 46, 432, 1),
(575, 48, 433, 1),
(576, 48, 434, 1),
(577, 48, 435, 1),
(578, 48, 436, 1),
(579, 48, 437, 1),
(580, 48, 438, 1),
(581, 48, 439, 1),
(582, 48, 440, 1),
(583, 48, 441, 1),
(584, 48, 442, 1),
(585, 48, 443, 1),
(586, 48, 444, 1),
(587, 48, 445, 1),
(588, 48, 446, 1),
(589, 48, 447, 1),
(590, 48, 448, 1),
(591, 48, 449, 1),
(592, 48, 450, 1),
(593, 49, 451, 1),
(594, 49, 453, 1),
(595, 49, 454, 1),
(596, 49, 455, 1),
(597, 49, 456, 1),
(598, 49, 457, 1),
(599, 49, 458, 1),
(600, 49, 459, 1),
(601, 49, 460, 1),
(602, 49, 461, 1),
(603, 49, 462, 1),
(604, 49, 463, 1),
(605, 49, 464, 1),
(606, 49, 465, 1),
(607, 49, 466, 1),
(608, 49, 467, 1),
(609, 49, 468, 1),
(610, 49, 469, 1),
(611, 49, 470, 1),
(612, 49, 471, 1),
(613, 49, 472, 1),
(614, 49, 473, 1),
(615, 49, 474, 1),
(616, 50, 475, 1),
(617, 50, 476, 1),
(618, 50, 477, 1),
(619, 50, 478, 1),
(620, 50, 479, 1),
(621, 50, 480, 1),
(622, 50, 481, 1),
(623, 50, 482, 1),
(624, 50, 483, 1),
(625, 50, 484, 1),
(626, 50, 485, 1),
(627, 50, 486, 1),
(628, 50, 487, 1),
(629, 50, 488, 1),
(630, 50, 489, 1),
(631, 50, 490, 1),
(632, 50, 492, 1),
(633, 50, 493, 1),
(634, 50, 494, 1),
(635, 50, 495, 1),
(636, 50, 496, 1),
(637, 50, 497, 1),
(638, 50, 498, 1),
(639, 50, 499, 1),
(640, 50, 500, 1),
(641, 50, 501, 1),
(642, 51, 502, 1),
(643, 51, 503, 1),
(644, 51, 504, 1),
(645, 51, 505, 1),
(646, 51, 506, 1),
(647, 51, 507, 1),
(648, 51, 508, 1),
(649, 51, 509, 1),
(650, 51, 510, 1),
(651, 51, 511, 1),
(652, 51, 512, 1),
(653, 51, 513, 1),
(654, 51, 514, 1),
(655, 51, 515, 1),
(656, 51, 516, 1),
(657, 51, 517, 1),
(658, 51, 518, 1),
(659, 51, 519, 1),
(660, 51, 520, 1),
(661, 51, 521, 1),
(662, 51, 522, 1),
(663, 51, 523, 1),
(664, 51, 524, 1),
(665, 51, 525, 1),
(666, 51, 526, 1),
(667, 51, 527, 1),
(668, 51, 528, 1),
(669, 51, 529, 1),
(670, 51, 530, 1),
(671, 51, 531, 1),
(672, 51, 532, 1),
(673, 51, 533, 1),
(674, 51, 534, 1),
(675, 51, 535, 1),
(676, 51, 536, 1),
(677, 51, 537, 1),
(678, 52, 537, 1),
(679, 53, 539, 1),
(680, 53, 540, 1),
(681, 53, 541, 1),
(682, 53, 542, 1),
(683, 53, 543, 1),
(684, 53, 544, 1),
(685, 53, 545, 1),
(686, 53, 546, 1),
(687, 53, 547, 1),
(688, 53, 548, 1),
(689, 53, 549, 1),
(690, 53, 550, 1),
(691, 53, 551, 1),
(692, 53, 552, 1),
(693, 53, 553, 1),
(694, 54, 554, 1),
(695, 54, 555, 1),
(696, 54, 556, 1),
(697, 54, 557, 1),
(698, 54, 558, 1),
(699, 54, 559, 1),
(700, 54, 560, 1),
(701, 54, 561, 1),
(702, 54, 562, 1),
(703, 54, 563, 1),
(704, 54, 564, 1),
(705, 54, 565, 1),
(706, 54, 566, 1),
(707, 55, 567, 1),
(708, 55, 568, 1),
(709, 55, 569, 1),
(710, 55, 570, 1),
(711, 55, 571, 1),
(712, 55, 572, 1),
(713, 55, 573, 1),
(714, 55, 574, 1),
(715, 55, 575, 1),
(716, 55, 576, 1),
(717, 55, 577, 1),
(718, 55, 578, 1),
(719, 55, 579, 1),
(720, 55, 580, 1),
(721, 55, 581, 1),
(722, 56, 582, 1),
(723, 56, 583, 1),
(724, 56, 584, 1),
(725, 56, 585, 1),
(726, 56, 586, 1),
(727, 56, 587, 1),
(728, 56, 588, 1),
(729, 56, 589, 1),
(730, 56, 590, 1),
(731, 56, 591, 1),
(732, 56, 592, 1),
(733, 56, 593, 1),
(734, 56, 594, 1),
(735, 56, 595, 1),
(736, 56, 596, 1),
(737, 56, 597, 1),
(738, 56, 598, 1),
(739, 56, 599, 1),
(740, 56, 600, 1),
(741, 56, 601, 1),
(742, 56, 602, 1),
(743, 56, 603, 1),
(744, 56, 604, 1),
(745, 56, 605, 1),
(746, 56, 606, 1),
(747, 56, 607, 1),
(748, 56, 608, 1),
(749, 56, 609, 1),
(750, 57, 610, 1),
(751, 57, 611, 1),
(752, 57, 612, 1),
(753, 57, 613, 1),
(754, 57, 614, 1),
(755, 57, 615, 1),
(756, 57, 616, 1),
(757, 57, 617, 1),
(758, 57, 618, 1),
(759, 57, 619, 1),
(760, 57, 621, 1),
(761, 57, 622, 1),
(762, 57, 623, 1),
(763, 57, 624, 1),
(764, 57, 625, 1),
(765, 57, 626, 1),
(766, 57, 627, 1),
(767, 57, 628, 1),
(768, 57, 629, 1),
(769, 57, 630, 1),
(770, 57, 631, 1),
(771, 57, 632, 1),
(772, 57, 633, 1),
(773, 57, 634, 1),
(774, 57, 635, 1),
(775, 57, 636, 1),
(776, 57, 637, 1),
(777, 58, 613, 1),
(778, 58, 632, 1),
(779, 59, 638, 1),
(780, 59, 639, 1),
(781, 59, 640, 1),
(782, 59, 641, 1),
(783, 59, 642, 1),
(784, 59, 643, 1),
(785, 59, 644, 1),
(786, 59, 645, 1),
(787, 59, 646, 1),
(788, 59, 647, 1),
(789, 59, 648, 1),
(790, 59, 649, 1),
(791, 59, 650, 1),
(792, 59, 652, 1),
(793, 59, 653, 1),
(794, 59, 654, 1),
(795, 59, 655, 1),
(796, 59, 656, 1),
(797, 59, 658, 1),
(798, 59, 660, 1),
(799, 60, 695, 1),
(800, 60, 696, 1),
(801, 60, 697, 1),
(802, 60, 699, 1),
(803, 60, 700, 1),
(804, 60, 701, 1),
(805, 60, 702, 1),
(806, 60, 703, 1),
(807, 60, 704, 1),
(808, 60, 705, 1),
(809, 60, 706, 1),
(810, 60, 707, 1),
(811, 60, 708, 1),
(812, 61, 679, 1),
(813, 61, 680, 1),
(814, 61, 681, 1),
(815, 61, 682, 1),
(816, 61, 683, 1),
(817, 61, 684, 1),
(818, 61, 685, 1),
(819, 61, 686, 1),
(820, 61, 687, 1),
(821, 61, 688, 1),
(822, 61, 689, 1),
(823, 61, 690, 1),
(824, 61, 691, 1),
(825, 61, 692, 1),
(826, 61, 693, 1),
(827, 61, 694, 1),
(828, 62, 709, 1),
(829, 62, 710, 1),
(830, 62, 711, 1),
(831, 62, 712, 1),
(832, 62, 713, 1),
(833, 62, 714, 1),
(834, 62, 715, 1),
(835, 62, 716, 1),
(836, 62, 717, 1),
(837, 62, 718, 1),
(838, 62, 719, 1),
(839, 62, 720, 1),
(840, 62, 722, 1),
(841, 62, 723, 1),
(842, 62, 724, 1),
(843, 62, 725, 1),
(844, 62, 726, 1),
(845, 62, 727, 1),
(846, 62, 728, 1),
(847, 63, 661, 1),
(848, 63, 662, 1),
(849, 63, 663, 1),
(850, 63, 664, 1),
(851, 63, 665, 1),
(852, 63, 666, 1),
(853, 63, 667, 1),
(854, 63, 668, 1),
(855, 63, 669, 1),
(856, 63, 670, 1),
(857, 63, 671, 1),
(858, 63, 672, 1),
(859, 63, 673, 1),
(860, 63, 674, 1),
(861, 63, 676, 1),
(862, 63, 677, 1),
(863, 63, 678, 1),
(864, 64, 729, 1),
(865, 64, 731, 1),
(866, 64, 732, 1),
(867, 64, 733, 1),
(868, 64, 734, 1),
(869, 64, 736, 1),
(870, 64, 737, 1),
(871, 64, 739, 1),
(872, 64, 740, 1),
(873, 64, 741, 1),
(874, 64, 743, 1),
(875, 64, 744, 1),
(876, 64, 745, 1),
(877, 64, 746, 1),
(878, 64, 747, 1),
(879, 64, 748, 1),
(880, 64, 749, 1),
(881, 64, 750, 1),
(882, 64, 751, 1),
(883, 65, 754, 1),
(884, 65, 755, 1),
(885, 65, 756, 1),
(886, 65, 757, 1),
(887, 65, 758, 1),
(888, 65, 759, 1),
(889, 65, 760, 1),
(890, 65, 761, 1),
(891, 65, 762, 1),
(892, 65, 763, 1),
(893, 65, 764, 1),
(894, 65, 765, 1),
(895, 65, 766, 1),
(896, 65, 767, 1),
(897, 65, 768, 1),
(898, 66, 769, 1),
(899, 66, 770, 1),
(900, 66, 771, 1),
(901, 66, 772, 1),
(902, 66, 773, 1),
(903, 66, 774, 1),
(904, 66, 775, 1),
(905, 66, 776, 1),
(906, 66, 777, 1),
(907, 66, 778, 1),
(908, 66, 779, 1),
(909, 66, 780, 1),
(910, 66, 781, 1),
(911, 66, 782, 1),
(912, 66, 783, 1),
(913, 66, 784, 1),
(914, 66, 785, 1),
(915, 66, 786, 1),
(916, 66, 787, 1),
(917, 66, 788, 1),
(918, 66, 789, 1),
(919, 66, 790, 1),
(920, 66, 791, 1),
(921, 66, 792, 1),
(922, 67, 793, 1),
(923, 67, 794, 1),
(924, 67, 795, 1),
(925, 67, 796, 1),
(926, 67, 797, 1),
(927, 67, 798, 1),
(928, 67, 799, 1),
(929, 67, 800, 1),
(930, 67, 801, 1),
(931, 67, 802, 1),
(932, 67, 803, 1),
(933, 67, 804, 1),
(934, 67, 805, 1),
(935, 68, 806, 1),
(936, 68, 807, 1),
(937, 68, 808, 1),
(938, 68, 809, 1),
(939, 68, 810, 1),
(940, 68, 811, 1),
(941, 68, 812, 1),
(942, 68, 813, 1),
(943, 68, 814, 1),
(944, 68, 815, 1),
(945, 68, 816, 1),
(946, 68, 817, 1),
(947, 68, 818, 1),
(948, 68, 819, 1),
(949, 68, 820, 1),
(950, 68, 821, 1),
(951, 68, 822, 1),
(952, 68, 823, 1),
(953, 68, 824, 1),
(954, 69, 825, 1),
(955, 69, 826, 1),
(956, 69, 827, 1),
(957, 69, 828, 1),
(958, 69, 829, 1),
(959, 69, 830, 1),
(960, 69, 831, 1),
(961, 69, 832, 1),
(962, 69, 833, 1),
(963, 69, 834, 1),
(964, 69, 835, 1),
(965, 70, 793, 1),
(966, 70, 794, 1),
(967, 70, 795, 1),
(968, 70, 796, 1),
(969, 70, 797, 1),
(970, 70, 798, 1),
(971, 70, 799, 1),
(972, 70, 800, 1),
(973, 70, 801, 1),
(974, 70, 802, 1),
(975, 70, 803, 1),
(976, 70, 804, 1),
(977, 70, 805, 1),
(978, 71, 836, 1),
(979, 71, 837, 1),
(980, 71, 838, 1),
(981, 71, 839, 1),
(982, 71, 840, 1),
(983, 71, 841, 1),
(984, 71, 842, 1),
(985, 71, 843, 1),
(986, 71, 844, 1),
(987, 71, 845, 1),
(988, 71, 846, 1),
(989, 71, 847, 1),
(990, 71, 848, 1),
(991, 71, 849, 1),
(992, 71, 850, 1),
(993, 71, 851, 1),
(994, 72, 837, 1),
(997, 76, 852, 1),
(998, 76, 853, 1),
(999, 76, 854, 1),
(1000, 76, 855, 1),
(1001, 76, 856, 1),
(1002, 76, 857, 1),
(1003, 76, 858, 1),
(1004, 76, 859, 1),
(1005, 76, 860, 1),
(1006, 76, 861, 1),
(1007, 76, 862, 1),
(1008, 76, 863, 1),
(1009, 76, 864, 1),
(1010, 76, 865, 1),
(1011, 76, 866, 1),
(1012, 76, 867, 1),
(1013, 76, 869, 1),
(1014, 76, 870, 1),
(1015, 76, 871, 1),
(1016, 76, 872, 1),
(1017, 76, 873, 1),
(1018, 76, 874, 1),
(1019, 77, 1043, 1),
(1020, 77, 1044, 1),
(1021, 77, 1045, 1),
(1022, 77, 1046, 1),
(1023, 77, 1047, 1),
(1024, 77, 1049, 1),
(1025, 77, 1050, 1),
(1026, 77, 1051, 1),
(1027, 77, 1052, 1),
(1028, 77, 1053, 1),
(1029, 77, 1054, 1),
(1030, 77, 1055, 1),
(1031, 77, 1056, 1),
(1032, 77, 1057, 1),
(1033, 77, 1058, 1),
(1034, 77, 1059, 1),
(1035, 77, 1060, 1),
(1036, 77, 1061, 1),
(1037, 77, 1062, 1),
(1038, 77, 1063, 1),
(1039, 77, 1064, 1),
(1040, 77, 1065, 1),
(1041, 77, 1066, 1),
(1042, 77, 1067, 1),
(1043, 77, 1068, 1),
(1044, 77, 1069, 1),
(1045, 77, 1070, 1),
(1046, 77, 1071, 1),
(1047, 77, 1072, 1),
(1048, 78, 951, 1),
(1049, 78, 952, 1),
(1050, 78, 953, 1),
(1051, 78, 954, 1),
(1052, 78, 955, 1),
(1053, 78, 956, 1),
(1054, 78, 957, 1),
(1055, 78, 958, 1),
(1056, 78, 959, 1),
(1057, 78, 960, 1),
(1058, 78, 961, 1),
(1059, 79, 944, 1),
(1060, 79, 945, 1),
(1061, 79, 946, 1),
(1062, 79, 947, 1),
(1063, 79, 948, 1),
(1064, 79, 949, 1),
(1065, 79, 950, 1),
(1066, 80, 901, 1),
(1067, 80, 902, 1),
(1068, 80, 903, 1),
(1069, 80, 904, 1),
(1070, 80, 905, 1),
(1071, 80, 906, 1),
(1072, 80, 907, 1),
(1073, 80, 908, 1),
(1074, 80, 909, 1),
(1075, 80, 910, 1),
(1076, 80, 911, 1),
(1077, 80, 912, 1),
(1078, 80, 913, 1),
(1079, 80, 914, 1),
(1080, 80, 915, 1),
(1081, 80, 916, 1),
(1082, 80, 917, 1),
(1083, 80, 919, 1),
(1084, 80, 920, 1),
(1085, 80, 921, 1),
(1086, 80, 922, 1),
(1087, 80, 923, 1),
(1088, 80, 924, 1),
(1089, 80, 925, 1),
(1090, 80, 926, 1),
(1091, 80, 927, 1),
(1092, 80, 928, 1),
(1093, 80, 929, 1),
(1094, 80, 930, 1),
(1095, 80, 931, 1),
(1096, 80, 932, 1),
(1097, 80, 933, 1),
(1098, 80, 934, 1),
(1099, 80, 935, 1),
(1100, 80, 936, 1),
(1101, 80, 937, 1),
(1102, 80, 938, 1),
(1103, 80, 940, 1),
(1104, 80, 941, 1),
(1105, 80, 942, 1),
(1106, 80, 943, 1),
(1107, 83, 875, 1),
(1108, 83, 876, 1),
(1109, 83, 877, 1),
(1110, 83, 878, 1),
(1111, 83, 879, 1),
(1112, 83, 880, 1),
(1113, 83, 881, 1),
(1114, 83, 882, 1),
(1115, 83, 883, 1),
(1116, 83, 884, 1),
(1117, 83, 885, 1),
(1118, 83, 886, 1),
(1119, 83, 887, 1),
(1120, 83, 888, 1),
(1121, 83, 889, 1),
(1122, 83, 890, 1),
(1123, 83, 891, 1),
(1124, 83, 892, 1),
(1125, 83, 893, 1),
(1126, 83, 894, 1),
(1127, 83, 895, 1),
(1128, 83, 896, 1),
(1129, 83, 897, 1),
(1130, 83, 898, 1),
(1131, 83, 899, 1),
(1132, 83, 900, 1),
(1133, 84, 962, 1),
(1134, 84, 963, 1),
(1135, 84, 964, 1),
(1136, 84, 965, 1),
(1137, 84, 966, 1),
(1138, 85, 967, 1),
(1139, 85, 968, 1),
(1140, 85, 969, 1),
(1141, 85, 970, 1),
(1142, 85, 971, 1),
(1143, 85, 972, 1),
(1144, 85, 973, 1),
(1145, 85, 974, 1),
(1146, 85, 975, 1),
(1147, 85, 976, 1),
(1148, 85, 977, 1),
(1149, 85, 978, 1),
(1150, 85, 979, 1),
(1151, 85, 980, 1),
(1152, 85, 981, 1),
(1153, 85, 982, 1),
(1154, 85, 983, 1),
(1155, 85, 984, 1),
(1156, 85, 985, 1),
(1157, 85, 986, 1),
(1158, 86, 987, 1),
(1159, 86, 988, 1),
(1160, 86, 989, 1),
(1161, 86, 990, 1),
(1162, 86, 991, 1),
(1163, 86, 992, 1),
(1164, 86, 993, 1),
(1165, 86, 994, 1),
(1166, 86, 995, 1),
(1167, 86, 996, 1),
(1168, 86, 997, 1),
(1169, 86, 998, 1),
(1170, 86, 999, 1),
(1171, 86, 1000, 1),
(1172, 86, 1001, 1),
(1173, 86, 1002, 1),
(1174, 86, 1003, 1),
(1175, 86, 1004, 1),
(1176, 86, 1005, 1),
(1177, 86, 1006, 1),
(1178, 86, 1007, 1),
(1179, 86, 1008, 1),
(1180, 86, 1009, 1),
(1181, 86, 1010, 1),
(1182, 86, 1011, 1),
(1183, 86, 1012, 1),
(1184, 86, 1013, 1),
(1185, 86, 1014, 1),
(1186, 86, 1015, 1),
(1187, 87, 1016, 1),
(1188, 87, 1017, 1),
(1189, 87, 1018, 1),
(1190, 87, 1019, 1),
(1191, 87, 1020, 1),
(1192, 87, 1021, 1),
(1193, 87, 1022, 1),
(1194, 87, 1023, 1),
(1195, 87, 1024, 1),
(1196, 87, 1025, 1),
(1197, 87, 1026, 1),
(1198, 87, 1027, 1),
(1199, 87, 1028, 1),
(1200, 87, 1029, 1),
(1201, 87, 1030, 1),
(1202, 87, 1031, 1),
(1203, 87, 1032, 1),
(1204, 87, 1033, 1),
(1205, 87, 1034, 1),
(1206, 87, 1035, 1),
(1207, 87, 1036, 1),
(1208, 87, 1037, 1),
(1209, 87, 1038, 1),
(1210, 87, 1039, 1),
(1211, 87, 1040, 1),
(1212, 87, 1041, 1),
(1213, 87, 1042, 1),
(1214, 88, 1047, 1),
(1215, 89, 1073, 1),
(1216, 89, 1074, 1),
(1217, 89, 1075, 1),
(1218, 89, 1076, 1),
(1219, 89, 1077, 1),
(1220, 89, 1078, 1),
(1221, 89, 1079, 1),
(1222, 89, 1080, 1),
(1223, 89, 1081, 1),
(1224, 89, 1082, 1),
(1225, 89, 1083, 1),
(1226, 89, 1084, 1),
(1227, 89, 1085, 1),
(1228, 89, 1086, 1),
(1229, 89, 1087, 1),
(1230, 89, 1088, 1),
(1231, 89, 1089, 1),
(1232, 89, 1090, 1),
(1233, 89, 1091, 1),
(1234, 89, 1092, 1),
(1235, 89, 1093, 1),
(1236, 89, 1094, 1),
(1237, 89, 1095, 1),
(1238, 89, 1096, 1),
(1239, 89, 1097, 1),
(1240, 89, 1099, 1),
(1241, 90, 1077, 1),
(1242, 90, 1082, 1),
(1243, 90, 1094, 1),
(1244, 91, 1100, 1),
(1245, 91, 1101, 1),
(1246, 91, 1102, 1),
(1247, 91, 1103, 1),
(1248, 91, 1104, 1),
(1249, 91, 1105, 1),
(1250, 91, 1106, 1),
(1251, 91, 1107, 1),
(1252, 91, 1108, 1),
(1253, 91, 1109, 1),
(1254, 92, 1110, 1),
(1255, 92, 1111, 1),
(1256, 92, 1112, 1),
(1257, 92, 1113, 1),
(1258, 92, 1114, 1),
(1259, 92, 1115, 1),
(1260, 92, 1116, 1),
(1261, 92, 1117, 1),
(1262, 92, 1118, 1),
(1263, 92, 1119, 1),
(1264, 92, 1120, 1),
(1265, 92, 1121, 1),
(1266, 92, 1122, 1),
(1267, 92, 1123, 1),
(1268, 92, 1124, 1),
(1269, 92, 1125, 1),
(1270, 92, 1126, 1),
(1271, 92, 1127, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feriados`
--

CREATE TABLE `feriados` (
  `id_feriado` int(11) NOT NULL,
  `feriado_dia` date NOT NULL,
  `feriado_motivo` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `feriados`
--

INSERT INTO `feriados` (`id_feriado`, `feriado_dia`, `feriado_motivo`) VALUES
(2, '2020-06-29', 'San Pedro y San Pablo'),
(3, '2020-07-28', 'Fiestas Patrias'),
(5, '2020-08-30', 'Santa Rosa de Lima'),
(7, '2020-11-01', 'Dia de Todos los Santos'),
(8, '2020-12-08', 'Inmaculada Concepción'),
(9, '2020-12-25', 'Navidad'),
(12, '2021-07-28', 'Fiestas Patrias'),
(13, '2021-12-31', 'Año Nuevo'),
(14, '2021-01-01', 'Año Nuevo'),
(15, '2021-04-01', 'Jueves Santo'),
(16, '2021-04-02', 'Viernes Santo'),
(17, '2021-05-01', 'Dia del Trabajo'),
(18, '2021-06-29', 'San Pedro y San Pablo'),
(19, '2021-07-28', 'FIestas Patrias'),
(21, '2021-07-29', 'Fiestas Patrias'),
(22, '2021-08-30', 'Santa Rosa de Lima'),
(23, '2021-10-08', 'Combate de Angamos'),
(24, '2021-11-01', 'Dia de los Santos'),
(25, '2021-12-08', 'Dia de la Inmaculada Concepción'),
(26, '2021-12-25', 'Navidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `id_grupo` int(11) NOT NULL,
  `grupo_nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `grupo_ticketera` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grupo_fecha_registro` datetime NOT NULL,
  `grupo_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id_grupo`, `grupo_nombre`, `grupo_ticketera`, `grupo_fecha_registro`, `grupo_estado`) VALUES
(1, 'COCINA', 'Ticketera', '2021-03-15 00:00:00', 1),
(2, 'BEBIDA', 'Ticketera', '2021-03-15 00:00:00', 0),
(3, 'CALIENTES', 'Ticketera', '2021-04-30 21:26:17', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `igv`
--

CREATE TABLE `igv` (
  `id_igv` int(11) NOT NULL,
  `igv_codigo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `igv_codigoafectacion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `igv_descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `igv_codigoInternacional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `igv_nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `igv_tipodeafectacion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `igv_tipo_json` tinyint(4) NOT NULL,
  `igv_estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `igv`
--

INSERT INTO `igv` (`id_igv`, `igv_codigo`, `igv_codigoafectacion`, `igv_descripcion`, `igv_codigoInternacional`, `igv_nombre`, `igv_tipodeafectacion`, `igv_tipo_json`, `igv_estado`) VALUES
(1, '1000', '10', 'IGV Impuesto General a las Ventas', 'VAT', 'IGV', 'Gravado - Operación Onerosa', 1, 1),
(2, '9998', '30', 'Inafecta', 'FRE', 'INA', 'Inafecto - Operación Onerosa', 9, 1),
(3, '9997', '20', 'Exonerado', 'VAT', 'EXO', 'Exonerado - Operación Onerosa', 8, 1),
(4, '9996', '11', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Gravado - Retiro por premio', 2, 1),
(5, '9996', '12', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Gravado - Retiro por donación', 3, 1),
(6, '9996', '13', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Gravado - Retiro', 4, 1),
(7, '9996', '14', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Gravado - Retiro por publicidad', 5, 1),
(8, '9996', '15', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Gravado - Bonificaciones', 6, 1),
(9, '9996', '16', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Gravado - Retiro por entrega a trabajadores', 7, 1),
(10, '1016', '17', 'Impuesto a la Venta Arroz Pilado', 'VAT', 'IVAP', 'Gravado - IVAP', 17, 1),
(11, '9996', '21', 'Gratuita', 'FRE', 'GRA', '[Gratuita] Exonerado - Transferencia gratuita', 0, 0),
(12, '9996', '31', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Inafecta - Retiro por Bonificación', 10, 1),
(13, '9996', '32', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Inafecto - Retiro', 11, 1),
(14, '9996', '33', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Inafecto - Retiro por Muestras Médicas', 12, 1),
(15, '9996', '34', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Inafecto - Retiro por Convenio Colectivo', 13, 1),
(16, '9996', '35', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Inafecto - Retiro por premio', 14, 1),
(17, '9996', '36', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Inafecto - Retiro por publicidad', 15, 1),
(18, '9996', '37', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Inafecto - Transferencia gratuita', 0, 0),
(19, '9995', '40', 'Exportación', 'FRE', 'EXP', 'Exportación de Bienes o Servicios', 16, 1),
(20, '9996', '17', 'Gratuito', 'FRE', 'GRA', '[Gratuita] Gravado - IVAP', 101, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `memorandum`
--

CREATE TABLE `memorandum` (
  `id_memorandum` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `memorandum_numero` int(11) DEFAULT NULL,
  `memorandum_motivo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `memorandum_otros` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memorandum_fecha` date NOT NULL,
  `memorandum_descripcion` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `memorandum_fecha_creacion` datetime NOT NULL,
  `id_user_aprobacion` int(11) DEFAULT NULL,
  `memoradum_fecha_aprobacion` datetime DEFAULT NULL,
  `memorandum_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id_menu` int(11) NOT NULL,
  `menu_nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `menu_controlador` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `menu_icono` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `menu_orden` int(11) NOT NULL,
  `menu_mostrar` tinyint(1) NOT NULL,
  `menu_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id_menu`, `menu_nombre`, `menu_controlador`, `menu_icono`, `menu_orden`, `menu_mostrar`, `menu_estado`) VALUES
(1, 'Login', 'Login', '-', 0, 0, 1),
(2, 'Panel de Inicio', 'Admin', 'fa fa-dashboard', 1, 1, 1),
(3, 'Gestión de Menu', 'Menu', 'fa fa-desktop', 2, 1, 1),
(4, 'Roles de Usuario', 'Rol', 'fa fa-user-secret', 3, 1, 1),
(5, 'Usuarios', 'Usuario', 'fa fa-user', 4, 1, 1),
(6, 'Datos Personales', 'Datos', 'fa fa-', 0, 0, 1),
(7, 'Negocios', 'Negocio', 'fa fa-industry', 10, 0, 1),
(8, 'Recursos', 'Recursos', 'fa fa-cart-plus', 7, 1, 1),
(9, 'Proveedores', 'Proveedor', 'fa fa-car', 9, 0, 1),
(10, 'Orden de Compra', 'Ordencompra', 'fa fa-cart-plus', 9, 0, 1),
(11, 'Productos', 'Producto', 'fa fa-tags', 9, 1, 1),
(12, 'Pedidos', 'Pedido', 'fa fa-shopping-cart', 11, 1, 1),
(13, 'Mesas', 'Mesa', 'fa fa-sitemap', 6, 1, 1),
(14, 'Almacen', 'Almacen', 'fa fa-folder-open', 6, 0, 1),
(15, 'Recetas', 'Receta', 'fa fa-file-text-o', 7, 1, 1),
(16, 'Ventas ', 'Ventas', 'fa fa-money', 12, 1, 1),
(17, 'Clientes', 'Cliente', 'fa fa-male', 5, 1, 1),
(18, 'Conversiones', 'Conversiones', 'fa fa-refresh', 8, 0, 1),
(19, 'Movimientos', 'Egreso', 'fa fa-usd', 13, 1, 1),
(20, 'Reportes', 'Reporte', 'fa fa-calendar-minus-o', 14, 1, 1),
(21, 'Insumos', 'Insumos', 'fa fa-apple', 8, 0, 1),
(22, 'Categorias', 'Categorias', 'fa fa-cutlery', 6, 0, 1),
(23, 'Recursos Humanos', 'Rhumanos', 'fa fa-folder-open', 2, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id_mesa` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `mesa_nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mesa_capacidad` int(100) NOT NULL,
  `mesa_estado` tinyint(4) NOT NULL,
  `mesa_estado_atencion` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id_mesa`, `id_sucursal`, `mesa_nombre`, `mesa_capacidad`, `mesa_estado`, `mesa_estado_atencion`) VALUES
(0, 4, 'Delivery', 1, 1, 2),
(6, 4, 'Mesa 01', 3, 1, 0),
(7, 4, 'Mesa 02', 2, 1, 0),
(8, 4, 'Mesa 03', 4, 1, 0),
(9, 4, 'Mesa 04', 6, 1, 0),
(10, 4, 'Mesa 05', 4, 1, 0),
(11, 4, 'Mesa 06', 2, 1, 0),
(12, 4, 'Mesa 07', 4, 1, 0),
(13, 4, 'Mesa 08', 2, 1, 0),
(14, 4, 'mesa 09', 2, 1, 0),
(15, 4, 'Mesa 10', 4, 1, 0),
(16, 4, 'Mesa 11', 4, 1, 0),
(17, 4, 'Mesa 12', 3, 0, 0),
(18, 4, 'Mesa 13 ', 2, 0, 0),
(19, 4, 'Mesa 14', 3, 0, 0),
(20, 4, 'Mesa 15', 2, 0, 0),
(21, 4, 'MESA 16', 1, 0, 0),
(22, 4, 'MESA 17', 3, 0, 0),
(23, 4, 'MESA 18', 1, 0, 0),
(24, 4, 'MESA 19', 3, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `id_moneda` int(11) NOT NULL,
  `moneda` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `abreviado` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `abrstandar` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `simbolo` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `activo` char(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`id_moneda`, `moneda`, `abreviado`, `abrstandar`, `simbolo`, `activo`) VALUES
(1, 'SOLES', 'sol', 'PEN', 'S/', '1'),
(2, 'DÓLARES', 'dol', 'USD', '$', '1'),
(3, 'EUROS', 'eur', 'EUR', 'E', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id_movimiento` int(11) NOT NULL,
  `id_caja_numero` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `movimiento_tipo` tinyint(2) NOT NULL COMMENT '1 es entrada y 2 es salida',
  `egreso_descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `egreso_monto` decimal(10,2) NOT NULL,
  `egreso_fecha_registro` datetime NOT NULL,
  `egreso_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimiento`, `id_caja_numero`, `id_usuario`, `id_sucursal`, `movimiento_tipo`, `egreso_descripcion`, `egreso_monto`, `egreso_fecha_registro`, `egreso_estado`) VALUES
(336, 1, 14, 4, 2, 'garrafon de agua', '4.00', '2021-10-28 19:56:11', 1),
(337, 1, 14, 4, 2, 'MERCADO 29/10/2021 - ENTREGADO GERRY', '400.00', '2021-10-29 16:15:41', 1),
(338, 1, 14, 4, 2, 'PAGO A ZEIN 28/10/2021', '10.00', '2021-10-29 16:16:40', 1),
(339, 1, 14, 4, 2, 'PARA COMPLETAR LA CERVEZA', '2.80', '2021-10-29 16:35:04', 1),
(340, 1, 14, 4, 2, 'HIELO', '12.00', '2021-10-29 17:39:02', 1),
(341, 1, 14, 4, 1, 'VUELTO DE HIELO', '0.20', '2021-10-29 18:06:19', 1),
(342, 1, 2, 4, 1, 'DE ERICK GAYA PARA CAMBIAR', '10.00', '2021-10-29 23:19:30', 1),
(343, 1, 14, 4, 2, 'DEVOLUCION DE 10 SOLES ERICK', '10.00', '2021-10-30 00:37:29', 1),
(344, 1, 14, 4, 2, 'PAGO A ZEIN', '10.00', '2021-10-30 00:39:03', 1),
(345, 1, 14, 4, 2, 'PAGO A LUIS', '100.00', '2021-10-30 00:58:43', 1),
(346, 1, 14, 4, 2, 'GARRAFON DE AGUA', '3.50', '2021-10-30 18:36:17', 1),
(347, 1, 14, 4, 2, 'COMPRA DE QUESO EDAM 0.218GR', '10.50', '2021-10-30 20:24:06', 1),
(348, 1, 14, 4, 2, 'PAGO ZEIN', '10.00', '2021-10-31 02:47:15', 1),
(349, 1, 14, 4, 2, 'COMPRA DE CERVEZA', '696.60', '2021-10-31 03:02:41', 1),
(350, 1, 14, 4, 2, 'COMPLETAR COMPRA DE GASEOSA Y CERVEZA', '2.70', '2021-11-02 18:18:51', 1),
(351, 1, 14, 4, 2, 'DEVOLUCION A ZEIN POR EL PAGO DE CERVEZA', '5.00', '2021-11-02 18:19:35', 1),
(352, 1, 14, 4, 2, 'MOVILIDAD PARA LA COMPRA DE CERVEZA Y GASEOSA', '5.00', '2021-11-02 18:20:13', 1),
(353, 1, 14, 4, 2, 'COMPRA DE CONTOMETRO TERMICO', '12.00', '2021-11-02 18:57:19', 1),
(354, 1, 14, 4, 2, 'MERCADO 03/11/21', '50.00', '2021-11-02 22:32:26', 1),
(355, 1, 14, 4, 2, 'COMPRA DE GAS 02/11/2021', '65.00', '2021-11-03 17:18:18', 1),
(356, 1, 14, 4, 2, 'COMPRA DE UN CIENTO DE ENVASES CON TAPA PARA AJI (PEDIDOS PARA LLEVAR)', '10.00', '2021-11-03 19:23:25', 1),
(357, 1, 14, 4, 2, 'COMPRA DE 2KILOS DE ALITAS', '36.00', '2021-11-03 22:53:14', 1),
(358, 1, 14, 4, 2, 'PAGO ZEIN', '10.00', '2021-11-03 22:58:39', 1),
(359, 1, 14, 4, 2, 'COMPRA DE HOT DOG', '9.00', '2021-11-05 23:01:01', 1),
(360, 1, 14, 4, 2, 'COMPRA DE 3 KG DE PAPA', '9.00', '2021-11-05 23:00:45', 1),
(361, 1, 14, 4, 2, 'ADELANTO KENYA ', '20.00', '2021-11-05 23:17:45', 1),
(362, 1, 14, 4, 2, 'PAGO DE ZEIN', '10.00', '2021-11-05 23:26:29', 1),
(363, 1, 14, 4, 2, 'MERCADO ', '243.50', '2021-11-05 23:32:26', 1),
(364, 1, 14, 4, 2, 'COMPRA DE DOS SIX DE CORONA Y DOS CAJAS DE CRISTAL', '159.50', '2021-11-06 18:39:43', 1),
(365, 1, 14, 4, 2, 'COMPRA DE TRAPEADOR Y LAVA VAJILLA', '31.50', '2021-11-06 18:41:00', 1),
(366, 1, 14, 4, 2, 'COMPRA DE GARRAFON DE AGUA', '3.50', '2021-11-06 18:42:03', 1),
(367, 1, 14, 4, 2, 'PAQUETE DE AGUA', '18.00', '2021-11-06 18:42:20', 1),
(368, 1, 14, 4, 2, 'PAAGO DE MOVILIDAD A ZEIN', '5.00', '2021-11-06 18:42:44', 1),
(369, 1, 14, 4, 2, '5 soles de Pago Zein ', '5.00', '2021-11-06 23:33:10', 1),
(370, 1, 14, 4, 2, 'DEPOSITO A ERICK', '100.00', '2021-11-07 20:57:49', 1),
(371, 1, 14, 4, 2, 'ADELANTO A ZEIN ', '10.00', '2021-11-07 20:58:12', 1),
(372, 1, 14, 4, 2, 'MERCADO PARA EL 11/11/21', '82.00', '2021-11-11 00:01:02', 1),
(373, 1, 14, 4, 2, 'ADELANTO KENIA', '10.00', '2021-11-10 23:48:15', 1),
(374, 1, 14, 4, 2, 'PAGO ZEIN', '5.00', '2021-11-10 23:47:20', 1),
(375, 1, 14, 4, 2, 'COMPRA DE UNA CAJA DE CORONA', '100.00', '2021-11-11 18:35:19', 1),
(376, 1, 14, 4, 2, 'COMPRA DE UNA CAJA DE CORONITA', '60.00', '2021-11-11 18:35:46', 1),
(377, 1, 14, 4, 2, 'COMPRA DE GARRAFON DE AGUA', '4.00', '2021-11-11 18:39:03', 1),
(378, 1, 14, 4, 2, 'COMPRA DE UNA CAJA DE CERVEZA', '55.00', '2021-11-11 19:13:49', 1),
(379, 1, 14, 4, 2, 'COMPRA DE HOT DOG', '4.80', '2021-11-11 22:56:41', 1),
(380, 1, 14, 4, 2, 'PAGO ZEIN', '10.00', '2021-11-12 00:10:51', 1),
(381, 1, 14, 4, 2, 'MERCADO DEDL 12/11/21', '120.00', '2021-11-12 01:05:30', 1),
(382, 1, 14, 4, 2, 'COMPRA DE 3 CAJAS DE CORONA', '294.00', '2021-11-12 18:50:33', 1),
(383, 1, 14, 4, 2, 'COMPRA DE ARROZ 2KG', '7.00', '2021-11-12 18:50:58', 1),
(384, 1, 14, 4, 2, 'PAGO DE MOVILIDAD ', '5.00', '2021-11-12 18:55:55', 1),
(385, 1, 14, 4, 2, 'COMPRA DE DESINFECTANTE 4L', '21.00', '2021-11-12 19:30:09', 1),
(386, 1, 14, 4, 2, 'COMPRA DE PAQUETE DE AGUA', '18.00', '2021-11-12 19:43:42', 1),
(387, 1, 14, 4, 2, 'COMPRA DE UN PAQUETE SURTIDO DE GASEOSA INACA COLA Y COCA COLA ', '22.50', '2021-11-12 19:44:46', 1),
(388, 1, 14, 4, 2, 'PASAJE LUIS', '5.00', '2021-11-13 02:11:13', 1),
(389, 1, 14, 4, 2, 'PAGO ZEIN', '10.00', '2021-11-13 02:13:24', 1),
(390, 1, 14, 4, 2, 'PAGO DE LOS MUSICOS', '400.00', '2021-11-13 02:23:45', 1),
(391, 1, 14, 4, 2, 'COMPRA DE CERVEZAS Y GASEOSA', '150.00', '2021-11-13 02:25:19', 1),
(392, 1, 14, 4, 2, 'COMPRA DE CERVEZA', '120.00', '2021-11-13 02:25:40', 1),
(393, 1, 14, 4, 2, 'COMPRA DE CERVEZA', '210.00', '2021-11-13 02:26:05', 1),
(394, 1, 14, 4, 2, 'COMPRA DE 3 GASEOSAS POR UND', '7.50', '2021-11-13 23:04:53', 1),
(395, 1, 14, 4, 2, 'COMPRA DE 3 AGUAS, 2 INCA KOLA Y 2 COCA COLA', '16.00', '2021-11-13 23:05:26', 1),
(396, 1, 14, 4, 2, 'COMPRA DE UN TARRO DE LECHE', '4.00', '2021-11-13 23:05:59', 1),
(397, 1, 14, 4, 2, 'COMPRA DE 6 CERVEZAS TRIGO', '36.00', '2021-11-13 23:06:14', 1),
(398, 1, 14, 4, 2, 'COMPRA DE CERVEZA CRISTAL 12 UNIDADES', '66.00', '2021-11-13 23:17:24', 1),
(399, 1, 14, 4, 2, 'PAGO ZEIN', '10.00', '2021-11-14 00:21:25', 1),
(400, 1, 14, 4, 2, 'ADELANTO KENIA', '50.00', '2021-11-14 00:22:29', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `negocios`
--

CREATE TABLE `negocios` (
  `id_negocio` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `negocio_nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `negocio_direccion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `negocio_ruc` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `negocio_foto` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `negocio_telefono` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `negocio_estado` tinyint(1) NOT NULL,
  `negocio_fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `negocios`
--

INSERT INTO `negocios` (`id_negocio`, `id_ciudad`, `negocio_nombre`, `negocio_direccion`, `negocio_ruc`, `negocio_foto`, `negocio_telefono`, `negocio_estado`, `negocio_fecha_registro`) VALUES
(3, 1, 'GAIA RESTAURANT CEVICHERIA', 'CAL. LOS FRUTALES NRO. B-1 (AV GUARDIA CIVIL)', '20606320796', 'media/negocio/LA ULTIMA CONCHITA_24032021142225.jp', '965562001', 1, '2021-03-24 14:22:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_venta`
--

CREATE TABLE `nota_venta` (
  `id_nota_venta` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tipo_pago` int(11) NOT NULL,
  `id_moneda` int(11) NOT NULL,
  `nota_venta_tipo` varchar(10) NOT NULL COMMENT 'aca siempre 20, porque es nota de venta',
  `nota_venta_serie` varchar(10) NOT NULL,
  `nota_venta_correlativo` varchar(60) NOT NULL,
  `nota_venta_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nota_venta_pago_cliente` decimal(10,2) DEFAULT 0.00,
  `nota_venta_vuelto` decimal(10,2) DEFAULT 0.00,
  `nota_venta_fecha` datetime NOT NULL,
  `nota_venta_observacion` varchar(500) DEFAULT NULL,
  `nota_venta_cancelar` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'si esta 1 significa que fue cancelada',
  `nota_venta_estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_venta_detalle`
--

CREATE TABLE `nota_venta_detalle` (
  `id_nota_venta_detalle` int(11) NOT NULL,
  `id_nota_venta` int(11) NOT NULL,
  `id_comanda_detalle` int(11) NOT NULL,
  `nota_venta_detalle_valor_unitario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nota_venta_detalle_precio_valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nota_venta_detalle_nombre_producto` varchar(200) NOT NULL,
  `nota_venta_detalle_cantidad` double NOT NULL,
  `nota_venta_detalle_total_igv` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nota_venta_detalle_porcentaje_igv` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nota_venta_detalle_total_icbper` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nota_venta_detalle_valor_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nota_venta_detalle_importe_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `id_producto_precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obligacion_pagar`
--

CREATE TABLE `obligacion_pagar` (
  `id_obligacion` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  `id_user_creacion` int(11) NOT NULL,
  `id_user_aprobacion` int(11) DEFAULT NULL,
  `obligacion_clase` tinyint(4) NOT NULL,
  `obligacion_codigo` int(11) DEFAULT NULL,
  `obligacion_fecha_creacion` date NOT NULL,
  `obligacion_hora_creacion` time NOT NULL,
  `obligacion_fecha_inicio` date DEFAULT NULL,
  `obligacion_fecha_fin` date NOT NULL,
  `obligacion_estado` tinyint(1) NOT NULL,
  `obligacion_tipo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `obligacion_concepto` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `obligacion_activo` tinyint(1) NOT NULL,
  `obligacion_moneda` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `obligacion_importe` float(10,2) DEFAULT NULL,
  `obligacion_id_persona` int(11) DEFAULT NULL,
  `obligacion_documentacion` tinyint(4) NOT NULL,
  `obligacion_fecha_aprobacion` date DEFAULT NULL,
  `obligacion_hora_aprobacion` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obligacion_personal`
--

CREATE TABLE `obligacion_personal` (
  `id_obligacionper` int(11) NOT NULL,
  `id_obligacion` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `obligacionper_dias_efectivos` float(10,2) NOT NULL,
  `obligacionper_dias_laborales` int(11) NOT NULL,
  `obligacionper_monto_mensual` float(10,2) NOT NULL,
  `obligacionper_total_mensual` float(10,2) NOT NULL,
  `obligacionper_subtotal` float(10,2) NOT NULL,
  `obligacionper_total` float(10,2) NOT NULL,
  `obligacionper_banco` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `obligacionper_cuenta` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `obligacionper_estadi` tinyint(1) NOT NULL,
  `obligacionper_cts` float(10,2) DEFAULT NULL,
  `obligacionper_grati` float(10,2) DEFAULT NULL,
  `obligacionper_vaca` float(10,2) DEFAULT NULL,
  `obligacionper_reint` float(10,2) DEFAULT NULL,
  `obligacionper_fondo` float(10,2) DEFAULT NULL,
  `obligacionper_desc` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `id_opcion` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `opcion_nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `opcion_funcion` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `opcion_icono` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opcion_mostrar` tinyint(1) NOT NULL,
  `opcion_orden` int(11) NOT NULL,
  `opcion_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id_opcion`, `id_menu`, `opcion_nombre`, `opcion_funcion`, `opcion_icono`, `opcion_mostrar`, `opcion_orden`, `opcion_estado`) VALUES
(1, 1, 'Inicio de Sesion', 'inicio', '-', 0, 0, 1),
(2, 2, 'Inicio', 'inicio', 'fa fa-play', 1, 1, 1),
(3, 2, 'Cerrar Sesión', 'finalizar_sesion', 'fa fa-sign-out', 0, 1, 1),
(4, 3, 'Gestionar Menús', 'inicio', NULL, 1, 1, 1),
(5, 3, 'Iconos', 'iconos', NULL, 1, 2, 1),
(6, 3, 'Accesos por Rol', 'roles', NULL, 0, 0, 1),
(7, 3, 'Opciones por Menú', 'opciones', NULL, 0, 0, 1),
(8, 3, 'Gestionar Permisos(breve)', 'gestion_permisos', '', 0, 0, 1),
(9, 4, 'Gestionar Roles', 'inicio', '', 1, 1, 1),
(10, 4, 'Accesos por Rol', 'accesos', '', 0, 0, 1),
(11, 3, 'Gestionar Restricciones(breve)', 'gestion_restricciones', '', 0, 0, 1),
(12, 5, 'Gestionar Usuarios', 'inicio', '', 1, 1, 1),
(13, 6, 'Editar Datos', 'editar_datos', '', 0, 0, 1),
(14, 6, 'Editar Usuario', 'editar_usuario', '', 0, 0, 1),
(15, 6, 'Cambiar Contraseña', 'cambiar_contrasenha', '', 0, 0, 1),
(16, 7, 'Gestionar', 'gestionar', '', 1, 1, 1),
(17, 7, 'Asignar Sucursal', 'sucursal', '', 0, 2, 1),
(18, 7, 'Usuarios Sucursal', 'usuarios_sucursal', '', 0, 3, 1),
(19, 7, 'Usuarios Negocios', 'usuarios_negocio', '', 0, 4, 1),
(20, 8, 'Gestionar Categorias', 'categorias', '', 1, 1, 1),
(21, 8, 'Gestionar Recursos', 'recursos', '', 1, 2, 1),
(22, 9, 'Gestionar', 'inicio', '', 1, 1, 1),
(23, 10, 'Registrar Orden de Compra', 'orden_compra', '', 1, 1, 1),
(24, 10, 'Ordenes de Compras Pendientes', 'orden_pendiente', '', 1, 2, 1),
(25, 10, 'Ordenes de Compra Aprobadas', 'orden_aprobada', '', 1, 3, 1),
(26, 10, 'Detalle de la Orden de Compra', 'detalle_orden_compra', '', 0, 4, 1),
(27, 10, 'Editar Orden de Compra', 'orden_editar', '', 0, 5, 1),
(28, 10, 'Recepcion Detalle Compra', 'recepcion_orden', '', 0, 6, 1),
(29, 11, 'Gestionar Productos', 'gestionar', '', 1, 1, 1),
(30, 12, 'Gestionar Pedidos', 'gestionar', '', 1, 1, 1),
(31, 13, 'Gestionar Mesas', 'inicio', '', 1, 1, 1),
(32, 14, 'Gestionar Almacen', 'inicio', '', 1, 1, 1),
(33, 12, 'Asignar Pedido', 'asignar', '', 0, 2, 1),
(34, 12, 'Listar Grupos', 'listar_grupos', '', 1, 5, 1),
(35, 12, 'Listado', 'listado_detalle_grupo', '', 0, 4, 1),
(36, 12, 'Listado Bebidas', 'listado_bebida', '', 0, 5, 1),
(37, 15, 'Gestionar Recetas', 'inicio', '', 1, 1, 1),
(38, 15, 'Gestionar Detalle Recetas', 'detalle_receta', '', 0, 2, 1),
(39, 16, 'Pendientes de Declarar', 'historial_ventas', '', 1, 2, 1),
(40, 12, 'Detalle del Pedido', 'detalle_pedido', '', 0, 6, 1),
(41, 17, 'Gestionar Clientes', 'inicio', '', 1, 1, 1),
(42, 18, 'Gestionar', 'gestionar', '', 1, 1, 1),
(43, 19, 'Gestionar', 'gestionar', '', 1, 1, 1),
(44, 20, 'Reporte Ingresos y Egresos', 'ingresos_egresos', '', 1, 1, 1),
(45, 21, 'Gestionar Insumos', 'gestionar', '', 1, 1, 1),
(46, 12, 'Realizar Delivery', 'delivery', '', 1, 2, 1),
(47, 16, 'Ver Detalle Venta', 'ver_detalle_venta', '', 0, 0, 1),
(48, 12, 'Historial Delivery Pendientes', 'historial_delivery', '', 1, 3, 1),
(49, 20, 'Reporte Clientes', 'reporte_clientes', '', 1, 2, 1),
(50, 20, 'Reporte Proveedores', 'reporte_proveedores', '', 0, 3, 1),
(51, 20, 'Reporte Meseros', 'reporte_meseros', '', 0, 4, 1),
(52, 16, 'Historial Ventas Sunat', 'historial_ventas_enviadas', '', 1, 3, 1),
(53, 16, 'Resumen Diario', 'envio_resumenes_diario', '', 1, 4, 1),
(54, 20, 'Reporte Insumos', 'reporte_insumos', '', 0, 6, 1),
(55, 16, 'Historial Resumen Diario', 'historial_resumen_diario', '', 1, 5, 1),
(56, 16, 'Ver Detalle Resumen', 'ver_detalle_resumen', '', 0, 0, 1),
(57, 12, 'ticket_pedido', 'ticket_pedido', '', 0, 0, 1),
(58, 16, 'imprimir_ticket_pdf', 'imprimir_ticket_pdf', '', 0, 0, 1),
(59, 12, 'ticket_venta', 'ticket_venta', '', 0, 0, 1),
(60, 16, 'Excel Ventas', 'excel_ventas_enviadas', '', 0, 0, 1),
(61, 12, 'Detalle Delivery', 'detalle_delivery', '', 0, 2, 1),
(62, 12, 'Historial Deliverys Entregados', 'historial_delivery_entregados', '', 1, 4, 1),
(63, 12, 'Ticket Venta Delivery', 'ticket_venta_delivery', '', 0, 0, 1),
(64, 16, 'Historia Bajas de Facturas', 'historial_bajas_facturas', '', 1, 6, 1),
(65, 16, 'Generar Nota', 'generar_nota', '', 0, 0, 1),
(66, 22, 'Gestionar Categorias', 'gestionar', '', 1, 0, 1),
(67, 23, 'Periodo Laboral', 'periodolaboral', '', 1, 4, 1),
(68, 23, 'Asistencia de Personal', 'asistencia', '', 1, 5, 1),
(69, 23, 'Convocatoria', 'convocatoria', '', 0, 1, 1),
(70, 23, 'Gestión de Personal', 'gestion_personal', '', 1, 2, 1),
(71, 23, 'Memorandum al Personal', 'memorandum', '', 1, 6, 1),
(72, 23, 'Obligación Laboral', 'obligacion_laboral', '', 0, 7, 1),
(73, 23, 'Listado de Memorandum', 'listar_memo', '', 0, 6, 1),
(74, 23, 'PDF MEMO', 'ver_memo', '', 0, 0, 1),
(75, 23, 'Editar Personal', 'editar_personal', '', 0, 0, 1),
(76, 23, 'Detalle Periodo Laboral', 'detalle_periodo_laboral', '', 0, 0, 1),
(77, 23, 'Agregar Periodo', 'agregar_periodo', '', 0, 0, 1),
(78, 23, 'Adjuntar Documentos', 'adjuntar', '', 0, 0, 1),
(79, 23, 'Gestionar Feriados', 'feriados', '', 0, 0, 1),
(80, 23, 'Proyectar Asistencia', 'proyectar_asistencia', '', 0, 0, 1),
(81, 23, 'Opciones', 'opciones', '', 0, 0, 1),
(82, 23, 'Por Persona', 'por_persona', '', 0, 0, 1),
(83, 23, 'Consultar', 'consultar', '', 0, 0, 1),
(84, 23, 'Asitencia Personal', 'asistencia_personal', '', 0, 0, 1),
(85, 23, 'Constancia de Trabajo', 'constancia_trabajo', '', 0, 0, 1),
(86, 23, 'Vacaciones', 'vacaciones', '', 0, 0, 1),
(87, 23, 'Editar Periodo', 'editar', '', 0, 0, 1),
(88, 23, 'Pendientes de Aprobación', 'aprobar', '', 0, 0, 1),
(89, 23, 'Ver Periodo', 'ver_periodo', '', 0, 0, 1),
(90, 23, 'Aprobar Asistencias', 'aprobar_asistencias', '', 0, 0, 1),
(91, 23, 'Renovar Periodo', 'renovar_periodo', '', 0, 0, 1),
(92, 23, 'guardar', 'guardar_departamento', '', 0, 0, 0),
(93, 10, 'Compra Rapida', 'facturas_sin_oc', '', 1, 7, 1),
(94, 23, 'Asignar Turnos', 'asignar_turnos', '', 0, 0, 1),
(95, 10, 'Ver Facturas', 'ver_facturas', '', 0, 0, 1),
(96, 12, 'Historial Pedido', 'historial_pedidos', '', 1, 2, 1),
(97, 12, 'Detalle Pedido Ver', 'detalle_pedido_ver', '', 0, 0, 1),
(98, 20, 'Tiempo de Atención por Pedido', 'tiempo_promedio_atencion', '', 0, 7, 1),
(99, 20, 'Ventas por Tipo de Pago', 'ventas_tipo_pago', '', 0, 8, 1),
(100, 20, 'Reporte Ventas por Productos', 'reporte_ventas_productos', '', 1, 0, 1),
(101, 23, 'Gestionar Turnos', 'gestionar_turnos', '', 0, 0, 1),
(102, 16, 'Historial Notas Ventas', 'historial_notas_ventas', '', 1, 1, 1),
(103, 16, 'tabla_productos_editar', 'tabla_productos_editar', '', 0, 0, 1),
(104, 16, 'editar_nota_venta', 'editar_nota_venta', '', 0, 0, 1),
(105, 20, 'Reporte Ventas Porductos PDF', 'reporte_ventas_productos_pdf', '', 0, 0, 1),
(106, 20, 'Reporte General', 'reporte_general', '', 1, 0, 1),
(107, 20, 'Reporte General PDF', 'reporte_general_pdf', '', 0, 0, 1),
(108, 20, 'Ventas Tipo Pago PDF', 'ventas_tipo_pago_pdf', '', 0, 8, 1),
(109, 12, 'Historial Pedidos Gratis', 'historial_pedidos_gratis', '', 1, 2, 1),
(110, 12, 'Pedidos Eliminados', 'pedidos_eliminados', '', 1, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra`
--

CREATE TABLE `orden_compra` (
  `id_orden_compra` int(11) NOT NULL,
  `id_solicitante` int(11) NOT NULL,
  `id_aprobacion` int(11) DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_tipo_pago` int(11) DEFAULT NULL,
  `orden_compra_observacion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orden_compra_fecha_aprob` datetime DEFAULT NULL,
  `orden_compra_titulo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `orden_compra_activo` int(11) DEFAULT NULL,
  `orden_compra_numero` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `orden_compra_estado` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `orden_compra_fecha` datetime NOT NULL,
  `orden_compra_tipo_doc` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orden_compra_numero_doc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orden_compra_doc_adjuntado` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orden_compra_fecha_emision_doc` date DEFAULT NULL,
  `orden_compra_doc_cuotas` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orden_compra_fecha_recibida` datetime DEFAULT NULL,
  `orden_compra_usuario_recibido` int(11) NOT NULL,
  `orden_compra_codigo` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_gratis`
--

CREATE TABLE `pedidos_gratis` (
  `id_pedido_gratis` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `pedido_gratis_numero` varchar(200) DEFAULT NULL,
  `pedido_gratis_nombre` varchar(20) DEFAULT NULL,
  `pedido_gratis_direccion` varchar(500) DEFAULT NULL,
  `pedido_gratis_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `pedido_gratis_observacion` varchar(500) DEFAULT NULL,
  `pedido_gratis_datetime` datetime DEFAULT NULL,
  `pedido_gratis_codigo` varchar(100) DEFAULT NULL,
  `pedido_gratis_estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos_gratis`
--

INSERT INTO `pedidos_gratis` (`id_pedido_gratis`, `id_mesa`, `id_usuario`, `pedido_gratis_numero`, `pedido_gratis_nombre`, `pedido_gratis_direccion`, `pedido_gratis_total`, `pedido_gratis_observacion`, `pedido_gratis_datetime`, `pedido_gratis_codigo`, `pedido_gratis_estado`) VALUES
(1, 0, 6, '71645655', 'JOSE LUIS MARCELO CH', 'Calle Rómulo espinar 602 entre tavara y Pablo rossel', '72.00', NULL, '2021-09-17 12:59:47', '1631901587.4407', 1),
(2, 8, 6, '11111111', 'ANONIMO', '', '84.00', NULL, '2021-10-09 15:11:52', '1633810312.6681', 1),
(3, 0, 6, '11111111', 'ANONIMO', 'Calle S/n', '100.00', NULL, '2021-10-10 12:25:18', '1633886718.4306', 1),
(4, 12, 6, '11111111', 'ANONIMO', '', '84.00', NULL, '2021-10-11 13:22:49', '1633976569.4422', 1),
(5, 6, 14, '11111111', 'ANONIMO', '', '10.00', NULL, '2021-10-29 19:58:04', '1635555484.0206', 1),
(6, 7, 2, '11111111', 'ANONIMO', '', '9.00', NULL, '2021-10-29 22:17:24', '1635563844.738', 1),
(7, 6, 2, '11111111', 'ANONIMO', '', '8.00', NULL, '2021-10-29 22:50:05', '1635565805.7528', 1),
(8, 11, 2, '11111111', 'ANONIMO', '', '12.00', NULL, '2021-10-29 23:29:33', '1635568173.9465', 1),
(9, 13, 2, '11111111', 'ANONIMO', '', '35.00', NULL, '2021-10-29 23:52:53', '1635569573.3366', 1),
(10, 7, 2, '11111111', 'ANONIMO', '', '134.00', NULL, '2021-10-31 02:39:23', '1635665963.2349', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_gratis_detalles`
--

CREATE TABLE `pedidos_gratis_detalles` (
  `id_pedido_gratis_detalle` int(11) NOT NULL,
  `id_pedido_gratis` int(11) NOT NULL,
  `id_comanda_detalle` int(11) NOT NULL,
  `id_pedido_gratis_detalle_estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos_gratis_detalles`
--

INSERT INTO `pedidos_gratis_detalles` (`id_pedido_gratis_detalle`, `id_pedido_gratis`, `id_comanda_detalle`, `id_pedido_gratis_detalle_estado`) VALUES
(1, 1, 2584, 1),
(2, 1, 2585, 1),
(3, 1, 2586, 1),
(4, 1, 2587, 1),
(5, 1, 2588, 1),
(6, 2, 4302, 1),
(7, 3, 4361, 1),
(8, 4, 4505, 1),
(9, 5, 4837, 1),
(10, 6, 4869, 1),
(11, 7, 4885, 1),
(12, 8, 4892, 1),
(13, 9, 4843, 1),
(14, 10, 5074, 1),
(15, 10, 5075, 1),
(16, 10, 5076, 1),
(17, 10, 5077, 1),
(18, 10, 5078, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_laboral`
--

CREATE TABLE `periodo_laboral` (
  `id_periodo` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `periodo_fechainicio` date NOT NULL,
  `periodo_fechafin` date NOT NULL,
  `periodo_fechafirma` date DEFAULT NULL,
  `periodo_sueldo` decimal(11,2) NOT NULL,
  `periodo_movilidad` decimal(11,2) DEFAULT NULL,
  `periodo_total` decimal(11,2) NOT NULL,
  `periodo_observa` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodo_estado` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `periodo_contrato` tinyint(1) DEFAULT NULL,
  `periodo_nro_contrato` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user_creacion` int(11) DEFAULT NULL,
  `id_user_aprobacion` int(11) DEFAULT NULL,
  `periodo_fecha_creacion` date DEFAULT NULL,
  `periodo_hora_creacion` time DEFAULT NULL,
  `periodo_bono` float(10,2) DEFAULT NULL,
  `perioido_ruc_centro_estudio` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodo_nombre_centro_estudio` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodo_domicilio_centro_estudio` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodo_dni_representante` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodo_nombre_representante` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodo_ciclo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodo_especialidad` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `permiso_accion` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permiso_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `id_opcion`, `permiso_accion`, `permiso_estado`) VALUES
(1, 1, 'validar_sesion', 1),
(2, 4, 'guardar_menu', 1),
(3, 6, 'configurar_relacion', 1),
(4, 7, 'guardar_opcion', 1),
(5, 7, 'agregar_permiso', 1),
(6, 7, 'eliminar_permiso', 1),
(7, 7, 'configurar_acceso', 1),
(8, 9, 'guardar_rol', 1),
(9, 10, 'gestionar_acceso_rol', 1),
(10, 12, 'guardar_nuevo_usuario', 1),
(11, 12, 'guardar_edicion_usuario', 1),
(12, 12, 'guardar_edicion_persona', 1),
(13, 12, 'restablecer_contrasenha', 1),
(14, 13, 'guardar_datos', 1),
(15, 14, 'guardar_usuario', 1),
(16, 15, 'guardar_contrasenha', 1),
(17, 16, 'guardar_negocio', 1),
(18, 16, 'editar_negocio', 1),
(19, 17, 'guardar_sucursal', 1),
(20, 17, 'editar_sucursal', 1),
(21, 18, 'guardar_usuario_sucursal', 1),
(22, 19, 'guardar_usuario_negocio', 1),
(23, 16, 'cambiar_estado_negocio', 1),
(24, 17, 'cambiar_estado_sucursal', 1),
(25, 19, 'cambiar_estado_usuario_negocio', 1),
(27, 18, 'cambiar_estado_usuariosucursal', 1),
(28, 20, 'guardar_categoria', 1),
(29, 21, 'guardar_recursos', 1),
(30, 21, 'listar_categoria_por_id', 1),
(31, 22, 'guardar_nuevo_proveedor', 1),
(32, 22, 'guardar_edicion_proveedor', 1),
(33, 22, 'eliminar_proveedor', 1),
(34, 23, 'listar_recursos_x_sucursal', 1),
(35, 23, 'guardar_orden', 1),
(36, 27, 'editar_orden', 1),
(37, 26, 'aprobar_orden', 1),
(38, 24, 'eliminar_orden', 1),
(39, 21, 'cambiar_estado_recurso', 1),
(40, 20, 'cambiar_estado_categoria', 1),
(41, 28, 'actualizar_recepcion', 1),
(42, 29, 'guardar_producto', 1),
(43, 29, 'editar_producto', 1),
(44, 29, 'listar_precios', 1),
(45, 29, 'agregar_nuevo_precio', 1),
(46, 29, 'cambiar_estado_producto', 1),
(47, 31, 'guardar_nuevo_mesa', 1),
(48, 31, 'guardar_edicion_mesa', 1),
(49, 31, 'eliminar_mesa', 1),
(50, 31, 'listar_negocio_por_id', 1),
(51, 32, 'guardar_nuevo_almacen', 1),
(52, 32, 'guardar_edicion_almacen', 1),
(53, 32, 'eliminar_almacen', 1),
(54, 32, 'listar_negocio_por_id', 1),
(55, 30, 'listar_precio_producto', 1),
(56, 33, 'guardar_comanda', 1),
(57, 35, 'cambiar_estado_pedido', 1),
(58, 33, 'ver_productos', 1),
(60, 37, 'guardar_edicion_receta', 1),
(61, 37, 'eliminar_receta', 1),
(62, 38, 'guardar_nuevo_detalle_receta', 1),
(63, 38, 'guardar_edicion_detalle_receta', 1),
(64, 38, 'eliminar_detalle_receta', 1),
(65, 37, 'guardar_nuevo_receta', 1),
(67, 41, 'guardar_cliente', 1),
(68, 41, 'guardar_edicion_cliente', 1),
(69, 41, 'eliminar_cliente', 1),
(70, 40, 'guardar_venta', 1),
(71, 38, 'listar_unidad_precio', 1),
(72, 21, 'jalar_categorias', 1),
(73, 40, 'ver_productos_nuevo', 1),
(74, 40, 'guardar_comanda_nuevo', 1),
(75, 40, 'eliminar_comanda_detalle', 1),
(76, 40, 'cambiar_mesa', 1),
(77, 40, 'buscar_cliente', 1),
(78, 31, 'listar_negocio_por_id_editar', 1),
(79, 40, 'cambiar_cantidad_personas', 1),
(80, 42, 'jalar_recursos', 1),
(81, 42, 'guardar_nueva_conversion', 1),
(82, 38, 'jalar_valor_preparacion', 1),
(83, 38, 'guardar_sub_receta', 1),
(84, 43, 'guardar_egresos', 1),
(85, 43, 'eliminar_egreso', 1),
(86, 43, 'editar_egresos', 1),
(87, 45, 'guardar_insumos', 1),
(88, 45, 'editar_insumos', 1),
(89, 30, 'consultar_serie', 1),
(90, 46, 'guardar_delivery', 1),
(91, 39, 'crear_xml_enviar_sunat', 1),
(92, 53, 'crear_enviar_resumen_sunat', 1),
(93, 40, 'ticket_venta', 1),
(94, 40, 'ticket_pedido', 1),
(95, 34, 'agregar_grupo', 1),
(96, 46, 'buscar_cliente_delivery', 1),
(97, 61, 'buscar_cliente_delivery_pagos', 1),
(98, 52, 'comunicacion_baja', 1),
(99, 39, 'anular_boleta_cambiarestado', 1),
(100, 41, 'guardar_cliente_nuevo', 1),
(101, 48, 'eliminar_comanda_delivery', 1),
(102, 65, 'tipo_nota_descripcion', 1),
(103, 65, 'consultar_serie', 1),
(104, 65, 'guardar_nota', 1),
(105, 52, 'consultar_comprobante', 1),
(106, 41, 'obtener_datos_x_dni', 1),
(107, 41, 'obtener_datos_x_ruc', 1),
(108, 66, 'guardar_categoria', 1),
(109, 66, 'editar_categoria', 1),
(110, 66, 'eliminar_categoria', 1),
(111, 21, 'editar_stock_minimo', 1),
(112, 22, 'obtener_datos_x_dni', 1),
(113, 22, 'obtener_datos_x_ruc', 1),
(114, 42, 'eliminar_conversion', 1),
(115, 38, 'eliminar_sub_receta', 1),
(116, 71, 'guardar_memo', 1),
(117, 73, 'editar_memo', 1),
(118, 73, 'aprobar_memo', 1),
(120, 73, 'eliminar_memo', 1),
(121, 70, 'guardar_personal', 1),
(122, 70, 'eliminar_personal', 1),
(123, 77, 'guardar_periodo', 1),
(124, 78, 'guardar_archivo', 1),
(125, 78, 'eliminar_documento', 1),
(126, 79, 'eliminar_feriado', 1),
(127, 79, 'agregar_feriado', 1),
(128, 80, 'guardar_asistencia_proyectada', 1),
(129, 80, 'registrar_asistencia_proyectad', 1),
(130, 76, 'aprobar_periodo', 1),
(131, 84, 'aprobar_asistencia', 1),
(132, 84, 'guardar_asistencia', 1),
(133, 84, 'registrar_asistencia', 1),
(134, 89, 'generar_contrato', 1),
(135, 76, 'eliminar_periodo', 1),
(137, 12, 'guardar_departamento', 1),
(138, 12, 'eliminar_departamento', 1),
(139, 12, 'eliminar_cargo', 1),
(140, 12, 'guardar_cargo', 1),
(141, 94, 'guardar_turno', 1),
(142, 90, 'guardar_horas', 1),
(143, 93, 'guardar_compra_rapida', 1),
(144, 2, 'guardar_apertura_caja', 1),
(145, 29, 'consultar_datos', 1),
(146, 101, 'agregar_turnos', 1),
(147, 101, 'agregar_turnos_editado', 1),
(148, 84, 'registrar_salida', 1),
(149, 30, 'habilitar_mesa', 1),
(150, 29, 'eliminar_familia', 1),
(151, 29, 'guardar_familia', 1),
(152, 104, 'addproduct', 1),
(153, 104, 'eliminar_producto', 1),
(154, 104, 'search_by_barcode', 1),
(155, 104, 'consultar_serie', 1),
(156, 104, 'tipo_nota_descripcion', 1),
(157, 104, 'ticket_electronico', 1),
(158, 104, 'editar_cantidad_tabla', 1),
(159, 104, 'guardar_venta_market', 1),
(160, 40, 'ticket_comanda', 1),
(161, 40, 'cambiar_comanda_detalle_cantid', 1),
(162, 30, 'guardar_reserva', 1),
(163, 30, 'habilitar_reserva', 1),
(164, 30, 'eliminar_reserva', 1),
(165, 55, 'consultar_ticket_resumen', 1),
(166, 2, 'guardar_cierre_caja', 1),
(167, 29, 'sumar_stock_nuevo', 1),
(168, 106, 'ticket_reporte', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `persona_nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `persona_apellido_paterno` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `persona_apellido_materno` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_tipo_documento` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_dni` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `persona_nacionalidad` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_estado_civil` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_direccion` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_discapacidad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_job` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_nacimiento` date DEFAULT NULL,
  `persona_sexo` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_telefono` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_telefono_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_foto` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_hijos` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_departamento` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_provincia` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_distrito` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_adicional` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_afp` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_cuspp` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_afiliac` date DEFAULT NULL,
  `persona_blacklist` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_bank` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_number_account` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_bank_alt` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `persona_number_account_alt` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_bank_cts` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_account_cts` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_cv` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_empleado` tinyint(1) DEFAULT NULL,
  `persona_creacion` datetime NOT NULL,
  `persona_modificacion` datetime NOT NULL,
  `person_codigo` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `persona_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `id_empresa`, `persona_nombre`, `persona_apellido_paterno`, `persona_apellido_materno`, `persona_email`, `persona_tipo_documento`, `persona_dni`, `persona_nacionalidad`, `persona_estado_civil`, `persona_direccion`, `persona_discapacidad`, `persona_job`, `persona_nacimiento`, `persona_sexo`, `persona_telefono`, `persona_telefono_2`, `persona_foto`, `persona_hijos`, `persona_departamento`, `persona_provincia`, `persona_distrito`, `persona_adicional`, `persona_afp`, `persona_cuspp`, `persona_afiliac`, `persona_blacklist`, `persona_bank`, `persona_number_account`, `persona_bank_alt`, `persona_number_account_alt`, `persona_bank_cts`, `persona_account_cts`, `persona_cv`, `persona_empleado`, `persona_creacion`, `persona_modificacion`, `person_codigo`, `persona_estado`) VALUES
(1, 1, 'César José', 'Ruiz', 'Reategui', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, 0, '2020-09-17 00:00:00', '2020-09-17 00:00:00', '010101010101', 1),
(2, 1, 'Erick', 'Gaya', 'Camiñas', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1996-04-13', NULL, '999075099', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, 1, '2020-10-27 18:29:10', '2021-10-27 13:23:32', '1603841350.1786', 1),
(12, 0, 'Gerry', 'Ramirez', 'Paredes', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-10-27 13:36:05', '2021-10-27 13:36:05', '1635359765.8072', 0),
(13, 0, 'Luis', 'Mogollon', 'Calvo', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1993-06-17', NULL, '954695143', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-10-27 13:48:36', '2021-10-28 17:43:26', '1635360516.2944', 0),
(14, 0, 'Julissa', 'Ramirez', 'Paredes', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-10-27 13:54:09', '2021-10-27 13:54:09', '1635360849.2822', 0),
(15, 0, 'Abel', 'Rios', 'Camiñas', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2021-11-16 11:03:59', '2021-11-16 11:03:59', '1637078639.5807', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_turno`
--

CREATE TABLE `persona_turno` (
  `id_persona_turno` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `persona_turno_fecha_registro` datetime NOT NULL,
  `persona_estado_turno` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto_familia` int(11) NOT NULL,
  `producto_nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `producto_codigo_barra` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producto_descripcion` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `producto_foto` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producto_estado` tinyint(1) NOT NULL,
  `producto_fecha_registro` datetime NOT NULL,
  `producto_codigo` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `id_receta`, `id_grupo`, `id_usuario`, `id_producto_familia`, `producto_nombre`, `producto_codigo_barra`, `producto_descripcion`, `producto_foto`, `producto_estado`, `producto_fecha_registro`, `producto_codigo`) VALUES
(1, 1, 1, 2, 1, 'Alitas BBQ + papas fritas + ensalada + chaufa', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '1'),
(2, 2, 1, 2, 1, 'Alitas BBQ + papas fritas + ensalada', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '2'),
(3, 3, 1, 2, 1, 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '3'),
(4, 4, 1, 2, 1, 'Alitas Acevichadas + papas fritas + ensalada', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '4'),
(5, 5, 1, 2, 1, 'Alitas Picantes + papas fritas + ensalada + chaufa', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '5'),
(6, 6, 1, 2, 1, 'Alitas Picantes + papas fritas + ensalada', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '6'),
(7, 7, 1, 2, 1, 'Alitas Crispy + papas fritas + ensalada + chaufa', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '7'),
(8, 8, 1, 2, 1, 'Alitas Crispy + papas fritas + ensalada', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '8'),
(9, 9, 1, 2, 1, 'Alitas Bufalo + papas fritas + ensalada + chaufa', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '9'),
(10, 10, 1, 2, 1, 'Alitas Bufalo + papas fritas + ensalada', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '10'),
(11, 11, 1, 2, 2, 'Pechuga de Pollo + papas + ensalada + chaufa', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '11'),
(12, 12, 1, 2, 2, 'Pechuga de Pollo + papas + ensalada', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '12'),
(13, 13, 1, 2, 2, 'Brochetas + papas + ensalada + chaufa', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '13'),
(14, 14, 1, 2, 2, 'Brochetas + papas + ensalada', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '14'),
(15, 15, 1, 2, 2, 'Anticucho + papas + ensalada + chaufa', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '15'),
(16, 16, 1, 2, 2, 'Anticucho + papas + ensalada', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '16'),
(17, 17, 1, 2, 3, 'Salchichapa Clasica', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '17'),
(18, 18, 1, 2, 3, 'Salchichapa Mixta', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '18'),
(19, 19, 1, 2, 3, 'Salchichapa Regional', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '19'),
(20, 20, 1, 2, 3, 'Salchipapa Balconcito', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '20'),
(21, 21, 1, 2, 4, 'Ceviche Simple', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '21'),
(22, 22, 1, 2, 4, 'Ceviche + Chicharron', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '22'),
(23, 23, 1, 2, 4, 'Trio Balconcito', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '23'),
(24, 24, 1, 2, 5, 'Chaufa Regional', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '24'),
(25, 25, 1, 2, 5, 'Chaufa de Pollo', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '25'),
(26, 26, 1, 2, 6, 'Tequeños (6 und)', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '26'),
(27, 27, 1, 2, 6, 'Tequeños (12 und)', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '27'),
(28, 28, 1, 2, 6, 'Tequeños Regionales (6 und)', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '28'),
(29, 29, 1, 2, 6, 'Tequeños Regionales (12 und)', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '29'),
(30, 30, 1, 2, 6, 'Piqueo Regional', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '30'),
(31, 31, 1, 2, 6, 'Ronda de Alitas Balconcito', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '31'),
(32, 32, 1, 2, 7, 'Chicken Fried Chicken', 'Null', 'Pechuga de pollo empanizada y bañada en salsa Gravy. Servido con pure de papa y choclo con mantequilla al ajo.', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '32'),
(33, 33, 1, 2, 7, 'Nuevo-BBQ CHICKEN SALAD', 'Null', 'Pechuga de pollo a la parrilla y bañada en salsa BBQ. Servido sobre una base de lechuga, tomate, queso, vinagreta y choclo con mantequilla al ajo.', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '33'),
(34, 34, 1, 2, 7, 'Chicken Fried Chicken SALAD', 'Null', 'Pechuga de pollo ahumada a la parrilla. Servida con pure de papa y una base de lechuga, tomate, queso, vinagreta', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '34'),
(35, 35, 1, 2, 8, 'Porcion de Chaufa', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '35'),
(36, 36, 1, 2, 8, 'Papas fritas', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '36'),
(37, 37, 1, 2, 8, 'Patacones', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '37'),
(38, 38, 1, 2, 8, 'Maduro', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '38'),
(39, 39, 1, 2, 9, 'Jarra de Refresco', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '39'),
(40, 40, 1, 2, 9, '1/2 Jarra', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '40'),
(41, 41, 1, 2, 9, 'Vaso de Refresco', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '41'),
(42, 42, 1, 2, 9, 'Agua', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '42'),
(43, 43, 1, 2, 9, 'Gaseosa Inca Kola de 500ml', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '43'),
(44, 44, 1, 2, 9, 'Gaseosa Coca Cola de 500ml', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '44'),
(45, 45, 1, 2, 9, 'Gaseosa Inca Kola de 1.5L', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '45'),
(46, 46, 1, 2, 9, 'Gaseosa Coca Cola de 1.5L', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '46'),
(47, 47, 1, 2, 9, 'Gaseosa Inca Kola de 2.5L', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '47'),
(48, 48, 1, 2, 9, 'Gaseosa Coca Cola de 2.5L', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '48'),
(49, 49, 1, 2, 10, 'Cristal 650ml', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '49'),
(50, 50, 1, 2, 10, 'Cusqueña Trigo 620ml', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '50'),
(51, 51, 1, 2, 10, 'Cusqueña Malta 620ml', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '51'),
(52, 52, 1, 2, 10, 'Corona', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '52'),
(53, 53, 1, 2, 10, 'Stella Artois', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '53'),
(54, 54, 1, 2, 10, 'Heineken ', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '54'),
(55, 55, 1, 2, 10, 'Cusqueña Trigo', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '55'),
(56, 56, 1, 2, 10, 'Cusqueña Malta', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '56'),
(57, 57, 1, 2, 11, 'Barril de Heineken ', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '57'),
(58, 58, 1, 2, 11, 'Balde de Stella Artois ', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '58'),
(59, 59, 1, 2, 11, 'Balde de Heineken', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '59'),
(60, 60, 1, 2, 11, 'Balde de Corona', 'Null', 'Ninguna', 'media/producto/default.png', 1, '2021-10-26 18:30:26', '60'),
(132, 204, 1, 1, 11, 'Combo para 1 (Alitas a elegir + 1 corona)', NULL, '', 'media/producto/default.png', 1, '2021-11-04 16:18:33', '1636060713.1378'),
(133, 205, 1, 1, 11, 'Combo para 2 (2 salchipapas clasicas + tequeños 6 und + 2 Stellas)', NULL, '', 'media/producto/default.png', 1, '2021-11-04 16:21:59', '1636060919.6362'),
(134, 206, 1, 1, 11, 'Combo Balconcito (Ronda de Alitas + Balde de Corona)', NULL, '', 'media/producto/default.png', 1, '2021-11-04 16:23:41', '1636061021.3785');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_familia`
--

CREATE TABLE `producto_familia` (
  `id_producto_familia` int(11) NOT NULL,
  `producto_familia_nombre` varchar(200) NOT NULL,
  `producto_familia_fecha_registro` datetime NOT NULL,
  `producto_familia_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_familia`
--

INSERT INTO `producto_familia` (`id_producto_familia`, `producto_familia_nombre`, `producto_familia_fecha_registro`, `producto_familia_estado`) VALUES
(1, 'ALITAS', '2021-10-26 18:08:20', 1),
(2, 'A LA PLANCHA', '2021-10-26 18:08:43', 1),
(3, 'SALCHIPAPAS', '2021-10-26 18:09:28', 1),
(4, 'CEVICHES', '2021-10-26 18:09:40', 1),
(5, 'ARROCES', '2021-10-26 18:09:49', 1),
(6, 'PIQUEOS', '2021-10-26 18:09:56', 1),
(7, 'ESPECIALES', '2021-10-26 18:10:42', 1),
(8, 'GUARNICIONES', '2021-10-26 18:10:52', 1),
(9, 'BEBIDAS', '2021-10-26 18:11:01', 1),
(10, 'CERVEZAS', '2021-10-26 18:12:21', 1),
(11, 'COMBOS', '2021-10-26 18:12:33', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_precio`
--

CREATE TABLE `producto_precio` (
  `id_producto_precio` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_unidad_medida` int(11) NOT NULL,
  `producto_precio_codigoafectacion` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '20',
  `producto_precio_venta` decimal(10,2) NOT NULL,
  `producto_precio_fecha_registro` datetime NOT NULL,
  `producto_precio_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto_precio`
--

INSERT INTO `producto_precio` (`id_producto_precio`, `id_producto`, `id_unidad_medida`, `producto_precio_codigoafectacion`, `producto_precio_venta`, `producto_precio_fecha_registro`, `producto_precio_estado`) VALUES
(1, 1, 58, '20', '19.00', '2021-10-26 18:30:26', 0),
(2, 2, 58, '20', '15.00', '2021-10-26 18:30:26', 0),
(3, 3, 58, '20', '19.00', '2021-10-26 18:30:26', 0),
(4, 4, 58, '20', '15.00', '2021-10-26 18:30:26', 0),
(5, 5, 58, '20', '19.00', '2021-10-26 18:30:26', 0),
(6, 6, 58, '20', '15.00', '2021-10-26 18:30:26', 0),
(7, 7, 58, '20', '19.00', '2021-10-26 18:30:26', 0),
(8, 8, 58, '20', '15.00', '2021-10-26 18:30:26', 0),
(9, 9, 58, '20', '19.00', '2021-10-26 18:30:26', 0),
(10, 10, 58, '20', '15.00', '2021-10-26 18:30:26', 0),
(11, 11, 58, '20', '19.00', '2021-10-26 18:30:26', 0),
(12, 12, 58, '20', '15.00', '2021-10-26 18:30:26', 0),
(13, 13, 58, '20', '19.00', '2021-10-26 18:30:26', 0),
(14, 14, 58, '20', '15.00', '2021-10-26 18:30:26', 0),
(15, 15, 58, '20', '19.00', '2021-10-26 18:30:26', 0),
(16, 16, 58, '20', '15.00', '2021-10-26 18:30:26', 0),
(17, 17, 58, '20', '12.00', '2021-10-26 18:30:26', 1),
(18, 18, 58, '20', '14.00', '2021-10-26 18:30:26', 1),
(19, 19, 58, '20', '15.00', '2021-10-26 18:30:26', 1),
(20, 20, 58, '20', '16.00', '2021-10-26 18:30:26', 1),
(21, 21, 58, '20', '20.00', '2021-10-26 18:30:26', 0),
(22, 22, 58, '20', '25.00', '2021-10-26 18:30:26', 0),
(23, 23, 58, '20', '30.00', '2021-10-26 18:30:26', 0),
(24, 24, 58, '20', '20.00', '2021-10-26 18:30:26', 1),
(25, 25, 58, '20', '15.00', '2021-10-26 18:30:26', 1),
(26, 26, 58, '20', '9.00', '2021-10-26 18:30:26', 0),
(27, 27, 58, '20', '15.00', '2021-10-26 18:30:26', 0),
(28, 28, 58, '20', '11.00', '2021-10-26 18:30:26', 0),
(29, 29, 58, '20', '16.00', '2021-10-26 18:30:26', 0),
(30, 30, 58, '20', '35.00', '2021-10-26 18:30:26', 1),
(31, 31, 58, '20', '35.00', '2021-10-26 18:30:26', 1),
(32, 32, 58, '20', '25.00', '2021-10-26 18:30:26', 1),
(33, 33, 58, '20', '25.00', '2021-10-26 18:30:26', 1),
(34, 34, 58, '20', '25.00', '2021-10-26 18:30:26', 1),
(35, 35, 58, '20', '6.00', '2021-10-26 18:30:26', 1),
(36, 36, 58, '20', '4.00', '2021-10-26 18:30:26', 1),
(37, 37, 58, '20', '4.00', '2021-10-26 18:30:26', 1),
(38, 38, 58, '20', '4.00', '2021-10-26 18:30:26', 1),
(39, 39, 58, '20', '10.00', '2021-10-26 18:30:26', 1),
(40, 40, 58, '20', '5.00', '2021-10-26 18:30:26', 1),
(41, 41, 58, '20', '2.50', '2021-10-26 18:30:26', 0),
(42, 42, 58, '20', '3.00', '2021-10-26 18:30:26', 1),
(43, 43, 58, '20', '3.00', '2021-10-26 18:30:26', 1),
(44, 44, 58, '20', '3.00', '2021-10-26 18:30:26', 1),
(45, 45, 58, '20', '10.00', '2021-10-26 18:30:26', 1),
(46, 46, 58, '20', '10.00', '2021-10-26 18:30:26', 1),
(47, 47, 58, '20', '13.00', '2021-10-26 18:30:26', 1),
(48, 48, 58, '20', '13.00', '2021-10-26 18:30:26', 1),
(49, 49, 58, '20', '8.00', '2021-10-26 18:30:26', 0),
(50, 50, 58, '20', '9.00', '2021-10-26 18:30:26', 0),
(51, 51, 58, '20', '9.00', '2021-10-26 18:30:26', 0),
(52, 52, 58, '20', '7.00', '2021-10-26 18:30:26', 0),
(53, 53, 58, '20', '7.00', '2021-10-26 18:30:26', 0),
(54, 54, 58, '20', '7.00', '2021-10-26 18:30:26', 0),
(55, 55, 58, '20', '6.00', '2021-10-26 18:30:26', 0),
(56, 56, 58, '20', '6.00', '2021-10-26 18:30:26', 0),
(57, 57, 58, '20', '95.00', '2021-10-26 18:30:26', 0),
(58, 58, 58, '20', '40.00', '2021-10-26 18:30:26', 0),
(59, 59, 58, '20', '40.00', '2021-10-26 18:30:26', 0),
(60, 60, 58, '20', '40.00', '2021-10-26 18:30:26', 0),
(205, 2, 58, '20', '17.00', '2021-10-28 13:21:08', 1),
(206, 1, 58, '20', '21.00', '2021-10-28 13:21:17', 1),
(207, 3, 58, '20', '21.00', '2021-10-28 13:21:27', 1),
(208, 4, 58, '20', '17.00', '2021-10-28 13:21:36', 1),
(209, 5, 58, '20', '21.00', '2021-10-28 13:21:53', 1),
(210, 6, 58, '20', '17.00', '2021-10-28 13:22:03', 1),
(211, 7, 58, '20', '21.00', '2021-10-28 13:22:12', 1),
(212, 8, 58, '20', '17.00', '2021-10-28 13:22:21', 1),
(213, 10, 58, '20', '17.00', '2021-10-28 13:22:51', 1),
(214, 9, 58, '20', '21.00', '2021-10-28 13:23:04', 1),
(215, 11, 58, '20', '20.00', '2021-10-28 13:24:27', 1),
(216, 12, 58, '20', '16.00', '2021-10-28 13:24:38', 1),
(217, 13, 58, '20', '20.00', '2021-10-28 13:25:00', 1),
(218, 14, 58, '20', '16.00', '2021-10-28 13:25:11', 1),
(219, 15, 58, '20', '20.00', '2021-10-28 13:25:21', 1),
(220, 16, 58, '20', '16.00', '2021-10-28 13:25:32', 1),
(221, 21, 58, '20', '21.00', '2021-10-28 13:26:13', 1),
(222, 22, 58, '20', '26.00', '2021-10-28 13:26:24', 1),
(223, 23, 58, '20', '32.00', '2021-10-28 13:26:32', 1),
(224, 26, 58, '20', '10.00', '2021-10-28 13:27:15', 1),
(225, 27, 58, '20', '16.00', '2021-10-28 13:27:26', 1),
(226, 28, 58, '20', '12.00', '2021-10-28 13:27:38', 1),
(227, 29, 58, '20', '18.00', '2021-10-28 13:27:49', 1),
(228, 41, 58, '20', '3.00', '2021-10-28 13:29:17', 1),
(229, 50, 58, '20', '10.00', '2021-10-28 13:30:03', 1),
(230, 51, 58, '20', '10.00', '2021-10-28 13:30:18', 1),
(231, 52, 58, '20', '8.00', '2021-10-28 13:30:29', 1),
(232, 53, 58, '20', '8.00', '2021-10-28 13:30:42', 1),
(233, 54, 58, '20', '8.00', '2021-10-28 13:30:51', 1),
(234, 55, 58, '20', '7.00', '2021-10-28 13:31:09', 1),
(235, 56, 58, '20', '7.00', '2021-10-28 13:31:18', 1),
(236, 57, 58, '20', '105.00', '2021-10-28 13:31:46', 1),
(237, 58, 58, '20', '45.00', '2021-10-28 13:31:55', 1),
(238, 59, 58, '20', '45.00', '2021-10-28 13:32:05', 1),
(239, 60, 58, '20', '45.00', '2021-10-28 13:32:16', 1),
(240, 49, 58, '20', '9.00', '2021-10-30 16:59:30', 0),
(241, 49, 58, '20', '8.00', '2021-11-03 20:40:09', 1),
(242, 132, 59, '20', '22.00', '2021-11-04 16:18:33', 1),
(243, 133, 59, '20', '44.00', '2021-11-04 16:21:59', 1),
(244, 134, 59, '20', '70.00', '2021-11-04 16:23:41', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `id_tipodocumento` int(11) NOT NULL,
  `proveedor_nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proveedor_ruc` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proveedor_direccion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proveedor_nombre_contacto` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proveedor_cargo_persona` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proveedor_numero` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proveedor_estado` int(4) NOT NULL,
  `proveedor_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `receta_nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receta_fecha` datetime NOT NULL,
  `receta_estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id_receta`, `id_usuario`, `receta_nombre`, `receta_fecha`, `receta_estado`) VALUES
(1, 2, 'Alitas BBQ + papas fritas + ensalada + chaufa', '2021-10-26 18:30:26', 1),
(2, 2, 'Alitas BBQ + papas fritas + ensalada', '2021-10-26 18:30:26', 1),
(3, 2, 'Alitas Acevichadas + papas fritas + ensalada + chaufa', '2021-10-26 18:30:26', 1),
(4, 2, 'Alitas Acevichadas + papas fritas + ensalada', '2021-10-26 18:30:26', 1),
(5, 2, 'Alitas Picantes + papas fritas + ensalada + chaufa', '2021-10-26 18:30:26', 1),
(6, 2, 'Alitas Picantes + papas fritas + ensalada', '2021-10-26 18:30:26', 1),
(7, 2, 'Alitas Crispy + papas fritas + ensalada + chaufa', '2021-10-26 18:30:26', 1),
(8, 2, 'Alitas Crispy + papas fritas + ensalada', '2021-10-26 18:30:26', 1),
(9, 2, 'Alitas Bufalo + papas fritas + ensalada + chaufa', '2021-10-26 18:30:26', 1),
(10, 2, 'Alitas Bufalo + papas fritas + ensalada', '2021-10-26 18:30:26', 1),
(11, 2, 'Pechuga de Pollo + papas + ensalada + chaufa', '2021-10-26 18:30:26', 1),
(12, 2, 'Pechuga de Pollo + papas + ensalada', '2021-10-26 18:30:26', 1),
(13, 2, 'Brochetas + papas + ensalada + chaufa', '2021-10-26 18:30:26', 1),
(14, 2, 'Brochetas + papas + ensalada', '2021-10-26 18:30:26', 1),
(15, 2, 'Anticucho + papas + ensalada + chaufa', '2021-10-26 18:30:26', 1),
(16, 2, 'Anticucho + papas + ensalada', '2021-10-26 18:30:26', 1),
(17, 2, 'Salchichapa Clasica', '2021-10-26 18:30:26', 1),
(18, 2, 'Salchichapa Mixta', '2021-10-26 18:30:26', 1),
(19, 2, 'Salchichapa Regional', '2021-10-26 18:30:26', 1),
(20, 2, 'Salchipapa Balconcito', '2021-10-26 18:30:26', 1),
(21, 2, 'Ceviche Simple', '2021-10-26 18:30:26', 1),
(22, 2, 'Ceviche + Chicharron', '2021-10-26 18:30:26', 1),
(23, 2, 'Trio Balconcito', '2021-10-26 18:30:26', 1),
(24, 2, 'Chaufa Regional', '2021-10-26 18:30:26', 1),
(25, 2, 'Chaufa de Pollo', '2021-10-26 18:30:26', 1),
(26, 2, 'Tequeños (6 und)', '2021-10-26 18:30:26', 1),
(27, 2, 'Tequeños (12 und)', '2021-10-26 18:30:26', 1),
(28, 2, 'Tequeños Regionales (6 und)', '2021-10-26 18:30:26', 1),
(29, 2, 'Tequeños Regionales (12 und)', '2021-10-26 18:30:26', 1),
(30, 2, 'Piqueo Regional', '2021-10-26 18:30:26', 1),
(31, 2, 'Ronda de Alitas Balconcito', '2021-10-26 18:30:26', 1),
(32, 2, 'Chicken Fried Chicken', '2021-10-26 18:30:26', 1),
(33, 2, 'Nuevo-BBQ CHICKEN SALAD', '2021-10-26 18:30:26', 1),
(34, 2, 'Chicken Fried Chicken SALAD', '2021-10-26 18:30:26', 1),
(35, 2, 'Porcion de Chaufa', '2021-10-26 18:30:26', 1),
(36, 2, 'Papas fritas', '2021-10-26 18:30:26', 1),
(37, 2, 'Patacones', '2021-10-26 18:30:26', 1),
(38, 2, 'Maduro', '2021-10-26 18:30:26', 1),
(39, 2, 'Jarra de Refresco', '2021-10-26 18:30:26', 1),
(40, 2, '1/2 Jarra', '2021-10-26 18:30:26', 1),
(41, 2, 'Vaso de Refresco', '2021-10-26 18:30:26', 1),
(42, 2, 'Agua', '2021-10-26 18:30:26', 1),
(43, 2, 'Gaseosa Inca Kola de 500ml', '2021-10-26 18:30:26', 1),
(44, 2, 'Gaseosa Coca Cola de 500ml', '2021-10-26 18:30:26', 1),
(45, 2, 'Gaseosa Inca Kola de 1.5L', '2021-10-26 18:30:26', 1),
(46, 2, 'Gaseosa Coca Cola de 1.5L', '2021-10-26 18:30:26', 1),
(47, 2, 'Gaseosa Inca Kola de 2.5L', '2021-10-26 18:30:26', 1),
(48, 2, 'Gaseosa Coca Cola de 2.5L', '2021-10-26 18:30:26', 1),
(49, 2, 'Cristal 650ml', '2021-10-26 18:30:26', 1),
(50, 2, 'Cusqueña Trigo 620ml', '2021-10-26 18:30:26', 1),
(51, 2, 'Cusqueña Malta 620ml', '2021-10-26 18:30:26', 1),
(52, 2, 'Corona', '2021-10-26 18:30:26', 1),
(53, 2, 'Stella Artois', '2021-10-26 18:30:26', 1),
(54, 2, 'Heineken ', '2021-10-26 18:30:26', 1),
(55, 2, 'Cusqueña Trigo', '2021-10-26 18:30:26', 1),
(56, 2, 'Cusqueña Malta', '2021-10-26 18:30:26', 1),
(57, 2, 'Barril de Heineken ', '2021-10-26 18:30:26', 1),
(58, 2, 'Balde de Stella Artois ', '2021-10-26 18:30:26', 1),
(59, 2, 'Balde de Heineken', '2021-10-26 18:30:26', 1),
(60, 2, 'Balde de Corona', '2021-10-26 18:30:26', 1),
(204, 1, 'Combo 1 (Alistas a elegir + 1 corona)', '2021-11-04 16:18:13', 1),
(205, 1, 'Combo para 2 (2 salchipapas clasicas + tequeños 6 und + 2 Stellas)', '2021-11-04 16:21:28', 1),
(206, 1, 'Combo Balconcito (Ronda de Alitas + Balde de Corona)', '2021-11-04 16:23:21', 1),
(207, 12, 'Combo  Trio', '2021-11-16 11:01:59', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE `recursos` (
  `id_recurso` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `recurso_nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `recurso_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recursos`
--

INSERT INTO `recursos` (`id_recurso`, `id_categoria`, `recurso_nombre`, `recurso_estado`) VALUES
(1, 3, 'Alitas BBQ + papas fritas + ensalada + chaufa', 1),
(2, 3, 'Alitas BBQ + papas fritas + ensalada', 2),
(3, 3, 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 3),
(4, 3, 'Alitas Acevichadas + papas fritas + ensalada', 4),
(5, 3, 'Alitas Picantes + papas fritas + ensalada + chaufa', 5),
(6, 3, 'Alitas Picantes + papas fritas + ensalada', 6),
(7, 3, 'Alitas Crispy + papas fritas + ensalada + chaufa', 7),
(8, 3, 'Alitas Crispy + papas fritas + ensalada', 8),
(9, 3, 'Alitas Bufalo + papas fritas + ensalada + chaufa', 9),
(10, 3, 'Alitas Bufalo + papas fritas + ensalada', 10),
(11, 3, 'Pechuga de Pollo + papas + ensalada + chaufa', 11),
(12, 3, 'Pechuga de Pollo + papas + ensalada', 12),
(13, 3, 'Brochetas + papas + ensalada + chaufa', 13),
(14, 3, 'Brochetas + papas + ensalada', 14),
(15, 3, 'Anticucho + papas + ensalada + chaufa', 15),
(16, 3, 'Anticucho + papas + ensalada', 16),
(17, 3, 'Salchichapa Clasica', 17),
(18, 3, 'Salchichapa Mixta', 18),
(19, 3, 'Salchichapa Regional', 19),
(20, 3, 'Salchipapa Balconcito', 20),
(21, 3, 'Ceviche Simple', 21),
(22, 3, 'Ceviche + Chicharron', 22),
(23, 3, 'Trio Balconcito', 23),
(24, 3, 'Chaufa Regional', 24),
(25, 3, 'Chaufa de Pollo', 25),
(26, 3, 'Teque?os (6 und)', 26),
(27, 3, 'Teque?os (12 und)', 27),
(28, 3, 'Teque?os Regionales (6 und)', 28),
(29, 3, 'Teque?os Regionales (12 und)', 29),
(30, 3, 'Piqueo Regional', 30),
(31, 3, 'Ronda de Alitas Balconcito', 31),
(32, 3, 'Chicken Fried Chicken', 32),
(33, 3, 'Nuevo-BBQ CHICKEN SALAD', 33),
(34, 3, 'Chicken Fried Chicken SALAD', 34),
(35, 3, 'Porci?n de Chaufa', 35),
(36, 3, 'Papas fritas', 36),
(37, 3, 'Patacones', 37),
(38, 3, 'Maduro', 38),
(39, 3, 'Jarra de Refresco', 39),
(40, 3, '1/2 Jarra', 40),
(41, 3, 'Vaso de Refresco', 41),
(42, 3, 'Agua', 42),
(43, 3, 'Gaseosa Inca Kola de 500ml', 43),
(44, 3, 'Gaseosa Coca Cola de 500ml', 44),
(45, 3, 'Gaseosa Inca Kola de 1.5L', 45),
(46, 3, 'Gaseosa Coca Cola de 1.5L', 46),
(47, 3, 'Gaseosa Inca Kola de 2.5L', 47),
(48, 3, 'Gaseosa Coca Cola de 2.5L', 48),
(49, 3, 'Cristal 650ml', 49),
(50, 3, 'Cusque?a Trigo 620ml', 50),
(51, 3, 'Cusque?a Malta 620ml', 51),
(52, 3, 'Corona', 52),
(53, 3, 'Stella Artois', 53),
(54, 3, 'Heineken ', 54),
(55, 3, 'Cusque?a Trigo', 55),
(56, 3, 'Cusque?a Malta', 56),
(57, 3, 'Barril de Heineken ', 57),
(58, 3, 'Balde de Stella Artois ', 58),
(59, 3, 'Balde de Heineken', 59),
(60, 3, 'Balde de Corona', 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos_sede`
--

CREATE TABLE `recursos_sede` (
  `id_recurso_sede` int(11) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_recurso` int(11) NOT NULL,
  `id_medida` int(11) NOT NULL,
  `recurso_sede_factor_unidad` decimal(10,2) NOT NULL,
  `recurso_sede_cantidad` decimal(10,2) NOT NULL,
  `recurso_sede_precio_unit` decimal(10,2) NOT NULL,
  `recurso_sede_precio_total` decimal(10,2) NOT NULL,
  `recurso_sede_peso_inicial` decimal(10,2) DEFAULT NULL,
  `recurso_sede_peso_final` decimal(10,2) DEFAULT NULL,
  `recurso_sede_merma` decimal(10,2) DEFAULT NULL,
  `recurso_sede_precio` decimal(10,2) NOT NULL,
  `recurso_sede_stock` decimal(10,2) DEFAULT 0.00,
  `recurso_sede_stock_minimo` decimal(10,2) DEFAULT 0.00,
  `recurso_sede_estado` tinyint(1) NOT NULL,
  `recurso_sede_fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recursos_sede`
--

INSERT INTO `recursos_sede` (`id_recurso_sede`, `id_usuario_creacion`, `id_sucursal`, `id_recurso`, `id_medida`, `recurso_sede_factor_unidad`, `recurso_sede_cantidad`, `recurso_sede_precio_unit`, `recurso_sede_precio_total`, `recurso_sede_peso_inicial`, `recurso_sede_peso_final`, `recurso_sede_merma`, `recurso_sede_precio`, `recurso_sede_stock`, `recurso_sede_stock_minimo`, `recurso_sede_estado`, `recurso_sede_fecha`) VALUES
(1, 2, 4, 1, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-16.00', '0.00', 1, '2021-10-26 18:30:26'),
(2, 2, 4, 2, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-25.00', '0.00', 1, '2021-10-26 18:30:26'),
(3, 2, 4, 3, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-9.00', '0.00', 1, '2021-10-26 18:30:26'),
(4, 2, 4, 4, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-6.00', '0.00', 1, '2021-10-26 18:30:26'),
(5, 2, 4, 5, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-1.00', '0.00', 1, '2021-10-26 18:30:26'),
(6, 2, 4, 6, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-2.00', '0.00', 1, '2021-10-26 18:30:26'),
(7, 2, 4, 7, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(8, 2, 4, 8, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-1.00', '0.00', 1, '2021-10-26 18:30:26'),
(9, 2, 4, 9, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-2.00', '0.00', 1, '2021-10-26 18:30:26'),
(10, 2, 4, 10, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(11, 2, 4, 11, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-7.00', '0.00', 1, '2021-10-26 18:30:26'),
(12, 2, 4, 12, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-4.00', '0.00', 1, '2021-10-26 18:30:26'),
(13, 2, 4, 13, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(14, 2, 4, 14, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-1.00', '0.00', 1, '2021-10-26 18:30:26'),
(15, 2, 4, 15, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-5.00', '0.00', 1, '2021-10-26 18:30:26'),
(16, 2, 4, 16, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-2.00', '0.00', 1, '2021-10-26 18:30:26'),
(17, 2, 4, 17, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-27.00', '0.00', 1, '2021-10-26 18:30:26'),
(18, 2, 4, 18, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-12.00', '0.00', 1, '2021-10-26 18:30:26'),
(19, 2, 4, 19, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-5.00', '0.00', 1, '2021-10-26 18:30:26'),
(20, 2, 4, 20, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-18.00', '0.00', 1, '2021-10-26 18:30:26'),
(21, 2, 4, 21, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-1.00', '0.00', 1, '2021-10-26 18:30:26'),
(22, 2, 4, 22, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(23, 2, 4, 23, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(24, 2, 4, 24, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-7.00', '0.00', 1, '2021-10-26 18:30:26'),
(25, 2, 4, 25, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-2.00', '0.00', 1, '2021-10-26 18:30:26'),
(26, 2, 4, 26, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-5.00', '0.00', 1, '2021-10-26 18:30:26'),
(27, 2, 4, 27, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-7.00', '0.00', 1, '2021-10-26 18:30:26'),
(28, 2, 4, 28, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(29, 2, 4, 29, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-3.00', '0.00', 1, '2021-10-26 18:30:26'),
(30, 2, 4, 30, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(31, 2, 4, 31, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-10.00', '0.00', 1, '2021-10-26 18:30:26'),
(32, 2, 4, 32, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-3.00', '0.00', 1, '2021-10-26 18:30:26'),
(33, 2, 4, 33, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-4.00', '0.00', 1, '2021-10-26 18:30:26'),
(34, 2, 4, 34, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-1.00', '0.00', 1, '2021-10-26 18:30:26'),
(35, 2, 4, 35, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-8.00', '0.00', 1, '2021-10-26 18:30:26'),
(36, 2, 4, 36, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-5.00', '0.00', 1, '2021-10-26 18:30:26'),
(37, 2, 4, 37, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-1.00', '0.00', 1, '2021-10-26 18:30:26'),
(38, 2, 4, 38, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(39, 2, 4, 39, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-8.00', '0.00', 1, '2021-10-26 18:30:26'),
(40, 2, 4, 40, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-1.00', '0.00', 1, '2021-10-26 18:30:26'),
(41, 2, 4, 41, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-27.00', '0.00', 1, '2021-10-26 18:30:26'),
(42, 2, 4, 42, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '14.00', '0.00', 1, '2021-10-26 18:30:26'),
(43, 2, 4, 43, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-13.00', '0.00', 1, '2021-10-26 18:30:26'),
(44, 2, 4, 44, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-5.00', '0.00', 1, '2021-10-26 18:30:26'),
(45, 2, 4, 45, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-1.00', '0.00', 1, '2021-10-26 18:30:26'),
(46, 2, 4, 46, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '5.00', '0.00', 1, '2021-10-26 18:30:26'),
(47, 2, 4, 47, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2.00', '0.00', 1, '2021-10-26 18:30:26'),
(48, 2, 4, 48, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '6.00', '0.00', 1, '2021-10-26 18:30:26'),
(49, 2, 4, 49, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '6.00', '0.00', 1, '2021-10-26 18:30:26'),
(50, 2, 4, 50, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-8.00', '0.00', 1, '2021-10-26 18:30:26'),
(51, 2, 4, 51, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(52, 2, 4, 52, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-108.00', '0.00', 1, '2021-10-26 18:30:26'),
(53, 2, 4, 53, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '3.00', '0.00', 1, '2021-10-26 18:30:26'),
(54, 2, 4, 54, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(55, 2, 4, 55, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-1.00', '0.00', 1, '2021-10-26 18:30:26'),
(56, 2, 4, 56, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(57, 2, 4, 57, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(58, 2, 4, 58, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(59, 2, 4, 59, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26'),
(60, 2, 4, 60, 58, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '2021-10-26 18:30:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_asistencias`
--

CREATE TABLE `registro_asistencias` (
  `id_registro` int(11) NOT NULL,
  `id_persona_turno` int(11) NOT NULL,
  `asistencia_fecha` date NOT NULL,
  `asistencia_valor` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `asistencia_cambio_fecha` date NOT NULL,
  `asistencia_cambio_hora` time NOT NULL,
  `asistencia_comentarios` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `registro_asistencias`
--

INSERT INTO `registro_asistencias` (`id_registro`, `id_persona_turno`, `asistencia_fecha`, `asistencia_valor`, `id_user`, `asistencia_cambio_fecha`, `asistencia_cambio_hora`, `asistencia_comentarios`) VALUES
(1, 1, '2021-08-18', 10, 1, '2021-08-18', '14:01:18', 'ASISTENCIA GENERAL'),
(2, 4, '2021-09-01', 1, 2, '2021-09-01', '16:54:47', 'ASISTENCIA GENERAL'),
(3, 5, '2021-09-01', 1, 2, '2021-09-01', '16:54:47', 'ASISTENCIA GENERAL'),
(4, 1, '2021-09-01', 1, 2, '2021-09-01', '16:54:47', 'ASISTENCIA GENERAL'),
(5, 6, '2021-09-01', 1, 2, '2021-09-01', '16:54:47', 'ASISTENCIA GENERAL'),
(6, 8, '2021-09-01', 1, 2, '2021-09-01', '16:54:47', 'ASISTENCIA GENERAL'),
(7, 2, '2021-09-01', 1, 2, '2021-09-01', '16:54:47', 'ASISTENCIA GENERAL'),
(8, 3, '2021-09-01', 7, 2, '2021-09-01', '16:54:47', 'ASISTENCIA GENERAL'),
(9, 9, '2021-09-01', 7, 2, '2021-09-01', '16:54:47', 'ASISTENCIA GENERAL'),
(10, 7, '2021-09-01', 1, 2, '2021-09-01', '16:54:47', 'ASISTENCIA GENERAL'),
(11, 4, '2021-09-03', 1, 2, '2021-09-03', '16:34:06', 'ASISTENCIA GENERAL'),
(12, 5, '2021-09-03', 1, 2, '2021-09-03', '16:34:07', 'ASISTENCIA GENERAL'),
(13, 1, '2021-09-03', 1, 2, '2021-09-03', '16:34:07', 'ASISTENCIA GENERAL'),
(14, 6, '2021-09-03', 1, 2, '2021-09-03', '16:34:07', 'ASISTENCIA GENERAL'),
(15, 8, '2021-09-03', 1, 2, '2021-09-03', '16:34:07', 'ASISTENCIA GENERAL'),
(16, 2, '2021-09-03', 1, 2, '2021-09-03', '16:34:07', 'ASISTENCIA GENERAL'),
(17, 3, '2021-09-03', 10, 2, '2021-09-03', '16:34:07', 'ASISTENCIA GENERAL'),
(18, 9, '2021-09-03', 1, 2, '2021-09-03', '16:34:07', 'ASISTENCIA GENERAL'),
(19, 7, '2021-09-03', 1, 2, '2021-09-03', '16:34:07', 'ASISTENCIA GENERAL'),
(20, 4, '2021-09-02', 1, 2, '2021-09-03', '16:34:49', 'ASISTENCIA GENERAL'),
(21, 5, '2021-09-02', 1, 2, '2021-09-03', '16:34:49', 'ASISTENCIA GENERAL'),
(22, 1, '2021-09-02', 1, 2, '2021-09-03', '16:34:49', 'ASISTENCIA GENERAL'),
(23, 6, '2021-09-02', 1, 2, '2021-09-03', '16:34:49', 'ASISTENCIA GENERAL'),
(24, 8, '2021-09-02', 10, 2, '2021-09-03', '16:34:49', 'ASISTENCIA GENERAL'),
(25, 2, '2021-09-02', 1, 2, '2021-09-03', '16:34:49', 'ASISTENCIA GENERAL'),
(26, 3, '2021-09-02', 1, 2, '2021-09-03', '16:34:49', 'ASISTENCIA GENERAL'),
(27, 9, '2021-09-02', 1, 2, '2021-09-03', '16:34:49', 'ASISTENCIA GENERAL'),
(28, 7, '2021-09-02', 10, 2, '2021-09-03', '16:34:49', 'ASISTENCIA GENERAL'),
(29, 11, '2021-09-02', 0, 2, '2021-09-07', '12:05:16', 'ASISTENCIA GENERAL'),
(30, 11, '2021-09-02', 0, 2, '2021-09-07', '12:05:35', 'ASISTENCIA GENERAL'),
(31, 5, '2021-09-04', 10, 2, '2021-09-07', '12:06:54', 'ASISTENCIA GENERAL'),
(32, 1, '2021-09-04', 10, 2, '2021-09-07', '12:06:54', 'ASISTENCIA GENERAL'),
(33, 6, '2021-09-04', 1, 2, '2021-09-07', '12:06:54', 'ASISTENCIA GENERAL'),
(34, 8, '2021-09-04', 1, 2, '2021-09-07', '12:06:55', 'ASISTENCIA GENERAL'),
(35, 2, '2021-09-04', 1, 2, '2021-09-07', '12:06:55', 'ASISTENCIA GENERAL'),
(36, 3, '2021-09-04', 10, 2, '2021-09-07', '12:06:55', 'ASISTENCIA GENERAL'),
(37, 9, '2021-09-04', 1, 2, '2021-09-07', '12:06:55', 'ASISTENCIA GENERAL'),
(38, 7, '2021-09-04', 1, 2, '2021-09-07', '12:06:55', 'ASISTENCIA GENERAL'),
(39, 5, '2021-09-05', 10, 2, '2021-09-07', '12:07:37', 'ASISTENCIA GENERAL'),
(40, 1, '2021-09-05', 10, 2, '2021-09-07', '12:07:37', 'ASISTENCIA GENERAL'),
(41, 6, '2021-09-05', 10, 2, '2021-09-07', '12:07:37', 'ASISTENCIA GENERAL'),
(42, 8, '2021-09-05', 1, 2, '2021-09-07', '12:07:37', 'ASISTENCIA GENERAL'),
(43, 2, '2021-09-05', 1, 2, '2021-09-07', '12:07:37', 'ASISTENCIA GENERAL'),
(44, 3, '2021-09-05', 1, 2, '2021-09-07', '12:07:38', 'ASISTENCIA GENERAL'),
(45, 9, '2021-09-05', 1, 2, '2021-09-07', '12:07:38', 'ASISTENCIA GENERAL'),
(46, 7, '2021-09-05', 10, 2, '2021-09-07', '12:07:38', 'ASISTENCIA GENERAL'),
(47, 5, '2021-09-06', 10, 2, '2021-09-07', '12:09:31', 'ASISTENCIA GENERAL'),
(48, 1, '2021-09-06', 1, 2, '2021-09-07', '12:09:31', 'ASISTENCIA GENERAL'),
(49, 8, '2021-09-06', 1, 2, '2021-09-07', '12:09:31', 'ASISTENCIA GENERAL'),
(50, 3, '2021-09-06', 10, 2, '2021-09-07', '12:09:31', 'ASISTENCIA GENERAL'),
(51, 9, '2021-09-06', 1, 2, '2021-09-07', '12:09:31', 'ASISTENCIA GENERAL'),
(52, 7, '2021-09-06', 10, 2, '2021-09-07', '12:09:31', 'ASISTENCIA GENERAL'),
(53, 4, '2021-09-07', 10, 2, '2021-09-15', '16:18:01', 'ASISTENCIA GENERAL'),
(54, 6, '2021-09-07', 10, 2, '2021-09-15', '16:18:02', 'ASISTENCIA GENERAL'),
(55, 8, '2021-09-07', 1, 2, '2021-09-15', '16:18:02', 'ASISTENCIA GENERAL'),
(56, 2, '2021-09-07', 1, 2, '2021-09-15', '16:18:02', 'ASISTENCIA GENERAL'),
(57, 3, '2021-09-07', 1, 2, '2021-09-15', '16:18:02', 'ASISTENCIA GENERAL'),
(58, 9, '2021-09-07', 1, 2, '2021-09-15', '16:18:02', 'ASISTENCIA GENERAL'),
(59, 4, '2021-09-09', 10, 2, '2021-09-15', '16:18:52', 'ASISTENCIA GENERAL'),
(60, 5, '2021-09-09', 10, 2, '2021-09-15', '16:18:52', 'ASISTENCIA GENERAL'),
(61, 1, '2021-09-09', 1, 2, '2021-09-15', '16:18:52', 'ASISTENCIA GENERAL'),
(62, 6, '2021-09-09', 10, 2, '2021-09-15', '16:18:52', 'ASISTENCIA GENERAL'),
(63, 8, '2021-09-09', 1, 2, '2021-09-15', '16:18:52', 'ASISTENCIA GENERAL'),
(64, 2, '2021-09-09', 1, 2, '2021-09-15', '16:18:52', 'ASISTENCIA GENERAL'),
(65, 3, '2021-09-09', 1, 2, '2021-09-15', '16:18:53', 'ASISTENCIA GENERAL'),
(66, 9, '2021-09-09', 1, 2, '2021-09-15', '16:18:53', 'ASISTENCIA GENERAL'),
(67, 7, '2021-09-09', 10, 2, '2021-09-15', '16:18:53', 'ASISTENCIA GENERAL'),
(68, 4, '2021-09-10', 10, 2, '2021-09-15', '16:19:25', 'ASISTENCIA GENERAL'),
(69, 5, '2021-09-10', 10, 2, '2021-09-15', '16:19:25', 'ASISTENCIA GENERAL'),
(70, 1, '2021-09-10', 10, 2, '2021-09-15', '16:19:25', 'ASISTENCIA GENERAL'),
(71, 6, '2021-09-10', 1, 2, '2021-09-15', '16:19:25', 'ASISTENCIA GENERAL'),
(72, 8, '2021-09-10', 1, 2, '2021-09-15', '16:19:25', 'ASISTENCIA GENERAL'),
(73, 2, '2021-09-10', 10, 2, '2021-09-15', '16:19:25', 'ASISTENCIA GENERAL'),
(74, 3, '2021-09-10', 10, 2, '2021-09-15', '16:19:26', 'ASISTENCIA GENERAL'),
(75, 9, '2021-09-10', 1, 2, '2021-09-15', '16:19:26', 'ASISTENCIA GENERAL'),
(76, 7, '2021-09-10', 10, 2, '2021-09-15', '16:19:26', 'ASISTENCIA GENERAL'),
(77, 4, '2021-09-11', 10, 2, '2021-09-15', '16:19:44', 'ASISTENCIA GENERAL'),
(78, 5, '2021-09-11', 10, 2, '2021-09-15', '16:19:44', 'ASISTENCIA GENERAL'),
(79, 1, '2021-09-11', 1, 2, '2021-09-15', '16:19:44', 'ASISTENCIA GENERAL'),
(80, 6, '2021-09-11', 10, 2, '2021-09-15', '16:19:44', 'ASISTENCIA GENERAL'),
(81, 8, '2021-09-11', 1, 2, '2021-09-15', '16:19:44', 'ASISTENCIA GENERAL'),
(82, 2, '2021-09-11', 1, 2, '2021-09-15', '16:19:44', 'ASISTENCIA GENERAL'),
(83, 3, '2021-09-11', 1, 2, '2021-09-15', '16:19:44', 'ASISTENCIA GENERAL'),
(84, 9, '2021-09-11', 1, 2, '2021-09-15', '16:19:44', 'ASISTENCIA GENERAL'),
(85, 7, '2021-09-11', 10, 2, '2021-09-15', '16:19:44', 'ASISTENCIA GENERAL'),
(86, 4, '2021-09-12', 10, 2, '2021-09-15', '16:20:32', 'ASISTENCIA GENERAL'),
(87, 5, '2021-09-12', 10, 2, '2021-09-15', '16:20:32', 'ASISTENCIA GENERAL'),
(88, 1, '2021-09-12', 10, 2, '2021-09-15', '16:20:32', 'ASISTENCIA GENERAL'),
(89, 6, '2021-09-12', 10, 2, '2021-09-15', '16:20:33', 'ASISTENCIA GENERAL'),
(90, 8, '2021-09-12', 1, 2, '2021-09-15', '16:20:33', 'ASISTENCIA GENERAL'),
(91, 3, '2021-09-12', 1, 2, '2021-09-15', '16:20:33', 'ASISTENCIA GENERAL'),
(92, 9, '2021-09-12', 1, 2, '2021-09-15', '16:20:33', 'ASISTENCIA GENERAL'),
(93, 7, '2021-09-12', 10, 2, '2021-09-15', '16:20:33', 'ASISTENCIA GENERAL'),
(94, 1, '2021-09-13', 1, 2, '2021-09-15', '16:21:45', 'ASISTENCIA GENERAL'),
(95, 8, '2021-09-13', 1, 2, '2021-09-15', '16:21:45', 'ASISTENCIA GENERAL'),
(96, 3, '2021-09-13', 10, 2, '2021-09-15', '16:21:45', 'ASISTENCIA GENERAL'),
(97, 9, '2021-09-13', 1, 2, '2021-09-15', '16:21:45', 'ASISTENCIA GENERAL'),
(98, 7, '2021-09-13', 1, 2, '2021-09-15', '16:21:45', 'ASISTENCIA GENERAL'),
(99, 4, '2021-09-14', 10, 2, '2021-09-15', '16:24:16', 'ASISTENCIA GENERAL'),
(100, 5, '2021-09-14', 1, 2, '2021-09-15', '16:24:16', 'ASISTENCIA GENERAL'),
(101, 8, '2021-09-14', 1, 2, '2021-09-15', '16:24:17', 'ASISTENCIA GENERAL'),
(102, 2, '2021-09-14', 1, 2, '2021-09-15', '16:24:17', 'ASISTENCIA GENERAL'),
(103, 3, '2021-09-14', 1, 2, '2021-09-15', '16:24:17', 'ASISTENCIA GENERAL'),
(104, 9, '2021-09-14', 1, 2, '2021-09-15', '16:24:17', 'ASISTENCIA GENERAL'),
(105, 4, '2021-09-15', 1, 2, '2021-09-15', '16:26:42', 'ASISTENCIA GENERAL'),
(106, 5, '2021-09-15', 1, 2, '2021-09-15', '16:26:42', 'ASISTENCIA GENERAL'),
(107, 6, '2021-09-15', 1, 2, '2021-09-15', '16:26:42', 'ASISTENCIA GENERAL'),
(108, 2, '2021-09-15', 1, 2, '2021-09-15', '16:26:42', 'ASISTENCIA GENERAL'),
(109, 7, '2021-09-15', 1, 2, '2021-09-15', '16:26:42', 'ASISTENCIA GENERAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `reserva_nombre` varchar(200) NOT NULL,
  `reserva_cantidad` varchar(100) NOT NULL,
  `reserva_fecha` date NOT NULL,
  `reserva_hora` time NOT NULL,
  `reserva_fecha_registro` datetime NOT NULL,
  `reserva_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restricciones`
--

CREATE TABLE `restricciones` (
  `id_restriccion` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `restricciones`
--

INSERT INTO `restricciones` (`id_restriccion`, `id_rol`, `id_opcion`) VALUES
(1, 4, 34),
(2, 7, 70),
(3, 6, 70),
(4, 5, 70),
(5, 4, 70),
(6, 7, 71),
(7, 5, 71),
(8, 6, 71),
(9, 4, 71),
(10, 7, 67),
(11, 6, 67),
(12, 5, 67),
(13, 4, 67),
(14, 7, 46),
(15, 6, 46),
(16, 4, 46),
(17, 7, 48),
(18, 6, 48),
(19, 4, 48),
(20, 7, 62),
(21, 6, 62),
(22, 4, 62),
(23, 3, 39),
(24, 4, 39),
(25, 5, 39),
(26, 6, 39),
(27, 7, 39),
(28, 8, 39),
(29, 3, 52),
(30, 4, 52),
(31, 5, 52),
(32, 6, 52),
(33, 7, 52),
(34, 8, 52),
(35, 3, 53),
(36, 4, 53),
(37, 5, 53),
(38, 6, 53),
(39, 7, 53),
(40, 8, 53),
(41, 3, 64),
(42, 4, 64),
(43, 5, 64),
(44, 6, 64),
(45, 7, 64),
(46, 8, 64);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `rol_nombre` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `rol_descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rol_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol_nombre`, `rol_descripcion`, `rol_estado`) VALUES
(1, 'Libre', 'Accesos sin inicio de sesión', 1),
(2, 'SuperAdmin', 'Tiene acceso a la gestión total del sistema', 1),
(3, 'Gerencia', 'Gestión del sistema', 1),
(4, 'Mesero', 'Atencion al publico', 1),
(5, 'Cajero', 'Encargado de estar en caja', 1),
(6, 'Cocinero', 'Encargado de la preparación del pedido', 1),
(7, 'Ayudante de Cocina', 'Ayudar en la cocina', 1),
(8, 'Administrador', 'Administra parte del Sistema', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_menus`
--

CREATE TABLE `roles_menus` (
  `id_rol_menu` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles_menus`
--

INSERT INTO `roles_menus` (`id_rol_menu`, `id_rol`, `id_menu`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 3, 2),
(7, 3, 5),
(8, 2, 6),
(9, 3, 6),
(10, 2, 7),
(11, 2, 8),
(12, 2, 9),
(13, 2, 10),
(14, 2, 11),
(15, 2, 12),
(16, 2, 13),
(17, 2, 14),
(18, 2, 15),
(19, 2, 16),
(20, 2, 17),
(21, 2, 18),
(22, 2, 19),
(23, 2, 20),
(24, 2, 21),
(25, 4, 2),
(26, 4, 12),
(28, 4, 17),
(29, 5, 2),
(30, 5, 16),
(31, 5, 12),
(32, 2, 22),
(33, 3, 8),
(34, 3, 9),
(35, 3, 10),
(36, 3, 11),
(37, 3, 12),
(38, 3, 13),
(39, 3, 14),
(40, 3, 15),
(41, 3, 16),
(42, 3, 17),
(43, 3, 18),
(44, 3, 19),
(45, 3, 20),
(46, 3, 21),
(47, 3, 7),
(48, 4, 13),
(50, 5, 13),
(51, 5, 17),
(52, 5, 19),
(53, 5, 20),
(54, 6, 2),
(55, 6, 12),
(56, 6, 13),
(57, 3, 22),
(58, 2, 23),
(59, 3, 23),
(60, 7, 12),
(61, 4, 23),
(62, 5, 23),
(63, 6, 23),
(64, 7, 23),
(65, 5, 8),
(66, 5, 11),
(67, 5, 15),
(68, 8, 2),
(70, 8, 20),
(71, 8, 19),
(72, 8, 12),
(73, 8, 23),
(74, 8, 22),
(75, 8, 21),
(76, 8, 18),
(77, 8, 17),
(78, 8, 11),
(79, 8, 13),
(80, 8, 15),
(81, 8, 16),
(82, 8, 8),
(83, 4, 1),
(85, 4, 5),
(86, 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serie`
--

CREATE TABLE `serie` (
  `id_serie` int(11) NOT NULL,
  `tipocomp` char(2) DEFAULT NULL,
  `serie` varchar(8) DEFAULT NULL,
  `correlativo` int(11) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Volcado de datos para la tabla `serie`
--

INSERT INTO `serie` (`id_serie`, `tipocomp`, `serie`, `correlativo`, `estado`) VALUES
(1, '01', 'F001', 0, 1),
(2, '01', 'F002', 0, 0),
(3, '03', 'B001', 1, 1),
(5, '07', 'FN01', 0, 1),
(6, '07', 'BN01', 0, 1),
(7, '08', 'FD01', 0, 1),
(8, '08', 'BD01', 0, 1),
(9, 'RC', '20211014', 0, 1),
(10, 'RA', '20210520', 0, 1),
(4, '03', 'B002', 0, 0),
(13, '20', 'NV01', 193, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_recetas`
--

CREATE TABLE `sub_recetas` (
  `id_sub_receta` int(11) NOT NULL,
  `id_medida` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `id_receta_2` int(11) NOT NULL,
  `sub_receta_cantidad` decimal(10,2) NOT NULL,
  `sub_receta_total` decimal(10,2) NOT NULL,
  `sub_receta_fecha_registro` datetime NOT NULL,
  `sub_receta_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `sucursal_nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `sucursal_direccion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `sucursal_ruc` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `sucursal_foto` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sucursal_telefono` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sucursal_estado` tinyint(1) NOT NULL,
  `sucursal_fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `id_ciudad`, `id_negocio`, `sucursal_nombre`, `sucursal_direccion`, `sucursal_ruc`, `sucursal_foto`, `sucursal_telefono`, `sucursal_estado`, `sucursal_fecha_registro`) VALUES
(4, 1, 3, 'BALCONCITO RESTAURANT', 'AV GUARDIA CIVIL 1331', '10111111111', 'media/sucursal/default.png', '9999999', 1, '2021-03-24 14:23:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoadjuntos`
--

CREATE TABLE `tipoadjuntos` (
  `id_adjunto` int(11) NOT NULL,
  `adjunto_nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `adjunto_ext` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipoadjuntos`
--

INSERT INTO `tipoadjuntos` (`id_adjunto`, `adjunto_nombre`, `adjunto_ext`) VALUES
(1, 'Boleta de Pago', 'BolPago'),
(2, 'Contrato firmado', 'ContrFirma'),
(3, 'Alta de PDT', 'AltaPDT'),
(4, 'Baja de PDT', 'BajaPDT'),
(5, 'Memorandum - Vacaciones', 'MemoVacac'),
(6, 'Memorandum - Sanciones', 'MemoSanc'),
(7, 'Memorandum - Cambio de Puesto', 'MemoCambP'),
(8, 'Memorandum - Varios', 'MemoVar'),
(9, 'Antecedentes Penales', 'AntPen'),
(10, 'Antecedentes Policiales', 'AntPol'),
(11, 'Otros Documentos y/o Solicitudes', 'Otros'),
(12, 'Renuncia', 'Renun'),
(13, 'Liquidación de Beneficios Sociales', 'LBS'),
(14, 'Carta de No Adeudo', 'CartNAd'),
(15, 'Licencia por Maternidad y/o Paternidad', 'LicMatPat'),
(16, 'Declaración Jurada', 'DeclJur'),
(17, 'Boleta de Pago - Vacaciones', 'BolPagVac'),
(18, 'Examen Medico', 'ExamMed'),
(19, 'Vacunas', 'Vac'),
(20, 'Certificado de Trabajo', 'CerTrab'),
(21, 'Boleta - Gratificación', 'BolGrat');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocargo`
--

CREATE TABLE `tipocargo` (
  `id_cargo` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `cargo_nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipocargo`
--

INSERT INTO `tipocargo` (`id_cargo`, `id_departamento`, `cargo_nombre`) VALUES
(1, 3, 'MESERO'),
(2, 2, 'PERSONAL LIMPIEZA'),
(3, 1, 'COCINERO'),
(5, 1, 'AYUDANTE DE COCINA'),
(6, 3, 'CAJERO'),
(7, 3, 'DELIVERY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocontrato`
--

CREATE TABLE `tipocontrato` (
  `id_contrato` int(11) NOT NULL,
  `contrato_nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipocontrato`
--

INSERT INTO `tipocontrato` (`id_contrato`, `contrato_nombre`) VALUES
(0, '--'),
(1, 'INDETERMINADO'),
(2, 'SUJETO A MODALIDAD'),
(3, 'POR OBRA DETERMINADA O SERVICIO ESPECIFICO'),
(7, 'DE PERSONAL EXTRANJERO A PLAZO DETERMINADO'),
(8, 'LOCACION DE SERVICIOS'),
(9, 'A TIEMPO PARCIAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodepartamento`
--

CREATE TABLE `tipodepartamento` (
  `id_departamento` int(11) NOT NULL,
  `departamento_nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipodepartamento`
--

INSERT INTO `tipodepartamento` (`id_departamento`, `departamento_nombre`) VALUES
(0, '--'),
(1, 'COCINA'),
(2, 'LIMPIEZA'),
(3, 'SERVICIOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposede`
--

CREATE TABLE `tiposede` (
  `id_sede` int(11) NOT NULL,
  `sede_nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tiposede`
--

INSERT INTO `tiposede` (`id_sede`, `sede_nombre`) VALUES
(0, '--'),
(1, 'Sede San Juan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_afectacion`
--

CREATE TABLE `tipo_afectacion` (
  `id_tipo_afectacion` int(11) NOT NULL,
  `codigo` char(2) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `codigo_afectacion` char(4) DEFAULT NULL,
  `nombre_afectacion` char(3) DEFAULT NULL,
  `tipo_afectacion` char(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tipo_afectacion`
--

INSERT INTO `tipo_afectacion` (`id_tipo_afectacion`, `codigo`, `descripcion`, `codigo_afectacion`, `nombre_afectacion`, `tipo_afectacion`) VALUES
(1, '10', 'OP. GRAVADAS', '1000', 'IGV', 'VAT'),
(2, '20', 'OP. EXONERADAS', '9997', 'EXO', 'VAT'),
(3, '30', 'OP. INAFECTAS', '9998', 'INA', 'FRE'),
(4, '21', 'OP. GRATUITAS', '9996', 'GRA', 'FRE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE `tipo_documentos` (
  `id_tipodocumento` int(11) NOT NULL,
  `tipodocumento_codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipodocumento_identidad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipodocumento_estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`id_tipodocumento`, `tipodocumento_codigo`, `tipodocumento_identidad`, `tipodocumento_estado`) VALUES
(1, '0', 'DOC.TRIB.NO.DOM.SIN.RUC', 1),
(2, '1', 'Documento Nacional de Identidad', 1),
(3, '4', 'Carnet de extranjería', 1),
(4, '6', 'Registro Unico de Contributentes', 1),
(5, '7', 'Pasaporte', 1),
(6, 'A', 'Cédula Diplomática de identidad', 1),
(7, 'B', 'DOC.IDENT.PAIS.RESIDENCIA-NO.D', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ncreditos`
--

CREATE TABLE `tipo_ncreditos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_nota_descripcion` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_ncreditos`
--

INSERT INTO `tipo_ncreditos` (`id`, `codigo`, `tipo_nota_descripcion`, `estado`) VALUES
(1, '01', 'Anulación de la operacion', 0),
(2, '02', 'Anulación por error en el RUC', 0),
(3, '03', 'Corrección por error en la descripcion', 0),
(4, '04', 'Descuento Global', 0),
(5, '05', 'Descuento por ítem', 0),
(6, '06', 'Devolución total', 0),
(7, '07', 'Devolución por ítem', 0),
(8, '08', 'Bonificación', 0),
(9, '09', 'Disminición en el valor', 0),
(10, '10', 'Otros conceptos', 0),
(11, '11', 'Ajustes de operaciones de exportacion', 0),
(12, '12', 'Ajustes afectos al IVAP', 0),
(13, '13', 'Corrección del monto neto pendiente de pago y/o la(s) fechas(s) de vencimiento del pago \r\núnico o de las cuotas y/o los montos correspondientes a cada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ndebitos`
--

CREATE TABLE `tipo_ndebitos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_nota_descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_ndebitos`
--

INSERT INTO `tipo_ndebitos` (`id`, `codigo`, `tipo_nota_descripcion`, `estado`) VALUES
(1, '01', 'Intereses por mora', 0),
(2, '02', 'Aumento en el valor', 0),
(3, '03', 'Penalidades / Otros conceptos', 0),
(4, '10', 'Ajustes de operaciones de exportación', 0),
(5, '11', 'Ajustes afectos al IVAP', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id_tipo_pago` int(11) NOT NULL,
  `tipo_pago_nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_pago_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`id_tipo_pago`, `tipo_pago_nombre`, `tipo_pago_estado`) VALUES
(1, 'TARJETA', 1),
(2, 'TRANSFERENCIA', 1),
(3, 'EFECTIVO', 1),
(4, 'PAGO A PLAZO', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `turno_nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `turno_hora_entrada` time NOT NULL,
  `turno_hora_tolerancia` time NOT NULL,
  `turno_hora_salida` time NOT NULL,
  `turno_estado` tinyint(2) NOT NULL,
  `turno_fecha_registro` datetime NOT NULL,
  `turno_usuario_registro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `turno_nombre`, `turno_hora_entrada`, `turno_hora_tolerancia`, `turno_hora_salida`, `turno_estado`, `turno_fecha_registro`, `turno_usuario_registro`) VALUES
(1, 'Turno 1', '16:00:00', '16:10:00', '23:59:00', 1, '2021-10-26 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id_medida` int(11) NOT NULL,
  `medida_codigo_unidad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `medida_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `medida_activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`id_medida`, `medida_codigo_unidad`, `medida_nombre`, `medida_activo`) VALUES
(1, '4A', 'BOBINAS                                           ', 0),
(2, 'BJ', 'BALDE                                             ', 1),
(3, 'BLL', 'BARRILES                                          ', 0),
(4, 'BG', 'BOLSA                                             ', 1),
(5, 'BO', 'BOTELLA                                      ', 1),
(6, 'BX', 'CAJA                                              ', 1),
(7, 'CT', 'CARTONES                                          ', 0),
(8, 'CMK', 'CENTIMETRO CUADRADO                               ', 0),
(9, 'CMQ', 'CENTIMETRO CUBICO                                 ', 0),
(10, 'CMT', 'CENTIMETRO LINEAL                                 ', 0),
(11, 'CEN', 'CIENTO DE UNIDADES                                ', 1),
(12, 'CY', 'CILINDRO                                          ', 0),
(13, 'CJ', 'CONOS                                             ', 0),
(14, 'DZN', 'DOCENA                                            ', 1),
(15, 'DZP', 'DOCENA POR 10**6                                  ', 0),
(16, 'BE', 'FARDO                                             ', 0),
(17, 'GLI', 'GALON INGLES (4,545956L)', 1),
(18, 'GRM', 'GRAMO                                             ', 1),
(19, 'GRO', 'GRUESA                                            ', 0),
(20, 'HLT', 'HECTOLITRO                                        ', 0),
(21, 'LEF', 'HOJA                                              ', 0),
(22, 'SET', 'JUEGO                                             ', 0),
(23, 'KGM', 'KILOGRAMO                                         ', 1),
(24, 'KTM', 'KILOMETRO                                         ', 0),
(25, 'KWH', 'KILOVATIO HORA                                    ', 0),
(26, 'KT', 'KIT                                               ', 0),
(27, 'CA', 'LATAS                                             ', 0),
(28, 'LBR', 'LIBRAS                                            ', 0),
(29, 'LTR', 'LITRO                                             ', 1),
(30, 'MWH', 'MEGAWATT HORA                                     ', 0),
(31, 'MTR', 'METRO                                             ', 1),
(32, 'MTK', 'METRO CUADRADO                                    ', 0),
(33, 'MTQ', 'METRO CUBICO                                      ', 0),
(34, 'MGM', 'MILIGRAMOS                                        ', 0),
(35, 'MLT', 'MILILITRO                                         ', 0),
(36, 'MMT', 'MILIMETRO                                         ', 0),
(37, 'MMK', 'MILIMETRO CUADRADO                                ', 0),
(38, 'MMQ', 'MILIMETRO CUBICO                                  ', 0),
(39, 'MLL', 'MILLARES                                          ', 0),
(40, 'UM', 'MILLON DE UNIDADES                                ', 0),
(41, 'ONZ', 'ONZAS                                             ', 0),
(42, 'PF', 'PALETAS                                           ', 0),
(43, 'PK', 'PAQUETE                                           ', 1),
(44, 'PR', 'PAR                                               ', 0),
(45, 'FOT', 'PIES                                              ', 0),
(46, 'FTK', 'PIES CUADRADOS                                    ', 0),
(47, 'FTQ', 'PIES CUBICOS                                      ', 0),
(48, 'C62', 'PIEZAS                                            ', 0),
(49, 'PG', 'PLACAS                                            ', 0),
(50, 'ST', 'PLIEGO                                            ', 0),
(51, 'INH', 'PULGADAS                                          ', 0),
(52, 'RM', 'RESMA                                             ', 0),
(53, 'DR', 'TAMBOR                                            ', 0),
(54, 'STN', 'TONELADA CORTA                                    ', 0),
(55, 'LTN', 'TONELADA LARGA                                    ', 0),
(56, 'TNE', 'TONELADAS                                         ', 0),
(57, 'TU', 'TUBOS                                             ', 0),
(58, 'NIU', 'UNIDAD (BIENES)                                   ', 1),
(59, 'ZZ', 'UNIDAD (SERVICIOS) ', 1),
(60, 'GLL', 'US GALON (3,7843 L)', 0),
(61, 'YRD', 'YARDA                                             ', 0),
(62, 'YDK', 'YARDA CUADRADA                                    ', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `usuario_nickname` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `usuario_contrasenha` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `usuario_email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `usuario_imagen` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usuario_estado` tinyint(1) NOT NULL,
  `usuario_creacion` datetime NOT NULL,
  `usuario_ultimo_login` datetime NOT NULL,
  `usuario_ultima_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_persona`, `id_rol`, `usuario_nickname`, `usuario_contrasenha`, `usuario_email`, `usuario_imagen`, `usuario_estado`, `usuario_creacion`, `usuario_ultimo_login`, `usuario_ultima_modificacion`) VALUES
(1, 1, 2, 'superadmin', '$2y$10$oPOOOgTUr4zIh511ATm/q.vzsAmxP.e2.vzyEbRn/1pzyWz2oXj0a', 'cesarjose@bufeotec.com', 'media/usuarios/usuario.jpg', 1, '2020-09-17 00:00:00', '2021-11-16 11:02:45', '2020-09-17 00:00:00'),
(2, 2, 3, 'EGAYA', '$2y$10$WoCTV2Sy6QqZehh6kZvdxukl2Fh.kPy5gc6p76NdXBF3JOTMtyfse', 'balconcitorest@gmail.com', 'media/usuarios/2_27102021133901.jpeg', 1, '2020-10-27 18:29:10', '2021-10-31 01:04:49', '2021-10-27 13:39:01'),
(12, 12, 8, 'GRAMIREZ', '$2y$10$OCCcTY4.rto93pPAMaThTe4sWv9D87heyejF6MrmKwDlFViTpU.PC', 'gerry.r2704@gmail.com', 'media/usuarios/usuario.jpg', 1, '2021-10-27 13:36:06', '2021-11-16 10:59:10', '2021-10-27 13:36:33'),
(13, 13, 4, 'LMOGOLLON', '$2y$10$R.t0sp8AkodkNjXaW1Rj1.3os6f4eLhMhZJsS4Q6AEkQf57m5moxS', 'system.iqt@gmail.com', 'media/usuarios/usuario.jpg', 1, '2021-10-27 13:48:36', '2021-11-13 22:26:20', '2021-10-27 13:48:36'),
(14, 14, 5, 'JRAMIREZ', '$2y$10$m3IeiOmILmKFDA3ZzTGFreK1vngjPa4GIotJ0dK.wPgGDijgboCGK', 'julissajazminramirez8@gmail.com', 'media/usuarios/usuario.jpg', 1, '2021-10-27 13:54:09', '2021-11-13 22:19:51', '2021-10-27 13:54:09'),
(15, 15, 5, 'abel', '$2y$10$9Vj3Ih5BgxkyyouSIYNM5eX9aQwFOfAXFt14IH09WQWlOHDPjJ7Dm', 'abel@gmail.com', 'media/usuarios/usuario.jpg', 1, '2021-11-16 11:03:59', '2021-11-16 11:04:15', '2021-11-16 11:03:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_negocio`
--

CREATE TABLE `usuarios_negocio` (
  `id_usuario_negocio` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `usuario_negocio_fecha` datetime NOT NULL,
  `usuario_negocio_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios_negocio`
--

INSERT INTO `usuarios_negocio` (`id_usuario_negocio`, `id_negocio`, `id_usuario`, `usuario_negocio_fecha`, `usuario_negocio_estado`) VALUES
(3, 3, 1, '2021-03-24 14:24:32', 1),
(4, 3, 2, '2021-08-16 11:57:29', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_sucursal`
--

CREATE TABLE `usuarios_sucursal` (
  `id_usuario_sucursal` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `usuario_sucursal_fecha` datetime NOT NULL,
  `usuario_sucursal_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios_sucursal`
--

INSERT INTO `usuarios_sucursal` (`id_usuario_sucursal`, `id_sucursal`, `id_usuario`, `id_rol`, `usuario_sucursal_fecha`, `usuario_sucursal_estado`) VALUES
(3, 4, 1, 2, '2021-03-24 14:24:09', 1),
(4, 4, 2, 3, '2021-08-12 16:59:36', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_caja_numero` int(11) NOT NULL DEFAULT 1,
  `id_empresa` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tipo_pago` int(11) NOT NULL DEFAULT 3,
  `id_moneda` int(11) NOT NULL DEFAULT 1,
  `venta_condicion_resumen` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-Registro, 2-Actualizar, 3-baja',
  `venta_tipo_envio` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-directo, 2-resumen diario',
  `venta_direccion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_tipo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `venta_serie` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_correlativo` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `venta_descuento_global` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_totalgratuita` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_totalexonerada` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_totalinafecta` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_totalgravada` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_totaligv` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_incluye_igv` tinyint(2) NOT NULL DEFAULT 1,
  `venta_totaldescuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_icbper` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_pago_cliente` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_vuelto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_fecha` datetime NOT NULL,
  `venta_observacion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_documento_modificar` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serie_modificar` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correlativo_modificar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_codigo_motivo_nota` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_estado_sunat` tinyint(4) NOT NULL DEFAULT 0,
  `venta_fecha_envio` datetime DEFAULT NULL,
  `venta_rutaXML` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_rutaCDR` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_respuesta_sunat` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_fecha_de_baja` date DEFAULT NULL,
  `anulado_sunat` tinyint(4) NOT NULL DEFAULT 0,
  `venta_cancelar` tinyint(1) NOT NULL DEFAULT 1,
  `venta_seriecorrelativo_notaventa` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Aqui se llena cuando se edita una nota de venta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_caja_numero`, `id_empresa`, `id_usuario`, `id_mesa`, `id_cliente`, `id_tipo_pago`, `id_moneda`, `venta_condicion_resumen`, `venta_tipo_envio`, `venta_direccion`, `venta_tipo`, `venta_serie`, `venta_correlativo`, `venta_descuento_global`, `venta_totalgratuita`, `venta_totalexonerada`, `venta_totalinafecta`, `venta_totalgravada`, `venta_totaligv`, `venta_incluye_igv`, `venta_totaldescuento`, `venta_icbper`, `venta_total`, `venta_pago_cliente`, `venta_vuelto`, `venta_fecha`, `venta_observacion`, `tipo_documento_modificar`, `serie_modificar`, `correlativo_modificar`, `venta_codigo_motivo_nota`, `venta_estado_sunat`, `venta_fecha_envio`, `venta_rutaXML`, `venta_rutaCDR`, `venta_respuesta_sunat`, `venta_fecha_de_baja`, `anulado_sunat`, `venta_cancelar`, `venta_seriecorrelativo_notaventa`) VALUES
(1160, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '1', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-28 20:02:19', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1161, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '2', '0.00', '0.00', '19.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '19.00', '0.00', '0.00', '2021-10-28 20:34:54', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1162, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '3', '0.00', '0.00', '50.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '50.00', '0.00', '0.00', '2021-10-28 20:51:11', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1163, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '4', '0.00', '0.00', '129.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '129.00', '0.00', '0.00', '2021-10-28 21:26:02', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1164, 1, 1, 14, 0, 3, 3, 1, 1, 0, NULL, '03', 'B001', '1', '0.00', '0.00', '50.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '50.00', '0.00', '0.00', '2021-10-28 21:51:37', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1165, 1, 1, 14, 12, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '5', '0.00', '0.00', '167.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '167.00', '0.00', '0.00', '2021-10-28 22:08:17', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1166, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '6', '0.00', '0.00', '59.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '59.00', '0.00', '0.00', '2021-10-28 22:25:03', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1167, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '7', '0.00', '0.00', '142.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '142.00', '0.00', '0.00', '2021-10-28 22:26:36', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1168, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '8', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-10-28 22:27:27', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1169, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '9', '0.00', '0.00', '58.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '58.00', '0.00', '0.00', '2021-10-28 22:55:15', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1170, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '10', '0.00', '0.00', '28.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '28.00', '0.00', '0.00', '2021-10-28 23:08:36', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1171, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '11', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-10-28 23:10:38', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1172, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '12', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-10-28 23:21:18', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1173, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '13', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-10-29 19:26:58', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1174, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '14', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-10-29 19:27:42', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1175, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '15', '0.00', '0.00', '38.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '38.00', '0.00', '0.00', '2021-10-29 21:00:11', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1176, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '16', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-29 21:14:29', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1177, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '17', '0.00', '0.00', '47.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '47.00', '0.00', '0.00', '2021-10-29 21:42:51', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1178, 1, 1, 14, 15, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '18', '0.00', '0.00', '14.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '14.00', '0.00', '0.00', '2021-10-29 22:49:32', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1179, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '19', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-10-29 22:56:04', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1180, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '20', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-29 23:04:14', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1181, 1, 1, 14, 12, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '21', '0.00', '0.00', '85.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '85.00', '0.00', '0.00', '2021-10-29 23:19:14', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1182, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '22', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-10-29 23:21:38', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1183, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '23', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-29 23:22:26', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1184, 1, 1, 14, 12, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '24', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-10-29 23:24:12', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1185, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '25', '0.00', '0.00', '60.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '60.00', '0.00', '0.00', '2021-10-29 23:33:50', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1186, 1, 1, 14, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '26', '0.00', '0.00', '74.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '74.00', '0.00', '0.00', '2021-10-29 23:44:24', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1187, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '27', '0.00', '0.00', '24.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '24.00', '0.00', '0.00', '2021-10-29 23:47:07', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1188, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '28', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-10-29 23:48:08', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1189, 1, 1, 14, 8, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '29', '0.00', '0.00', '56.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '56.00', '0.00', '0.00', '2021-10-29 23:51:52', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1190, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '30', '0.00', '0.00', '94.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '94.00', '0.00', '0.00', '2021-10-29 23:59:29', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1191, 1, 1, 14, 13, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '31', '0.00', '0.00', '22.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '22.00', '0.00', '0.00', '2021-10-30 00:00:30', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1192, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '32', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-10-30 00:04:09', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1193, 1, 1, 14, 10, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '33', '0.00', '0.00', '49.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '49.00', '0.00', '0.00', '2021-10-30 00:07:07', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1194, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '34', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-10-30 00:09:58', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1195, 1, 1, 14, 15, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '35', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-30 00:12:32', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1196, 1, 1, 14, 15, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '36', '0.00', '0.00', '126.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '126.00', '0.00', '0.00', '2021-10-30 00:13:57', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1197, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '37', '0.00', '0.00', '40.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '40.00', '0.00', '0.00', '2021-10-30 00:17:38', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1198, 1, 1, 14, 10, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '38', '0.00', '0.00', '23.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '23.00', '0.00', '0.00', '2021-10-30 00:18:28', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1199, 1, 1, 14, 7, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '39', '0.00', '0.00', '56.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '56.00', '0.00', '0.00', '2021-10-30 00:25:45', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1200, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '40', '0.00', '0.00', '40.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '40.00', '0.00', '0.00', '2021-10-30 00:30:58', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1201, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '41', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-10-30 00:32:30', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1202, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '42', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '50.00', '34.00', '2021-10-30 00:34:44', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1203, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '43', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-30 17:18:43', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1204, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '44', '0.00', '0.00', '30.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '30.00', '0.00', '0.00', '2021-10-30 19:16:28', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1205, 1, 1, 14, 10, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '45', '0.00', '0.00', '60.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '60.00', '0.00', '0.00', '2021-10-30 20:42:21', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1206, 1, 1, 14, 10, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '46', '0.00', '0.00', '54.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '54.00', '0.00', '0.00', '2021-10-30 22:43:00', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1207, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '47', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-10-30 22:59:16', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1208, 1, 1, 14, 8, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '48', '0.00', '0.00', '18.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '18.00', '0.00', '0.00', '2021-10-30 23:00:24', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1209, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '49', '0.00', '0.00', '58.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '58.00', '0.00', '0.00', '2021-10-30 23:30:15', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1210, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '50', '0.00', '0.00', '381.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '381.00', '400.00', '19.00', '2021-10-30 23:32:07', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1211, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '51', '0.00', '0.00', '51.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '51.00', '0.00', '0.00', '2021-10-30 23:48:50', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1212, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '52', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-10-31 00:00:06', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1213, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '53', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-31 00:20:11', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1214, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '54', '0.00', '0.00', '10.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '10.00', '0.00', '0.00', '2021-10-31 00:22:29', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1215, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '55', '0.00', '0.00', '48.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '48.00', '0.00', '0.00', '2021-10-31 00:25:31', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1216, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '56', '0.00', '0.00', '18.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '18.00', '0.00', '0.00', '2021-10-31 00:29:47', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1217, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '57', '0.00', '0.00', '55.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '55.00', '0.00', '0.00', '2021-10-31 00:38:27', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1218, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '58', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-10-31 00:48:02', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1219, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '59', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-31 00:52:53', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1220, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '60', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '100.00', '55.00', '2021-10-31 00:59:22', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1221, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '61', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-10-31 01:00:40', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1222, 1, 1, 14, 12, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '62', '0.00', '0.00', '90.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '90.00', '100.00', '100.00', '2021-10-31 01:08:11', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1223, 1, 1, 14, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '63', '0.00', '0.00', '46.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '46.00', '0.00', '0.00', '2021-10-31 01:16:06', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1224, 1, 1, 14, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '64', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-31 01:17:02', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1225, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '65', '0.00', '0.00', '60.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '60.00', '0.00', '0.00', '2021-10-31 01:20:00', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1226, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '66', '0.00', '0.00', '18.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '18.00', '0.00', '0.00', '2021-10-31 01:26:14', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1227, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '67', '0.00', '0.00', '39.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '39.00', '0.00', '0.00', '2021-10-31 01:28:07', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1228, 1, 1, 2, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '67', '0.00', '0.00', '64.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '64.00', '0.00', '0.00', '2021-10-31 01:41:35', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1229, 1, 1, 2, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '68', '0.00', '0.00', '10.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '10.00', '0.00', '0.00', '2021-10-31 01:46:17', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1230, 1, 1, 14, 6, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '69', '0.00', '0.00', '98.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '98.00', '0.00', '0.00', '2021-10-31 01:47:52', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1231, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '70', '0.00', '0.00', '40.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '40.00', '50.00', '50.00', '2021-10-31 01:50:31', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1232, 1, 1, 14, 8, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '71', '0.00', '0.00', '63.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '63.00', '0.00', '0.00', '2021-10-31 02:01:59', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1233, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '72', '0.00', '0.00', '64.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '64.00', '0.00', '0.00', '2021-10-31 02:03:29', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1234, 1, 1, 14, 12, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '73', '0.00', '0.00', '74.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '74.00', '0.00', '0.00', '2021-10-31 02:05:50', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1235, 1, 1, 14, 8, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '74', '0.00', '0.00', '48.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '48.00', '50.00', '2.00', '2021-10-31 02:06:25', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1236, 1, 1, 2, 15, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '75', '0.00', '0.00', '90.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '90.00', '0.00', '0.00', '2021-10-31 02:08:02', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1237, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '76', '0.00', '0.00', '162.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '162.00', '0.00', '0.00', '2021-10-31 02:08:09', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1238, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '77', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-10-31 02:08:58', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1239, 1, 1, 14, 11, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '78', '0.00', '0.00', '245.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '245.00', '0.00', '0.00', '2021-10-31 02:14:53', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1240, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '79', '0.00', '0.00', '102.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '102.00', '0.00', '0.00', '2021-10-31 02:18:40', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1241, 1, 1, 14, 13, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '80', '0.00', '0.00', '99.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '99.00', '0.00', '0.00', '2021-10-31 02:19:01', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1242, 1, 1, 14, 13, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '81', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-10-31 02:21:00', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1243, 1, 1, 14, 8, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '82', '0.00', '0.00', '9.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '9.00', '0.00', '0.00', '2021-10-31 02:23:48', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1244, 1, 1, 14, 15, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '83', '0.00', '0.00', '78.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '78.00', '0.00', '0.00', '2021-10-31 02:31:13', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1245, 1, 1, 14, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '84', '0.00', '0.00', '9.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '9.00', '0.00', '0.00', '2021-10-31 03:10:25', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1246, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '85', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-10-31 03:10:58', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1247, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '86', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-10-31 18:04:34', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1248, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '87', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-02 18:17:04', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1249, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '88', '0.00', '0.00', '27.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '27.00', '0.00', '0.00', '2021-11-02 19:02:50', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1250, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '89', '0.00', '0.00', '12.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '12.00', '20.00', '8.00', '2021-11-02 19:16:42', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1251, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '90', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-02 19:36:59', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1252, 1, 1, 13, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '91', '0.00', '0.00', '57.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '57.00', '100.00', '43.00', '2021-11-02 19:56:40', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1253, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '92', '0.00', '0.00', '47.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '47.00', '0.00', '0.00', '2021-11-03 20:16:36', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1254, 1, 1, 12, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '93', '0.00', '0.00', '36.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '36.00', '0.00', '0.00', '2021-11-03 21:02:01', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1255, 1, 1, 12, 13, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '94', '0.00', '0.00', '36.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '36.00', '0.00', '0.00', '2021-11-03 22:00:15', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1256, 1, 1, 12, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '95', '0.00', '0.00', '140.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '140.00', '0.00', '0.00', '2021-11-03 22:45:09', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1257, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '96', '0.00', '0.00', '48.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '48.00', '0.00', '0.00', '2021-11-05 20:19:59', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1258, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '97', '0.00', '0.00', '109.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '109.00', '0.00', '0.00', '2021-11-05 20:38:59', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1259, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '98', '0.00', '0.00', '42.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '42.00', '0.00', '0.00', '2021-11-05 21:31:32', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1260, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '99', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-11-05 21:32:54', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1261, 1, 1, 14, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '100', '0.00', '0.00', '55.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '55.00', '70.00', '21.00', '2021-11-05 21:49:53', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1262, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '101', '0.00', '0.00', '23.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '23.00', '0.00', '0.00', '2021-11-05 22:41:14', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1263, 1, 1, 14, 12, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '102', '0.00', '0.00', '100.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '100.00', '0.00', '0.00', '2021-11-05 22:45:54', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1264, 1, 1, 14, 15, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '103', '0.00', '0.00', '44.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '44.00', '100.00', '56.00', '2021-11-05 23:23:11', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1265, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '104', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '5.00', '5.00', '2021-11-06 21:01:44', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1266, 1, 1, 14, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '105', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '80.00', '0.00', '0.00', '2021-11-06 21:23:46', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1267, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '106', '0.00', '0.00', '72.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '72.00', '100.00', '28.00', '2021-11-06 23:21:56', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1268, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '107', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-06 23:27:49', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1269, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '108', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-11-07 20:55:53', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1270, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '109', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-11-09 18:13:26', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1271, 1, 1, 14, 7, 3, 2, 1, 1, 0, NULL, '20', 'NV01', '110', '0.00', '0.00', '15.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '15.00', '0.00', '0.00', '2021-11-09 22:28:23', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1272, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '111', '0.00', '0.00', '41.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '41.00', '0.00', '0.00', '2021-11-09 23:05:18', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1273, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '112', '0.00', '0.00', '51.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '51.00', '0.00', '0.00', '2021-11-10 19:47:01', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1274, 1, 1, 14, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '113', '0.00', '0.00', '84.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '84.00', '0.00', '0.00', '2021-11-10 20:02:20', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1275, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '114', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-10 22:08:50', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1276, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '115', '0.00', '0.00', '61.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '61.00', '0.00', '0.00', '2021-11-10 22:30:02', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1277, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '116', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-11-10 23:45:59', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1278, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '117', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-11-11 18:45:18', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1279, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '118', '0.00', '0.00', '20.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '20.00', '0.00', '0.00', '2021-11-11 20:18:09', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1280, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '119', '0.00', '0.00', '38.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '38.00', '0.00', '0.00', '2021-11-11 20:35:05', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1281, 1, 1, 13, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '120', '0.00', '0.00', '15.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '15.00', '0.00', '0.00', '2021-11-11 20:40:27', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1282, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '121', '0.00', '0.00', '66.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '66.00', '0.00', '0.00', '2021-11-11 21:55:21', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1283, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '122', '0.00', '0.00', '21.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '21.00', '0.00', '0.00', '2021-11-11 21:57:26', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1284, 1, 1, 13, 14, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '123', '0.00', '0.00', '23.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '23.00', '0.00', '0.00', '2021-11-11 22:41:39', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1285, 1, 1, 13, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '124', '0.00', '0.00', '17.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '17.00', '0.00', '0.00', '2021-11-11 22:48:31', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1286, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '125', '0.00', '0.00', '17.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '17.00', '0.00', '0.00', '2021-11-11 22:53:03', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1287, 1, 1, 14, 6, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '126', '0.00', '0.00', '37.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '37.00', '0.00', '0.00', '2021-11-11 22:55:37', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1288, 1, 1, 14, 12, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '127', '0.00', '0.00', '254.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '254.00', '0.00', '0.00', '2021-11-12 00:57:59', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1289, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '128', '0.00', '0.00', '34.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '34.00', '0.00', '0.00', '2021-11-12 00:58:32', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1290, 1, 1, 14, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '129', '0.00', '0.00', '28.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '28.00', '0.00', '0.00', '2021-11-12 00:59:05', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1291, 1, 1, 14, 6, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '130', '0.00', '0.00', '125.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '125.00', '0.00', '0.00', '2021-11-12 18:54:50', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1292, 1, 1, 14, 11, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '131', '0.00', '0.00', '57.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '57.00', '0.00', '0.00', '2021-11-12 19:58:35', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1293, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '132', '0.00', '0.00', '17.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '17.00', '0.00', '0.00', '2021-11-12 20:07:05', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1294, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '133', '0.00', '0.00', '20.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '20.00', '0.00', '0.00', '2021-11-12 22:36:40', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1295, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '134', '0.00', '0.00', '15.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '15.00', '0.00', '0.00', '2021-11-12 22:38:28', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1296, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '135', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-11-12 22:42:52', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1297, 1, 1, 14, 15, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '136', '0.00', '0.00', '19.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '19.00', '0.00', '0.00', '2021-11-12 23:02:02', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1298, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '137', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-11-12 23:13:51', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1299, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '138', '0.00', '0.00', '24.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '24.00', '0.00', '0.00', '2021-11-12 23:24:14', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1300, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '139', '0.00', '0.00', '24.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '24.00', '0.00', '0.00', '2021-11-12 23:25:40', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1301, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '140', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-12 23:29:42', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1302, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '141', '0.00', '0.00', '90.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '90.00', '0.00', '0.00', '2021-11-12 23:32:31', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1303, 1, 1, 14, 7, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '142', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-11-12 23:37:22', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1304, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '143', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-12 23:49:18', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1305, 1, 1, 14, 15, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '144', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-11-12 23:54:40', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1306, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '145', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-11-12 23:56:54', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1307, 1, 1, 14, 7, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '146', '0.00', '0.00', '36.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '36.00', '0.00', '0.00', '2021-11-13 00:05:57', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1308, 1, 1, 14, 7, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '147', '0.00', '0.00', '90.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '90.00', '0.00', '0.00', '2021-11-13 00:08:55', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1309, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '148', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-11-13 00:10:15', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1310, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '149', '0.00', '0.00', '24.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '24.00', '0.00', '0.00', '2021-11-13 00:18:58', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1311, 1, 1, 14, 6, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '150', '0.00', '0.00', '36.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '36.00', '0.00', '0.00', '2021-11-13 00:34:14', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1312, 1, 1, 14, 8, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '151', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-13 00:35:20', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1313, 1, 1, 14, 16, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '152', '0.00', '0.00', '16.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '16.00', '0.00', '0.00', '2021-11-13 00:38:01', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1314, 1, 1, 14, 8, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '153', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-13 00:56:24', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1315, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '154', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-11-13 01:01:21', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1316, 1, 1, 14, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '155', '0.00', '0.00', '104.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '104.00', '0.00', '0.00', '2021-11-13 01:23:08', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1317, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '156', '0.00', '0.00', '72.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '72.00', '0.00', '0.00', '2021-11-13 01:36:18', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1318, 1, 1, 14, 10, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '157', '0.00', '0.00', '225.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '225.00', '0.00', '0.00', '2021-11-13 01:38:51', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1319, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '158', '0.00', '0.00', '68.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '68.00', '0.00', '0.00', '2021-11-13 01:39:14', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1320, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '159', '0.00', '0.00', '10.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '10.00', '0.00', '0.00', '2021-11-13 01:46:34', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1321, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '160', '0.00', '0.00', '24.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '24.00', '0.00', '0.00', '2021-11-13 01:47:04', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1322, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '161', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-13 01:50:30', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1323, 1, 1, 14, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '162', '0.00', '0.00', '120.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '120.00', '0.00', '0.00', '2021-11-13 02:02:09', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1324, 1, 1, 14, 11, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '163', '0.00', '0.00', '143.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '143.00', '0.00', '0.00', '2021-11-13 02:03:24', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1325, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '164', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-13 02:03:43', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1326, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '165', '0.00', '0.00', '22.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '22.00', '0.00', '0.00', '2021-11-13 02:04:14', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1327, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '166', '0.00', '0.00', '10.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '10.00', '0.00', '0.00', '2021-11-13 02:05:26', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1328, 1, 1, 14, 15, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '167', '0.00', '0.00', '40.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '40.00', '0.00', '0.00', '2021-11-13 02:31:30', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1329, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '168', '0.00', '0.00', '24.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '24.00', '0.00', '0.00', '2021-11-13 02:33:59', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1330, 1, 1, 14, 15, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '169', '0.00', '0.00', '64.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '64.00', '0.00', '0.00', '2021-11-13 02:44:26', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1331, 1, 1, 14, 12, 3, 1, 1, 1, 0, NULL, '20', 'NV01', '170', '0.00', '0.00', '272.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '272.00', '0.00', '0.00', '2021-11-13 02:46:27', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1332, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '171', '0.00', '0.00', '28.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '28.00', '0.00', '0.00', '2021-11-13 03:07:21', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1333, 1, 1, 13, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '172', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-13 18:00:12', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1334, 1, 1, 12, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '173', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-11-13 19:37:39', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1335, 1, 1, 12, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '174', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-13 20:00:48', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1336, 1, 1, 12, 12, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '175', '0.00', '0.00', '24.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '24.00', '0.00', '0.00', '2021-11-13 20:21:33', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1337, 1, 1, 12, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '176', '0.00', '0.00', '115.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '115.00', '0.00', '0.00', '2021-11-13 21:20:09', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1338, 1, 1, 12, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '177', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-11-13 21:34:12', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1339, 1, 1, 12, 9, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '178', '0.00', '0.00', '62.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '62.00', '0.00', '0.00', '2021-11-13 21:39:48', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1340, 1, 1, 12, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '179', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-13 21:41:27', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1341, 1, 1, 14, 13, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '180', '0.00', '0.00', '26.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '26.00', '0.00', '0.00', '2021-11-13 22:34:18', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1342, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '181', '0.00', '0.00', '6.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '6.00', '0.00', '0.00', '2021-11-13 22:43:43', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1343, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '182', '0.00', '0.00', '65.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '65.00', '0.00', '0.00', '2021-11-13 22:49:41', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1344, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '183', '0.00', '0.00', '8.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '8.00', '0.00', '0.00', '2021-11-13 22:50:34', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1345, 1, 1, 14, 8, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '184', '0.00', '0.00', '115.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '115.00', '0.00', '0.00', '2021-11-13 22:53:44', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1346, 1, 1, 13, 11, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '185', '0.00', '0.00', '41.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '41.00', '0.00', '0.00', '2021-11-13 22:54:04', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1347, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '186', '0.00', '0.00', '24.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '24.00', '0.00', '0.00', '2021-11-13 22:56:32', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1348, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '187', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '45.00', '0.00', '0.00', '2021-11-13 22:58:07', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1349, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '188', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-13 23:01:11', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1350, 1, 1, 14, 10, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '189', '0.00', '0.00', '49.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '49.00', '0.00', '0.00', '2021-11-13 23:26:08', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1351, 1, 1, 14, 16, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '190', '0.00', '0.00', '20.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '20.00', '0.00', '0.00', '2021-11-14 00:00:41', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1352, 1, 1, 14, 7, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '191', '0.00', '0.00', '22.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '22.00', '0.00', '0.00', '2021-11-14 00:13:44', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1353, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '192', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-14 00:14:17', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(1354, 1, 1, 14, 6, 3, 3, 1, 1, 0, NULL, '20', 'NV01', '193', '0.00', '0.00', '3.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '3.00', '0.00', '0.00', '2021-11-14 00:20:17', NULL, '', NULL, '', '0', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_anulados`
--

CREATE TABLE `ventas_anulados` (
  `id_venta_anulado` int(11) NOT NULL,
  `venta_anulado_fecha` date NOT NULL,
  `venta_anulado_serie` varchar(20) NOT NULL,
  `venta_anulado_correlativo` int(11) NOT NULL,
  `venta_anulacion_ticket` varchar(100) NOT NULL,
  `venta_anulado_rutaXML` varchar(1000) NOT NULL,
  `venta_anulado_rutaCDR` varchar(1000) DEFAULT NULL,
  `venta_anulado_estado_sunat` varchar(1000) DEFAULT NULL,
  `id_venta` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `venta_anulado_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `venta_anulado_estado` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_cuotas`
--

CREATE TABLE `ventas_cuotas` (
  `id_ventas_cuotas` int(11) NOT NULL,
  `id_ventas` int(11) NOT NULL,
  `id_tipo_pago` int(11) NOT NULL,
  `venta_cuota_numero` varchar(30) NOT NULL,
  `venta_cuota_importe` decimal(10,2) NOT NULL,
  `venta_cuota_fecha` date NOT NULL,
  `venta_cuota_estado` tinyint(4) NOT NULL DEFAULT 1,
  `venta_cuota_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalle`
--

CREATE TABLE `ventas_detalle` (
  `id_venta_detalle` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_comanda_detalle` int(11) NOT NULL,
  `venta_detalle_valor_unitario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_detalle_precio_unitario` decimal(10,2) NOT NULL,
  `venta_detalle_nombre_producto` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `venta_detalle_cantidad` double NOT NULL,
  `venta_detalle_total_igv` decimal(10,2) NOT NULL,
  `venta_detalle_porcentaje_igv` decimal(10,2) NOT NULL DEFAULT 0.18,
  `venta_detalle_total_icbper` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_detalle_valor_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_detalle_importe_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `id_producto_precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ventas_detalle`
--

INSERT INTO `ventas_detalle` (`id_venta_detalle`, `id_venta`, `id_comanda_detalle`, `venta_detalle_valor_unitario`, `venta_detalle_precio_unitario`, `venta_detalle_nombre_producto`, `venta_detalle_cantidad`, `venta_detalle_total_igv`, `venta_detalle_porcentaje_igv`, `venta_detalle_total_icbper`, `venta_detalle_valor_total`, `venta_detalle_importe_total`, `id_producto_precio`) VALUES
(3895, 1160, 4797, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3896, 1161, 4796, '16.00', '16.00', 'Anticucho + papas + ensalada', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3897, 1161, 4798, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3898, 1162, 4793, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(3899, 1162, 4794, '15.00', '15.00', 'Salchichapa Regional', 1, '0.00', '18.00', '0.00', '15.00', '15.00', NULL),
(3900, 1162, 4795, '10.00', '10.00', 'Jarra de Refresco', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(3901, 1162, 4799, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3902, 1163, 4804, '10.00', '10.00', 'Jarra de Refresco', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(3903, 1163, 4801, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(3904, 1163, 4808, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3905, 1163, 4805, '3.00', '3.00', 'Agua', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(3906, 1163, 4802, '21.00', '21.00', 'Ceviche Simple', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3907, 1163, 4806, '4.00', '4.00', 'Patacones', 1, '0.00', '18.00', '0.00', '4.00', '4.00', NULL),
(3908, 1163, 4803, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3909, 1163, 4807, '10.00', '10.00', 'Tequeños (6 und)', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(3910, 1163, 4810, '14.00', '14.00', 'Salchichapa Mixta', 1, '0.00', '18.00', '0.00', '14.00', '14.00', NULL),
(3911, 1163, 4820, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(3912, 1164, 4817, '17.00', '17.00', 'Alitas Picantes + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(3913, 1164, 4818, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(3914, 1164, 4819, '21.00', '21.00', 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3915, 1165, 4790, '35.00', '35.00', 'Ronda de Alitas Balconcito', 1, '0.00', '18.00', '0.00', '35.00', '35.00', NULL),
(3916, 1165, 4791, '8.00', '8.00', 'Cristal 650ml', 11, '0.00', '18.00', '0.00', '88.00', '88.00', NULL),
(3917, 1165, 4809, '35.00', '35.00', 'Ronda de Alitas Balconcito', 1, '0.00', '18.00', '0.00', '35.00', '35.00', NULL),
(3918, 1165, 4811, '3.00', '3.00', 'Agua', 3, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(3919, 1166, 4822, '10.00', '10.00', 'Cusqueña Trigo 620ml', 3, '0.00', '18.00', '0.00', '30.00', '30.00', NULL),
(3920, 1166, 4823, '21.00', '21.00', 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3921, 1166, 4827, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(3922, 1167, 4815, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(3923, 1167, 4812, '25.00', '25.00', 'Chicken Fried Chicken', 1, '0.00', '18.00', '0.00', '25.00', '25.00', NULL),
(3924, 1167, 4816, '20.00', '20.00', 'Anticucho + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(3925, 1167, 4813, '6.00', '6.00', 'Porcion de Chaufa', 1, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(3926, 1167, 4814, '21.00', '21.00', 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3927, 1167, 4821, '13.00', '13.00', 'Gaseosa Inca Kola de 2.5L', 1, '0.00', '18.00', '0.00', '13.00', '13.00', NULL),
(3928, 1167, 4824, '8.00', '8.00', 'Cristal 650ml', 5, '0.00', '18.00', '0.00', '40.00', '40.00', NULL),
(3929, 1168, 4829, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(3930, 1169, 4826, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3931, 1169, 4825, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3932, 1169, 4830, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3933, 1170, 4828, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(3934, 1170, 4831, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(3935, 1171, 4832, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(3936, 1172, 4833, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(3937, 1173, 4834, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(3938, 1174, 4835, '8.00', '8.00', 'Stella Artois', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(3939, 1175, 4840, '10.00', '10.00', 'Jarra de Refresco', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(3940, 1175, 4838, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(3941, 1175, 4839, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3942, 1176, 4836, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3943, 1177, 4841, '35.00', '35.00', 'Ronda de Alitas Balconcito', 1, '0.00', '18.00', '0.00', '35.00', '35.00', NULL),
(3944, 1177, 4842, '3.00', '3.00', 'Vaso de Refresco', 4, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(3945, 1178, 4847, '14.00', '14.00', 'Salchichapa Mixta', 1, '0.00', '18.00', '0.00', '14.00', '14.00', NULL),
(3946, 1179, 4886, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3947, 1180, 4887, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3948, 1181, 4855, '10.00', '10.00', 'Gaseosa Inca Kola de 1.5L', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(3949, 1181, 4856, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3950, 1181, 4853, '21.00', '21.00', 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3951, 1181, 4854, '20.00', '20.00', 'Pechuga de Pollo + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(3952, 1181, 4862, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3953, 1182, 4889, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3954, 1183, 4890, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3955, 1184, 4868, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3956, 1185, 4861, '3.00', '3.00', 'Agua', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(3957, 1185, 4859, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3958, 1185, 4860, '21.00', '21.00', 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3959, 1185, 4863, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(3960, 1186, 4870, '8.00', '8.00', 'Corona', 5, '0.00', '18.00', '0.00', '40.00', '40.00', NULL),
(3961, 1186, 4871, '25.00', '25.00', 'Chicken Fried Chicken', 1, '0.00', '18.00', '0.00', '25.00', '25.00', NULL),
(3962, 1186, 4891, '3.00', '3.00', 'Agua', 3, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(3963, 1187, 4893, '8.00', '8.00', 'Cristal 650ml', 3, '0.00', '18.00', '0.00', '24.00', '24.00', NULL),
(3964, 1188, 4894, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3965, 1189, 4864, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3966, 1189, 4865, '10.00', '10.00', 'Tequeños (6 und)', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(3967, 1189, 4866, '12.00', '12.00', 'Salchichapa Clasica', 2, '0.00', '18.00', '0.00', '24.00', '24.00', NULL),
(3968, 1189, 4878, '3.00', '3.00', 'Vaso de Refresco', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(3969, 1190, 4850, '6.00', '6.00', 'Porcion de Chaufa', 1, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(3970, 1190, 4851, '21.00', '21.00', 'Alitas Bufalo + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3971, 1190, 4849, '15.00', '15.00', 'Salchichapa Regional', 1, '0.00', '18.00', '0.00', '15.00', '15.00', NULL),
(3972, 1190, 4858, '16.00', '16.00', 'Pechuga de Pollo + papas + ensalada', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3973, 1190, 4867, '21.00', '21.00', 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(3974, 1190, 4879, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3975, 1190, 4895, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3976, 1190, 4896, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3977, 1190, 4897, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3978, 1190, 4898, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3979, 1191, 4857, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3980, 1191, 4899, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3981, 1191, 4900, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3982, 1192, 4901, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3983, 1193, 4880, '20.00', '20.00', 'Anticucho + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(3984, 1193, 4881, '10.00', '10.00', 'Jarra de Refresco', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(3985, 1193, 4882, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3986, 1193, 4902, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3987, 1194, 4905, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(3988, 1195, 4907, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3989, 1196, 4846, '14.00', '14.00', 'Salchichapa Mixta', 1, '0.00', '18.00', '0.00', '14.00', '14.00', NULL),
(3990, 1196, 4844, '35.00', '35.00', 'Ronda de Alitas Balconcito', 1, '0.00', '18.00', '0.00', '35.00', '35.00', NULL),
(3991, 1196, 4848, '3.00', '3.00', 'Vaso de Refresco', 4, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(3992, 1196, 4845, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(3993, 1196, 4876, '8.00', '8.00', 'Cristal 650ml', 6, '0.00', '18.00', '0.00', '48.00', '48.00', NULL),
(3994, 1197, 4873, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3995, 1197, 4888, '16.00', '16.00', 'Tequeños (12 und)', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(3996, 1197, 4904, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(3997, 1198, 4874, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(3998, 1198, 4872, '17.00', '17.00', 'Alitas Acevichadas + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(3999, 1198, 4903, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4000, 1199, 4884, '8.00', '8.00', 'Stella Artois', 4, '0.00', '18.00', '0.00', '32.00', '32.00', NULL),
(4001, 1199, 4908, '8.00', '8.00', 'Stella Artois', 3, '0.00', '18.00', '0.00', '24.00', '24.00', NULL),
(4002, 1200, 4875, '8.00', '8.00', 'Cristal 650ml', 5, '0.00', '18.00', '0.00', '40.00', '40.00', NULL),
(4003, 1201, 4906, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4004, 1202, 4909, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4005, 1202, 4910, '8.00', '8.00', 'Stella Artois', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4006, 1203, 4911, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4007, 1204, 4912, '21.00', '21.00', 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4008, 1204, 4913, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4009, 1205, 4915, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 2, '0.00', '18.00', '0.00', '34.00', '34.00', NULL),
(4010, 1205, 4916, '20.00', '20.00', 'Anticucho + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4011, 1205, 4917, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4012, 1205, 4918, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4013, 1206, 4937, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4014, 1206, 4939, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4015, 1206, 4940, '25.00', '25.00', 'Nuevo-BBQ CHICKEN SALAD', 1, '0.00', '18.00', '0.00', '25.00', '25.00', NULL),
(4016, 1206, 4941, '17.00', '17.00', 'Alitas Acevichadas + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4017, 1206, 4942, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4018, 1206, 4960, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4019, 1207, 4982, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4020, 1208, 4981, '9.00', '9.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '18.00', '18.00', NULL),
(4021, 1209, 4944, '35.00', '35.00', 'Ronda de Alitas Balconcito', 1, '0.00', '18.00', '0.00', '35.00', '35.00', NULL),
(4022, 1209, 4945, '5.00', '5.00', '1/2 Jarra', 1, '0.00', '18.00', '0.00', '5.00', '5.00', NULL),
(4023, 1209, 4946, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4024, 1209, 4977, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4025, 1209, 4985, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4026, 1210, 4923, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4027, 1210, 4924, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4028, 1210, 4925, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4029, 1210, 4928, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4030, 1210, 4936, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4031, 1210, 4950, '18.00', '18.00', 'Tequeños Regionales (12 und)', 1, '0.00', '18.00', '0.00', '18.00', '18.00', NULL),
(4032, 1210, 4951, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4033, 1210, 4952, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4034, 1210, 4962, '16.00', '16.00', 'Tequeños (12 und)', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4035, 1210, 4963, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4036, 1210, 4964, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4037, 1210, 4975, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4038, 1210, 4979, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4039, 1210, 4984, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4040, 1210, 4991, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4041, 1211, 4958, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4042, 1211, 4959, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4043, 1211, 4961, '15.00', '15.00', 'Salchichapa Regional', 1, '0.00', '18.00', '0.00', '15.00', '15.00', NULL),
(4044, 1211, 4980, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4045, 1211, 4994, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4046, 1212, 5004, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4047, 1213, 5014, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4048, 1214, 5016, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4049, 1215, 5017, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4050, 1215, 5018, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4051, 1216, 5010, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4052, 1216, 5020, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4053, 1217, 5024, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4054, 1217, 5025, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4055, 1218, 5031, '3.00', '3.00', 'Agua', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4056, 1218, 5032, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4057, 1219, 5034, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4058, 1220, 5037, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4059, 1221, 5038, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4060, 1222, 4972, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4061, 1222, 4990, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4062, 1222, 4996, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4063, 1222, 5009, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4064, 1222, 5011, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4065, 1222, 5015, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4066, 1222, 5023, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4067, 1222, 5028, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4068, 1222, 5033, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4069, 1222, 5041, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4070, 1223, 4974, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4071, 1223, 4976, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4072, 1223, 4988, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4073, 1223, 4995, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4074, 1223, 5003, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4075, 1223, 5021, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4076, 1224, 5045, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4077, 1225, 5040, '8.00', '8.00', 'Corona', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4078, 1225, 5044, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4079, 1225, 5046, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4080, 1225, 5047, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4081, 1225, 5048, '9.00', '9.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '18.00', '18.00', NULL),
(4082, 1226, 5053, '9.00', '9.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '18.00', '18.00', NULL),
(4083, 1227, 5005, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4084, 1227, 5013, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4085, 1227, 5022, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4086, 1227, 5030, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4087, 1227, 5042, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4088, 1228, 5058, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4089, 1228, 5059, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4090, 1228, 5060, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4091, 1229, 5062, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4092, 1230, 4967, '17.00', '17.00', 'Alitas Acevichadas + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4093, 1230, 4968, '8.00', '8.00', 'Corona', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4094, 1230, 4969, '17.00', '17.00', 'Alitas Picantes + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4095, 1230, 4986, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4096, 1230, 4987, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4097, 1230, 5007, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4098, 1230, 5008, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4099, 1230, 5035, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4100, 1230, 5036, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4101, 1230, 5054, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4102, 1231, 5065, '8.00', '8.00', 'Corona', 5, '0.00', '18.00', '0.00', '40.00', '40.00', NULL),
(4103, 1232, 4955, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4104, 1232, 4956, '18.00', '18.00', 'Tequeños Regionales (12 und)', 1, '0.00', '18.00', '0.00', '18.00', '18.00', NULL),
(4105, 1233, 5069, '8.00', '8.00', 'Stella Artois', 8, '0.00', '18.00', '0.00', '64.00', '64.00', NULL),
(4106, 1234, 5043, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4107, 1234, 5049, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4108, 1234, 5050, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4109, 1235, 5070, '8.00', '8.00', 'Stella Artois', 6, '0.00', '18.00', '0.00', '48.00', '48.00', NULL),
(4110, 1236, 5039, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4111, 1236, 5067, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4112, 1237, 4965, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4113, 1237, 4966, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4114, 1237, 4970, '35.00', '35.00', 'Ronda de Alitas Balconcito', 1, '0.00', '18.00', '0.00', '35.00', '35.00', NULL),
(4115, 1237, 4971, '16.00', '16.00', 'Tequeños (12 und)', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4116, 1237, 4978, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4117, 1237, 4989, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4118, 1237, 4993, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4119, 1237, 4999, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4120, 1237, 5000, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4121, 1237, 5006, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4122, 1237, 5019, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4123, 1237, 5029, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4124, 1237, 5056, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4125, 1237, 5057, '9.00', '9.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '18.00', '18.00', NULL),
(4126, 1237, 5063, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4127, 1237, 5064, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4128, 1238, 5027, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4129, 1239, 4919, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4130, 1239, 4920, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4131, 1239, 4921, '6.00', '6.00', 'Porcion de Chaufa', 1, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4132, 1239, 4922, '25.00', '25.00', 'Chicken Fried Chicken', 1, '0.00', '18.00', '0.00', '25.00', '25.00', NULL),
(4133, 1239, 4926, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4134, 1239, 4927, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4135, 1239, 4934, '21.00', '21.00', 'Alitas Bufalo + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4136, 1239, 4938, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4137, 1239, 4953, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4138, 1239, 4954, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4139, 1239, 4992, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4140, 1239, 5051, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4141, 1239, 5066, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4142, 1239, 5068, '45.00', '45.00', 'Balde de Stella Artois ', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4143, 1240, 4943, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4144, 1240, 4957, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4145, 1240, 4973, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4146, 1240, 4997, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4147, 1241, 4947, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4148, 1241, 4948, '16.00', '16.00', 'Pechuga de Pollo + papas + ensalada', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4149, 1241, 4949, '20.00', '20.00', 'Pechuga de Pollo + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4150, 1241, 4983, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4151, 1241, 5012, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4152, 1241, 5026, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4153, 1241, 5055, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4154, 1242, 5072, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4155, 1243, 5073, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4156, 1244, 4929, '20.00', '20.00', 'Pechuga de Pollo + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4157, 1244, 4930, '10.00', '10.00', 'Tequeños (6 und)', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4158, 1244, 4931, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4159, 1244, 5001, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4160, 1245, 5071, '9.00', '9.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4161, 1246, 4914, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4162, 1247, 5079, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4163, 1248, 5080, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4164, 1249, 5082, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4165, 1249, 5081, '15.00', '15.00', 'Salchichapa Regional', 1, '0.00', '18.00', '0.00', '15.00', '15.00', NULL),
(4166, 1250, 5083, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4167, 1251, 5087, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4168, 1252, 5085, '20.00', '20.00', 'Chaufa Regional', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4169, 1252, 5086, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4170, 1252, 5084, '21.00', '21.00', 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4171, 1253, 5089, '20.00', '20.00', 'Chaufa Regional', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4172, 1253, 5090, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4173, 1253, 5088, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4174, 1253, 5091, '3.00', '3.00', 'Vaso de Refresco', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4175, 1253, 5092, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4176, 1254, 5101, '20.00', '20.00', 'Chaufa Regional', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4177, 1254, 5100, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4178, 1255, 5106, '20.00', '20.00', 'Chaufa Regional', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4179, 1255, 5108, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4180, 1255, 5109, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4181, 1256, 5094, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4182, 1256, 5095, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4183, 1256, 5093, '17.00', '17.00', 'Alitas Acevichadas + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4184, 1256, 5097, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4185, 1256, 5098, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4186, 1256, 5096, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4187, 1256, 5099, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4188, 1256, 5102, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4189, 1256, 5103, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4190, 1256, 5104, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4191, 1256, 5105, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4192, 1256, 5107, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4193, 1256, 5110, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4194, 1256, 5111, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4195, 1256, 5112, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4196, 1256, 5113, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4197, 1256, 5114, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4198, 1257, 5122, '16.00', '16.00', 'Salchipapa Balconcito', 2, '0.00', '18.00', '0.00', '32.00', '32.00', NULL),
(4199, 1257, 5123, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4200, 1257, 5125, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4201, 1258, 5117, '20.00', '20.00', 'Pechuga de Pollo + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4202, 1258, 5120, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4203, 1258, 5118, '6.00', '6.00', 'Porcion de Chaufa', 1, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4204, 1258, 5116, '35.00', '35.00', 'Ronda de Alitas Balconcito', 2, '0.00', '18.00', '0.00', '70.00', '70.00', NULL),
(4205, 1258, 5119, '10.00', '10.00', 'Gaseosa Inca Kola de 1.5L', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4206, 1259, 5115, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4207, 1259, 5121, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4208, 1259, 5124, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4209, 1259, 5126, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4210, 1259, 5127, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4211, 1260, 5133, '8.00', '8.00', 'Corona', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4212, 1261, 5129, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4213, 1261, 5130, '8.00', '8.00', 'Stella Artois', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4214, 1261, 5128, '16.00', '16.00', 'Pechuga de Pollo + papas + ensalada', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4215, 1261, 5131, '3.00', '3.00', 'Agua', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4216, 1262, 5140, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4217, 1262, 5139, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4218, 1262, 5147, '8.00', '8.00', 'Stella Artois', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4219, 1263, 5132, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4220, 1263, 5134, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4221, 1263, 5135, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4222, 1263, 5136, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4223, 1263, 5137, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4224, 1263, 5138, '17.00', '17.00', 'Alitas Crispy + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4225, 1263, 5141, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4226, 1263, 5142, '20.00', '20.00', 'Chaufa Regional', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4227, 1263, 5143, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4228, 1263, 5144, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4229, 1264, 5146, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 2, '0.00', '18.00', '0.00', '34.00', '34.00', NULL),
(4230, 1264, 5148, '10.00', '10.00', 'Jarra de Refresco', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4231, 1265, 5153, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4232, 1266, 5149, '70.00', '70.00', 'Combo Balconcito (Ronda de Alitas + Balde de Corona)', 1, '0.00', '18.00', '0.00', '70.00', '70.00', NULL),
(4233, 1266, 5151, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4234, 1266, 5150, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4235, 1266, 5152, '4.00', '4.00', 'Papas fritas', 1, '0.00', '18.00', '0.00', '4.00', '4.00', NULL),
(4236, 1267, 5154, '25.00', '25.00', 'Nuevo-BBQ CHICKEN SALAD', 1, '0.00', '18.00', '0.00', '25.00', '25.00', NULL),
(4237, 1267, 5157, '20.00', '20.00', 'Pechuga de Pollo + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4238, 1267, 5155, '17.00', '17.00', 'Alitas Acevichadas + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4239, 1267, 5156, '10.00', '10.00', 'Gaseosa Inca Kola de 1.5L', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4240, 1268, 5158, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4241, 1269, 5159, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4242, 1270, 5160, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4243, 1271, 5166, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4244, 1271, 5167, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4245, 1272, 5161, '16.00', '16.00', 'Pechuga de Pollo + papas + ensalada', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4246, 1272, 5162, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4247, 1272, 5163, '4.00', '4.00', 'Papas fritas', 1, '0.00', '18.00', '0.00', '4.00', '4.00', NULL),
(4248, 1272, 5164, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4249, 1272, 5165, '15.00', '15.00', 'Salchichapa Regional', 1, '0.00', '18.00', '0.00', '15.00', '15.00', NULL),
(4250, 1273, 5174, '10.00', '10.00', 'Jarra de Refresco', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4251, 1273, 5172, '21.00', '21.00', 'Alitas Acevichadas + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4252, 1273, 5173, '20.00', '20.00', 'Anticucho + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4253, 1274, 5168, '17.00', '17.00', 'Alitas Acevichadas + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4254, 1274, 5171, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4255, 1274, 5169, '20.00', '20.00', 'Chaufa Regional', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4256, 1274, 5170, '25.00', '25.00', 'Chicken Fried Chicken SALAD', 1, '0.00', '18.00', '0.00', '25.00', '25.00', NULL),
(4257, 1274, 5175, '8.00', '8.00', 'Corona', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4258, 1275, 5181, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4259, 1276, 5176, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4260, 1276, 5177, '35.00', '35.00', 'Ronda de Alitas Balconcito', 1, '0.00', '18.00', '0.00', '35.00', '35.00', NULL),
(4261, 1276, 5178, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4262, 1276, 5179, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4263, 1276, 5180, '4.00', '4.00', 'Papas fritas', 1, '0.00', '18.00', '0.00', '4.00', '4.00', NULL),
(4264, 1277, 5182, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4265, 1278, 5184, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4266, 1278, 5185, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4267, 1278, 5183, '10.00', '10.00', 'Gaseosa Inca Kola de 1.5L', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4268, 1279, 5189, '20.00', '20.00', 'Chaufa Regional', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4269, 1280, 5186, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4270, 1280, 5187, '16.00', '16.00', 'Anticucho + papas + ensalada', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4271, 1280, 5188, '10.00', '10.00', 'Jarra de Refresco', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4272, 1281, 5190, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4273, 1281, 5191, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4274, 1282, 5192, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4275, 1282, 5195, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 3, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4276, 1282, 5193, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4277, 1282, 5194, '16.00', '16.00', 'Brochetas + papas + ensalada', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4278, 1282, 5213, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4279, 1283, 5214, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4280, 1284, 5207, '20.00', '20.00', 'Pechuga de Pollo + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4281, 1284, 5212, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4282, 1285, 5220, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4283, 1286, 5196, '14.00', '14.00', 'Salchichapa Mixta', 1, '0.00', '18.00', '0.00', '14.00', '14.00', NULL),
(4284, 1286, 5197, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4285, 1287, 5208, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4286, 1287, 5209, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4287, 1287, 5210, '10.00', '10.00', 'Tequeños (6 und)', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4288, 1287, 5217, '4.00', '4.00', 'Papas fritas', 1, '0.00', '18.00', '0.00', '4.00', '4.00', NULL),
(4289, 1287, 5221, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4290, 1288, 5199, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4291, 1288, 5203, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4292, 1288, 5201, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4293, 1288, 5206, '14.00', '14.00', 'Salchichapa Mixta', 1, '0.00', '18.00', '0.00', '14.00', '14.00', NULL),
(4294, 1288, 5202, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4295, 1288, 5216, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4296, 1288, 5222, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4297, 1288, 5223, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4298, 1288, 5224, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4299, 1288, 5225, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4300, 1288, 5226, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4301, 1288, 5232, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4302, 1288, 5231, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4303, 1288, 5233, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4304, 1288, 5234, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4305, 1288, 5235, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4306, 1288, 5236, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4307, 1289, 5227, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4308, 1289, 5230, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4309, 1289, 5228, '16.00', '16.00', 'Tequeños (12 und)', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4310, 1289, 5229, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4311, 1290, 5198, '16.00', '16.00', 'Tequeños (12 und)', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4312, 1290, 5211, '6.00', '6.00', 'Porcion de Chaufa', 1, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4313, 1290, 5218, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4314, 1290, 5219, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4315, 1291, 5237, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4316, 1291, 5238, '8.00', '8.00', 'Corona', 5, '0.00', '18.00', '0.00', '40.00', '40.00', NULL),
(4317, 1291, 5239, '8.00', '8.00', 'Stella Artois', 5, '0.00', '18.00', '0.00', '40.00', '40.00', NULL),
(4318, 1292, 5242, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4319, 1292, 5240, '14.00', '14.00', 'Salchichapa Mixta', 1, '0.00', '18.00', '0.00', '14.00', '14.00', NULL),
(4320, 1292, 5243, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4321, 1292, 5241, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4322, 1292, 5244, '6.00', '6.00', 'Porcion de Chaufa', 1, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4323, 1292, 5245, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4324, 1293, 5246, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4325, 1294, 5250, '20.00', '20.00', 'Anticucho + papas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4326, 1295, 5254, '15.00', '15.00', 'Chaufa de Pollo', 1, '0.00', '18.00', '0.00', '15.00', '15.00', NULL),
(4327, 1296, 5271, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4328, 1297, 5281, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4329, 1297, 5280, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4330, 1298, 5272, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4331, 1299, 5292, '8.00', '8.00', 'Cristal 650ml', 3, '0.00', '18.00', '0.00', '24.00', '24.00', NULL),
(4332, 1300, 5293, '8.00', '8.00', 'Cristal 650ml', 3, '0.00', '18.00', '0.00', '24.00', '24.00', NULL),
(4333, 1301, 5294, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4334, 1302, 5295, '45.00', '45.00', 'Balde de Corona', 2, '0.00', '18.00', '0.00', '90.00', '90.00', NULL),
(4335, 1303, 5297, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4336, 1304, 5308, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4337, 1305, 5310, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4338, 1306, 5311, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4339, 1307, 5312, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4340, 1307, 5313, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4341, 1308, 5314, '45.00', '45.00', 'Balde de Corona', 2, '0.00', '18.00', '0.00', '90.00', '90.00', NULL),
(4342, 1309, 5316, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4343, 1310, 5296, '8.00', '8.00', 'Cristal 650ml', 3, '0.00', '18.00', '0.00', '24.00', '24.00', NULL),
(4344, 1311, 5319, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4345, 1311, 5320, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4346, 1312, 5323, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4347, 1313, 5324, '8.00', '8.00', 'Corona', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4348, 1314, 5328, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4349, 1315, 5330, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4350, 1316, 5286, '8.00', '8.00', 'Stella Artois', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL);
INSERT INTO `ventas_detalle` (`id_venta_detalle`, `id_venta`, `id_comanda_detalle`, `venta_detalle_valor_unitario`, `venta_detalle_precio_unitario`, `venta_detalle_nombre_producto`, `venta_detalle_cantidad`, `venta_detalle_total_igv`, `venta_detalle_porcentaje_igv`, `venta_detalle_total_icbper`, `venta_detalle_valor_total`, `venta_detalle_importe_total`, `id_producto_precio`) VALUES
(4351, 1316, 5285, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4352, 1316, 5304, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4353, 1316, 5302, '15.00', '15.00', 'Chaufa de Pollo', 1, '0.00', '18.00', '0.00', '15.00', '15.00', NULL),
(4354, 1316, 5303, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4355, 1316, 5305, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4356, 1316, 5306, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4357, 1316, 5315, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4358, 1316, 5321, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4359, 1316, 5322, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4360, 1316, 5327, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4361, 1316, 5337, '8.00', '8.00', 'Corona', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4362, 1317, 5279, '8.00', '8.00', 'Corona', 5, '0.00', '18.00', '0.00', '40.00', '40.00', NULL),
(4363, 1317, 5298, '8.00', '8.00', 'Corona', 4, '0.00', '18.00', '0.00', '32.00', '32.00', NULL),
(4364, 1318, 5263, '25.00', '25.00', 'Nuevo-BBQ CHICKEN SALAD', 1, '0.00', '18.00', '0.00', '25.00', '25.00', NULL),
(4365, 1318, 5264, '4.00', '4.00', 'Papas fritas', 1, '0.00', '18.00', '0.00', '4.00', '4.00', NULL),
(4366, 1318, 5262, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4367, 1318, 5265, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4368, 1318, 5284, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4369, 1318, 5309, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4370, 1318, 5325, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4371, 1319, 5332, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4372, 1319, 5331, '8.00', '8.00', 'Cristal 650ml', 2, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4373, 1319, 5336, '8.00', '8.00', 'Corona', 4, '0.00', '18.00', '0.00', '32.00', '32.00', NULL),
(4374, 1320, 5340, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4375, 1321, 5251, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4376, 1321, 5282, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4377, 1322, 5341, '3.00', '3.00', 'Vaso de Refresco', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4378, 1323, 5248, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4379, 1323, 5252, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4380, 1323, 5307, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4381, 1323, 5318, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4382, 1323, 5343, '8.00', '8.00', 'Corona', 3, '0.00', '18.00', '0.00', '24.00', '24.00', NULL),
(4383, 1324, 5249, '70.00', '70.00', 'Combo Balconcito (Ronda de Alitas + Balde de Corona)', 1, '0.00', '18.00', '0.00', '70.00', '70.00', NULL),
(4384, 1324, 5253, '70.00', '70.00', 'Combo Balconcito (Ronda de Alitas + Balde de Corona)', 1, '0.00', '18.00', '0.00', '70.00', '70.00', NULL),
(4385, 1324, 5287, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4386, 1325, 5342, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4387, 1326, 5260, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4388, 1326, 5276, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4389, 1326, 5277, '8.00', '8.00', 'Corona', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4390, 1326, 5283, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4391, 1327, 5344, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4392, 1328, 5347, '8.00', '8.00', 'Corona', 5, '0.00', '18.00', '0.00', '40.00', '40.00', NULL),
(4393, 1329, 5348, '8.00', '8.00', 'Corona', 3, '0.00', '18.00', '0.00', '24.00', '24.00', NULL),
(4394, 1330, 5333, '8.00', '8.00', 'Corona', 8, '0.00', '18.00', '0.00', '64.00', '64.00', NULL),
(4395, 1331, 5274, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4396, 1331, 5275, '3.00', '3.00', 'Vaso de Refresco', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4397, 1331, 5273, '16.00', '16.00', 'Tequeños (12 und)', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4398, 1331, 5300, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4399, 1331, 5301, '3.00', '3.00', 'Agua', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4400, 1331, 5299, '16.00', '16.00', 'Tequeños (12 und)', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4401, 1331, 5326, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4402, 1331, 5334, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4403, 1331, 5339, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4404, 1331, 5349, '45.00', '45.00', 'Balde de Corona', 1, '0.00', '18.00', '0.00', '45.00', '45.00', NULL),
(4405, 1332, 5346, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4406, 1332, 5345, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4407, 1333, 5350, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4408, 1334, 5352, '12.00', '12.00', 'Salchichapa Clasica', 3, '0.00', '18.00', '0.00', '36.00', '36.00', NULL),
(4409, 1334, 5353, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 3, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4410, 1335, 5357, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4411, 1336, 5355, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4412, 1336, 5356, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4413, 1337, 5359, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 2, '0.00', '18.00', '0.00', '34.00', '34.00', NULL),
(4414, 1337, 5360, '13.00', '13.00', 'Gaseosa Inca Kola de 2.5L', 1, '0.00', '18.00', '0.00', '13.00', '13.00', NULL),
(4415, 1337, 5358, '14.00', '14.00', 'Salchichapa Mixta', 3, '0.00', '18.00', '0.00', '42.00', '42.00', NULL),
(4416, 1337, 5361, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4417, 1337, 5364, '6.00', '6.00', 'Porcion de Chaufa', 1, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4418, 1338, 5369, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4419, 1339, 5363, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4420, 1339, 5362, '7.00', '7.00', 'Cusqueña Trigo', 1, '0.00', '18.00', '0.00', '7.00', '7.00', NULL),
(4421, 1339, 5367, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4422, 1339, 5365, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4423, 1339, 5366, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4424, 1339, 5368, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4425, 1340, 5370, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4426, 1341, 5375, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4427, 1341, 5374, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4428, 1341, 5378, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4429, 1342, 5379, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4430, 1343, 5381, '10.00', '10.00', 'Cusqueña Trigo 620ml', 1, '0.00', '18.00', '0.00', '10.00', '10.00', NULL),
(4431, 1343, 5384, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4432, 1343, 5382, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4433, 1343, 5385, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4434, 1343, 5380, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4435, 1343, 5383, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4436, 1344, 5386, '8.00', '8.00', 'Cristal 650ml', 1, '0.00', '18.00', '0.00', '8.00', '8.00', NULL),
(4437, 1345, 5390, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4438, 1345, 5393, '14.00', '14.00', 'Salchichapa Mixta', 2, '0.00', '18.00', '0.00', '28.00', '28.00', NULL),
(4439, 1345, 5388, '13.00', '13.00', 'Gaseosa Inca Kola de 2.5L', 1, '0.00', '18.00', '0.00', '13.00', '13.00', NULL),
(4440, 1345, 5391, '6.00', '6.00', 'Porcion de Chaufa', 1, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4441, 1345, 5389, '14.00', '14.00', 'Salchichapa Mixta', 1, '0.00', '18.00', '0.00', '14.00', '14.00', NULL),
(4442, 1345, 5392, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4443, 1345, 5387, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4444, 1346, 5372, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4445, 1346, 5371, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4446, 1347, 5395, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4447, 1347, 5394, '21.00', '21.00', 'Alitas BBQ + papas fritas + ensalada + chaufa', 1, '0.00', '18.00', '0.00', '21.00', '21.00', NULL),
(4448, 1348, 5397, '12.00', '12.00', 'Salchichapa Clasica', 2, '0.00', '18.00', '0.00', '24.00', '24.00', NULL),
(4449, 1348, 5398, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 3, '0.00', '18.00', '0.00', '9.00', '9.00', NULL),
(4450, 1348, 5396, '12.00', '12.00', 'Salchichapa Clasica', 1, '0.00', '18.00', '0.00', '12.00', '12.00', NULL),
(4451, 1349, 5399, '3.00', '3.00', 'Gaseosa Coca Cola de 500ml', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4452, 1350, 5376, '17.00', '17.00', 'Alitas BBQ + papas fritas + ensalada', 1, '0.00', '18.00', '0.00', '17.00', '17.00', NULL),
(4453, 1350, 5377, '8.00', '8.00', 'Cristal 650ml', 4, '0.00', '18.00', '0.00', '32.00', '32.00', NULL),
(4454, 1351, 5400, '10.00', '10.00', 'Cusqueña Trigo 620ml', 2, '0.00', '18.00', '0.00', '20.00', '20.00', NULL),
(4455, 1352, 5401, '16.00', '16.00', 'Salchipapa Balconcito', 1, '0.00', '18.00', '0.00', '16.00', '16.00', NULL),
(4456, 1352, 5402, '3.00', '3.00', 'Gaseosa Inca Kola de 500ml', 2, '0.00', '18.00', '0.00', '6.00', '6.00', NULL),
(4457, 1353, 5373, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL),
(4458, 1354, 5403, '3.00', '3.00', 'Agua', 1, '0.00', '18.00', '0.00', '3.00', '3.00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalle_pagos`
--

CREATE TABLE `ventas_detalle_pagos` (
  `id_venta_detalle_pago` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_tipo_pago` int(11) NOT NULL,
  `venta_detalle_pago_monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `venta_detalle_pago_estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas_detalle_pagos`
--

INSERT INTO `ventas_detalle_pagos` (`id_venta_detalle_pago`, `id_venta`, `id_tipo_pago`, `venta_detalle_pago_monto`, `venta_detalle_pago_estado`) VALUES
(1158, 1160, 3, '3.00', 1),
(1159, 1161, 3, '19.00', 1),
(1160, 1162, 3, '50.00', 1),
(1161, 1163, 3, '129.00', 1),
(1162, 1164, 3, '50.00', 1),
(1163, 1165, 1, '167.00', 1),
(1164, 1166, 3, '59.00', 1),
(1165, 1167, 3, '142.00', 1),
(1166, 1168, 3, '8.00', 1),
(1167, 1169, 3, '58.00', 1),
(1168, 1170, 3, '28.00', 1),
(1169, 1171, 3, '8.00', 1),
(1170, 1172, 3, '8.00', 1),
(1171, 1173, 3, '8.00', 1),
(1172, 1174, 3, '8.00', 1),
(1173, 1175, 3, '38.00', 1),
(1174, 1176, 3, '3.00', 1),
(1175, 1177, 3, '47.00', 1),
(1176, 1178, 1, '14.00', 1),
(1177, 1179, 3, '16.00', 1),
(1178, 1180, 3, '3.00', 1),
(1179, 1181, 3, '85.00', 1),
(1180, 1182, 3, '16.00', 1),
(1181, 1183, 3, '3.00', 1),
(1182, 1184, 3, '16.00', 1),
(1183, 1185, 3, '60.00', 1),
(1184, 1186, 3, '74.00', 1),
(1185, 1187, 3, '24.00', 1),
(1186, 1188, 3, '16.00', 1),
(1187, 1189, 3, '56.00', 1),
(1188, 1190, 3, '94.00', 1),
(1189, 1191, 1, '22.00', 1),
(1190, 1192, 3, '16.00', 1),
(1191, 1193, 1, '49.00', 1),
(1192, 1194, 3, '8.00', 1),
(1193, 1195, 1, '3.00', 1),
(1194, 1196, 3, '126.00', 1),
(1195, 1197, 3, '40.00', 1),
(1196, 1198, 1, '23.00', 1),
(1197, 1199, 1, '56.00', 1),
(1198, 1200, 3, '40.00', 1),
(1199, 1201, 3, '8.00', 1),
(1200, 1202, 3, '16.00', 1),
(1201, 1203, 3, '3.00', 1),
(1202, 1204, 3, '30.00', 1),
(1203, 1205, 1, '60.00', 1),
(1204, 1206, 1, '54.00', 1),
(1205, 1207, 3, '45.00', 1),
(1206, 1208, 3, '18.00', 1),
(1207, 1209, 3, '58.00', 1),
(1208, 1210, 3, '381.00', 1),
(1209, 1211, 3, '51.00', 1),
(1210, 1212, 3, '45.00', 1),
(1211, 1213, 3, '3.00', 1),
(1212, 1214, 3, '10.00', 1),
(1213, 1215, 3, '48.00', 1),
(1214, 1216, 3, '18.00', 1),
(1215, 1217, 3, '55.00', 1),
(1216, 1218, 3, '16.00', 1),
(1217, 1219, 3, '3.00', 1),
(1218, 1220, 3, '45.00', 1),
(1219, 1221, 3, '45.00', 1),
(1220, 1222, 3, '90.00', 1),
(1221, 1223, 3, '46.00', 1),
(1222, 1224, 3, '3.00', 1),
(1223, 1225, 3, '60.00', 1),
(1224, 1226, 3, '18.00', 1),
(1225, 1228, 3, '64.00', 1),
(1226, 1229, 3, '10.00', 1),
(1227, 1230, 1, '98.00', 1),
(1228, 1231, 3, '40.00', 1),
(1229, 1232, 1, '63.00', 1),
(1230, 1233, 3, '64.00', 1),
(1231, 1234, 3, '74.00', 1),
(1232, 1235, 3, '48.00', 1),
(1233, 1236, 3, '90.00', 1),
(1234, 1237, 3, '162.00', 1),
(1235, 1238, 3, '45.00', 1),
(1236, 1239, 1, '245.00', 1),
(1237, 1240, 3, '102.00', 1),
(1238, 1241, 1, '99.00', 1),
(1239, 1242, 1, '45.00', 1),
(1240, 1243, 3, '9.00', 1),
(1241, 1244, 3, '78.00', 1),
(1242, 1245, 3, '9.00', 1),
(1243, 1246, 3, '8.00', 1),
(1244, 1247, 3, '3.00', 1),
(1245, 1248, 3, '3.00', 1),
(1246, 1249, 3, '27.00', 1),
(1247, 1250, 3, '12.00', 1),
(1248, 1251, 3, '3.00', 1),
(1249, 1252, 3, '57.00', 1),
(1250, 1253, 3, '47.00', 1),
(1251, 1254, 3, '36.00', 1),
(1252, 1255, 1, '36.00', 1),
(1253, 1256, 3, '140.00', 1),
(1254, 1257, 3, '48.00', 1),
(1255, 1258, 3, '109.00', 1),
(1256, 1259, 3, '42.00', 1),
(1257, 1260, 3, '16.00', 1),
(1258, 1261, 3, '55.00', 1),
(1259, 1262, 3, '23.00', 1),
(1260, 1263, 3, '100.00', 1),
(1261, 1264, 3, '44.00', 1),
(1262, 1265, 3, '3.00', 1),
(1263, 1266, 3, '80.00', 1),
(1264, 1267, 3, '72.00', 1),
(1265, 1268, 3, '3.00', 1),
(1266, 1269, 3, '8.00', 1),
(1267, 1270, 3, '8.00', 1),
(1268, 1271, 2, '15.00', 1),
(1269, 1272, 3, '41.00', 1),
(1270, 1273, 3, '51.00', 1),
(1271, 1274, 3, '84.00', 1),
(1272, 1275, 3, '3.00', 1),
(1273, 1276, 3, '61.00', 1),
(1274, 1277, 3, '8.00', 1),
(1275, 1278, 3, '16.00', 1),
(1276, 1279, 3, '20.00', 1),
(1277, 1280, 3, '38.00', 1),
(1278, 1281, 3, '15.00', 1),
(1279, 1282, 3, '66.00', 1),
(1280, 1283, 3, '21.00', 1),
(1281, 1284, 3, '23.00', 1),
(1282, 1285, 3, '17.00', 1),
(1283, 1286, 3, '17.00', 1),
(1284, 1287, 1, '37.00', 1),
(1285, 1288, 3, '254.00', 1),
(1286, 1289, 3, '34.00', 1),
(1287, 1290, 3, '28.00', 1),
(1288, 1291, 1, '125.00', 1),
(1289, 1292, 1, '57.00', 1),
(1290, 1293, 3, '17.00', 1),
(1291, 1294, 3, '20.00', 1),
(1292, 1295, 3, '15.00', 1),
(1293, 1296, 3, '16.00', 1),
(1294, 1297, 3, '19.00', 1),
(1295, 1298, 3, '45.00', 1),
(1296, 1299, 3, '24.00', 1),
(1297, 1300, 3, '24.00', 1),
(1298, 1301, 3, '3.00', 1),
(1299, 1302, 3, '90.00', 1),
(1300, 1303, 1, '45.00', 1),
(1301, 1304, 3, '3.00', 1),
(1302, 1305, 3, '45.00', 1),
(1303, 1306, 3, '45.00', 1),
(1304, 1307, 1, '36.00', 1),
(1305, 1308, 1, '90.00', 1),
(1306, 1309, 3, '45.00', 1),
(1307, 1310, 3, '24.00', 1),
(1308, 1311, 1, '36.00', 1),
(1309, 1312, 3, '3.00', 1),
(1310, 1313, 1, '16.00', 1),
(1311, 1314, 3, '3.00', 1),
(1312, 1315, 3, '45.00', 1),
(1313, 1316, 3, '104.00', 1),
(1314, 1317, 3, '72.00', 1),
(1315, 1318, 1, '225.00', 1),
(1316, 1319, 3, '68.00', 1),
(1317, 1320, 3, '10.00', 1),
(1318, 1321, 3, '24.00', 1),
(1319, 1322, 3, '3.00', 1),
(1320, 1323, 3, '120.00', 1),
(1321, 1324, 1, '143.00', 1),
(1322, 1325, 3, '3.00', 1),
(1323, 1326, 3, '22.00', 1),
(1324, 1327, 3, '10.00', 1),
(1325, 1328, 3, '40.00', 1),
(1326, 1329, 3, '24.00', 1),
(1327, 1330, 3, '64.00', 1),
(1328, 1331, 1, '272.00', 1),
(1329, 1332, 3, '28.00', 1),
(1330, 1333, 3, '3.00', 1),
(1331, 1334, 3, '45.00', 1),
(1332, 1335, 3, '3.00', 1),
(1333, 1336, 3, '24.00', 1),
(1334, 1337, 3, '115.00', 1),
(1335, 1338, 3, '8.00', 1),
(1336, 1339, 3, '62.00', 1),
(1337, 1340, 3, '3.00', 1),
(1338, 1341, 3, '26.00', 1),
(1339, 1342, 3, '6.00', 1),
(1340, 1343, 3, '65.00', 1),
(1341, 1344, 3, '8.00', 1),
(1342, 1345, 3, '115.00', 1),
(1343, 1346, 3, '41.00', 1),
(1344, 1347, 3, '24.00', 1),
(1345, 1348, 3, '45.00', 1),
(1346, 1349, 3, '3.00', 1),
(1347, 1350, 3, '49.00', 1),
(1348, 1351, 3, '20.00', 1),
(1349, 1352, 3, '22.00', 1),
(1350, 1353, 3, '3.00', 1),
(1351, 1354, 3, '3.00', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`id_almacen`),
  ADD KEY `id_negocio` (`id_negocio`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `id_persona_turno` (`id_persona_turno`);

--
-- Indices de la tabla `asistencia_fecha`
--
ALTER TABLE `asistencia_fecha`
  ADD PRIMARY KEY (`id_asistencia_fecha`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `caja_numero`
--
ALTER TABLE `caja_numero`
  ADD PRIMARY KEY (`id_caja_numero`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `categorias_negocio`
--
ALTER TABLE `categorias_negocio`
  ADD PRIMARY KEY (`id_categoria_negocio`),
  ADD KEY `id_negocio` (`id_negocio`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`id_comanda`),
  ADD KEY `id_mesa` (`id_mesa`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `comanda_detalle`
--
ALTER TABLE `comanda_detalle`
  ADD PRIMARY KEY (`id_comanda_detalle`),
  ADD KEY `id_comanda` (`id_comanda`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `conversiones`
--
ALTER TABLE `conversiones`
  ADD PRIMARY KEY (`id_conversion`),
  ADD KEY `id_recurso_sede` (`id_recurso_sede`),
  ADD KEY `conversion_unidad_medida` (`conversion_unidad_medida`);

--
-- Indices de la tabla `correlativos`
--
ALTER TABLE `correlativos`
  ADD PRIMARY KEY (`id_correlativo`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_detalle_compra`),
  ADD KEY `id_orden_compra` (`id_orden_compra`),
  ADD KEY `id_recurso_sede` (`id_recurso_sede`);

--
-- Indices de la tabla `detalle_recetas`
--
ALTER TABLE `detalle_recetas`
  ADD PRIMARY KEY (`id_detalle_receta`),
  ADD KEY `id_receta` (`id_receta`),
  ADD KEY `id_recursos_sede` (`id_recursos_sede`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `envio_resumen`
--
ALTER TABLE `envio_resumen`
  ADD PRIMARY KEY (`id_envio_resumen`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `envio_resumen_detalle`
--
ALTER TABLE `envio_resumen_detalle`
  ADD PRIMARY KEY (`id_envio_resumen_detalle`),
  ADD KEY `id_envio_resumen` (`id_envio_resumen`);

--
-- Indices de la tabla `feriados`
--
ALTER TABLE `feriados`
  ADD PRIMARY KEY (`id_feriado`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indices de la tabla `igv`
--
ALTER TABLE `igv`
  ADD PRIMARY KEY (`id_igv`);

--
-- Indices de la tabla `memorandum`
--
ALTER TABLE `memorandum`
  ADD PRIMARY KEY (`id_memorandum`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id_mesa`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`id_moneda`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `negocios`
--
ALTER TABLE `negocios`
  ADD PRIMARY KEY (`id_negocio`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `nota_venta`
--
ALTER TABLE `nota_venta`
  ADD PRIMARY KEY (`id_nota_venta`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_mesa` (`id_mesa`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_tipo_pago` (`id_tipo_pago`),
  ADD KEY `id_moneda` (`id_moneda`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `nota_venta_detalle`
--
ALTER TABLE `nota_venta_detalle`
  ADD PRIMARY KEY (`id_nota_venta_detalle`),
  ADD KEY `id_nota_venta` (`id_nota_venta`),
  ADD KEY `id_comanda_detalle` (`id_comanda_detalle`);

--
-- Indices de la tabla `obligacion_pagar`
--
ALTER TABLE `obligacion_pagar`
  ADD PRIMARY KEY (`id_obligacion`);

--
-- Indices de la tabla `obligacion_personal`
--
ALTER TABLE `obligacion_personal`
  ADD PRIMARY KEY (`id_obligacionper`),
  ADD KEY `id_obligacion` (`id_obligacion`),
  ADD KEY `id_periodo` (`id_periodo`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`id_opcion`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indices de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`id_orden_compra`),
  ADD KEY `id_solicitante` (`id_solicitante`),
  ADD KEY `id_tipo_pago` (`id_tipo_pago`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `pedidos_gratis`
--
ALTER TABLE `pedidos_gratis`
  ADD PRIMARY KEY (`id_pedido_gratis`),
  ADD KEY `id_mesa` (`id_mesa`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pedidos_gratis_detalles`
--
ALTER TABLE `pedidos_gratis_detalles`
  ADD PRIMARY KEY (`id_pedido_gratis_detalle`),
  ADD KEY `id_pedido_gratis` (`id_pedido_gratis`),
  ADD KEY `id_comanda_detalle` (`id_comanda_detalle`);

--
-- Indices de la tabla `periodo_laboral`
--
ALTER TABLE `periodo_laboral`
  ADD PRIMARY KEY (`id_periodo`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_contrato` (`id_contrato`),
  ADD KEY `id_cargo` (`id_cargo`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_sede` (`id_sede`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `id_opcion` (`id_opcion`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `persona_turno`
--
ALTER TABLE `persona_turno`
  ADD PRIMARY KEY (`id_persona_turno`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_turno` (`id_turno`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_grupo` (`id_grupo`),
  ADD KEY `id_receta` (`id_receta`);

--
-- Indices de la tabla `producto_familia`
--
ALTER TABLE `producto_familia`
  ADD PRIMARY KEY (`id_producto_familia`);

--
-- Indices de la tabla `producto_precio`
--
ALTER TABLE `producto_precio`
  ADD PRIMARY KEY (`id_producto_precio`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_unidad_medida` (`id_unidad_medida`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_negocio` (`id_negocio`),
  ADD KEY `id_tipodocumento` (`id_tipodocumento`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`id_recurso`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `recursos_sede`
--
ALTER TABLE `recursos_sede`
  ADD PRIMARY KEY (`id_recurso_sede`),
  ADD KEY `id_medida` (`id_medida`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `id_recurso` (`id_recurso`);

--
-- Indices de la tabla `registro_asistencias`
--
ALTER TABLE `registro_asistencias`
  ADD PRIMARY KEY (`id_registro`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`);

--
-- Indices de la tabla `restricciones`
--
ALTER TABLE `restricciones`
  ADD PRIMARY KEY (`id_restriccion`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_opcion` (`id_opcion`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `roles_menus`
--
ALTER TABLE `roles_menus`
  ADD PRIMARY KEY (`id_rol_menu`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indices de la tabla `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`id_serie`) USING BTREE;

--
-- Indices de la tabla `sub_recetas`
--
ALTER TABLE `sub_recetas`
  ADD PRIMARY KEY (`id_sub_receta`),
  ADD KEY `id_receta` (`id_receta`),
  ADD KEY `id_receta_2` (`id_receta_2`),
  ADD KEY `id_medida` (`id_medida`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD KEY `id_ciudad` (`id_ciudad`),
  ADD KEY `id_negocio` (`id_negocio`);

--
-- Indices de la tabla `tipoadjuntos`
--
ALTER TABLE `tipoadjuntos`
  ADD PRIMARY KEY (`id_adjunto`);

--
-- Indices de la tabla `tipocargo`
--
ALTER TABLE `tipocargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `tipocontrato`
--
ALTER TABLE `tipocontrato`
  ADD PRIMARY KEY (`id_contrato`);

--
-- Indices de la tabla `tipodepartamento`
--
ALTER TABLE `tipodepartamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `tiposede`
--
ALTER TABLE `tiposede`
  ADD PRIMARY KEY (`id_sede`);

--
-- Indices de la tabla `tipo_afectacion`
--
ALTER TABLE `tipo_afectacion`
  ADD PRIMARY KEY (`id_tipo_afectacion`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`id_tipodocumento`);

--
-- Indices de la tabla `tipo_ncreditos`
--
ALTER TABLE `tipo_ncreditos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_ndebitos`
--
ALTER TABLE `tipo_ndebitos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id_tipo_pago`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id_medida`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `usuarios_negocio`
--
ALTER TABLE `usuarios_negocio`
  ADD PRIMARY KEY (`id_usuario_negocio`),
  ADD KEY `id_negocio` (`id_negocio`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios_sucursal`
--
ALTER TABLE `usuarios_sucursal`
  ADD PRIMARY KEY (`id_usuario_sucursal`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_moneda` (`id_moneda`),
  ADD KEY `id_mesa` (`id_mesa`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_tipo_pago` (`id_tipo_pago`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `ventas_anulados`
--
ALTER TABLE `ventas_anulados`
  ADD PRIMARY KEY (`id_venta_anulado`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `ventas_cuotas`
--
ALTER TABLE `ventas_cuotas`
  ADD PRIMARY KEY (`id_ventas_cuotas`),
  ADD KEY `id_ventas` (`id_ventas`),
  ADD KEY `id_tipo_pago` (`id_tipo_pago`);

--
-- Indices de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD PRIMARY KEY (`id_venta_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_comanda_detalle` (`id_comanda_detalle`);

--
-- Indices de la tabla `ventas_detalle_pagos`
--
ALTER TABLE `ventas_detalle_pagos`
  ADD PRIMARY KEY (`id_venta_detalle_pago`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_tipo_pago` (`id_tipo_pago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `id_almacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=359;

--
-- AUTO_INCREMENT de la tabla `asistencia_fecha`
--
ALTER TABLE `asistencia_fecha`
  MODIFY `id_asistencia_fecha` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `caja_numero`
--
ALTER TABLE `caja_numero`
  MODIFY `id_caja_numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `categorias_negocio`
--
ALTER TABLE `categorias_negocio`
  MODIFY `id_categoria_negocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de la tabla `comanda`
--
ALTER TABLE `comanda`
  MODIFY `id_comanda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1562;

--
-- AUTO_INCREMENT de la tabla `comanda_detalle`
--
ALTER TABLE `comanda_detalle`
  MODIFY `id_comanda_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5404;

--
-- AUTO_INCREMENT de la tabla `conversiones`
--
ALTER TABLE `conversiones`
  MODIFY `id_conversion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `correlativos`
--
ALTER TABLE `correlativos`
  MODIFY `id_correlativo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_recetas`
--
ALTER TABLE `detalle_recetas`
  MODIFY `id_detalle_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `envio_resumen`
--
ALTER TABLE `envio_resumen`
  MODIFY `id_envio_resumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `envio_resumen_detalle`
--
ALTER TABLE `envio_resumen_detalle`
  MODIFY `id_envio_resumen_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1272;

--
-- AUTO_INCREMENT de la tabla `feriados`
--
ALTER TABLE `feriados`
  MODIFY `id_feriado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `igv`
--
ALTER TABLE `igv`
  MODIFY `id_igv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `memorandum`
--
ALTER TABLE `memorandum`
  MODIFY `id_memorandum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id_mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `id_moneda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT de la tabla `negocios`
--
ALTER TABLE `negocios`
  MODIFY `id_negocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `nota_venta`
--
ALTER TABLE `nota_venta`
  MODIFY `id_nota_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nota_venta_detalle`
--
ALTER TABLE `nota_venta_detalle`
  MODIFY `id_nota_venta_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `obligacion_pagar`
--
ALTER TABLE `obligacion_pagar`
  MODIFY `id_obligacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `obligacion_personal`
--
ALTER TABLE `obligacion_personal`
  MODIFY `id_obligacionper` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  MODIFY `id_orden_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_gratis`
--
ALTER TABLE `pedidos_gratis`
  MODIFY `id_pedido_gratis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidos_gratis_detalles`
--
ALTER TABLE `pedidos_gratis_detalles`
  MODIFY `id_pedido_gratis_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `periodo_laboral`
--
ALTER TABLE `periodo_laboral`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `persona_turno`
--
ALTER TABLE `persona_turno`
  MODIFY `id_persona_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de la tabla `producto_familia`
--
ALTER TABLE `producto_familia`
  MODIFY `id_producto_familia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `producto_precio`
--
ALTER TABLE `producto_precio`
  MODIFY `id_producto_precio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT de la tabla `recursos`
--
ALTER TABLE `recursos`
  MODIFY `id_recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `recursos_sede`
--
ALTER TABLE `recursos_sede`
  MODIFY `id_recurso_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `registro_asistencias`
--
ALTER TABLE `registro_asistencias`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `restricciones`
--
ALTER TABLE `restricciones`
  MODIFY `id_restriccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles_menus`
--
ALTER TABLE `roles_menus`
  MODIFY `id_rol_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `serie`
--
ALTER TABLE `serie`
  MODIFY `id_serie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `sub_recetas`
--
ALTER TABLE `sub_recetas`
  MODIFY `id_sub_receta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipoadjuntos`
--
ALTER TABLE `tipoadjuntos`
  MODIFY `id_adjunto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `tipocargo`
--
ALTER TABLE `tipocargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipocontrato`
--
ALTER TABLE `tipocontrato`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipodepartamento`
--
ALTER TABLE `tipodepartamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tiposede`
--
ALTER TABLE `tiposede`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `id_tipodocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_ncreditos`
--
ALTER TABLE `tipo_ncreditos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tipo_ndebitos`
--
ALTER TABLE `tipo_ndebitos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id_tipo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id_medida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios_negocio`
--
ALTER TABLE `usuarios_negocio`
  MODIFY `id_usuario_negocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios_sucursal`
--
ALTER TABLE `usuarios_sucursal`
  MODIFY `id_usuario_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1355;

--
-- AUTO_INCREMENT de la tabla `ventas_anulados`
--
ALTER TABLE `ventas_anulados`
  MODIFY `id_venta_anulado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas_cuotas`
--
ALTER TABLE `ventas_cuotas`
  MODIFY `id_ventas_cuotas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  MODIFY `id_venta_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4459;

--
-- AUTO_INCREMENT de la tabla `ventas_detalle_pagos`
--
ALTER TABLE `ventas_detalle_pagos`
  MODIFY `id_venta_detalle_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1352;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD CONSTRAINT `almacenes_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `negocios` (`id_negocio`),
  ADD CONSTRAINT `almacenes_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`id_persona_turno`) REFERENCES `persona_turno` (`id_persona_turno`);

--
-- Filtros para la tabla `categorias_negocio`
--
ALTER TABLE `categorias_negocio`
  ADD CONSTRAINT `categorias_negocio_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `negocios` (`id_negocio`),
  ADD CONSTRAINT `categorias_negocio_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`),
  ADD CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `comanda_detalle`
--
ALTER TABLE `comanda_detalle`
  ADD CONSTRAINT `comanda_detalle_ibfk_1` FOREIGN KEY (`id_comanda`) REFERENCES `comanda` (`id_comanda`),
  ADD CONSTRAINT `comanda_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `conversiones`
--
ALTER TABLE `conversiones`
  ADD CONSTRAINT `conversiones_ibfk_1` FOREIGN KEY (`id_recurso_sede`) REFERENCES `recursos_sede` (`id_recurso_sede`),
  ADD CONSTRAINT `conversiones_ibfk_2` FOREIGN KEY (`conversion_unidad_medida`) REFERENCES `unidad_medida` (`id_medida`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`id_orden_compra`) REFERENCES `orden_compra` (`id_orden_compra`),
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`id_recurso_sede`) REFERENCES `recursos_sede` (`id_recurso_sede`);

--
-- Filtros para la tabla `detalle_recetas`
--
ALTER TABLE `detalle_recetas`
  ADD CONSTRAINT `detalle_recetas_ibfk_1` FOREIGN KEY (`id_recursos_sede`) REFERENCES `recursos_sede` (`id_recurso_sede`),
  ADD CONSTRAINT `detalle_recetas_ibfk_2` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`);

--
-- Filtros para la tabla `memorandum`
--
ALTER TABLE `memorandum`
  ADD CONSTRAINT `memorandum_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `mesas_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `negocios`
--
ALTER TABLE `negocios`
  ADD CONSTRAINT `negocios_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`);

--
-- Filtros para la tabla `obligacion_personal`
--
ALTER TABLE `obligacion_personal`
  ADD CONSTRAINT `obligacion_personal_ibfk_1` FOREIGN KEY (`id_obligacion`) REFERENCES `obligacion_pagar` (`id_obligacion`),
  ADD CONSTRAINT `obligacion_personal_ibfk_2` FOREIGN KEY (`id_periodo`) REFERENCES `periodo_laboral` (`id_periodo`),
  ADD CONSTRAINT `obligacion_personal_ibfk_3` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `opciones_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menus` (`id_menu`);

--
-- Filtros para la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`id_solicitante`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`id_tipo_pago`),
  ADD CONSTRAINT `orden_compra_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `orden_compra_ibfk_4` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `periodo_laboral`
--
ALTER TABLE `periodo_laboral`
  ADD CONSTRAINT `periodo_laboral_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  ADD CONSTRAINT `periodo_laboral_ibfk_2` FOREIGN KEY (`id_contrato`) REFERENCES `tipocontrato` (`id_contrato`),
  ADD CONSTRAINT `periodo_laboral_ibfk_3` FOREIGN KEY (`id_cargo`) REFERENCES `tipocargo` (`id_cargo`),
  ADD CONSTRAINT `periodo_laboral_ibfk_4` FOREIGN KEY (`id_departamento`) REFERENCES `tipodepartamento` (`id_departamento`),
  ADD CONSTRAINT `periodo_laboral_ibfk_5` FOREIGN KEY (`id_sede`) REFERENCES `tiposede` (`id_sede`),
  ADD CONSTRAINT `periodo_laboral_ibfk_6` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id_opcion`) REFERENCES `opciones` (`id_opcion`);

--
-- Filtros para la tabla `persona_turno`
--
ALTER TABLE `persona_turno`
  ADD CONSTRAINT `persona_turno_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  ADD CONSTRAINT `persona_turno_ibfk_2` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`),
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`);

--
-- Filtros para la tabla `producto_precio`
--
ALTER TABLE `producto_precio`
  ADD CONSTRAINT `producto_precio_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `negocios` (`id_negocio`),
  ADD CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`id_tipodocumento`) REFERENCES `tipo_documentos` (`id_tipodocumento`);

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD CONSTRAINT `recursos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `recursos_sede`
--
ALTER TABLE `recursos_sede`
  ADD CONSTRAINT `recursos_sede_ibfk_1` FOREIGN KEY (`id_medida`) REFERENCES `unidad_medida` (`id_medida`),
  ADD CONSTRAINT `recursos_sede_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `recursos_sede_ibfk_3` FOREIGN KEY (`id_recurso`) REFERENCES `recursos` (`id_recurso`);

--
-- Filtros para la tabla `restricciones`
--
ALTER TABLE `restricciones`
  ADD CONSTRAINT `restricciones_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `restricciones_ibfk_2` FOREIGN KEY (`id_opcion`) REFERENCES `opciones` (`id_opcion`);

--
-- Filtros para la tabla `roles_menus`
--
ALTER TABLE `roles_menus`
  ADD CONSTRAINT `roles_menus_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `roles_menus_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menus` (`id_menu`);

--
-- Filtros para la tabla `sub_recetas`
--
ALTER TABLE `sub_recetas`
  ADD CONSTRAINT `sub_recetas_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`),
  ADD CONSTRAINT `sub_recetas_ibfk_2` FOREIGN KEY (`id_receta_2`) REFERENCES `recetas` (`id_receta`),
  ADD CONSTRAINT `sub_recetas_ibfk_3` FOREIGN KEY (`id_medida`) REFERENCES `unidad_medida` (`id_medida`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  ADD CONSTRAINT `sucursal_ibfk_2` FOREIGN KEY (`id_negocio`) REFERENCES `negocios` (`id_negocio`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `usuarios_negocio`
--
ALTER TABLE `usuarios_negocio`
  ADD CONSTRAINT `usuarios_negocio_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `negocios` (`id_negocio`),
  ADD CONSTRAINT `usuarios_negocio_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `usuarios_sucursal`
--
ALTER TABLE `usuarios_sucursal`
  ADD CONSTRAINT `usuarios_sucursal_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `usuarios_sucursal_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuarios_sucursal_ibfk_3` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`),
  ADD CONSTRAINT `id_tipo_venta` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`id_tipo_pago`),
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_moneda`) REFERENCES `monedas` (`id_moneda`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`),
  ADD CONSTRAINT `ventas_ibfk_4` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD CONSTRAINT `id_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

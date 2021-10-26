-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2021 a las 21:05:58
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
(1, 'Caja Número 1', '2021-07-23 00:00:00', 1),
(2, 'Caja Número 2', '2021-07-23 00:00:00', 1);

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
(3, 'Abarrotes', '2021-05-11 00:00:00', 1),
(4, 'Frutas, Vegetales', '2021-05-09 00:00:00', 1),
(6, 'Tuberculos', '2021-05-01 00:00:00', 1),
(9, 'Cárnicos', '2021-08-12 00:00:00', 1),
(10, 'Mariscos', '2021-08-12 00:00:00', 1),
(11, 'De la Selva', '2021-08-12 00:00:00', 1),
(12, 'Otros', '2021-08-12 00:00:00', 1);

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
(4, 1, 3, 3, 1, '2021-03-24 14:27:56'),
(5, 1, 3, 4, 1, '2021-03-24 14:28:07'),
(7, 1, 3, 6, 1, '2021-04-15 19:49:03'),
(8, 1, 3, 9, 1, '2021-08-12 00:00:00'),
(9, 1, 3, 10, 1, '2021-08-12 00:00:00'),
(10, 1, 3, 11, 1, '2021-08-12 00:00:00'),
(11, 1, 3, 12, 1, '2021-08-12 00:00:00');

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
(3, 2, '', 'Anonimo', '11111111', 'anonimo@gmail.com', 'Calle S/n', '', '999999999', '2021-03-26 00:00:00', 1),
(4, 2, 'Luis Fernando', 'Luis Fernando ', '74785015', 'luis@gmail.com', 'Putumayo cuadra 2256', '', '965002302', '2021-08-17 21:32:01', 1),
(5, 2, '', 'LUIS ANTONIO SALAZAR BARTRA', '71106432', '', 'Calle S/n', '', '', '2021-08-19 10:57:05', 1),
(7, 2, '', 'Teresa Mora', '70479983', '', 'Rosa Merino 323 / San Antonio y Arequip', '', '981947898', '2021-08-19 11:40:30', 1),
(8, 2, '', 'priscila wong', '', '', 'prolongacion grau 2075', '', '900875960', '2021-08-19 12:39:05', 1),
(9, 4, 'BUFEO TEC S.A.C.', '', '20604352429', '', 'URBA. SARGENTO LORES MZ C LT 3', '', '', '2021-08-20 14:57:38', 1),
(10, 4, 'HUGO FRANCISCO ROCA VEGA', '', '10324818460', '', 'AV. DEL EJERCITO 1855', '', '', '2021-08-21 14:20:13', 1),
(11, 2, '', 'null null null', '111111111', '', '', '', '', '2021-08-22 13:34:23', 1),
(12, 2, '', 'Ministerio Publico', '40968036', '', '', '', '', '2021-08-22 13:42:00', 1),
(13, 0, '', 'TAMARA ZUMAETA ', '71719215', '', 'ELECTRO ORIENTE /ASESORIA LEGAL', '', '944245800', '2021-08-23 12:03:44', 1),
(14, 4, 'U.N.A.P.', '', '20180260316', '', 'AV. GRAU 1072', '', '', '2021-08-23 16:00:15', 1),
(15, 4, 'EMP REG DE SERV PUBLICO DE ELECTRICIDAD', '', '20103795631', '', 'AV. GENERAL EP AUGUSTO FREYRE NRO. 1168', '', '', '2021-08-25 11:33:38', 1),
(16, 2, '', 'juan pezo', '45647622', '', 'putumayo  573/ tinta sagrada ', '', '928318066', '2021-08-25 13:42:30', 1),
(18, 2, '', 'edward torres', '70924954', '', 'La dirección es Jesus de Nazaret 302.', '', ' 51 921 767 717', '2021-08-25 14:03:40', 1),
(19, 4, 'BARDALEZ VILLACORTA JOSE AUGUSTO TERCERO', '', '10418930824', '', 'calle San Francisco #639 A -Belén', '', '', '2021-08-26 11:04:07', 1),
(20, 2, '', 'lucy manzanares', '44138851', '', 'Raymondi # 156 Clinica dental Oral health', '', '958527832', '2021-08-26 11:26:25', 1),
(21, 2, '', 'Darwin Tamani', '46315323', '', 'ALMACEN Diremid. costado hospedaje Levaron pampachica', '', '948 010 218', '2021-08-26 12:49:19', 1),
(22, 2, '', 'PAOLA VALERIA BELLO RENGIFO', '74140726', '', 'Jorge Chavez 122', '', '932591261', '2021-08-26 13:36:27', 1),
(23, 2, '', 'kevin del aguila rios', '71114639', '', 'Garisho 330', '', '961694066', '2021-08-26 13:44:00', 1),
(24, 2, '', 'dra brigit', '73514538', '', 'fiscalia de violencia sargento lores ', '', '942079772', '2021-08-27 12:12:11', 1),
(25, 2, '', 'greyci', '73302704', '', '22 abril 115/jesus paenz micaela ', '', '925635747', '2021-08-27 13:06:40', 1),
(26, 2, '', 'nathaly sargento lores', '47673392', '', 'Calle sargento lores 930 , departamento 101', '', ' 51 929 914 187', '2021-08-28 12:01:07', 1),
(27, 2, '', 'Berny Mauricio Navas', '74222577', '', 'Para la Urb Juan Pablo mod 51 dpto 104', '', ' 51 949 601 659', '2021-08-28 12:19:32', 1),
(28, 4, 'consorcio constructor loreto', '', '20605870750', '', '', '', '', '2021-08-28 16:11:20', 1),
(29, 2, '', 'Aldair Antonio Flores Reategui', '72032964', '', 'Calle San Juan de Miraflores 188 Anita cabrera', '', '948 965 727', '2021-08-29 12:08:54', 1),
(30, 2, '', 'Letsy Chumbe Tanchiva ', '40160500', '', 'calle 2 de agosto nro. 23 Referencia por la plaza Quiñones', '', '944 064 768', '2021-08-29 12:11:39', 1),
(31, 2, '', 'alexandra', '47604108', '', '27 de febrero D7 espalda de la urba calvo de araujo', '', '969 179 541', '2021-08-29 12:14:38', 1),
(32, 2, '', 'Sr. Carlos Reyes,', '73101927', '', 'urbanización Juan Pablo II, modulo 19, departamento 101', '', '929 431 176', '2021-08-29 12:51:06', 1),
(33, 2, '', 'Melanie Galvez', '71002991', '', 'San Francisco 691 entre participación y Quiñones al frente del spa lotus spa', '', ' 947 639 300', '2021-08-29 13:18:52', 1),
(34, 2, '', 'GABRIELA CRISTINA BALUARTE MONGE', '42801958', '', '', '', '', '2021-08-29 14:13:46', 1),
(35, 2, '', ' Fiorella Peñaherrera ', '74094011', '', 'Calle 2 de Mayo, Mz G lote 36, Sol Naciente.  Referencia: Entrando por el Gorel, del segundo óvalo a la derecha', '', '949 789 943', '2021-08-30 14:06:46', 1),
(36, 0, '', ' Johana Rengifo', '70430447', '', 'Psj José Olaya A14, altura de la calvo de Araujo cuadra 20 Referencia. De pizzería mostacho la sgte cuadra a la izquierda', '', '902 743 124', '2021-08-30 14:13:49', 1),
(37, 2, '', 'Cristian Portocarrero', '71719266', '', 'Garcilazo de la Vega 339 Tupac', '', '978 506 990', '2021-08-30 14:16:27', 1),
(38, 2, '', 'Ketzy Kenia Rengifo Romero', '47873453', '', 'Guardia Civil 419 Referencia: Frente de un quiosco del Ejército', '', '925 165 108', '2021-08-30 14:53:21', 1),
(39, 2, '', 'Lucero Pinedo', '71262160', '', 'Av del ejercito #2280', '', '942655450', '2021-08-30 15:06:45', 1),
(40, 4, 'GONELI CONSTRUCCION Y SERVICIOS GENERALES S.R.L.', '', '2049375301', '', 'CUSCO #689', '', '', '2021-08-31 14:13:33', 1),
(41, 2, '', 'Moisés Rachumick', '72737271', '', 'Dirección: Poder Judicial puerta Número 2 por el banco de la nación', '', '950 986 797', '2021-09-01 10:59:43', 1),
(42, 2, '', 'Bryan. ', '72719987', '', ' Putumayo cdra 573 (Tinta Sagrada', '', '959 964 677', '2021-09-01 12:23:00', 1),
(43, 2, '', 'Debora ', '76181975', '', 'Pasaje jorge chavez #30 Detras del mercadillo de morona cocha', '', '929 394 897', '2021-09-01 13:41:01', 1),
(44, 2, '', 'Belisario Gorel', '46949531', '', 'Urb. Rio Mar C-1', '', '953613157', '2021-09-01 15:16:11', 1),
(45, 2, '', 'rayza bardales', '73580936', '', ' dos de mayo 925  Referencia: entre Castilla y San roman. ', '', '920 586 895', '2021-09-04 14:08:26', 1),
(46, 2, '', 'MARCOS GALLARDO MORENO', '40051101', '', '', '', '', '2021-09-04 14:26:25', 1),
(47, 2, '', 'victor diaz', '71391825', '', ' Moronacocha caballero lastre #572 por favor', '', '975 525 265', '2021-09-04 14:46:08', 1),
(48, 2, '', 'ABEL CHRISTIAN TELLO GRANDEZ', '40948625', '', '', '', '', '2021-09-04 16:27:36', 1),
(49, 2, '', 'Sandra Juliana Saavedra Cardenas', ' 43609059', '', 'Pasaje Ricardo Palma #525 (altura de la cuadra 10 de ricardo palma a espaldas del pardo entre alzamora y echenique)', '', '916 448 656', '2021-09-05 11:06:59', 1),
(50, 2, '', 'Diana Jiménez', '70346653', '', 'Las cañitas 253. Joaquín abensur.', '', '964 316 570', '2021-09-05 12:24:37', 1),
(51, 2, '', 'f f f', '151', '', '', '', '', '2021-09-05 13:35:59', 1),
(52, 2, '', 'sandrita', ' 40989786', '', 'pasaje quiñones 319. Altura de la abtao cuadra 16', '', ' 987 812 914', '2021-09-05 13:58:58', 1),
(53, 4, 'INVERSIONES GAVIC S.R.L.', '', '20601441790', '', 'soledad #1066', '', '', '2021-09-05 14:12:24', 1),
(54, 4, 'SIFUENTES ARCENTALES CESAR ANTHONY', '', '10711064414', '', '', '', '', '2021-09-05 15:10:31', 1),
(55, 2, '', 'Sergio Ocampo', '73462867', '', 'Condamine 347', '', '975 999 136', '2021-09-05 15:28:32', 1),
(56, 2, '', 'lesly', '75707064', '', 'escondite  perfecto ', '', '983 886 259', '2021-09-05 15:31:15', 1),
(57, 2, '', 'nicolle', '73768484', '', 'Urb. mártires de la democracia A-21  URBA que está adentro del gorel', '', '943 347 425', '2021-09-06 11:12:00', 1),
(58, 2, '', 'Ximena Stefania Ampuero Solsol', '47192441', '', 'Atahualpa 628', '', '936 119 319', '2021-09-06 13:42:03', 1),
(59, 2, '', 'Eduardo García ', '71208691', '', 'psj jose olaya 18A frente a complejo CNI', '', '923182773', '2021-09-06 13:45:24', 1),
(60, 2, '', 'Alessandra brigitti reque grados', '48124513', '', ' Moore 629/Frente al colegio Rosa de América', '', '968 609 724', '2021-09-06 15:55:14', 1),
(61, 2, '', 'Allison Pereira', '72684659', 'undefined', 'urb calvo de araujo A3', 'undefined', '945218361', '2021-09-08 14:05:33', 1),
(62, 2, '', 'Jasmín Panduro  ', '73054849', 'undefined', 'abtao / pasaje quiñones  1688\n', 'undefined', '952270529', '2021-09-09 10:30:53', 1),
(63, 4, 'MUNDO MEDICO LOGISTICO S.A.C.', '', '20514950041', '', '', '', '', '2021-09-10 11:46:12', 1),
(64, 2, '', 'ZETKIN CHIANCHING RUIZ BARRERA', '45448356', 'undefined', ' calle José Pérez lozano 177 Micaela Bastidas', 'undefined', '997 121 009', '2021-09-10 12:35:43', 1),
(65, 2, '', 'RENZO ARMANDO CESAR DOMINGUEZ RIOS', '46946162', 'undefined', 'Sargento lores BBVA iquitos', 'undefined', '918 845 485', '2021-09-11 09:54:52', 1),
(66, 2, '', 'BIBI KENIA LOPEZ LOPEZ', '72455953', 'undefined', 'Calle estado de israel N 250/calvo cuadra 13, a una cuadra del estadio', 'undefined', '993 993 030', '2021-09-11 12:27:51', 1),
(67, 2, '', 'DAVID MARTIN VASQUEZ LOZANO', '41411403', 'undefined', 'Prolongación calvo de Araujo B-10 pampachica', 'undefined', '991 986 358', '2021-09-11 13:25:49', 1),
(68, 4, 'IMPORTADORA HUNTER E.I.R.L.', '', '20528241761', '', 'urb. SARGENTO LORES  Mz .O lote 6 ', '', '', '2021-09-11 14:26:29', 1),
(69, 2, '', 'MARY GERALDINE BANEO GARATE', '71782676', 'undefined', 'Garcia Saenz 485', 'undefined', '988 447 398', '2021-09-11 14:32:05', 1),
(70, 2, '', 'Miguel angel Guevara.', '71520636', 'undefined', 'Av mariscal caceres/En la misma. Villa militar moronacocha.', 'undefined', '950 506 692   ', '2021-09-11 15:03:14', 1),
(71, 2, '', 'LUIS JAVIER GARCIA MEDINA', '43313679', 'undefined', 'calle tito Chávez 241/san Lorenzo ', 'undefined', '965990673', '2021-09-12 12:17:54', 1),
(72, 2, '', 'KARLA ALEXANDRA COCHACHIN TORRES', '73240327', 'undefined', 'Calvo cdra 20 pasaje güepi#135 el primer pasaje de la izquierda\nEntre navarro cauper y sgto lore', 'undefined', '927 819 280', '2021-09-12 12:25:20', 1),
(73, 2, '', 'LOURDES PAOLA CHUQUIPIONDO SANCHEZ', '71602442', 'undefined', ' Ricardo Palma #1442', 'undefined', '934 752 080', '2021-09-12 13:23:58', 1),
(74, 2, '', 'ALBERSON REATEGUI SANCHEZ', '05376461', '', '', '', '', '2021-09-12 13:52:27', 1),
(75, 4, 'SIFUENTES SANGAMA MARCO ANTONIO', '', '10700199563', '', 'Rómulo Espinar #836', '', '', '2021-09-12 16:34:33', 1),
(76, 2, '', 'LUIS MIGUEL PINEDO LOZANO', '72894274', 'undefined', 'Bolognesi 1278', 'undefined', ' 974 197 244', '2021-09-15 15:25:36', 1),
(77, 2, '', 'JOSE LUIS MARCELO CHAVEZ VALLES', '71645655', 'undefined', 'Calle Rómulo espinar 602 entre tavara y Pablo rossel', 'undefined', '950 904 160', '2021-09-17 12:29:15', 1),
(78, 2, '', 'VICTORIA YSABEL VILLACORTA PEZO', '70387253', 'undefined', 'Prolongación Calvo de Araujo C8-B\nParalelo a la Facultad de Odontología, por el gym Iron Monkey', 'undefined', '944 945 286', '2021-09-17 16:09:10', 1),
(79, 2, '', 'SOLANSH ESMERALDA DE JESUS RAMOS SANCHEZ', '70019519', 'undefined', 'Ramon Castilla 1127\nEntre Abtao y 9 de diciembre', 'undefined', '959 022 056', '2021-09-18 10:55:32', 1),
(80, 2, '', 'ERIKA PATRICIA FACUNDO MEZA', '61488360', 'undefined', ' Psj Inti 196\n Frente al colegio Túpac secundaria', 'undefined', '910 027 058', '2021-09-18 13:35:53', 1),
(81, 4, 'TELLO GATICA PAUL DAVID', '', '10102987492', '', 'av. grau #1038 ', '', '', '2021-09-18 13:51:25', 1),
(82, 2, '', 'NORMA STEFANY VELA DIAZ', '75018787', 'undefined', 'Entrando por el gorel en el último óvalo,  donde que hay varias entraditas  , cuando esta ahí me escribe,  para salir', 'undefined', '936 814 532', '2021-09-18 15:17:44', 1),
(84, 2, '', 'ARACELI JIMENA GALVEZ DEL AGUILA', '72858780', 'undefined', 'r. Francisco Gonzales Vigil 269.\nReferencia: de la curva de moronacocha entrando, casa portón rojo. 1 cuadra antes de la cancha F7', 'undefined', '974 114 451', '2021-09-19 13:51:54', 1),
(85, 4, 'SHIGUAY SARMIENTO IGNACIO EPIFANIO', '', '10085173338', '', '', '', '', '2021-09-19 14:38:41', 1),
(86, 4, 'VIRTUAL IQT S.A.C.', '', '20603011512', '', 'jirón Huallaga #315 ', '', '', '2021-09-19 15:53:42', 1),
(87, 4, 'LILIA ROSA LAURI VILCA ', '', '10053332582', '', 'Arica #618', '', '', '2021-09-19 16:01:31', 1),
(88, 2, '', 'LIZETH RAMIREZ ARICARA', '42371589', 'undefined', 'poder judicial  Cáceres 2 puerta banco nación  ', 'undefined', '943208018', '2021-09-20 12:00:45', 1),
(89, 2, '', 'SOLSOL SAAVEDRA JERSON ALEJANDRO', '71738303', 'undefined', 'hotel sumiría jumgle  Ricardo palma 1', 'undefined', '917 908 674', '2021-09-20 12:14:01', 1),
(90, 2, '', 'CYNTHIA FIORELLA RAMIREZ PINEDO', '43817991', 'undefined', 'UGEL YNAS  ', 'undefined', '935 843 894', '2021-09-20 12:19:47', 1),
(91, 2, '', 'AZUCENA ELIZABETH CARRION TORRES', '05403374', 'undefined', '[0:26 p. m., 20/9/2021]  51 940 628 937: Calle Jose Bernardo Alcedo 116. San Juan Modelo: Ref. Altura ex fabrica de postes a la izquierda', 'undefined', '940 628 937', '2021-09-20 12:27:04', 1),
(92, 2, '', 'JHULIANA PAOLA RODRIGUEZ DEL AGUILA', '48024273', 'undefined', ' pasaje San Lorenzo 288\nReferencia: clínica Wisar salud', 'undefined', '930 563 114', '2021-09-20 14:26:39', 1),
(93, 4, 'PAPA PLATANO EIRL', '', '20605605738', '', 'Av. San Luis  #2988', '', '', '2021-09-20 15:37:09', 1),
(94, 2, '', 'Fernanda Levano', '72912134', 'undefined', 'Psje 29 de junio #125, como referencia del Senati de Pampachica, al costado', 'undefined', '932 804 462', '2021-09-21 13:52:30', 1),
(95, 4, 'B.J.R.SELVA  S.A.C', '', '20601638143', '', 'Av. Pachacutac Mz.A lote.8 AA.HH Los mangos Yarinacocha ', '', '', '2021-09-22 13:38:00', 1),
(96, 2, '', 'MILAGROS MARCYA DEL AGUILA GATICA', '42686116', 'undefined', 'Calle las crisnejas MZ f lote 31 Joaquín abenzur atraz del colegio cni', 'undefined', ' 965 670 676', '2021-09-23 12:20:18', 1),
(97, 4, 'JACKIE PINCHI RIOS ', '', '10422037247', '', 'calle francisco vigo #102 ', '', '', '2021-09-23 14:51:32', 1),
(98, 2, '', 'Diana  Shapiama ', '70747219', 'undefined', 'Jesús Paenz #202 - Micaela Bastidas.\nReferencia: a 3cuadras antes de entrar al colegio Micaela Bastidas - en un agente, en diagonal al mercadillo.', 'undefined', '953 670 082', '2021-09-24 11:28:16', 1),
(99, 4, 'FLORES RUECKNER RAUL FERNANDO', '', '10404005184', '', 'calle Pablo Rosell #1313', '', '', '2021-09-24 12:25:19', 1),
(100, 2, '', 'VASQUEZ MENDOZA NILA SUSANA', '70611344', 'undefined', '', 'undefined', '912 110 788', '2021-09-24 12:46:06', 1),
(101, 4, 'MULTISERVICIOS R ', '', '20541139193', '', 'Los Rosales #58A  PUNCHANA', '', '', '2021-09-24 14:02:18', 1),
(102, 2, '', 'pablo panduro', '76144079', 'undefined', 'Para Dos de mayo 529', 'undefined', '954 108 672', '2021-09-24 14:05:50', 1),
(103, 4, 'MUNICIPALIDAD DISTRITAL DE MAQUIA', '', '20199428994', '', 'fitzcarrald #336-338', '', '', '2021-09-24 14:51:49', 1),
(104, 4, 'CHIRINOS ZAGACETA RIMMEL SMYTH', '', '10053712474', '', 'urb. Moronacocha C4', '', '', '2021-09-25 11:18:48', 1),
(105, 2, '', 'TITO CARLOS RODRIGUEZ SALDAÑA', '72556890', 'undefined', ' polleria flavius', 'undefined', '953 964 451', '2021-09-25 12:58:03', 1),
(106, 2, '', 'ISABEL DE JESUS ROJAS LOMAS', '71010875', 'undefined', 'Tavara 1105', 'undefined', '990 199 043', '2021-09-25 14:24:17', 1),
(107, 2, '', 'STEFANY SMITH ALVAREZ HILORIO', '72268974', 'undefined', '25 de julio Mz S lote 31 aahh villa disnarda \nReferencia: entrando por las calle begonias, hay un cancha que se llama Joaquin y cerca hay un pequeño pasaje... se entra por ahí', 'undefined', '943 135 307', '2021-09-26 10:15:54', 1),
(108, 2, '', 'Alex Rodriguez', '70412376', 'undefined', 'José Gálvez #1640 - Entre palmeras con Jorge Chávez', 'undefined', '949 371 980', '2021-09-26 14:12:50', 1),
(109, 2, '', 'Alex Rodriguez', '72456677', 'undefined', 'José Gálvez #1640 - Entre palmeras con Jorge Chávez', 'undefined', '949 371 980', '2021-09-26 14:14:09', 1),
(110, 2, '', 'Victor Lopez', '77172381', 'undefined', 'Tacna 459.Entre Brasil y Huallaga', 'undefined', '915 243 631', '2021-09-26 14:34:36', 1),
(111, 2, '', 'Andrea chuquipiondo sanchez', '71777766', 'undefined', 'Calle mariscal Cáceres (ref. Entre calle moore y av. Grau - es la única institución del Poder Judicial - puerta rojo - al costado del cajero global net)', 'undefined', '943 027 614', '2021-09-28 12:57:26', 1),
(112, 2, '', 'MONICA REGUERA BRAVO', '44250796', 'undefined', 'Jr. Bolognesi 163 (entre Napo y Putumayo)', 'undefined', '977 841 751', '2021-09-29 12:55:23', 1),
(113, 2, '', 'Eduardo Marín Torres', '72753371', 'undefined', 'Calle 22 de abril 186 A la vuelta del senati-pampachica Por la Jesus Paenz', '', '965 657 072', '2021-09-30 11:41:22', 1),
(114, 2, '', 'PAOLA ALEXANDRA LOPEZ SORIA', '72980266', 'undefined', ' Morona 645/Reyna de las Americas/garage con puestas azules', '', '966 156 338', '2021-10-01 10:53:00', 1),
(115, 2, '', 'Renzo castro', '72955899', 'undefined', 'Los frutales d-14 pampachica a 3 cuadras de gaia', 'undefined', '993 120 312', '2021-10-01 13:27:43', 1),
(116, 4, 'CONTADORES ', '', '20493536932', '', ' calle Unión #608', '', '', '2021-10-01 16:16:39', 1),
(117, 2, '', 'YASMIN JENNIFER RIOS URETA', '71255569', 'undefined', 'Pasaje rosa mistica n7  del hotel sol del oriente al frente  entrando/Por la calle señor de los milagros', 'undefined', '973 972 413', '2021-10-02 12:29:43', 1),
(118, 2, '', 'GIANINA MIRELLA VILLACORTA SIFUENTES', '71335471', 'undefined', 'Ramon Castilla 234 (entre putumayo/ calvo de araujo)', 'undefined', '965 806 045', '2021-10-03 12:51:05', 1),
(119, 2, '', 'YENNY ISABEL SUPO ALMONTE', '07763854', '', '', '', '', '2021-10-03 15:18:49', 1),
(120, 2, '', 'ELY CAROLINA CASTAÑEDA REATEGUI', '70287211', '', '', '', '', '2021-10-03 15:20:45', 1),
(121, 4, 'CABALLERO CONTRATISTAS GENERALES E.I.R.L.', '', '20528115897', '', 'av.Principal sin numero /villa saramirisa  daten del marañon /manceriche', '', '', '2021-10-03 16:11:03', 1),
(122, 2, '', 'MARCOS GALLARDO MORENO', '45051101', '', '', '', '', '2021-10-05 14:09:40', 1),
(123, 2, '', 'GEORGE PEPE GALLARDO GONZALES', '45857065', '', 'CALLE 4 NRO. 32', '', '', '2021-10-05 15:23:18', 1),
(124, 2, '', 'teresa villasis', '72803407', 'undefined', 'progreso 320 entrando pr el colegio ruy guzman', 'undefined', '979162591', '2021-10-06 15:15:05', 1),
(125, 2, '', 'RUTH EDITH CUBAS GARCIA', '05241248', 'undefined', '', 'undefined', '950 927 121', '2021-10-07 11:42:16', 1),
(126, 2, '', 'EDGAR RAMIREZ BARDALES', '05286234', '', '', '', '', '2021-10-07 15:09:00', 1),
(127, 2, '', 'ALBERT LINARES LANARO', '71235255', 'undefined', 'plaza 28 tienda bitel / angiy ', 'undefined', '962272653', '2021-10-08 09:35:43', 1),
(128, 2, '', 'Raquel Franco  ', '75739963', 'undefined', 'los frutales MZb lote10 / casa de policias ', 'undefined', '980323392', '2021-10-08 13:37:58', 1),
(129, 2, '', 'ERICK JOSIMAR GAYA CAMIÑAS', '74324133', 'undefined', 'Av Guardia Civil 1331', 'undefined', '999 075 099', '2021-10-08 15:36:04', 1),
(130, 2, '', 'ROLI GARCIA ', '45461539', '', '', '', '', '2021-10-09 12:41:32', 1),
(131, 2, '', 'JAIME SEBASTIAN REATEGUI TORRES', '70764106', 'undefined', 'Psj Juan Pablo 2, 23 - A\nAserradero de John Reategu', 'undefined', '946 123 017', '2021-10-09 13:54:06', 1),
(132, 2, '', 'MARIA PATRICIA RODRIGUEZ OLORTEGUI', '76796183', '', '', '', '', '2021-10-09 14:29:51', 1),
(133, 2, '', 'JESUS ISRAEL CANELO SUAREZ', '70827911', 'undefined', ' Jesus paenz 465 pampachica \nReferencia: pasando el instituto SENATI, segunda entrada doblando a la derecha', 'undefined', '968 567 145', '2021-10-09 14:41:21', 1),
(134, 2, '', 'Cindy Achong', '70070354', 'undefined', 'Urba sargento lores q12/Entrando por la putumayo cuadrab14/Frente a la canchita del olvalo', 'undefined', '966 281 700', '2021-10-11 15:16:43', 1),
(135, 2, '', 'ADRIANA ANTUANETH CUBAS CORONADO', '71584683', 'undefined', 'Urb. Calvo de Araujo F5 a , referencia a 2 casas del restaurante punta salinas ', 'undefined', '982 423 817', '2021-10-13 12:28:40', 1),
(136, 2, '', 'CARMEN ROSA CORNEJO JARA', '73708622', 'undefined', 'Pasaje Azucenas Mz A Lote 12 Urbanización Frutales de Pampachica/por el Local Amy a la sgte cuadra doblando a la derecha', 'undefined', ' 986 037 357', '2021-10-14 12:01:25', 1),
(137, 2, '', 'Yenith ', '76566314', 'undefined', ' psje . San Lorenzo - A 36\nReferencia: entrando por Orvisa / al frente de la cancha de la', 'undefined', '996 004 265', '2021-10-14 14:51:30', 1),
(138, 2, '', 'ALLAN AREVALO FLORES', '08150818', 'undefined', 'irección av del ejército #1675 policlinico essalud', 'undefined', '965 932 287', '2021-10-15 12:35:19', 1),
(139, 2, '', 'Andreita Vasquez ', '05411139', 'undefined', ':Calle Los uvos 161-Navarro Cauper/ Arequipa/', 'undefined', '947 644 215', '2021-10-15 12:57:43', 1);

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
  `comanda_detalle_observacion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comanda_detalle_fecha_registro` datetime NOT NULL,
  `comanda_detalle_estado` tinyint(4) NOT NULL,
  `comanda_detalle_estado_venta` tinyint(2) NOT NULL DEFAULT 0,
  `comanda_detalle_hora_entrega` time DEFAULT NULL,
  `comanda_detalle_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(2, 'BEBIDA', 'Ticketera', '2021-03-15 00:00:00', 1),
(3, 'CALIENTES', 'Ticketera', '2021-04-30 21:26:17', 1);

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
(7, 'Negocios', 'Negocio', 'fa fa-industry', 10, 1, 1),
(8, 'Recursos', 'Recursos', 'fa fa-cart-plus', 7, 1, 1),
(9, 'Proveedores', 'Proveedor', 'fa fa-car', 9, 1, 1),
(10, 'Orden de Compra', 'Ordencompra', 'fa fa-cart-plus', 9, 1, 1),
(11, 'Productos', 'Producto', 'fa fa-tags', 9, 1, 1),
(12, 'Pedidos', 'Pedido', 'fa fa-shopping-cart', 11, 1, 1),
(13, 'Mesas', 'Mesa', 'fa fa-sitemap', 6, 1, 1),
(14, 'Almacen', 'Almacen', 'fa fa-folder-open', 6, 0, 1),
(15, 'Recetas', 'Receta', 'fa fa-file-text-o', 9, 1, 1),
(16, 'Ventas ', 'Ventas', 'fa fa-money', 12, 1, 1),
(17, 'Clientes', 'Cliente', 'fa fa-male', 5, 1, 1),
(18, 'Conversiones', 'Conversiones', 'fa fa-refresh', 8, 1, 1),
(19, 'Movimientos', 'Egreso', 'fa fa-usd', 13, 1, 1),
(20, 'Reportes', 'Reporte', 'fa fa-calendar-minus-o', 14, 1, 1),
(21, 'Insumos', 'Insumos', 'fa fa-apple', 8, 0, 1),
(22, 'Categorias', 'Categorias', 'fa fa-cutlery', 6, 0, 1),
(23, 'Recursos Humanos', 'Rhumanos', 'fa fa-folder-open', 2, 1, 1);

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
(17, 4, 'Mesa 12', 3, 1, 0),
(18, 4, 'Mesa 13 ', 2, 1, 0),
(19, 4, 'Mesa 14', 3, 1, 0),
(20, 4, 'Mesa 15', 2, 1, 0),
(21, 4, 'MESA 16', 1, 1, 0),
(22, 4, 'MESA 17', 3, 1, 0),
(23, 4, 'MESA 18', 1, 1, 0),
(24, 4, 'MESA 19', 3, 1, 0);

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
  `id_usuario` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `movimiento_tipo` tinyint(2) NOT NULL COMMENT '1 es entrada y 2 es salida',
  `egreso_descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `egreso_monto` decimal(10,2) NOT NULL,
  `egreso_fecha_registro` datetime NOT NULL,
  `egreso_estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(50, 20, 'Reporte Proveedores', 'reporte_proveedores', '', 1, 3, 1),
(51, 20, 'Reporte Meseros', 'reporte_meseros', '', 1, 4, 1),
(52, 16, 'Historial Ventas Sunat', 'historial_ventas_enviadas', '', 1, 3, 1),
(53, 16, 'Resumen Diario', 'envio_resumenes_diario', '', 1, 4, 1),
(54, 20, 'Reporte Insumos', 'reporte_insumos', '', 1, 6, 1),
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
(98, 20, 'Tiempo de Atención por Pedido', 'tiempo_promedio_atencion', '', 1, 7, 1),
(99, 20, 'Ventas por Tipo de Pago', 'ventas_tipo_pago', '', 1, 8, 1),
(100, 20, 'Reporte Ventas por Productos', 'reporte_ventas_productos', '', 1, 0, 1),
(101, 23, 'Gestionar Turnos', 'gestionar_turnos', '', 0, 0, 1),
(102, 16, 'Historial Notas Ventas', 'historial_notas_ventas', '', 1, 1, 1),
(103, 16, 'tabla_productos_editar', 'tabla_productos_editar', '', 0, 0, 1),
(104, 16, 'editar_nota_venta', 'editar_nota_venta', '', 0, 0, 1),
(105, 20, 'Reporte Ventas Porductos PDF', 'reporte_ventas_productos_pdf', '', 0, 0, 1),
(106, 20, 'Reporte General', 'reporte_general', '', 1, 0, 1),
(107, 20, 'Reporte General PDF', 'reporte_general_pdf', '', 0, 0, 1),
(108, 20, 'Ventas Tipo Pago PDF', 'ventas_tipo_pago_pdf', '', 0, 8, 1),
(109, 12, 'Historial Pedidos Gratis', 'historial_pedidos_gratis', '', 1, 2, 1);

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
  `pedido_gratis_datetime` datetime DEFAULT NULL,
  `pedido_gratis_codigo` varchar(100) DEFAULT NULL,
  `pedido_gratis_estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos_gratis`
--

INSERT INTO `pedidos_gratis` (`id_pedido_gratis`, `id_mesa`, `id_usuario`, `pedido_gratis_numero`, `pedido_gratis_nombre`, `pedido_gratis_direccion`, `pedido_gratis_total`, `pedido_gratis_datetime`, `pedido_gratis_codigo`, `pedido_gratis_estado`) VALUES
(1, 0, 6, '71645655', 'JOSE LUIS MARCELO CH', 'Calle Rómulo espinar 602 entre tavara y Pablo rossel', '72.00', '2021-09-17 12:59:47', '1631901587.4407', 1),
(2, 8, 6, '11111111', 'ANONIMO', '', '84.00', '2021-10-09 15:11:52', '1633810312.6681', 1),
(3, 0, 6, '11111111', 'ANONIMO', 'Calle S/n', '100.00', '2021-10-10 12:25:18', '1633886718.4306', 1),
(4, 12, 6, '11111111', 'ANONIMO', '', '84.00', '2021-10-11 13:22:49', '1633976569.4422', 1);

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
(8, 4, 4505, 1);

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
(165, 55, 'consultar_ticket_resumen', 1);

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
(2, 1, 'Balconcito', 'Admin', 'Restaurant', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, 1, '2020-10-27 18:29:10', '2021-08-12 17:02:37', '1603841350.1786', 1);

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
(1, 3, 'Aceite vegetal Cheff 18 lt', 1),
(2, 3, 'Aceite vegetal Palmerola 20 lt ', 1),
(3, 3, 'Ajino moto', 1),
(4, 3, 'Pimenton en polvo (paprica)', 1),
(5, 3, 'Azucar blanca itamarati 50 kg', 1),
(6, 3, 'wantan', 1),
(7, 3, 'Ajonjoli', 1),
(8, 3, 'Ostion', 1),
(9, 3, 'Mostaza', 1),
(10, 3, 'Harina 50kg', 1),
(11, 3, 'Panco', 1),
(12, 3, 'Leche caja x24', 1),
(13, 3, 'Crema de Leche caja x12 und', 1),
(14, 3, 'Arroz Dorado saco 30 kg', 1),
(15, 3, 'Sillao x 12 und', 1),
(16, 3, 'Sal Yodada saco x 25 kg o 50 und', 1),
(17, 3, 'Vinagre Tinto', 1),
(18, 3, 'cabello de angel', 1),
(19, 3, 'Jamonada', 1),
(20, 3, 'Spaguetti', 1),
(21, 4, 'Aji Mirasol', 1),
(22, 4, 'Aji Limo', 1),
(23, 4, 'Aji Rocoto', 1),
(24, 4, 'Ajo pelado', 1),
(25, 4, 'Choclo en granos', 1),
(26, 4, 'Alberja en Granos', 1),
(27, 4, 'Cebolla Roja', 1),
(28, 4, 'Tomate', 1),
(29, 4, 'Apio', 1),
(30, 4, 'Limon', 1),
(31, 4, 'Maracuya', 1),
(32, 4, 'Palta', 1),
(33, 6, 'Zanahoria', 1),
(34, 6, 'Camote', 1),
(35, 6, 'Papa amarilla', 1),
(36, 6, 'Kion', 1),
(37, 6, 'Papa canchan', 1),
(38, 9, 'Lomo fino', 1),
(39, 9, 'Cecina', 1),
(40, 9, 'Chorizo', 1),
(41, 9, 'Pechuga dePollo', 1),
(42, 9, 'Pollo entero fileteado', 1),
(43, 9, 'Milanesa de pollo', 1),
(44, 9, 'Pescado Doncella', 1),
(45, 9, 'Pescado Dorado', 1),
(46, 9, 'Chuleta', 1),
(47, 10, 'Mixtura', 1),
(48, 10, 'Langostino', 1),
(49, 10, 'Camaron', 1),
(50, 10, 'Cangrejo', 1),
(51, 10, 'Yuyo', 1),
(52, 11, 'Aji Charapita', 1),
(53, 11, 'Maduro ', 1),
(54, 11, 'Platano', 1),
(55, 11, 'Cebolla China', 1),
(56, 11, 'Lechuga', 1),
(57, 11, 'Culantro', 1),
(58, 11, 'Cocona', 1),
(59, 11, 'aji dulce', 1),
(60, 11, 'pepino', 1),
(61, 11, 'Chonta ', 1),
(62, 11, 'Yuca', 1),
(63, 12, 'Aceituna', 1),
(64, 12, 'Queso Fresco', 1),
(65, 12, 'Queso Parmesano', 1),
(66, 12, 'Cancha chulpi', 1),
(67, 12, 'Grasita', 1),
(68, 12, 'Chicharron', 1),
(69, 12, 'Huevo', 1),
(70, 12, 'comino', 1),
(71, 12, 'pimienta', 1),
(72, 12, 'canela', 1),
(73, 12, 'clavo', 1),
(74, 12, 'frejol', 1),
(75, 12, 'Nuez Moscada', 1),
(76, 12, 'Oregano', 1);

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
(22, 4, 62);

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
(3, 'Admin', 'Gestión del sistema', 1),
(4, 'Mesero', 'Atencion al publico', 1),
(5, 'Cajero', 'Encargado de estar en caja', 1),
(6, 'Cocinero', 'Encargado de la preparación del pedido', 1),
(7, 'Ayudante de Cocina', 'Ayudar en la cocina', 1);

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
(67, 5, 15);

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
(3, '03', 'B001', 0, 1),
(5, '07', 'FN01', 0, 1),
(6, '07', 'BN01', 0, 1),
(7, '08', 'FD01', 0, 1),
(8, '08', 'BD01', 0, 1),
(9, 'RC', '20211014', 0, 1),
(10, 'RA', '20210520', 0, 1),
(4, '03', 'B002', 0, 0),
(13, '20', 'NV01', 0, 1);

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
(4, 1, 3, 'GAIA RESTAURANT CEVICHERIA', 'CAL. LOS FRUTALES NRO. B-1 (AV GUARDIA CIVIL)', '20606320796', 'media/sucursal/default.png', '987100215', 1, '2021-03-24 14:23:50');

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
(1, 'Turno 1', '08:00:00', '08:10:00', '16:10:00', 1, '0000-00-00 00:00:00', 0),
(2, 'Turno 2', '12:00:00', '12:10:00', '16:10:00', 1, '0000-00-00 00:00:00', 1),
(3, 'Turno 3', '09:00:00', '09:10:00', '16:10:00', 1, '2021-08-09 22:15:29', 1),
(4, 'Turno 4', '09:00:00', '09:10:00', '17:10:00', 1, '2021-08-18 11:16:13', 1);

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
  `usuario_imagen` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `usuario_estado` tinyint(1) NOT NULL,
  `usuario_creacion` datetime NOT NULL,
  `usuario_ultimo_login` datetime NOT NULL,
  `usuario_ultima_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_persona`, `id_rol`, `usuario_nickname`, `usuario_contrasenha`, `usuario_email`, `usuario_imagen`, `usuario_estado`, `usuario_creacion`, `usuario_ultimo_login`, `usuario_ultima_modificacion`) VALUES
(1, 1, 2, 'superadmin', '$2y$10$oPOOOgTUr4zIh511ATm/q.vzsAmxP.e2.vzyEbRn/1pzyWz2oXj0a', 'cesarjose@bufeotec.com', 'media/usuarios/usuario.jpg', 1, '2020-09-17 00:00:00', '2021-10-26 13:48:09', '2020-09-17 00:00:00'),
(2, 2, 3, 'admin', '$2y$10$Ieku4i2ex6oMwML9rz2s9.9Og.AFHadp9KJok.a./8nfhbqgQZfRa', 'balconcito@gmail.com', 'media/usuarios/usuario.jpg', 1, '2020-10-27 18:29:10', '2021-10-26 14:00:31', '2021-08-12 17:02:46');

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
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_comanda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1369;

--
-- AUTO_INCREMENT de la tabla `comanda_detalle`
--
ALTER TABLE `comanda_detalle`
  MODIFY `id_comanda_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4761;

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
  MODIFY `id_detalle_receta` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

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
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  MODIFY `id_orden_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_gratis`
--
ALTER TABLE `pedidos_gratis`
  MODIFY `id_pedido_gratis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos_gratis_detalles`
--
ALTER TABLE `pedidos_gratis_detalles`
  MODIFY `id_pedido_gratis_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `periodo_laboral`
--
ALTER TABLE `periodo_laboral`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `persona_turno`
--
ALTER TABLE `persona_turno`
  MODIFY `id_persona_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT de la tabla `producto_familia`
--
ALTER TABLE `producto_familia`
  MODIFY `id_producto_familia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `producto_precio`
--
ALTER TABLE `producto_precio`
  MODIFY `id_producto_precio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de la tabla `recursos`
--
ALTER TABLE `recursos`
  MODIFY `id_recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `recursos_sede`
--
ALTER TABLE `recursos_sede`
  MODIFY `id_recurso_sede` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_restriccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles_menus`
--
ALTER TABLE `roles_menus`
  MODIFY `id_rol_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

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
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1142;

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
  MODIFY `id_venta_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3869;

--
-- AUTO_INCREMENT de la tabla `ventas_detalle_pagos`
--
ALTER TABLE `ventas_detalle_pagos`
  MODIFY `id_venta_detalle_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1140;

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

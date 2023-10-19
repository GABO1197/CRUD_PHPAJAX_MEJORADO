-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2023 a las 05:50:48
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
-- Base de datos: `graficos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GRAFICOS_BAR` ()   SELECT * FROM `productos` WHERE 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_PRODUCTOS` (IN `IDPRODUCTO` INT(10), IN `NOMBRE` VARCHAR(233), IN `CANTIDAD` VARCHAR(222), IN `STOK` VARCHAR(233), IN `VENTACANTIDAD` VARCHAR(233), IN `VENTAFECHA` DATE)   UPDATE productos,venta
 SET productos.id=IDPRODUCTO,
		 productos.nombre =NOMBRE,
     productos.cantidad =CANTIDAD,
     productos.stok =STOK,
		 venta.vanta_cantidad =VENTACANTIDAD,
     venta.venta_fecharegistro	=VENTAFECHA

WHERE productos.id = IDPRODUCTO AND venta.venta_id = IDPRODUCTO$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DATOSGRAFICO_PARAMETRO` (IN `ANIOINICIO` VARCHAR(10), IN `ANIOFIN` VARCHAR(10))   SELECT
	productos.nombre,
	venta.vanta_cantidad AS CANTIDAD
	
FROM
	venta
	INNER JOIN productos ON  venta.venta_id = productos.id
	WHERE   venta.venta_fecharegistro BETWEEN ANIOINICIO AND ANIOFIN
	GROUP BY venta.venta_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DATOSGRAFICO_PARAMETRO_MES` (IN `MESINICIO` VARCHAR(10), IN `MESFIN` VARCHAR(10))   SELECT
	productos.nombre,
	venta.vanta_cantidad AS CANTIDAD
	
FROM
	venta
	INNER JOIN productos ON  venta.venta_id = productos.id
	WHERE   MONTH(venta.venta_fecharegistro)  BETWEEN MESINICIO AND MESFIN
	
	GROUP BY venta.venta_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_PRODUCTOS` (IN `ID` INT(11))   DELETE p
FROM productos p
INNER JOIN venta v
  ON p.id=v.venta_id
WHERE p.id = ID AND v.venta_id = ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GRAFICOS_GENERAL` ()   SELECT
	productos.id, 
	productos.nombre, 
	productos.cantidad, 
	productos.stok, 
	venta.venta_id, 
	venta.producto_id, 
	venta.vanta_cantidad, 
	venta.venta_fecharegistro,
	venta.fecha_v,
	productos.fecha_p
FROM
	graficos.venta
	INNER JOIN
	graficos.productos
	ON 
	venta.venta_id = productos.id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PRODUCTOS` (IN `NOMBRE` VARCHAR(200), IN `UNIDAD` VARCHAR(2000), IN `STOK` VARCHAR(2440), IN `VENTAC` VARCHAR(2500), IN `FECHA` DATE)   BEGIN

INSERT INTO  productos(nombre,cantidad,stok,fecha_p)VALUES(NOMBRE,UNIDAD,STOK,NOW());
INSERT INTO  venta(vanta_cantidad,venta_fecharegistro,fecha_v)VALUES(VENTAC,FECHA,NOW());


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_USU` (IN `NOMBRE` VARCHAR(200), IN `CELL` VARCHAR(11), IN `PASS` VARCHAR(200), IN `EMAIL` VARCHAR(233), IN `ROLL` VARCHAR(20))   INSERT INTO user(nombre_user,pass_user,cell,correo,rol)VALUES(NOMBRE,CELL,PASS,EMAIL,ROLL)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_USER` (IN `USUARIO` VARCHAR(255), IN `PASS` VARCHAR(255))   SELECT
	`user`.*
FROM
	`user`
	WHERE nombre_user = BINARY USUARIO AND pass_user=PASS$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `cantidad` varchar(2000) NOT NULL,
  `stok` varchar(2440) NOT NULL,
  `p_estatus` int(11) NOT NULL DEFAULT 1,
  `fecha_p` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `cantidad`, `stok`, `p_estatus`, `fecha_p`) VALUES
(1, '  coco11', '2200', '  2200', 0, '2023-10-05 18:01:19'),
(2, 'manzana', '9528', '1200', 1, '2023-10-05 18:47:58'),
(3, 'MANGO', '1000', '1200', 1, '2023-10-05 19:06:19'),
(4, 'MANGO1', '1000', '500', 1, '2023-10-05 19:14:19'),
(5, 'pera', '1000', '1200', 1, '2023-10-05 19:33:40'),
(6, 'pera1', '1000', '1200', 1, '2023-10-05 19:40:46'),
(7, 'asdasd', '123', '123', 1, '2023-10-05 19:48:14'),
(8, 'MANGO222', '1000', '1200', 1, '2023-10-05 19:49:27'),
(9, '', '', '', 1, '2023-10-05 19:49:48'),
(10, 'sandia', '1200', '1200', 1, '2023-10-06 16:19:46'),
(11, 'maracuya', '5000', '5000', 1, '2023-10-06 16:40:32'),
(12, ' cafe', '5600', ' 5600', 1, '2023-10-06 17:03:29'),
(13, 'pollo', '12', '12', 1, '2023-10-08 13:03:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'INVITADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nombre_user` varchar(250) NOT NULL,
  `pass_user` varchar(255) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `cell` varchar(11) NOT NULL,
  `rol` varchar(250) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `nombre_user`, `pass_user`, `correo`, `cell`, `rol`, `estatus`) VALUES
(1, 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'gaboandres1197@gmail.com', '3245889169', 'ADMINISTRADOR', 1),
(2, 'gabo', '3245889169', 'gaboandres1197@gmail.com', '123456', 'ADMINISTRADOR', 1),
(3, 'camilo', '3214567891', 'camilo@gmail.com', '7c4a8d09ca3', 'INVITADO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `vanta_cantidad` varchar(2500) NOT NULL,
  `venta_fecharegistro` date NOT NULL,
  `v_estatus` int(11) NOT NULL DEFAULT 1,
  `fecha_v` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`venta_id`, `producto_id`, `vanta_cantidad`, `venta_fecharegistro`, `v_estatus`, `fecha_v`) VALUES
(1, 0, '2000', '2023-10-05', 0, '2023-10-05 18:01:19'),
(2, 0, '2323', '2023-10-05', 1, '2023-10-05 18:47:58'),
(3, 0, '222', '2023-10-05', 1, '2023-10-05 19:06:19'),
(4, 0, '222', '2023-10-05', 1, '2023-10-05 19:14:19'),
(5, 0, '222', '2023-10-05', 1, '2023-10-05 19:33:40'),
(6, 0, '222', '2023-10-05', 1, '2023-10-05 19:40:46'),
(7, 0, '123', '2023-10-05', 1, '2023-10-05 19:48:14'),
(8, 0, '222', '2023-10-05', 1, '2023-10-05 19:49:27'),
(9, 0, '', '0000-00-00', 1, '2023-10-05 19:49:48'),
(10, 0, '1200', '2023-10-06', 1, '2023-10-06 16:19:46'),
(11, 0, '2500', '2023-10-06', 1, '2023-10-06 16:40:32'),
(12, 0, '1200', '2023-10-06', 1, '2023-10-06 17:03:29'),
(13, 0, '12', '2023-10-08', 1, '2023-10-08 13:03:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venta_id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `venta_fecharegistro` (`venta_fecharegistro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `venta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*
MySQL Backup
Database: graficos
Backup Time: 2023-10-06 18:47:06
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `graficos`.`productos`;
DROP TABLE IF EXISTS `graficos`.`venta`;
DROP PROCEDURE IF EXISTS `graficos`.`GRAFICOS_BAR`;
DROP PROCEDURE IF EXISTS `graficos`.`SP_ACTUALIZAR_PRODUCTOS`;
DROP PROCEDURE IF EXISTS `graficos`.`SP_DATOSGRAFICO_PARAMETRO`;
DROP PROCEDURE IF EXISTS `graficos`.`SP_DATOSGRAFICO_PARAMETRO_MES`;
DROP PROCEDURE IF EXISTS `graficos`.`SP_DELETE_PRODUCTOS`;
DROP PROCEDURE IF EXISTS `graficos`.`SP_GRAFICOS_GENERAL`;
DROP PROCEDURE IF EXISTS `graficos`.`SP_REGISTRAR_PRODUCTOS`;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `cantidad` varchar(2000) NOT NULL,
  `stok` varchar(2440) NOT NULL,
  `p_estatus` int(11) NOT NULL DEFAULT 1,
  `fecha_p` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `venta` (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `vanta_cantidad` varchar(2500) NOT NULL,
  `venta_fecharegistro` date NOT NULL,
  `v_estatus` int(11) NOT NULL DEFAULT 1,
  `fecha_v` varchar(200) NOT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `producto_id` (`producto_id`),
  KEY `venta_fecharegistro` (`venta_fecharegistro`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GRAFICOS_BAR`()
SELECT * FROM `productos` WHERE 1;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_PRODUCTOS`(IN IDPRODUCTO INT(10),IN NOMBRE VARCHAR(233),
IN CANTIDAD VARCHAR(222),IN STOK VARCHAR(233),IN VENTACANTIDAD VARCHAR(233),IN VENTAFECHA DATE)
UPDATE productos,venta
 SET productos.id=IDPRODUCTO,
		 productos.nombre =NOMBRE,
     productos.cantidad =CANTIDAD,
     productos.stok =STOK,
		 venta.vanta_cantidad =VENTACANTIDAD,
     venta.venta_fecharegistro	=VENTAFECHA

WHERE productos.id = IDPRODUCTO AND venta.venta_id = IDPRODUCTO;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DATOSGRAFICO_PARAMETRO`(IN `ANIOINICIO` VARCHAR(10), IN `ANIOFIN` VARCHAR(10))
SELECT
	productos.nombre,
	venta.vanta_cantidad AS CANTIDAD
	
FROM
	venta
	INNER JOIN productos ON  venta.venta_id = productos.id
	WHERE   venta.venta_fecharegistro BETWEEN ANIOINICIO AND ANIOFIN
	GROUP BY venta.venta_id;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DATOSGRAFICO_PARAMETRO_MES`(IN MESINICIO VARCHAR(10), IN MESFIN VARCHAR(10))
SELECT
	productos.nombre,
	venta.vanta_cantidad AS CANTIDAD
	
FROM
	venta
	INNER JOIN productos ON  venta.venta_id = productos.id
	WHERE   MONTH(venta.venta_fecharegistro)  BETWEEN MESINICIO AND MESFIN
	
	GROUP BY venta.venta_id;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_PRODUCTOS`(IN ID INT(11))
DELETE p
FROM productos p
INNER JOIN venta v
  ON p.id=v.venta_id
WHERE p.id = ID AND v.venta_id = ID;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GRAFICOS_GENERAL`()
SELECT
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
	venta.venta_id = productos.id;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PRODUCTOS`(IN `NOMBRE` VARCHAR(200), IN `UNIDAD` VARCHAR(2000), IN `STOK` VARCHAR(2440), IN `VENTAC` VARCHAR(2500), IN `FECHA` DATE)
BEGIN

INSERT INTO  productos(nombre,cantidad,stok,fecha_p)VALUES(NOMBRE,UNIDAD,STOK,NOW());
INSERT INTO  venta(vanta_cantidad,venta_fecharegistro,fecha_v)VALUES(VENTAC,FECHA,NOW());


END;
BEGIN;
LOCK TABLES `graficos`.`productos` WRITE;
DELETE FROM `graficos`.`productos`;
INSERT INTO `graficos`.`productos` (`id`,`nombre`,`cantidad`,`stok`,`p_estatus`,`fecha_p`) VALUES (1, ' coco1', '2200', ' 2200', 0, '2023-10-05 18:01:19'),(2, 'manzana', '9528', '1200', 1, '2023-10-05 18:47:58'),(3, 'MANGO', '1000', '1200', 1, '2023-10-05 19:06:19'),(4, 'MANGO1', '1000', '500', 1, '2023-10-05 19:14:19'),(5, 'pera', '1000', '1200', 1, '2023-10-05 19:33:40'),(6, 'pera1', '1000', '1200', 1, '2023-10-05 19:40:46'),(7, 'asdasd', '123', '123', 1, '2023-10-05 19:48:14'),(8, 'MANGO222', '1000', '1200', 1, '2023-10-05 19:49:27'),(9, '', '', '', 1, '2023-10-05 19:49:48'),(10, 'sandia', '1200', '1200', 1, '2023-10-06 16:19:46'),(11, 'maracuya', '5000', '5000', 1, '2023-10-06 16:40:32'),(12, ' cafe', '5600', ' 5600', 1, '2023-10-06 17:03:29')
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `graficos`.`venta` WRITE;
DELETE FROM `graficos`.`venta`;
INSERT INTO `graficos`.`venta` (`venta_id`,`producto_id`,`vanta_cantidad`,`venta_fecharegistro`,`v_estatus`,`fecha_v`) VALUES (1, 0, '2000', '2023-10-05', 0, '2023-10-05 18:01:19'),(2, 0, '2323', '2023-10-05', 1, '2023-10-05 18:47:58'),(3, 0, '222', '2023-10-05', 1, '2023-10-05 19:06:19'),(4, 0, '222', '2023-10-05', 1, '2023-10-05 19:14:19'),(5, 0, '222', '2023-10-05', 1, '2023-10-05 19:33:40'),(6, 0, '222', '2023-10-05', 1, '2023-10-05 19:40:46'),(7, 0, '123', '2023-10-05', 1, '2023-10-05 19:48:14'),(8, 0, '222', '2023-10-05', 1, '2023-10-05 19:49:27'),(9, 0, '', '0000-00-00', 1, '2023-10-05 19:49:48'),(10, 0, '1200', '2023-10-06', 1, '2023-10-06 16:19:46'),(11, 0, '2500', '2023-10-06', 1, '2023-10-06 16:40:32'),(12, 0, '1200', '2023-10-06', 1, '2023-10-06 17:03:29')
;
UNLOCK TABLES;
COMMIT;

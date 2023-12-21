-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2023 a las 04:53:09
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
-- Base de datos: `minosdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analisiscarnico_cab`
--

CREATE TABLE `analisiscarnico_cab` (
  `idanalisis` double NOT NULL,
  `fecha` date NOT NULL,
  `codarticulo` varchar(10) NOT NULL,
  `centroproduccion` varchar(4) NOT NULL,
  `unidad` varchar(4) NOT NULL,
  `cantidad` decimal(10,0) NOT NULL,
  `vu` double NOT NULL,
  `valortotal` double NOT NULL,
  `estado` varchar(1) NOT NULL,
  `idusuario` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analisiscarnico_det`
--

CREATE TABLE `analisiscarnico_det` (
  `idanalisis` double NOT NULL,
  `tipocarne` varchar(2) NOT NULL,
  `codarticulo` varchar(10) NOT NULL,
  `unidad` varchar(4) NOT NULL,
  `cantinicial` decimal(10,2) NOT NULL,
  `porcentaje` decimal(10,2) NOT NULL,
  `valortotal` double NOT NULL,
  `costounidad` double NOT NULL,
  `costototal` double NOT NULL,
  `unidadtransformacion` varchar(20) NOT NULL,
  `costoporcion` double NOT NULL,
  `numporcion` decimal(10,2) NOT NULL,
  `factorcosto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analisisrecetas`
--

CREATE TABLE `analisisrecetas` (
  `idanalisis` double NOT NULL,
  `fecha` date NOT NULL,
  `centroproduccion` varchar(2) NOT NULL,
  `idreceta` int(11) NOT NULL,
  `nombrereceta` varchar(100) NOT NULL,
  `idgrupoplato` int(11) NOT NULL,
  `tiporeceta` varchar(1) NOT NULL COMMENT 'R(Receta)/S(subreceta)',
  `descripcion` varchar(400) NOT NULL,
  `porciones` tinyint(4) NOT NULL,
  `margenvariacion` float NOT NULL,
  `costomateria` float NOT NULL,
  `impuestoventa` float NOT NULL,
  `costopreparacion` double NOT NULL,
  `valormargenvar` double NOT NULL,
  `costototprepa` double NOT NULL,
  `costoporcion` double NOT NULL,
  `preciopotencial` double NOT NULL,
  `precioaprox` double NOT NULL,
  `preciocarta` double NOT NULL,
  `preciorealventa` double NOT NULL,
  `porcenrealcosto` double NOT NULL,
  `impuestogenerado` double NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT 'S(Activo)/N(Inactivo)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analisisrecetas_detalle`
--

CREATE TABLE `analisisrecetas_detalle` (
  `iddetalle` int(11) NOT NULL,
  `idanalisis` float NOT NULL,
  `idreceta` int(11) NOT NULL,
  `idgrupoplato` int(11) NOT NULL,
  `idarticulo` varchar(10) NOT NULL,
  `tipoarticulo` varchar(10) NOT NULL,
  `cantidad` float NOT NULL,
  `valorunitario` double NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `CodArticulo` varchar(8) NOT NULL,
  `NomArticulo` varchar(100) NOT NULL,
  `CodGrupo` varchar(2) NOT NULL,
  `CodSubGrupo` varchar(2) NOT NULL,
  `CodClas` varchar(2) NOT NULL,
  `CodPres` varchar(4) NOT NULL,
  `CodTipoUnid` varchar(4) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `stockmin` double NOT NULL,
  `iva` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`CodArticulo`, `NomArticulo`, `CodGrupo`, `CodSubGrupo`, `CodClas`, `CodPres`, `CodTipoUnid`, `estado`, `stockmin`, `iva`) VALUES
('01010101', 'perniles', '01', '01', '01', '02', '03', 'S', 50000, 19),
('01010201', 'jjjj', '01', '01', '02', '03', '02', 'S', 4444, 9),
('01010202', 'CERDO', '01', '01', '02', '01', '05', 'S', 10000, 10),
('01010301', 'salchichon', '01', '01', '03', '02', '04', 'S', 5000, 0),
('10010101', 'PREINICIADOR', '10', '01', '01', '07', '01', 'S', 250000, 0),
('10010102', 'LEVANTE', '10', '01', '01', '07', '01', 'S', 0, NULL),
('10010103', 'ENGORDE QUEBRANTADO', '10', '01', '01', '07', '01', 'S', 0, NULL),
('10010104', 'ENGORDE PELETIZADO', '10', '01', '01', '07', '01', 'S', 0, NULL),
('11010101', 'LONAS ', '11', '01', '01', '02', '04', 'S', 0, NULL),
('11020201', 'POLLINAZA', '11', '02', '02', '07', '01', 'S', 0, NULL),
('12010101', 'GAS DE 100 LB', '12', '01', '01', '02', '04', 'S', 0, NULL),
('12010102', 'GAS DE 40 LIBRAS', '12', '01', '01', '02', '04', 'S', 0, NULL),
('12020201', 'SUPRADES X GARRAFA ', '12', '02', '02', '02', '02', 'S', 0, NULL),
('13010101', 'POLLO EN CANAL X KILO', '13', '01', '01', '02', '11', 'S', 0, NULL),
('13010102', 'MENUDENCIA X KILO', '13', '01', '01', '02', '11', 'S', 0, NULL),
('13010103', 'PECHUGA X KILO', '13', '01', '01', '02', '11', 'S', 0, NULL),
('13010104', 'PIERNA PERNIL X KILO', '13', '01', '01', '02', '11', 'S', 0, NULL),
('13010105', 'ALAS X KILO', '13', '01', '01', '02', '11', 'S', 0, NULL),
('13010106', 'COLOMBINAS X KILO', '13', '01', '01', '02', '11', 'S', 0, NULL),
('13010107', 'CUADRO X KILO', '13', '01', '01', '02', '11', 'S', 0, NULL),
('13010108', 'RABADILLA X KILO', '13', '01', '01', '02', '11', 'S', 0, NULL),
('13010109', 'PERNIL SIN RABADILLA X KILO', '13', '01', '01', '02', '11', 'S', 0, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barabrircajas`
--

CREATE TABLE `barabrircajas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(100) NOT NULL,
  `fechacierre` date NOT NULL,
  `horacierre` varchar(10) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `base` double NOT NULL,
  `efectivo` double DEFAULT NULL,
  `cheque` double DEFAULT NULL,
  `credito` double DEFAULT NULL,
  `totalcierre` double DEFAULT NULL,
  `observaciones` varchar(100) NOT NULL,
  `obscierre` varchar(100) DEFAULT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barcajas`
--

CREATE TABLE `barcajas` (
  `idcaja` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `idbar` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barcierrecajadet`
--

CREATE TABLE `barcierrecajadet` (
  `id` double NOT NULL,
  `idcierre` double NOT NULL,
  `idfac` double NOT NULL,
  `valor` double DEFAULT NULL,
  `propinas` double DEFAULT NULL,
  `tipopago` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bardescargue`
--

CREATE TABLE `bardescargue` (
  `iddescargue` double NOT NULL,
  `FECHAINI` date NOT NULL,
  `FECHAFIN` date NOT NULL,
  `IDBAR` int(11) NOT NULL,
  `IDCAJA` int(11) NOT NULL,
  `ESTADO` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bardescargue_det`
--

CREATE TABLE `bardescargue_det` (
  `DET` double NOT NULL,
  `iddescargue` double NOT NULL,
  `articulo` varchar(50) NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `unidadppal` varchar(10) DEFAULT NULL,
  `tasa` double DEFAULT NULL,
  `cantidad` double NOT NULL,
  `valor` double NOT NULL,
  `subtotal` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barfactura`
--

CREATE TABLE `barfactura` (
  `idfac` double NOT NULL,
  `idorden` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(10) NOT NULL,
  `tercero` varchar(50) NOT NULL,
  `idbar` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idmesa` int(11) NOT NULL,
  `propina` double NOT NULL,
  `valor` double NOT NULL,
  `tipopago` varchar(20) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barfactura_det`
--

CREATE TABLE `barfactura_det` (
  `id_det` double NOT NULL,
  `idfac` double NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `idanalisis` int(11) NOT NULL,
  `cantidad` decimal(10,1) NOT NULL,
  `vu` double NOT NULL,
  `impuesto` decimal(10,0) NOT NULL,
  `valorimpuesto` float NOT NULL,
  `subtotal` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barfactura_det_acompa`
--

CREATE TABLE `barfactura_det_acompa` (
  `idacomp` double NOT NULL,
  `id_det` double NOT NULL,
  `id_fac` double NOT NULL,
  `id_prefac` double NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `idanalisis` double NOT NULL,
  `cantidad` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barmesas`
--

CREATE TABLE `barmesas` (
  `idmesas` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `idbar` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barordenpedido`
--

CREATE TABLE `barordenpedido` (
  `idorden` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(10) NOT NULL,
  `tercero` varchar(50) NOT NULL,
  `idbar` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idmesa` int(11) NOT NULL,
  `valor` double NOT NULL,
  `estado` varchar(1) NOT NULL,
  `pax` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barordenpedido_det`
--

CREATE TABLE `barordenpedido_det` (
  `id_det` double NOT NULL,
  `idorden` double NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `idanalisis` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `saldocan` decimal(10,1) NOT NULL,
  `vu` double NOT NULL,
  `impuesto` decimal(10,0) NOT NULL,
  `valorimpuesto` float NOT NULL,
  `subtotal` double NOT NULL,
  `saldosubtotal` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barordenpedido_det_acompa`
--

CREATE TABLE `barordenpedido_det_acompa` (
  `idacomp` double NOT NULL,
  `id_det` double NOT NULL,
  `idorden` double NOT NULL,
  `idacompa_analisis` int(11) NOT NULL,
  `idanalisis` double NOT NULL,
  `cantidad` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barprefactura`
--

CREATE TABLE `barprefactura` (
  `idfac` double NOT NULL,
  `idorden` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(10) NOT NULL,
  `tercero` varchar(50) NOT NULL,
  `idbar` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idmesa` int(11) NOT NULL,
  `propina` double NOT NULL,
  `valor` double NOT NULL,
  `tipopago` varchar(20) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barprefactura_det`
--

CREATE TABLE `barprefactura_det` (
  `id_det` double NOT NULL,
  `id_prefac` double NOT NULL,
  `id_detOP` double NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `idanalisis` int(11) NOT NULL,
  `cantidad` decimal(10,1) NOT NULL,
  `vu` double NOT NULL,
  `impuesto` decimal(10,0) NOT NULL,
  `valorimpuesto` float NOT NULL,
  `subtotal` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barprefactura_det_acompa`
--

CREATE TABLE `barprefactura_det_acompa` (
  `idacomp` double NOT NULL,
  `id_det` double NOT NULL,
  `idorden` double NOT NULL,
  `id_prefac` double NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `idanalisis` double NOT NULL,
  `cantidad` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `basesdatos`
--

CREATE TABLE `basesdatos` (
  `IdBases` int(11) NOT NULL,
  `base` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo` varchar(1) NOT NULL COMMENT 'P (Principal) / A(Aprendiz)',
  `documento` varchar(40) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT 'S (Disponible) / N (No Disponible)'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bienes`
--

CREATE TABLE `bienes` (
  `IdBienes` int(11) NOT NULL,
  `NombreBienes` varchar(45) NOT NULL,
  `ValorBienes` decimal(25,0) NOT NULL,
  `ObservacionBienes` varchar(200) NOT NULL,
  `EstadoBienes` varchar(15) NOT NULL,
  `CantidadBienes` int(11) NOT NULL,
  `IdTipoBienes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `IdCaja` int(11) NOT NULL,
  `ValorBaseCaja` decimal(25,0) NOT NULL,
  `ValorActualCaja` decimal(25,0) NOT NULL,
  `FechaCaja` date NOT NULL,
  `HoraAperturaCaja` time NOT NULL,
  `HoraCierreCaja` time NOT NULL,
  `ObservacionesCaja` varchar(200) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calculorecetas`
--

CREATE TABLE `calculorecetas` (
  `idanalisis` double NOT NULL,
  `fecha` date NOT NULL,
  `centroproduccion` varchar(2) NOT NULL,
  `idreceta` int(11) NOT NULL,
  `nombrereceta` varchar(100) NOT NULL,
  `idgrupoplato` int(11) NOT NULL,
  `tiporeceta` varchar(1) NOT NULL COMMENT 'R(Receta)/S(subreceta)',
  `descripcion` varchar(400) NOT NULL,
  `porciones` tinyint(4) NOT NULL,
  `totalporciones` tinyint(4) NOT NULL,
  `desc_explosion` varchar(300) DEFAULT NULL,
  `estado` varchar(1) NOT NULL COMMENT 'S(Activo)/N(Inactivo)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calculorecetas_detalle`
--

CREATE TABLE `calculorecetas_detalle` (
  `iddetalle` int(11) NOT NULL,
  `idanalisis` float NOT NULL,
  `idreceta` int(11) NOT NULL,
  `idgrupoplato` int(11) NOT NULL,
  `idarticulo` varchar(10) NOT NULL,
  `tipoarticulo` varchar(10) NOT NULL,
  `cantidad` float NOT NULL,
  `valorunitario` double NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `valor` double NOT NULL,
  `total` double NOT NULL,
  `cantotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos_descripcion`
--

CREATE TABLE `cargos_descripcion` (
  `idcargo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `fijo` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `IdCiudad` int(11) NOT NULL,
  `NombreCiudad` varchar(50) NOT NULL,
  `IdDepartamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`IdCiudad`, `NombreCiudad`, `IdDepartamento`) VALUES
(1, 'LETICIA', 1),
(2, 'MEDELLÃN', 2),
(3, 'ARAUCA', 3),
(4, 'BARRANQUILLA', 4),
(5, 'CARTAGENA', 5),
(6, 'TUNJA', 6),
(7, 'MANIZALES', 7),
(8, 'FLORENCIA', 8),
(9, 'YOPAL', 9),
(10, 'POPAYÃN', 10),
(11, 'VALLEDUPAR', 11),
(12, 'QUIBDÃ“', 12),
(13, 'MONTERÃA', 13),
(14, 'SANTA FE DE BOGOTÃ', 14),
(15, 'PUERTO INÃRIDA', 15),
(16, 'SAN JOSÃ‰ DEL GUAVIARE', 16),
(17, 'NEIVA', 17),
(18, 'RIOHACHA', 18),
(19, 'SANTA MARTA', 19),
(20, 'VILLAVICENCIO', 20),
(21, 'PASTO', 21),
(22, 'CÃšCUTA', 22),
(23, 'MOCOA', 23),
(24, 'ARMENIA', 24),
(25, 'PEREIRA', 25),
(26, 'SAN ANDRÃ‰S', 26),
(27, 'BUCARAMANGA', 27),
(28, 'SINCELEJO', 28),
(29, 'IBAGUÃ‰', 29),
(30, 'CALI', 30),
(31, 'MITÃš', 31),
(32, 'PUERTO CARREÃ‘O', 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion_clientes`
--

CREATE TABLE `clasificacion_clientes` (
  `idclasificacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descuento` decimal(10,0) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL,
  `NitCliente` varchar(20) NOT NULL,
  `TipoDocumentoCliente` varchar(45) DEFAULT NULL,
  `NombreCliente` varchar(45) NOT NULL,
  `ApellidoCliente` varchar(50) DEFAULT NULL,
  `DireccionCliente` varchar(100) NOT NULL,
  `Telefono1Cliente` varchar(20) NOT NULL,
  `Telefono2Cliente` varchar(20) DEFAULT NULL,
  `CorreoCliente` varchar(120) NOT NULL,
  `ObservacionesCliente` varchar(200) DEFAULT NULL,
  `PreferenciasCliente` varchar(200) DEFAULT NULL,
  `ComisionCliente` double DEFAULT NULL,
  `NumeroCuentaCliente` varchar(60) NOT NULL,
  `ActividadEconomicaCliente` varchar(150) DEFAULT NULL,
  `ValorCreditoCliente` decimal(25,0) DEFAULT NULL,
  `NacionalidadCliente` varchar(30) NOT NULL,
  `ContactoCliente` varchar(60) DEFAULT NULL,
  `CodigoMagicoCliente` varchar(45) NOT NULL,
  `DescuentoCliente` double DEFAULT NULL,
  `IdCiudad` int(11) DEFAULT NULL,
  `IdClienteTipo` int(11) DEFAULT NULL,
  `IdPersonaTipo` int(11) DEFAULT NULL,
  `IdContribuyenteTipo` int(11) DEFAULT NULL,
  `IdConvenio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientetipo`
--

CREATE TABLE `clientetipo` (
  `IdClienteTipo` int(11) NOT NULL,
  `NombreClienteTipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `clientetipo`
--

INSERT INTO `clientetipo` (`IdClienteTipo`, `NombreClienteTipo`) VALUES
(1, 'PARTICULAR'),
(2, 'CORPORATIVO'),
(3, 'AGENCIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL,
  `idtercero` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `descripcion` int(11) NOT NULL,
  `valortota` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_cab`
--

CREATE TABLE `compras_cab` (
  `idcompra` double NOT NULL,
  `idorden` double NOT NULL,
  `fecha` date NOT NULL,
  `numfactura` varchar(15) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `valortotal` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_det`
--

CREATE TABLE `compras_det` (
  `iddet` double NOT NULL,
  `idcompra` double NOT NULL,
  `idarticulo` varchar(8) NOT NULL,
  `unidad` varchar(4) NOT NULL,
  `cantidad` double NOT NULL,
  `valorunitario` double NOT NULL,
  `iva` double NOT NULL,
  `porciva` decimal(10,0) NOT NULL,
  `valortotal` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobanteegreso`
--

CREATE TABLE `comprobanteegreso` (
  `IdComprobanteEgreso` int(11) NOT NULL,
  `FechaComprobanteEgreso` datetime NOT NULL,
  `ConceptoComprobanteEgreso` varchar(150) NOT NULL,
  `ValorComprobanteEgreso` decimal(25,0) NOT NULL,
  `ValorLetrasComprobanteEgreso` varchar(200) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdFacturaExterna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante_cab`
--

CREATE TABLE `comprobante_cab` (
  `num_comprobante` varchar(255) NOT NULL,
  `tipo_comprobante` varchar(255) NOT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `total_debitos` double DEFAULT NULL,
  `total_creditos` double DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante_det`
--

CREATE TABLE `comprobante_det` (
  `id_det` double NOT NULL,
  `num_comprobante` int(11) DEFAULT NULL,
  `tipo_comprobante` int(11) DEFAULT NULL,
  `cuenta` varchar(300) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `valdebito` double DEFAULT NULL,
  `valcredito` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumos`
--

CREATE TABLE `consumos` (
  `IdConsumos` int(11) NOT NULL,
  `TipoConsumos` varchar(20) NOT NULL,
  `ValorConsumos` decimal(25,0) NOT NULL,
  `CantidadConsumos` int(11) NOT NULL,
  `EstadoConsumos` varchar(40) NOT NULL,
  `IdFacturaExterna` int(11) DEFAULT NULL,
  `IdFolio` int(11) DEFAULT NULL,
  `IdCotizacion` int(11) DEFAULT NULL,
  `IdServicios` int(11) DEFAULT NULL,
  `IdBienes` int(11) DEFAULT NULL,
  `IdProductos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumos_folio`
--

CREATE TABLE `consumos_folio` (
  `IdConsumos` int(11) NOT NULL,
  `TipoConsumos` varchar(20) NOT NULL,
  `ValorConsumos` decimal(25,0) NOT NULL,
  `CantidadConsumos` int(11) NOT NULL,
  `EstadoConsumos` varchar(40) NOT NULL,
  `IdFacturaExterna` int(11) DEFAULT NULL,
  `IdFolio` int(11) DEFAULT NULL,
  `IdCotizacion` int(11) DEFAULT NULL,
  `IdServicios` int(11) DEFAULT NULL,
  `IdBienes` int(11) DEFAULT NULL,
  `IdProductos` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `impuesto` float DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumos_folio_detalle`
--

CREATE TABLE `consumos_folio_detalle` (
  `IdConsumosdet` double NOT NULL,
  `idconsumos` double NOT NULL,
  `TipoConsumos` varchar(20) NOT NULL,
  `ValorConsumos` decimal(25,0) NOT NULL,
  `CantidadConsumos` int(11) NOT NULL,
  `EstadoConsumos` varchar(40) NOT NULL,
  `IdFacturaExterna` int(11) DEFAULT NULL,
  `IdFolio` int(11) DEFAULT NULL,
  `IdCotizacion` int(11) DEFAULT NULL,
  `IdServicios` int(11) DEFAULT NULL,
  `IdBienes` int(11) DEFAULT NULL,
  `IdProductos` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `impuesto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contribuyentetipo`
--

CREATE TABLE `contribuyentetipo` (
  `IdContribuyenteTipo` int(11) NOT NULL,
  `NombreContribuyenteTipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio`
--

CREATE TABLE `convenio` (
  `IdConvenio` int(11) NOT NULL,
  `CodigoConvenio` varchar(20) NOT NULL,
  `EstadoConvenio` varchar(25) NOT NULL,
  `NombreConvenio` varchar(50) NOT NULL,
  `FormaPagoConvenio` varchar(30) DEFAULT NULL,
  `InicioFechaConvenio` date NOT NULL,
  `FinFechaConvenio` date NOT NULL,
  `PenalizacionConvenio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `IdCotizacion` int(11) NOT NULL,
  `DatosClienteCotizacion` varchar(500) NOT NULL,
  `TipoHabitacionCotizacion` varchar(45) NOT NULL,
  `FechaCotizacion` datetime NOT NULL,
  `FechaInicioCotizacion` datetime NOT NULL,
  `FechaSalidaCotizacion` datetime NOT NULL,
  `PlazoCotizacion` int(11) NOT NULL,
  `ObservacionesCotizacion` varchar(250) NOT NULL,
  `ValorCotizacion` decimal(25,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosempresa`
--

CREATE TABLE `datosempresa` (
  `IdDatosEmpresa` int(11) NOT NULL,
  `tipodoc` varchar(20) DEFAULT NULL,
  `NitDatosEmpresa` varchar(20) NOT NULL,
  `NombreDatosEmpresa` varchar(50) NOT NULL,
  `sigla` varchar(20) DEFAULT NULL,
  `TelefonoDatosEmpresa` varchar(20) NOT NULL,
  `CorreoDatosEmpresa` varchar(70) NOT NULL,
  `DireccionDatosEmpresa` varchar(80) NOT NULL,
  `LogoDatosEmpresa` text DEFAULT NULL,
  `WebDatosEmpresa` varchar(200) DEFAULT NULL,
  `rnt` varchar(50) DEFAULT NULL,
  `resoldian` varchar(150) DEFAULT NULL,
  `textofactura` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `IdDepartamento` int(11) NOT NULL,
  `NombreDepartamento` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`IdDepartamento`, `NombreDepartamento`) VALUES
(1, 'AMAZONAS'),
(2, 'ANTIOQUIA'),
(3, 'ARAUCA'),
(4, 'ATLANTICO'),
(5, 'BOLIVAR'),
(6, 'BOYACA'),
(7, 'CALDAS'),
(8, 'CAQUETA'),
(9, 'CASANARE'),
(10, 'CAUCA'),
(11, 'CESAR'),
(12, 'CHOCO'),
(13, 'CORDOBA'),
(14, 'CUNDINAMARCA'),
(15, 'GUAINIA'),
(16, 'GUAVIARE'),
(17, 'HUILA'),
(18, 'LA GUAJIRA'),
(19, 'MAGDALENA'),
(20, 'META'),
(21, 'NARI?O'),
(22, 'NORTE DE SANTANDER'),
(23, 'PUTUMAYO'),
(24, 'QUINDIO'),
(25, 'RISARALDA'),
(26, 'SAN ANDRES Y PROVIDENCIA'),
(27, 'SANTANDER'),
(28, 'SUCRE'),
(29, 'TOLIMA'),
(30, 'VALLE DEL CAUCA'),
(31, 'VAUPES'),
(32, 'VICHADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos_noches`
--

CREATE TABLE `descuentos_noches` (
  `iddescuento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,0) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_usuarios`
--

CREATE TABLE `documentos_usuarios` (
  `id` double NOT NULL,
  `iddoc` double NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipodoc` varchar(50) DEFAULT NULL,
  `tabla` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dominios`
--

CREATE TABLE `dominios` (
  `valor_inicial` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valor_final` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `descripcion_valor` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nombre_dominio` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipo` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `descripcion_dominio` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dominios`
--

INSERT INTO `dominios` (`valor_inicial`, `valor_final`, `descripcion_valor`, `nombre_dominio`, `tipo`, `descripcion_dominio`) VALUES
('03', '0403', 'COPAS LICORES Y COCTELES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '0504', 'MESA  REDONDA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0504', 'MULETÓN MESA  A', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('43', 'true', 'FRASCOX400gr', 'UNIDADES_INVENTARIO', 'FRX400gr', 'ACTIVO'),
('41', 'true', 'BOTELLA POR 750CC', 'UNIDADES_INVENTARIO', 'BOT750', 'ACTIVO'),
('42', 'false', 'centimetros cubicos', 'UNIDADES_INVENTARIO', 'cc', 'ACTIVO'),
('1', '5', 'Riesgo I', 'ARL', NULL, 'RIESGOS LABORALES'),
('13', 'false', 'BOTELLA X 150 CC', 'UNIDADES_INVENTARIO', 'BOTX150CC', 'ACTIVO'),
('32', 'false', 'PORCION X 150 g', 'UNIDADES_INVENTARIO', 'PRX150 g', 'ACTIVO'),
('03', '05', 'SERVILLETAS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('1', NULL, 'ENTRADAS', 'GRUPOS_PLATOS', 'S', NULL),
('2', NULL, 'PROTEINA', 'GRUPOS_PLATOS', 'S', NULL),
('3', NULL, 'ACOMPAÑAMIENTO', 'GRUPOS_PLATOS', 'S', NULL),
('4', NULL, 'POSTRES', 'GRUPOS_PLATOS', 'S', NULL),
('5', NULL, 'JUGOS', 'GRUPOS_PLATOS', 'S', NULL),
('6', NULL, 'REFRIGERIOS', 'GRUPOS_PLATOS', 'N', NULL),
('7', NULL, 'PASABOCAS', 'GRUPOS_PLATOS', 'S', NULL),
('02', '0403', 'COPAS DE VINO', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('1', '5', NULL, 'IVA', 'S', NULL),
('2', '9', NULL, 'IVA', 'S', NULL),
('3', '14', NULL, 'IVA', 'S', NULL),
('4', '16', NULL, 'IVA', 'S', NULL),
('5', '19', NULL, 'IVA', 'S', NULL),
('0', '0', NULL, 'IVA', 'S', NULL),
('53', 'false', 'FRASCOX900CC', 'UNIDADES_INVENTARIO', 'FRCx900cc', 'ACTIVO'),
('52', 'false', 'PORCIÓN X 300gr', 'UNIDADES_INVENTARIO', 'PORX300gr', 'ACTIVO'),
('51', 'true', 'GARRAFAx3000cc', 'UNIDADES_INVENTARIO', 'GF x3000cc', 'ACTIVO'),
('12', 'false', 'GRAMO', 'UNIDADES_INVENTARIO', 'GR', 'ACTIVO'),
('01', '0403', 'VASOS SERVICIO', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('23', 'false', 'ONZA', 'UNIDADES_INVENTARIO', 'OZ', 'ACTIVO'),
('2', '4', 'Riesgo II', 'ARL', NULL, 'RIESGOS LABORALES'),
('3', '5', 'Riesgo III', 'ARL', NULL, NULL),
('4', '8', 'Riesgo IV', 'ARL', NULL, NULL),
('5', '10', 'Riesgo V', 'ARL', NULL, NULL),
('0', '0', 'NINGUNO', 'ARL', NULL, NULL),
('11', 'true', 'KILO', 'UNIDADES_INVENTARIO', 'KL', 'ACTIVO'),
('21', 'true', 'LIBRA', 'UNIDADES_INVENTARIO', 'LB', 'ACTIVO'),
('03', '0402', 'PLATO FUERTE', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('33', 'false', 'BOLSA X 100 gr', 'UNIDADES_INVENTARIO', 'BOL X 100g', 'ACTIVO'),
('22', 'true', 'PORCION POR 250G', 'UNIDADES_INVENTARIO', 'PORCX 250g', 'ACTIVO'),
('03', '0502', 'FORROS SILLAS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '04', 'CRISTALERIA', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '04', 'CUBIERTERIA', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '02', 'LICORES', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('02', '04', 'VAJILLA', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('02', '03', 'CLIENTES', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('03', '03', 'PAPELERIA', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('02', '02', 'VINOS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('02', '05', 'FALDONES', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '05', 'MATELES', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '03', 'ASEO', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('04', '0402', 'PLATO TORTERO', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0504', 'MULETÓN MESA C', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('31', 'true', 'LITRO', 'UNIDADES_INVENTARIO', 'LT', 'ACTIVO'),
('02', '0502', 'ESTAMPADOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0502', 'BLANCOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0202', 'TINTOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '0501', 'MESA REDONDA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '0202', 'ROSE', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0401', 'TENEDORES DE MESA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '0401', 'CUCHILLOS DE MESA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0402', 'PLATOS DE BASE', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0402', 'TAZAS Y PLATOS HONDOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '', 'ALIMENTOS', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('05', '', 'MANTELES', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('03', '', 'SUMINISTROS', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('02', '', 'BEBIDAS', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('04', '', 'ACTIVOS DE OPERACION', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('01', '01', 'CARNES', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('02', '0303', 'UTILES DE OFICINA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0501', 'MESA B', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0303', 'IMPRESOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0101', 'RES Y CERDO', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0501', 'MESA A', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '0302', 'DECORACION', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0401', 'CUCHARAS DE MESA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0202', 'BLANCOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '0301', 'QUIMICOS DESINFECCION', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0302', 'PAPELERIA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '0201', 'COCTELES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0302', 'SOUVENIRS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0201', 'CREMAS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0101', 'AVES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0301', 'QUIMICOS LIMPIEZA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0201', 'AGUARDIENTES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0301', 'UTENSILIOS ASEO', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('05', '01', 'AGUAS Y GASEOSAS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('04', '01', 'EMPACADO Y ENVASADOS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('03', '01', 'LACTEOS II', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('02', '01', 'LACTEOS  I HUEVOS Y PANES', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('04', '05', 'MULETONES', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('1', NULL, 'ENTRADAS', 'CARTA', 'S', NULL),
('2', NULL, 'PLATO FUERTE', 'CARTA', 'S', NULL),
('3', NULL, 'ACOMPAÑAMIENTO', 'CARTA', 'S', NULL),
('4', NULL, 'POSTRES', 'CARTA', 'S', NULL),
('5', NULL, 'JUGOS', 'CARTA', 'S', NULL),
('7', NULL, 'ADICIONALES', 'CARTA', 'S', NULL),
('6', NULL, 'PASABOCAS', 'CARTA', 'S', NULL),
('57', '42', '450', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('51', '51', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('32', '11', '0.15', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('11', '12', '1000', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('22', '22', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('31', '42', '1000', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('21', '32', '3.33333', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('31', '31', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('31', '13', '6.666666666', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('23', '23', '33.814', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('11', '22', '4', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('11', '32', '6.6666667', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('11', '21', '2', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('31', '23', '33,814', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('31', '13', '6.666666666', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('21', '43', '1,25', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('21', '12', '500', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('21', '22', '2', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('11', '11', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('51', '53', '3,333333333', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('51', '13', '20', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('51', '42', '3000', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('51', '41', '4', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('51', '23', '100', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('51', '31', '3', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('01', '', 'BOLSAS', 'PRESENTACION_INVENTARIO', 'BLS', 'ACTIVO'),
('03', '', 'CAJA ', 'PRESENTACION_INVENTARIO', 'CJ', 'ACTIVO'),
('02', '', 'UNIDAD', 'PRESENTACION_INVENTARIO', 'UN', 'ACTIVO'),
('05', '', 'CANASTILLA', 'PRESENTACION_INVENTARIO', 'CANT', 'ACTIVO'),
('04', '', 'GRANEL', 'PRESENTACION_INVENTARIO', 'GRN', 'ACTIVO'),
('03', '0101', 'SALSAMENTARIA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('04', '0102', 'LACTEOS I', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('05', '0103', 'PANES', 'CLASIFICACION_INVENTARIO', '3', 'INACTIVO'),
('06', '0103', 'HUEVOS', 'CLASIFICACION_INVENTARIO', '3', 'INACTIVO'),
('07', '0103', 'QUESOS FRESCOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('08', '0103', 'QUESOS MADUROS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('09', '0104', 'GRANOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0105', 'JUGOS ENVASADOS', 'CLASIFICACION_INVENTARIO', '3', 'INACTIVO'),
('01', '0105', 'AGUAS ENVASADAS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('11', '0104', 'PRECONGELADOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('10', '0104', 'EMPACADO EN SECO', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('06', '0102', 'HUEVOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('05', '0102', 'PANES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('54', 'false', 'SOBRE X 8 gr', 'UNIDADES_INVENTARIO', 'SB 8 gr', 'ACTIVO'),
('55', 'false', 'MEDIA X375 cc', 'UNIDADES_INVENTARIO', 'MedX 375CC', 'ACTIVO'),
('54', '12', '8', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('54', '54', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('04', '0101', 'PESCADOS Y MARISCOS ', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '02', 'CERVEZAS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('04', '0202', 'ESPUMOSOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '0203', 'NACIONALES INDUSTRIALES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '0203', 'IMPORTADAS INDUSTRIALES ', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '0203', 'ARTESANALES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '0105', 'GASEOSAS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('04', '0105', 'BEBIDAS HIDRATANTES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('05', '0105', 'JUGOS ENVASADOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('11', '43', '2.5', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('13', '13', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('13', '42', '150', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('13', '23', '5', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('56', 'true', 'UNIDAD X 40 GR', 'UNIDADES_INVENTARIO', 'U X 40 Gr', 'ACTIVO'),
('56', '12', '40', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('57', 'false', 'FRASCO* 450cc', 'UNIDADES_INVENTARIO', 'FRA*450cc', 'ACTIVO'),
('58', 'true', 'PAQUETE X 22 TAJADO', 'UNIDADES_INVENTARIO', 'PQ X22 TAJ', 'ACTIVO'),
('43', '23', '15', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('59', 'true', 'CAJA *180gr', 'UNIDADES_INVENTARIO', 'CJX180gr', 'ACTIVO'),
('59', '59', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('60', 'true', 'sobre x 5 gr ', 'UNIDADES_INVENTARIO', 'sobx 5gr ', 'ACTIVO'),
('24', 'true', 'PAQUETE X 125 GRAMOS ', 'UNIDADES_INVENTARIO', 'PAQX125GR', 'ACTIVO'),
('62', 'true', 'cubo x 15 gr ', 'UNIDADES_INVENTARIO', 'und x15gr', 'ACTIVO'),
('61', 'false', 'UNIDAD', 'UNIDADES_INVENTARIO', 'UND', 'ACTIVO'),
('57', '', 'VERDURAS', 'GRUPOS_INVENTARIO', '1', 'INACTIVO'),
('58', '58', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('01', '57', ' VERDURAS', 'SUBGRUPOS_INVENTARIO', '2', 'INACTIVO'),
('34', 'false', 'PORCION X 10 GR ', 'UNIDADES_INVENTARIO', 'PORC x10gr', 'ACTIVO'),
('35', 'false', 'GALON X 3770 GR ', 'UNIDADES_INVENTARIO', 'GALX3770GR', 'ACTIVO'),
('01', '5701', 'VERDURAS', 'CLASIFICACION_INVENTARIO', '3', 'INACTIVO'),
('58', '61', '22', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('36', 'false', 'PAQUETE X 450 GR ', 'UNIDADES_INVENTARIO', 'PAQX450 GR', 'ACTIVO'),
('63', 'true', 'FRASCO 100 cc', 'UNIDADES_INVENTARIO', 'FR 100 cc', 'ACTIVO'),
('63', '12', '', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('37', 'false', 'UNIDAD X 350 GR ', 'UNIDADES_INVENTARIO', 'UNIDx350gr', 'ACTIVO'),
('64', 'true', 'frascox375gr', 'UNIDADES_INVENTARIO', 'Fr x375 gr', 'ACTIVO'),
('38', 'false', 'UNIDAD X 350 CC', 'UNIDADES_INVENTARIO', 'UNIDx350cc', 'ACTIVO'),
('25', 'true', 'UNIDAD X 180 GRAMOS ', 'UNIDADES_INVENTARIO', 'UNDX180GR', 'ACTIVO'),
('26', 'true', 'FRASCO X 330 GRAMOS ', 'UNIDADES_INVENTARIO', 'FRCX330GR', 'ACTIVO'),
('65', 'true', 'UNIDAD POR 250Gr', 'UNIDADES_INVENTARIO', 'U X 250Gr', 'ACTIVO'),
('65', '61', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('21', '21', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('66', 'true', 'BOTELLA 700 ml', 'UNIDADES_INVENTARIO', 'BOT 700 ml', 'ACTIVO'),
('06', '01', 'FRUTAS Y VERDURAS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '0106', 'FRUTAS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('27', 'true', 'PACA X 12 PAQUETES ', 'UNIDADES_INVENTARIO', 'PACAX12PAQ', 'ACTIVO'),
('21', '61', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('67', 'true', 'PAQUETE X 40 UNIDADES ', 'UNIDADES_INVENTARIO', 'PAQX40UND', 'ACTIVO'),
('68', 'true', 'BOTELLA X 350CC', 'UNIDADES_INVENTARIO', 'BOTX350CC', 'ACTIVO'),
('69', 'true', 'CAJA X 40 GRAMOS', 'UNIDADES_INVENTARIO', 'CAJAX4OGR', 'ACTIVO'),
('70', 'true', 'CAJA X 40 GRAMOS', 'UNIDADES_INVENTARIO', 'CAJAX4OGR', 'ACTIVO'),
('71', 'true', 'CAJA X 40 GRAMOS', 'UNIDADES_INVENTARIO', 'CAJAX4OGR', 'ACTIVO'),
('72', 'true', 'CAJA X 40 GRAMOS', 'UNIDADES_INVENTARIO', 'CAJAX4OGR', 'ACTIVO'),
('12', '12', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('02', '0106', 'VERDURAS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('05', '0101', 'AVES', 'CLASIFICACION_INVENTARIO', '3', 'INACTIVO'),
('24', '24', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('25', '12', '180', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('26', '26', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('27', '27', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('32', '32', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('33', '33', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('34', '34', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('35', '35', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('36', '36', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('37', '37', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('38', '38', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('66', '42', '700', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('42', '42', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('43', '43', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('52', '52', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('53', '53', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('55', '55', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('56', '56', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('57', '57', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('60', '60', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('61', '61', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('62', '62', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('63', '63', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('64', '64', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('65', '65', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('66', '66', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('67', '67', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('68', '68', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('69', '69', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('70', '69', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('70', '70', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('70', '71', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('70', '72', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('69', '70', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('69', '71', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('69', '72', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('71', '69', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('71', '70', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('71', '71', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('71', '72', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('72', '69', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('72', '70', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('72', '71', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('72', '72', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('04', '02', 'CREMAS Y COCTELES', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '0204', 'CREMAS Y COCTELES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('74', 'true', 'PORCION X 200 GRAMOS', 'UNIDADES_INVENTARIO', 'PORCX200 G', 'ACTIVO'),
('74', '12', '200', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('74', '74', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('75', 'true', 'PORCION X 125 GRAMOS', 'UNIDADES_INVENTARIO', 'PORCX125 G', 'ACTIVO'),
('75', '75', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('75', '12', '125', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('76', 'true', 'PORCION X 375 GRAMOS', 'UNIDADES_INVENTARIO', 'PORCX375 G', 'ACTIVO'),
('76', '12', '375', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('76', '76', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('32', '12', '150', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('22', '12', '250', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('24', '12', '125', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('25', '25', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('26', '12', '330', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('33', '12', '100', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('34', '12', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('35', '12', '3770', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('36', '12', '450', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('37', '12', '350', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('38', '42', '350', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('68', '42', '350', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('67', '61', '40', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('55', '41', '0.5', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('55', '42', '375', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('41', '55', '2', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('41', '42', '750', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('41', '41', '1', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('11', '33', '10', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('21', '43', '1,25', 'UNIDADESTRANSFORMACION_INVENTARIO', '', 'ACTIVO'),
('8', NULL, 'PRUEBA', 'GRUPOS_PLATOS', 'N', NULL),
('9', NULL, 'PRUEBA9', 'GRUPOS_PLATOS', 'N', NULL),
('10', NULL, 'PRUEBA66', 'GRUPOS_PLATOS', 'N', NULL),
('6', '20', NULL, 'IVA', 'N', NULL),
('10', NULL, 'COCTEL', 'GRUPOS_PLATOS', 'S', NULL),
('06', '', 'grupo de prueba', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('07', '', 'GRUPO NUEVO', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('07', '01', 'sub grupo de prueba', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('06', '0101', 'cerdo', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('10', '', 'MATERIA PRIMA', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('11', '', 'SUB PRODUCTOS', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('01', '10', 'CONCENTRADOS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('02', '10', 'POLLITO', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '1001', 'CONCENTRADOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '1002', 'POLLITO', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '11', 'LONAS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('02', '11', 'POLLINAZA', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '1101', 'LONAS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '1102', 'POLLINAZA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('12', '', 'INSUMOS', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('01', '12', 'GAS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('02', '12', 'DESINFECTANTES', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('03', '12', 'VITAMINAS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('04', '12', 'ANTIBIOTICOS', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '1201', 'GAS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('02', '1202', 'DESINFECTANTES', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('03', '1203', 'VITAMINAS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', '1204', 'ANTIBIOTICOS', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO'),
('01', 'false', 'BULTOS', 'UNIDADES_INVENTARIO', 'BUL', 'ACTIVO'),
('02', 'true', 'LITROS', 'UNIDADES_INVENTARIO', 'LT', 'ACTIVO'),
('03', 'true', 'KILOGRAMOS', 'UNIDADES_INVENTARIO', 'KLG', 'ACTIVO'),
('04', 'false', 'UNIDADES', 'UNIDADES_INVENTARIO', 'UND', 'ACTIVO'),
('05', 'true', 'GRAMOS', 'UNIDADES_INVENTARIO', 'GR', 'ACTIVO'),
('06', 'true', 'CENTIMETROS CUBICOS', 'UNIDADES_INVENTARIO', 'CM3', 'ACTIVO'),
('07', 'true', 'PAQUETE X250GRM', 'UNIDADES_INVENTARIO', 'PQ250', 'ACTIVO'),
('08', 'true', 'PAQUETE X500GRM', 'UNIDADES_INVENTARIO', 'PQ500', 'ACTIVO'),
('07', '', 'BULTOS', 'PRESENTACION_INVENTARIO', 'BUL', 'ACTIVO'),
('13', '', 'VENTA', 'GRUPOS_INVENTARIO', '1', 'ACTIVO'),
('01', '13', 'VENTA', 'SUBGRUPOS_INVENTARIO', '2', 'ACTIVO'),
('01', '1301', 'VENTA', 'CLASIFICACION_INVENTARIO', '3', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dominios_hotel`
--

CREATE TABLE `dominios_hotel` (
  `valor_inicial` varchar(30) DEFAULT NULL,
  `valor_final` varchar(30) DEFAULT NULL,
  `descripcion_valor` varchar(100) DEFAULT NULL,
  `nombre_dominio` varchar(100) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `descripcion_dominio` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `dominios_hotel`
--

INSERT INTO `dominios_hotel` (`valor_inicial`, `valor_final`, `descripcion_valor`, `nombre_dominio`, `tipo`, `descripcion_dominio`) VALUES
('AEREO', '2', NULL, 'TIPOSTRANSPORTE', 'ACTIVO', NULL),
('TERRESTRE', '1', NULL, 'TIPOSTRANSPORTE', 'ACTIVO', NULL),
('VIAJE', '1', NULL, 'MOTIVOSVIAJE', 'ACTIVO', NULL),
('ESTUDIO', '2', NULL, 'MOTIVOSVIAJE', 'ACTIVO', NULL),
('EFECTIVO', '1', NULL, 'FORMAPAGO', 'ACTIVO', NULL),
('TRABAJO', '3', NULL, 'MOTIVOSVIAJE', 'ACTIVO', NULL),
('CONSIGNACION', '2', NULL, 'FORMAPAGO', 'ACTIVO', NULL),
('TARJETACREDITO', '3', NULL, 'FORMAPAGO', 'ACTIVO', NULL),
('CUENTAPORCOBRAR', '4', NULL, 'FORMAPAGO', 'ACTIVO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturaexterna`
--

CREATE TABLE `facturaexterna` (
  `IdFacturaExterna` int(11) NOT NULL,
  `FechaFacturaExterna` datetime NOT NULL,
  `IvaFacturaExterna` decimal(10,0) NOT NULL,
  `SubTotalFacturaExterna` decimal(10,0) NOT NULL,
  `ValorTotalFacturaExterna` decimal(25,0) NOT NULL,
  `ValorLetrasFacturaExterna` varchar(500) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `ValorCreditoFacturaExterna` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_hotel`
--

CREATE TABLE `factura_hotel` (
  `idfac` double NOT NULL,
  `idprefac` double NOT NULL,
  `fecha` date NOT NULL,
  `tercero` varchar(50) NOT NULL,
  `idfolio` double NOT NULL,
  `presentacion` varchar(30) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `propina` double NOT NULL,
  `valor` double NOT NULL,
  `tipopago` varchar(20) NOT NULL,
  `obs` varchar(300) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `debito` double DEFAULT NULL,
  `credito` double DEFAULT NULL,
  `fechaplazo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_hotel_detalle`
--

CREATE TABLE `factura_hotel_detalle` (
  `id_detalle` double NOT NULL,
  `id_fac` double NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `idcargo` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cantidad` float NOT NULL,
  `vu` double NOT NULL,
  `impuesto` float DEFAULT NULL,
  `valorimpuesto` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `iddoc` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_hotel_tipospago`
--

CREATE TABLE `factura_hotel_tipospago` (
  `id` double NOT NULL,
  `idfac` double DEFAULT NULL,
  `tipopago` varchar(20) DEFAULT NULL,
  `valor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folio`
--

CREATE TABLE `folio` (
  `IdFolio` int(11) NOT NULL,
  `FechaFolio` datetime NOT NULL,
  `EstadoFolio` varchar(30) NOT NULL,
  `ResponsableOcupacionFolio` varchar(70) NOT NULL,
  `TipoFolio` varchar(30) NOT NULL,
  `ValorEstadiaFolio` decimal(25,0) NOT NULL,
  `IdMovimientoHabitacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folio_nueva_detalle`
--

CREATE TABLE `folio_nueva_detalle` (
  `id_detalle` double NOT NULL,
  `id_folio` double NOT NULL,
  `fecha` date DEFAULT NULL,
  `idcargo` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cantidad` float NOT NULL,
  `vu` double NOT NULL,
  `impuesto` float DEFAULT NULL,
  `valorimpuesto` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `iddoc` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folio_nuevo`
--

CREATE TABLE `folio_nuevo` (
  `IdFolio` double NOT NULL,
  `FechaFolio` datetime NOT NULL,
  `EstadoFolio` varchar(30) NOT NULL,
  `ResponsableOcupacionFolio` varchar(70) NOT NULL,
  `TipoFolio` varchar(30) NOT NULL,
  `ValorEstadiaFolio` decimal(25,0) NOT NULL,
  `IdMovimientoHabitacion` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `observaciones` varchar(400) NOT NULL,
  `documento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `IdHabitacion` int(11) NOT NULL,
  `NombreHabitacion` varchar(20) NOT NULL,
  `EstadoHabitacion` varchar(20) NOT NULL,
  `ObservacionesHabitacion` varchar(200) DEFAULT NULL,
  `IdHabitacionTipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciontipo`
--

CREATE TABLE `habitaciontipo` (
  `IdHabitacionTipo` int(11) NOT NULL,
  `NombreHabitacionTipo` varchar(30) NOT NULL,
  `FechaCreacionHabitacionTipo` date NOT NULL,
  `CantidadPaxHabitacionTipo` int(11) NOT NULL,
  `ValorPaxHabitacionTipo` decimal(25,0) NOT NULL,
  `ValorPax2HabitacionTipo` double NOT NULL,
  `ValorAdicionalHabitacionTipo` decimal(25,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `habitaciontipo`
--

INSERT INTO `habitaciontipo` (`IdHabitacionTipo`, `NombreHabitacionTipo`, `FechaCreacionHabitacionTipo`, `CantidadPaxHabitacionTipo`, `ValorPaxHabitacionTipo`, `ValorPax2HabitacionTipo`, `ValorAdicionalHabitacionTipo`) VALUES
(1, 'ESTANDAR', '2021-09-30', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciontipo_tarifas`
--

CREATE TABLE `habitaciontipo_tarifas` (
  `IdHabitacionTipo` int(11) NOT NULL,
  `IdTarifa` int(11) NOT NULL,
  `valorpax` double DEFAULT NULL,
  `valorpax2` double DEFAULT NULL,
  `valorpaxadicional` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialcaja`
--

CREATE TABLE `historialcaja` (
  `IdHistorialCaja` int(11) NOT NULL,
  `ValorBaseCaja` decimal(25,0) NOT NULL,
  `ValorActualHistorialCaja` decimal(25,0) NOT NULL,
  `FechaHistorialCaja` date NOT NULL,
  `HoraHistorialCaja` time NOT NULL,
  `ObservacionesHistorialCaja` varchar(200) NOT NULL,
  `IdCaja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialcomprobanteingreso`
--

CREATE TABLE `historialcomprobanteingreso` (
  `IdHistorialComprobanteIngreso` int(11) NOT NULL,
  `FechaHistorialComprobanteIngreso` datetime NOT NULL,
  `IdComprobanteIngreso` int(11) NOT NULL,
  `FechaComprobanteIngreso` datetime NOT NULL,
  `NombreComprobanteIngreso` varchar(50) NOT NULL,
  `ValorComprobanteIngreso` decimal(25,0) NOT NULL,
  `CedulaComprobanteIngreso` varchar(20) NOT NULL,
  `FormaPagoComprobaanteIngreso` varchar(45) NOT NULL,
  `ConceptoComprobanteIngreso` varchar(200) NOT NULL,
  `ValorLetrasComprobanteIngreso` varchar(200) NOT NULL,
  `IdMovimiento` int(11) NOT NULL,
  `IdHabitacion` int(11) NOT NULL,
  `idcargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialprocesousuario`
--

CREATE TABLE `historialprocesousuario` (
  `IdHistorialProcesoUsuario` int(11) NOT NULL,
  `IdProcesoRealizado` varchar(50) NOT NULL,
  `NombreProceso` varchar(50) NOT NULL,
  `FechaProceso` datetime NOT NULL,
  `FechadelIngreso` datetime NOT NULL,
  `IdUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialtipohabitacion`
--

CREATE TABLE `historialtipohabitacion` (
  `IdHistorialTipoHabitacion` int(11) NOT NULL,
  `NombreTipoHabitacion` varchar(25) NOT NULL,
  `CantidadMaximaPaxHistorialTipoHabitacion` int(11) NOT NULL,
  `ValorPaxHistorialTipoHabitacion` decimal(25,0) NOT NULL,
  `ValorAdicionalHistorialTipoHabitacion` decimal(25,0) NOT NULL,
  `FechaActualizacionHistorialTipoHabitacion` date NOT NULL,
  `IdHabitacionTipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_abrircajas`
--

CREATE TABLE `hotel_abrircajas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(100) NOT NULL,
  `fechacierre` date NOT NULL,
  `horacierre` varchar(10) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `base` double NOT NULL,
  `efectivo` double DEFAULT NULL,
  `cheque` double DEFAULT NULL,
  `credito` double DEFAULT NULL,
  `totalcierre` double DEFAULT NULL,
  `observaciones` varchar(100) NOT NULL,
  `obscierre` varchar(100) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `usuarioasignado` varchar(5) DEFAULT NULL,
  `adjunto` varchar(100) DEFAULT NULL,
  `consignacion` double DEFAULT NULL,
  `debito` double DEFAULT NULL,
  `cuentacobrar` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_cajas`
--

CREATE TABLE `hotel_cajas` (
  `idcaja` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `idbar` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `hotel_cajas`
--

INSERT INTO `hotel_cajas` (`idcaja`, `nombre`, `idbar`, `estado`) VALUES
(0, '', 0, 'S'),
(0, '', 0, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_cajas_facturas`
--

CREATE TABLE `hotel_cajas_facturas` (
  `id` double NOT NULL,
  `idcajaabierta` double NOT NULL,
  `iddoc` double NOT NULL,
  `tipodoc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_cierrecajadet`
--

CREATE TABLE `hotel_cierrecajadet` (
  `id` double NOT NULL,
  `idcierre` double NOT NULL,
  `idfac` double NOT NULL,
  `valor` double DEFAULT NULL,
  `propinas` double DEFAULT NULL,
  `tipopago` varchar(20) DEFAULT NULL,
  `tipodoc` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huesped`
--

CREATE TABLE `huesped` (
  `IdHuesped` int(11) NOT NULL,
  `NumeroDocumentoHuesped` varchar(25) NOT NULL,
  `NombreHuesped` varchar(45) NOT NULL,
  `ApellidoHuesped` varchar(50) NOT NULL,
  `TelefonoHuesped` varchar(30) DEFAULT NULL,
  `NacionalidadHuesped` varchar(45) NOT NULL,
  `TipoSangreHuesped` varchar(45) DEFAULT NULL,
  `TipoDocumentoHuesped` varchar(20) NOT NULL,
  `DireccionHuesped` varchar(70) DEFAULT NULL,
  `EstadoOcupacionHuesped` varchar(45) NOT NULL,
  `FechaNacimientoHuesped` date DEFAULT NULL,
  `TipoHuesped` varchar(25) NOT NULL,
  `ProfesionHuesped` varchar(50) DEFAULT NULL,
  `SeguroHuesped` decimal(25,0) DEFAULT NULL,
  `FechaEntradaHuesped` datetime NOT NULL,
  `FechaSalidaHuesped` datetime DEFAULT NULL,
  `IdMovimientoHabitacion` int(11) DEFAULT NULL,
  `IdCiudad` int(11) DEFAULT NULL,
  `ObservacionesHuesped` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `huesped`
--

INSERT INTO `huesped` (`IdHuesped`, `NumeroDocumentoHuesped`, `NombreHuesped`, `ApellidoHuesped`, `TelefonoHuesped`, `NacionalidadHuesped`, `TipoSangreHuesped`, `TipoDocumentoHuesped`, `DireccionHuesped`, `EstadoOcupacionHuesped`, `FechaNacimientoHuesped`, `TipoHuesped`, `ProfesionHuesped`, `SeguroHuesped`, `FechaEntradaHuesped`, `FechaSalidaHuesped`, `IdMovimientoHabitacion`, `IdCiudad`, `ObservacionesHuesped`) VALUES
(1, '86070', 'JAIR', 'PERZ', NULL, 'COLOMBIANO', NULL, 'CEDULA DE CIUDADANIA', NULL, 'ACTIVO', '1980-12-16', 'ADULTO', NULL, 8500, '2021-12-16 09:23:20', '2021-12-17 13:00:00', 1, NULL, 'NINGUNA'),
(2, '80030123', 'JUAN', 'MORALES', NULL, 'CHILENO', NULL, 'CEDULA DE CIUDADANIA', NULL, 'ACTIVO', '1978-12-07', 'ADULTO', NULL, 8500, '2021-12-16 09:40:18', '2021-12-17 13:00:00', 3, NULL, 'NA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huespedalojamiento`
--

CREATE TABLE `huespedalojamiento` (
  `IdHuespedEstadia` int(11) NOT NULL,
  `FechaHuespedEstadia` date NOT NULL,
  `ValorSeguroHuespedEstadia` decimal(25,0) NOT NULL,
  `ValorNocheHuespedEstadia` decimal(25,0) NOT NULL,
  `IdHuesped` int(11) NOT NULL,
  `IdMovimientoHabitacion` int(11) NOT NULL,
  `EstadoEstadiaHuesped` varchar(20) DEFAULT NULL,
  `IdFacturaExterna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huespedestadia`
--

CREATE TABLE `huespedestadia` (
  `IdHuespedEstadia` int(11) NOT NULL,
  `FechaHuespedEstadia` date NOT NULL,
  `ValorSeguroHuespedEstadia` decimal(25,0) DEFAULT NULL,
  `ValorNocheHuespedEstadia` decimal(25,0) DEFAULT NULL,
  `IdHuesped` int(11) NOT NULL,
  `IdMovimientoHabitacion` int(11) NOT NULL,
  `EstadoEstadiaHuesped` varchar(20) DEFAULT NULL,
  `IdFacturaExterna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humincapacidades`
--

CREATE TABLE `humincapacidades` (
  `id_inca` int(11) NOT NULL,
  `incaeps_ant` varchar(20) NOT NULL,
  `incanueva` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `tercero` varchar(30) NOT NULL,
  `dia_ini` varchar(2) NOT NULL,
  `dias_inca` varchar(2) NOT NULL,
  `mes` varchar(2) NOT NULL,
  `vigencia` varchar(4) NOT NULL,
  `tipo_inca` varchar(4) NOT NULL,
  `indicador` float NOT NULL,
  `ajustar_nov` varchar(1) NOT NULL,
  `pagar_parafiscales` varchar(1) NOT NULL,
  `diasdesc_inca` varchar(3) NOT NULL,
  `valordiainca` double NOT NULL,
  `valorinca` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humincapacidades_det`
--

CREATE TABLE `humincapacidades_det` (
  `id_inca` double NOT NULL,
  `mes` varchar(2) NOT NULL,
  `vigencia` varchar(4) NOT NULL,
  `dias` int(11) NOT NULL,
  `diasdesc` int(11) NOT NULL,
  `valor` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humnivelsalarial`
--

CREATE TABLE `humnivelsalarial` (
  `id_nivel` mediumint(9) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `valor` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `humnivelsalarial`
--

INSERT INTO `humnivelsalarial` (`id_nivel`, `nombre`, `valor`, `estado`) VALUES
(0, 'almacen', 10000000, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humnomina`
--

CREATE TABLE `humnomina` (
  `id_nom` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `periodo` varchar(1) NOT NULL,
  `mes` tinyint(4) NOT NULL,
  `diasp` tinyint(4) NOT NULL,
  `mesnum` varchar(1) NOT NULL,
  `cc` varchar(4) NOT NULL,
  `vigencia` varchar(4) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humnominaretenemp`
--

CREATE TABLE `humnominaretenemp` (
  `id_nom` int(11) NOT NULL,
  `id` double NOT NULL,
  `cedulanit` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `valor` double NOT NULL,
  `ncta` smallint(6) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humnomina_aprobado`
--

CREATE TABLE `humnomina_aprobado` (
  `id_aprob` int(11) NOT NULL,
  `id_nom` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_rp` int(11) NOT NULL,
  `persoaprobo` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humnomina_det`
--

CREATE TABLE `humnomina_det` (
  `id_nom` int(11) NOT NULL,
  `cedulanit` varchar(30) NOT NULL,
  `salbas` double NOT NULL,
  `diaslab` tinyint(4) NOT NULL,
  `devendias` double NOT NULL,
  `ibc` double NOT NULL,
  `auxalim` double NOT NULL,
  `auxtran` double NOT NULL,
  `valhorex` double NOT NULL,
  `totaldev` double NOT NULL,
  `salud` double NOT NULL,
  `saludemp` double NOT NULL,
  `pension` double NOT NULL,
  `pensionemp` double NOT NULL,
  `fondosolid` double NOT NULL,
  `retefte` double NOT NULL,
  `otrasdeduc` double NOT NULL,
  `totaldeduc` double NOT NULL,
  `netopagar` double NOT NULL,
  `estado` varchar(1) NOT NULL,
  `vac` varchar(1) NOT NULL,
  `diasarl` varchar(4) NOT NULL,
  `cajacf` double NOT NULL,
  `sena` double NOT NULL,
  `icbf` double NOT NULL,
  `instecnicos` double NOT NULL,
  `esap` double NOT NULL,
  `tipofondopension` varchar(4) NOT NULL,
  `basepara` double NOT NULL,
  `basearp` double NOT NULL,
  `arp` double NOT NULL,
  `totalsalud` double NOT NULL,
  `totalpension` double NOT NULL,
  `prima_navi` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humnomina_parafiscales`
--

CREATE TABLE `humnomina_parafiscales` (
  `id_nom` int(11) NOT NULL,
  `id_parafiscal` varchar(4) NOT NULL,
  `porcentaje` decimal(10,5) NOT NULL,
  `valor` double NOT NULL,
  `cc` varchar(4) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humnomina_saludpension`
--

CREATE TABLE `humnomina_saludpension` (
  `id_nom` int(11) NOT NULL,
  `tipo` varchar(4) NOT NULL,
  `empleado` varchar(30) NOT NULL,
  `tercero` varchar(30) NOT NULL,
  `cc` varchar(2) NOT NULL,
  `valor` double NOT NULL,
  `estado` varchar(1) NOT NULL,
  `sector` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humparafiscales`
--

CREATE TABLE `humparafiscales` (
  `codigo` varchar(4) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  `porcentaje` double NOT NULL,
  `cuentapres` varchar(30) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humparafiscales_det`
--

CREATE TABLE `humparafiscales_det` (
  `id_det` int(11) NOT NULL,
  `codigo` varchar(4) NOT NULL,
  `cc` varchar(4) NOT NULL,
  `cuentacon` varchar(20) NOT NULL,
  `debito` varchar(1) NOT NULL,
  `credito` varchar(1) NOT NULL,
  `cuentapres` varchar(40) NOT NULL,
  `sector` varchar(8) NOT NULL,
  `concepto` varchar(4) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `vigencia` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humparametrosliquida`
--

CREATE TABLE `humparametrosliquida` (
  `id` int(11) NOT NULL,
  `aprueba` varchar(30) NOT NULL COMMENT 'aprueba la nomina',
  `sueldo` varchar(4) NOT NULL COMMENT 'Pagos',
  `prima_navidad` varchar(4) NOT NULL,
  `prima_vacaciones` varchar(4) NOT NULL,
  `indemni_vacaciones` varchar(4) NOT NULL,
  `bonifica_direccion` varchar(4) NOT NULL,
  `int_cesantias` varchar(4) NOT NULL,
  `sub_alimentacion` varchar(4) NOT NULL,
  `aux_transporte` varchar(4) NOT NULL,
  `aux_cesantias` varchar(4) NOT NULL,
  `recar_nocturno` varchar(4) NOT NULL,
  `horaext_diurno` varchar(4) NOT NULL,
  `horaext_nocturno` varchar(4) NOT NULL,
  `horaord_dominical` varchar(4) NOT NULL,
  `horaext_diurnadom` varchar(4) NOT NULL,
  `horaext_noctdom` varchar(4) NOT NULL,
  `cajacompensacion` varchar(4) NOT NULL COMMENT 'parafiscales',
  `icbf` varchar(4) NOT NULL,
  `sena` varchar(4) NOT NULL,
  `iti` varchar(4) NOT NULL,
  `esap` varchar(4) NOT NULL,
  `arp` varchar(4) NOT NULL,
  `salud_empleador` varchar(4) NOT NULL,
  `salud_empleado` varchar(4) NOT NULL,
  `pension_empleador` varchar(4) NOT NULL,
  `pension_empleado` varchar(4) NOT NULL,
  `provi_cesantias` varchar(4) NOT NULL,
  `int_cesantiaspara` varchar(4) NOT NULL,
  `incapacidades` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humperiodos`
--

CREATE TABLE `humperiodos` (
  `id_periodo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `dias` tinyint(4) NOT NULL,
  `vigencia` varchar(4) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humretenempleados`
--

CREATE TABLE `humretenempleados` (
  `id` double NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `id_retencion` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `empleado` varchar(40) NOT NULL,
  `deuda` double NOT NULL,
  `ncuotas` tinyint(4) NOT NULL,
  `sncuotas` tinyint(4) NOT NULL,
  `valorcuota` double NOT NULL,
  `estado` varchar(1) NOT NULL,
  `habilitado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humvariables`
--

CREATE TABLE `humvariables` (
  `codigo` varchar(4) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `pparafiscal` varchar(1) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `provision` varchar(1) NOT NULL,
  `psalud` varchar(1) NOT NULL,
  `ppension` varchar(1) NOT NULL,
  `parl` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humvariablesretenciones`
--

CREATE TABLE `humvariablesretenciones` (
  `codigo` varchar(4) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `beneficiario` varchar(30) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humvariablesretenciones_det`
--

CREATE TABLE `humvariablesretenciones_det` (
  `id_det` int(11) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  `tipocuenta` varchar(3) NOT NULL,
  `cuenta` varchar(10) NOT NULL,
  `debito` varchar(1) NOT NULL,
  `credito` varchar(1) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `modulo` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humvariables_det`
--

CREATE TABLE `humvariables_det` (
  `id_det` int(11) NOT NULL,
  `codigo` varchar(4) NOT NULL,
  `concepto` varchar(4) NOT NULL,
  `modulo` varchar(2) NOT NULL,
  `tipoconce` varchar(2) NOT NULL,
  `cc` varchar(4) NOT NULL,
  `cuentacon` varchar(20) NOT NULL,
  `cuentapres` varchar(40) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `vigencia` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hum_parametros_nom`
--

CREATE TABLE `hum_parametros_nom` (
  `salrioaux` int(11) NOT NULL,
  `redondeoibc` int(11) NOT NULL,
  `redonpension` int(11) NOT NULL,
  `redondeoibcarp` int(11) NOT NULL,
  `redondeoibcpara` int(11) NOT NULL,
  `tiporedondeoibc1` float NOT NULL,
  `tiporedondeoibc2` int(11) NOT NULL,
  `tiporedondeoibcp1` float NOT NULL,
  `tiporedondeoibcp2` int(11) NOT NULL,
  `tiporedondeoibca1` float NOT NULL,
  `tiporedondeoibca2` int(11) NOT NULL,
  `tipolquidacion` int(11) NOT NULL,
  `nivelredondeo` int(11) NOT NULL,
  `tipofondosol` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hum_porcentajesinca`
--

CREATE TABLE `hum_porcentajesinca` (
  `codigo` int(11) NOT NULL,
  `porcentaje` double NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hum_terceros_emprse`
--

CREATE TABLE `hum_terceros_emprse` (
  `codigo` double NOT NULL,
  `numdocumento` varchar(50) NOT NULL,
  `tipoemprse` varchar(3) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hum_vacaciones`
--

CREATE TABLE `hum_vacaciones` (
  `num_vaca` double NOT NULL,
  `fecha` date NOT NULL,
  `vigencia` varchar(4) NOT NULL,
  `doc_funcionario` varchar(30) NOT NULL,
  `nom_funcionario` varchar(200) NOT NULL,
  `num_resolucion` varchar(100) NOT NULL,
  `salario` double NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `valor_total` double NOT NULL,
  `paga_ibc` varchar(2) NOT NULL,
  `paga_arl` varchar(2) NOT NULL,
  `paga_para` varchar(2) NOT NULL,
  `meses` varchar(200) NOT NULL,
  `dias_total` int(11) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hum_vacaciones_det`
--

CREATE TABLE `hum_vacaciones_det` (
  `id_det` double NOT NULL,
  `doc_funcionario` varchar(30) NOT NULL,
  `num_vaca` double NOT NULL,
  `vigencia` varchar(4) NOT NULL,
  `mes` varchar(2) NOT NULL,
  `dias_vaca` int(11) NOT NULL,
  `valor_dia` double NOT NULL,
  `valor_total` double NOT NULL,
  `pagar_ibc` varchar(2) NOT NULL,
  `pagar_arl` varchar(2) NOT NULL,
  `pagar_para` varchar(2) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresocomprobante`
--

CREATE TABLE `ingresocomprobante` (
  `IdIngresoComprobante` int(11) NOT NULL,
  `FechaIngresoComprobante` datetime NOT NULL,
  `NombreClienteIngresoComprobante` varchar(70) NOT NULL,
  `CedulaIngresoComprobante` varchar(20) NOT NULL,
  `ValorIngresoComprobante` decimal(25,0) NOT NULL,
  `FormaPagoIngresoComprobante` varchar(20) NOT NULL,
  `ConceptoIngresoComprobante` varchar(200) NOT NULL,
  `ValorLetrasIngresoComprobante` varchar(120) NOT NULL,
  `IdHabitacion` int(11) NOT NULL,
  `IdMovimiento` int(11) NOT NULL,
  `IdFacturaExterna` int(11) DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `CodArticulo` varchar(16) NOT NULL,
  `tipounidad` varchar(2) NOT NULL,
  `movimiento` varchar(5) NOT NULL,
  `cantidad` double NOT NULL,
  `valor` double NOT NULL,
  `nummov` int(11) NOT NULL,
  `tipomov` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva`
--

CREATE TABLE `iva` (
  `IdIva` int(11) NOT NULL,
  `NombreIva` varchar(50) NOT NULL,
  `PorcentajeIva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `iva`
--

INSERT INTO `iva` (`IdIva`, `NombreIva`, `PorcentajeIva`) VALUES
(1, 'IVA', 19),
(2, 'CONSUMO', 8),
(3, 'CONSUMO 1', 12),
(4, 'CONSUMO 2', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `idmodulo` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `orden` varchar(2) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `icono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`idmodulo`, `nombre`, `orden`, `estado`, `icono`) VALUES
(1, 'Reserva y Check In', '3', 'N', 'fa fa-book'),
(2, 'Terceros', '2', 'N', 'fa fa-users'),
(3, 'Informes y Reportes', '6', 'S', 'fa fa-bar-chart'),
(4, 'Compras', '4', 'S', 'fa fa-cart-plus'),
(5, 'Administracion del Sistema', '1', 'S', 'fa fa-cogs'),
(6, 'Inventario', '3', 'S', 'fa fa-list-alt'),
(7, 'Ventas', '5', 'S', 'fa fa-dollar'),
(8, 'Nomina', '8', 'N', NULL),
(9, 'Contabilidad', '7', 'S', 'fa fa-book');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movinventario`
--

CREATE TABLE `movinventario` (
  `idmov` double NOT NULL,
  `codcentroprod` varchar(8) NOT NULL,
  `tipomov` varchar(1) NOT NULL,
  `prefijomov` varchar(1) NOT NULL,
  `nummov` varchar(20) NOT NULL,
  `codarticulo` varchar(10) NOT NULL,
  `codunidad` varchar(4) NOT NULL,
  `cantidad` float NOT NULL,
  `vu` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mov_cargohab`
--

CREATE TABLE `mov_cargohab` (
  `id_movcargo` double NOT NULL,
  `fecha` date DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `obs` varchar(300) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mov_cargohab_det`
--

CREATE TABLE `mov_cargohab_det` (
  `id_det` double NOT NULL,
  `id_movcargo` double NOT NULL,
  `idmovimiento` double NOT NULL,
  `habitacion` varchar(30) NOT NULL,
  `tarifa` varchar(10) NOT NULL,
  `adultos` int(11) NOT NULL,
  `ninos` int(11) NOT NULL,
  `valor` double NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `valoriva` float NOT NULL,
  `impuestohotelero` float NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_parametros`
--

CREATE TABLE `nomina_parametros` (
  `id` int(11) NOT NULL,
  `salario` double NOT NULL,
  `aux_alim` float NOT NULL,
  `aux_trans` float NOT NULL,
  `salud_empleado` decimal(10,0) NOT NULL,
  `salud_empleador` decimal(10,0) NOT NULL,
  `pension_empleado` decimal(10,0) NOT NULL,
  `pension_empleador` decimal(10,0) NOT NULL,
  `cajacompensacion` decimal(10,0) NOT NULL,
  `valor_horaextra` float NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `nomina_parametros`
--

INSERT INTO `nomina_parametros` (`id`, `salario`, `aux_alim`, `aux_trans`, `salud_empleado`, `salud_empleador`, `pension_empleado`, `pension_empleador`, `cajacompensacion`, `valor_horaextra`, `estado`) VALUES
(2, 860000, 25000, 3888, 5, 2, 4, 13, 3, 10000, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `idopcion` int(11) NOT NULL,
  `nombreopcion` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ruta` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modulo` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `orden` decimal(2,0) NOT NULL,
  `estado` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `icono` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`idopcion`, `nombreopcion`, `ruta`, `modulo`, `orden`, `estado`, `icono`) VALUES
(4, 'Clientes', 'clientes/RegistroIndividualTab.php', '2', 1, 'S', ''),
(5, 'Convenios', 'cliente/ConvenioTab.php', '2', 2, 'N', ''),
(6, 'Consultar Folios', 'folio/FoliosTap.php', '3', 5, 'N', ''),
(7, 'Solicitud de Requisicion', 'produccion/requisicionesTab.php', '4', 1, 'N', ''),
(8, 'Compras', 'produccion/ordencompraTab.php', '4', 3, 'S', ''),
(9, 'Entrada de Mercancia', 'produccion/comprasTab.php', '4', 4, 'N', ''),
(10, 'Analisis Carnico', 'produccion/TransformacionesTab.php', '4', 5, 'N', ''),
(11, 'Requisiciones', 'produccion/TrasladosTab.php', '4', 2, 'N', ''),
(12, 'Usuarios', 'parametrizacion/ActualizarMostrarUsuarios.php', '5', 2, 'S', ''),
(13, 'Tarifas', 'parametrizacion/ParametrosHotelTab.php', '5', 6, 'N', ''),
(14, 'Informacion de la Empresa', 'parametrizacion/InformacionHotelHabitacionesTab.php', '5', 3, 'S', ''),
(15, 'Bases de Datos', 'parametrizacion/ParametrosBasesDatos.php', '5', 9, 'N', ''),
(16, 'Productos', 'inventario/ProductosTab.php', '6', 1, 'N', ''),
(17, 'Unidades y Presentaciones', 'inventario/BienesTab.php', '6', 4, 'S', ''),
(18, 'Servicios', 'inventario/ServiciosTab.php', '6', 3, 'N', ''),
(19, 'Terceros-Proveedores', 'inventario/ProveedoresTab.php', '6', 1, 'S', ''),
(20, 'Grupos de Inventarios', 'inventario/InventariosMaestrosTab.php', '6', 2, 'S', ''),
(21, 'Articulos Inventario', 'inventario/ActualizarArticulos.php', '6', 5, 'S', ''),
(22, 'Centros de Produccion', 'inventario/InventariosCentrosProduccionTab.php', '6', 3, 'N', ''),
(23, 'Receta Estandar', 'inventario/RecetaEsTab.php', '4', 6, 'N', ''),
(24, 'Cajas Recepcion - AYB', 'facturacion/admincajabarTap.php', '7', 8, 'N', ''),
(25, 'Popularidad de platos', 'facturacion/popularidadesTab.php', '7', 6, 'N', ''),
(26, 'Abonos y Depositos', 'facturacion/AbonosDepositosTab.php', '3', 4, 'N', ''),
(27, 'Devoluciones', '../modulos/facturacion/DevolucionesTab.php', '7', 4, 'N', ''),
(28, 'Precuentas', 'facturacion/TransferenciasTab.php', '7', 2, 'N', ''),
(29, 'Parametrizar Cajas', 'parametrizacion/hotelcajastab.php', '7', 1, 'S', ''),
(30, 'Consumos', 'facturacion/ConsumosTap.php', '3', 3, 'N', ''),
(31, 'Empleados', '../modulos/nomina/empleadostab.php', '8', 1, 'S', ''),
(32, 'NovedadesÂ Nomina', '../modulos/nomina/nominatab.php', '8', 2, 'S', ''),
(33, 'LiquidacionÂ Nomina', '../modulos/nomina/liqnominatab.php', '8', 3, 'S', ''),
(34, 'Configuracion cargos', 'parametrizacion/cargosdescripcion.php', '5', 4, 'N', NULL),
(35, 'Roles', 'parametrizacion/roles_tab.php', '5', 1, 'S', NULL),
(36, 'Caja', 'facturacion/cajabarTab.php', '7', 7, 'S', NULL),
(39, 'Informes', 'movimiento/MovimientoTab_informes.php', '1', 4, 'S', NULL),
(40, 'Crear Folios', 'folio/crearfolio.php', '3', 1, 'N', NULL),
(41, 'Cargos Alojamiento', 'folio/cargohabitacion.php', '3', 2, 'N', NULL),
(42, 'Facturacion Hotel', 'facturacion/facturastap.php', '7', 3, 'N', NULL),
(43, 'Check Out', 'facturacion/checkouttap.php', '7', 5, 'N', NULL),
(45, 'Cajas', 'parametrizacion/hotelcajastab.php', '5', 9, 'S', NULL),
(46, 'Habitaciones', 'parametrizacion/HabitacionesTab.php', '5', 5, 'N', NULL),
(47, 'Informes de Saldos', 'folio/informesTab.php', '3', 9, 'N', NULL),
(48, 'Informes', 'produccion/InformesTab.php', '4', 8, 'S', NULL),
(49, 'Cierres', 'produccion/cierresTab.php', '4', 9, 'S', NULL),
(51, 'Configuracon AyB', 'facturacion/parametrosbarTab.php', '5', 7, 'N', NULL),
(52, 'Transformacion Animales', 'produccion/explosionTab.php', '4', 7, 'N', NULL),
(53, 'Informes', 'facturacion/informestab.php', '7', 9, 'N', NULL),
(54, 'Comprobante', 'contabilidad_g/comprobante.php', '9', 1, 'S', NULL),
(55, 'Parametrización Contable', '', '9', 2, 'S', NULL),
(56, 'Valoración de prueba', '', '9', 3, 'S', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordencompra_cab`
--

CREATE TABLE `ordencompra_cab` (
  `idorden` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fechaentrega` date NOT NULL,
  `idtercero` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `valortotal` double NOT NULL,
  `estado` varchar(1) NOT NULL,
  `usuarioaprueba` varchar(2) DEFAULT NULL,
  `fechaaproba` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordencompra_det`
--

CREATE TABLE `ordencompra_det` (
  `iddet` double NOT NULL,
  `idorden` int(11) NOT NULL,
  `idarticulo` varchar(8) NOT NULL,
  `codunidad` varchar(4) NOT NULL,
  `cantidad` double NOT NULL,
  `valorunitario` double NOT NULL,
  `iva` double NOT NULL,
  `porciva` decimal(10,0) NOT NULL,
  `valortotal` double NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `IdParametros` int(11) NOT NULL,
  `HoraCheckInParametros` time DEFAULT NULL,
  `HoraCheckOutParametros` time DEFAULT NULL,
  `LimiteEdadParametros` tinyint(4) DEFAULT NULL,
  `PorcentajePenalizacionParametros` double DEFAULT NULL,
  `FechaVencimientoFacturaParametros` int(11) DEFAULT NULL,
  `PorcentajeDescuentoNinosParametros` double DEFAULT NULL,
  `ValorSeguroParametros` decimal(10,0) NOT NULL,
  `iva` decimal(5,2) DEFAULT NULL,
  `ivaextranjero` varchar(2) DEFAULT NULL,
  `etiqueta1` varchar(50) NOT NULL,
  `etiqueta2` varchar(50) NOT NULL,
  `edad2` tinyint(4) NOT NULL,
  `valordescuento2` decimal(10,2) NOT NULL,
  `etiqueta3` varchar(50) NOT NULL,
  `edad3` tinyint(4) NOT NULL,
  `valordescuento3` decimal(10,2) NOT NULL,
  `desayuno1` varchar(1) NOT NULL,
  `seguro1` varchar(1) NOT NULL,
  `desayuno2` varchar(1) NOT NULL,
  `seguro2` varchar(1) NOT NULL,
  `desayuno3` varchar(1) NOT NULL,
  `seguro3` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`IdParametros`, `HoraCheckInParametros`, `HoraCheckOutParametros`, `LimiteEdadParametros`, `PorcentajePenalizacionParametros`, `FechaVencimientoFacturaParametros`, `PorcentajeDescuentoNinosParametros`, `ValorSeguroParametros`, `iva`, `ivaextranjero`, `etiqueta1`, `etiqueta2`, `edad2`, `valordescuento2`, `etiqueta3`, `edad3`, `valordescuento3`, `desayuno1`, `seguro1`, `desayuno2`, `seguro2`, `desayuno3`, `seguro3`) VALUES
(1, '15:00:00', '13:00:00', 2, 5, 12, 100, 8500, 0.00, 'NO', 'Bebes', 'Niños Menores', 7, 50.00, 'niños grandes', 11, 0.00, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_restaurante`
--

CREATE TABLE `parametros_restaurante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `centroproduccion` varchar(2) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `parametros_restaurante`
--

INSERT INTO `parametros_restaurante` (`id`, `nombre`, `centroproduccion`, `descripcion`, `estado`) VALUES
(1, 'Restaurante', '02', 'Restaurante prueba 27/10/2020', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personatipo`
--

CREATE TABLE `personatipo` (
  `IdPersonaTipo` int(11) NOT NULL,
  `NombrePersonaTipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `personatipo`
--

INSERT INTO `personatipo` (`IdPersonaTipo`, `NombrePersonaTipo`) VALUES
(1, 'NATURAL'),
(2, 'JURIDICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precuenta_folio`
--

CREATE TABLE `precuenta_folio` (
  `idprecuenta` double NOT NULL,
  `idfolio` double NOT NULL,
  `fecha` date DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `valordeb` double DEFAULT NULL,
  `valorcred` double DEFAULT NULL,
  `valorsaldo` double DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `precuenta_folio`
--

INSERT INTO `precuenta_folio` (`idprecuenta`, `idfolio`, `fecha`, `idusuario`, `valordeb`, `valorcred`, `valorsaldo`, `estado`) VALUES
(1, 1, '2021-12-16', 1, 8000, 0, 8000, 'ACTIVA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precuenta_folio_detalle`
--

CREATE TABLE `precuenta_folio_detalle` (
  `id_detalle` double NOT NULL,
  `id_folio` double NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `idcargo` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cantidad` float NOT NULL,
  `vu` double NOT NULL,
  `impuesto` float DEFAULT NULL,
  `valorimpuesto` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `iddoc` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `precuenta_folio_detalle`
--

INSERT INTO `precuenta_folio_detalle` (`id_detalle`, `id_folio`, `fecha`, `idcargo`, `descripcion`, `cantidad`, `vu`, `impuesto`, `valorimpuesto`, `subtotal`, `estado`, `tipo`, `iddoc`) VALUES
(1, 1, '2021-12-16 00:00:00', 10, 'Consumo No. 2 - 2021-12-16 ', 1, 8000, 0, 0, 8000, 'S', 'DEBITO', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prefijos`
--

CREATE TABLE `prefijos` (
  `id` int(11) NOT NULL,
  `tabla` varchar(60) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `prefijo` varchar(5) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prefijos`
--

INSERT INTO `prefijos` (`id`, `tabla`, `descripcion`, `prefijo`, `estado`) VALUES
(1, 'folio_nuevo', 'FOLIOS', 'FOL', 'S'),
(2, 'movimiento_reserva', 'RESERVAS', 'RES', 'S'),
(3, 'factura_hotel', 'FACTURA', 'FAC', 'S'),
(4, 'movimiento_registro', 'REGISTRO', 'REG', 'S'),
(5, 'precuenta_folio', 'PRECUENTA', 'PC', 'S'),
(6, 'consumos_folio', 'CONSUMOS', 'CON', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProductos` int(11) NOT NULL,
  `NombreProductos` varchar(50) NOT NULL,
  `ValorProductos` decimal(25,0) NOT NULL,
  `ObservacionesProductos` varchar(200) DEFAULT NULL,
  `CantidadProductos` int(11) NOT NULL,
  `MedidaProductos` varchar(20) NOT NULL,
  `MarcaProductos` varchar(30) DEFAULT NULL,
  `DescripcionProductos` varchar(50) DEFAULT NULL,
  `IdProductoTipo` int(11) NOT NULL,
  `IdProveedores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productotipo`
--

CREATE TABLE `productotipo` (
  `IdProductoTipo` int(11) NOT NULL,
  `NombreProductoTipo` varchar(50) NOT NULL,
  `ObservacionesProductoTipo` varchar(200) DEFAULT NULL,
  `ImpuestoProductoTipo` double NOT NULL,
  `CentroContableProductoTipo` varchar(50) DEFAULT NULL,
  `CuentaContableProductoTipo` varchar(50) DEFAULT NULL,
  `ConceptoContableProductoTipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `IdProveedores` int(11) NOT NULL,
  `NitProveedores` varchar(30) NOT NULL,
  `NombreProveedores` varchar(150) NOT NULL,
  `TelefonoProveedores` varchar(20) NOT NULL,
  `DireccionProveedores` varchar(70) NOT NULL,
  `CorreoProveedores` varchar(70) NOT NULL,
  `CelularProveedores` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puc`
--

CREATE TABLE `puc` (
  `id` int(11) NOT NULL,
  `cuenta` varchar(20) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puc`
--

INSERT INTO `puc` (`id`, `cuenta`, `tipo`, `descripcion`, `estado`) VALUES
(1, '1', 'CLASE', 'Activo', 'ACTIVA'),
(2, '11', 'GRUPO', 'Disponible', 'ACTIVA'),
(3, '1105', 'CUENTA', 'Caja', 'ACTIVA'),
(4, '110505', 'SUBCUENTA', 'Caja general', 'ACTIVA'),
(5, '110510', 'SUBCUENTA', 'Cajas menores', 'ACTIVA'),
(6, '110515', 'SUBCUENTA', 'Moneda extranjera', 'ACTIVA'),
(7, '1110', 'CUENTA', 'Bancos', 'ACTIVA'),
(8, '111005', 'SUBCUENTA', 'Moneda nacional', 'ACTIVA'),
(9, '111010', 'SUBCUENTA', 'Moneda extranjera', 'ACTIVA'),
(10, '1115', 'CUENTA', 'Remesas en tránsito', 'ACTIVA'),
(11, '111505', 'SUBCUENTA', 'Moneda nacional', 'ACTIVA'),
(12, '111510', 'SUBCUENTA', 'Moneda extranjera', 'ACTIVA'),
(13, '1120', 'CUENTA', 'Cuentas de ahorro', 'ACTIVA'),
(14, '112005', 'SUBCUENTA', 'Bancos', 'ACTIVA'),
(15, '112010', 'SUBCUENTA', 'Corporaciones de ahorro y vivienda', 'ACTIVA'),
(16, '112015', 'SUBCUENTA', 'Organismos cooperativos financieros', 'ACTIVA'),
(17, '1125', 'CUENTA', 'Fondos', 'ACTIVA'),
(18, '112505', 'SUBCUENTA', 'Rotatorios moneda nacional', 'ACTIVA'),
(19, '112510', 'SUBCUENTA', 'Rotatorios moneda extranjera', 'ACTIVA'),
(20, '112515', 'SUBCUENTA', 'Especiales moneda nacional', 'ACTIVA'),
(21, '112520', 'SUBCUENTA', 'Especiales moneda extranjera', 'ACTIVA'),
(22, '112525', 'SUBCUENTA', 'De amortización moneda nacional', 'ACTIVA'),
(23, '112530', 'SUBCUENTA', 'De amortización moneda extranjera', 'ACTIVA'),
(24, '12', 'GRUPO', 'Inversiones', 'ACTIVA'),
(25, '1205', 'CUENTA', 'Acciones', 'ACTIVA'),
(26, '120505', 'SUBCUENTA', 'Agricultura  ganadería  caza y silvicultura', 'ACTIVA'),
(27, '120510', 'SUBCUENTA', 'Pesca', 'ACTIVA'),
(28, '120515', 'SUBCUENTA', 'Explotación de minas y canteras', 'ACTIVA'),
(29, '120520', 'SUBCUENTA', 'Industria manufacturera', 'ACTIVA'),
(30, '120525', 'SUBCUENTA', 'Suministro de electricidad  gas y agua', 'ACTIVA'),
(31, '120530', 'SUBCUENTA', 'Construcción', 'ACTIVA'),
(32, '120535', 'SUBCUENTA', 'Comercio al por mayor y al por menor', 'ACTIVA'),
(33, '120540', 'SUBCUENTA', 'Hoteles y restaurantes', 'ACTIVA'),
(34, '120545', 'SUBCUENTA', 'Transporte  almacenamiento y comunicaciones', 'ACTIVA'),
(35, '120550', 'SUBCUENTA', 'Actividad financiera', 'ACTIVA'),
(36, '120555', 'SUBCUENTA', 'Actividades inmobiliarias  empresariales y de alquiler', 'ACTIVA'),
(37, '120560', 'SUBCUENTA', 'Enseñanza', 'ACTIVA'),
(38, '120565', 'SUBCUENTA', 'Servicios sociales y de salud', 'ACTIVA'),
(39, '120570', 'SUBCUENTA', 'Otras actividades de servicios comunitarios  sociales y personales', 'ACTIVA'),
(40, '120599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(41, '1210', 'CUENTA', 'Cuotas o partes de interés social', 'ACTIVA'),
(42, '121005', 'SUBCUENTA', 'Agricultura  ganadería  caza y silvicultura', 'ACTIVA'),
(43, '121010', 'SUBCUENTA', 'Pesca', 'ACTIVA'),
(44, '121015', 'SUBCUENTA', 'Explotación de minas y canteras', 'ACTIVA'),
(45, '121020', 'SUBCUENTA', 'Industria manufacturera', 'ACTIVA'),
(46, '121025', 'SUBCUENTA', 'Suministro de electricidad  gas y agua', 'ACTIVA'),
(47, '121030', 'SUBCUENTA', 'Construcción', 'ACTIVA'),
(48, '121035', 'SUBCUENTA', 'Comercio al por mayor y al por menor', 'ACTIVA'),
(49, '121040', 'SUBCUENTA', 'Hoteles y restaurantes', 'ACTIVA'),
(50, '121045', 'SUBCUENTA', 'Transporte  almacenamiento y comunicaciones', 'ACTIVA'),
(51, '121050', 'SUBCUENTA', 'Actividad financiera', 'ACTIVA'),
(52, '121055', 'SUBCUENTA', 'Actividades inmobiliarias  empresariales y de alquiler', 'ACTIVA'),
(53, '121060', 'SUBCUENTA', 'Enseñanza', 'ACTIVA'),
(54, '121065', 'SUBCUENTA', 'Servicios sociales y de salud', 'ACTIVA'),
(55, '121070', 'SUBCUENTA', 'Otras actividades de servicios comunitarios  sociales y personales', 'ACTIVA'),
(56, '121099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(57, '1215', 'CUENTA', 'Bonos', 'ACTIVA'),
(58, '121505', 'SUBCUENTA', 'Bonos públicos moneda nacional', 'ACTIVA'),
(59, '121510', 'SUBCUENTA', 'Bonos públicos moneda extranjera', 'ACTIVA'),
(60, '121515', 'SUBCUENTA', 'Bonos ordinarios', 'ACTIVA'),
(61, '121520', 'SUBCUENTA', 'Bonos convertibles en acciones', 'ACTIVA'),
(62, '121595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(63, '1220', 'CUENTA', 'Cédulas', 'ACTIVA'),
(64, '122005', 'SUBCUENTA', 'Cédulas de capitalización', 'ACTIVA'),
(65, '122010', 'SUBCUENTA', 'Cédulas hipotecarias', 'ACTIVA'),
(66, '122015', 'SUBCUENTA', 'Cédulas de inversión', 'ACTIVA'),
(67, '122095', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(68, '1225', 'CUENTA', 'Certificados', 'ACTIVA'),
(69, '122505', 'SUBCUENTA', 'Certificados de depósito a término (CDT)', 'ACTIVA'),
(70, '122510', 'SUBCUENTA', 'Certificados de depósito de ahorro', 'ACTIVA'),
(71, '122515', 'SUBCUENTA', 'Certificados de ahorro de valor constante (CAVC)', 'ACTIVA'),
(72, '122520', 'SUBCUENTA', 'Certificados de cambio', 'ACTIVA'),
(73, '122525', 'SUBCUENTA', 'Certificados cafeteros valorizables', 'ACTIVA'),
(74, '122530', 'SUBCUENTA', 'Certificados eléctricos valorizables (CEV)', 'ACTIVA'),
(75, '122535', 'SUBCUENTA', 'Certificados de reembolso tributario (CERT)', 'ACTIVA'),
(76, '122540', 'SUBCUENTA', 'Certificados de desarrollo turístico', 'ACTIVA'),
(77, '122545', 'SUBCUENTA', 'Certificados de inversión forestal (CIF)', 'ACTIVA'),
(78, '122595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(79, '1230', 'CUENTA', 'Papeles comerciales', 'ACTIVA'),
(80, '123005', 'SUBCUENTA', 'Empresas comerciales', 'ACTIVA'),
(81, '123010', 'SUBCUENTA', 'Empresas industriales', 'ACTIVA'),
(82, '123015', 'SUBCUENTA', 'Empresas de servicios', 'ACTIVA'),
(83, '1235', 'CUENTA', 'Títulos', 'ACTIVA'),
(84, '123505', 'SUBCUENTA', 'Títulos de desarrollo agropecuario', 'ACTIVA'),
(85, '123510', 'SUBCUENTA', 'Títulos canjeables por certificados de cambio', 'ACTIVA'),
(86, '123515', 'SUBCUENTA', 'Títulos de tesorería (TES)', 'ACTIVA'),
(87, '123520', 'SUBCUENTA', 'Títulos de participación', 'ACTIVA'),
(88, '123525', 'SUBCUENTA', 'Títulos de crédito de fomento', 'ACTIVA'),
(89, '123530', 'SUBCUENTA', 'Títulos financieros agroindustriales (TFA)', 'ACTIVA'),
(90, '123535', 'SUBCUENTA', 'Títulos de ahorro cafetero (TAC)', 'ACTIVA'),
(91, '123540', 'SUBCUENTA', 'Títulos de ahorro nacional (TAN)', 'ACTIVA'),
(92, '123545', 'SUBCUENTA', 'Títulos energéticos de rentabilidad creciente (TER)', 'ACTIVA'),
(93, '123550', 'SUBCUENTA', 'Títulos de ahorro educativo (TAE)', 'ACTIVA'),
(94, '123555', 'SUBCUENTA', 'Títulos financieros industriales y comerciales', 'ACTIVA'),
(95, '123560', 'SUBCUENTA', 'Tesoros', 'ACTIVA'),
(96, '123565', 'SUBCUENTA', 'Títulos de devolución de impuestos nacionales (TIDIS)', 'ACTIVA'),
(97, '123570', 'SUBCUENTA', 'Títulos inmobiliarios', 'ACTIVA'),
(98, '123595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(99, '1240', 'CUENTA', 'Aceptaciones bancarias o financieras', 'ACTIVA'),
(100, '124005', 'SUBCUENTA', 'Bancos comerciales', 'ACTIVA'),
(101, '124010', 'SUBCUENTA', 'Compañías de financiamiento comercial', 'ACTIVA'),
(102, '124015', 'SUBCUENTA', 'Corporaciones financieras', 'ACTIVA'),
(103, '124095', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(104, '1245', 'CUENTA', 'Derechos fiduciarios', 'ACTIVA'),
(105, '124505', 'SUBCUENTA', 'Fideicomisos de inversión moneda nacional', 'ACTIVA'),
(106, '124510', 'SUBCUENTA', 'Fideicomisos de inversión moneda extranjera', 'ACTIVA'),
(107, '1250', 'CUENTA', 'Derechos de recompra de inversiones negociadas (repos)', 'ACTIVA'),
(108, '125005', 'SUBCUENTA', 'Acciones', 'ACTIVA'),
(109, '125010', 'SUBCUENTA', 'Cuotas o partes de interés social', 'ACTIVA'),
(110, '125015', 'SUBCUENTA', 'Bonos', 'ACTIVA'),
(111, '125020', 'SUBCUENTA', 'Cédulas', 'ACTIVA'),
(112, '125025', 'SUBCUENTA', 'Certificados', 'ACTIVA'),
(113, '125030', 'SUBCUENTA', 'Papeles comerciales', 'ACTIVA'),
(114, '125035', 'SUBCUENTA', 'Títulos', 'ACTIVA'),
(115, '125040', 'SUBCUENTA', 'Aceptaciones bancarias o financieras', 'ACTIVA'),
(116, '125095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(117, '125099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(118, '1255', 'CUENTA', 'Obligatorias', 'ACTIVA'),
(119, '125505', 'SUBCUENTA', 'Bonos de financiamiento especial', 'ACTIVA'),
(120, '125510', 'SUBCUENTA', 'Bonos de financiamiento presupuestal', 'ACTIVA'),
(121, '125515', 'SUBCUENTA', 'Bonos para desarrollo social y seguridad interna (BDSI)', 'ACTIVA'),
(122, '125595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(123, '1260', 'CUENTA', 'Cuentas en participación', 'ACTIVA'),
(124, '126099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(125, '1295', 'CUENTA', 'Otras inversiones', 'ACTIVA'),
(126, '129505', 'SUBCUENTA', 'Aportes en cooperativas', 'ACTIVA'),
(127, '129510', 'SUBCUENTA', 'Derechos en clubes sociales', 'ACTIVA'),
(128, '129515', 'SUBCUENTA', 'Acciones o derechos en clubes deportivos', 'ACTIVA'),
(129, '129520', 'SUBCUENTA', 'Bonos en colegios', 'ACTIVA'),
(130, '129595', 'SUBCUENTA', 'Diversas', 'ACTIVA'),
(131, '129599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(132, '1299', 'CUENTA', 'Provisiones', 'ACTIVA'),
(133, '129905', 'SUBCUENTA', 'Acciones', 'ACTIVA'),
(134, '129910', 'SUBCUENTA', 'Cuotas o partes de interés social', 'ACTIVA'),
(135, '129915', 'SUBCUENTA', 'Bonos', 'ACTIVA'),
(136, '129920', 'SUBCUENTA', 'Cédulas', 'ACTIVA'),
(137, '129925', 'SUBCUENTA', 'Certificados', 'ACTIVA'),
(138, '129930', 'SUBCUENTA', 'Papeles comerciales', 'ACTIVA'),
(139, '129935', 'SUBCUENTA', 'Títulos', 'ACTIVA'),
(140, '129940', 'SUBCUENTA', 'Aceptaciones bancarias o financieras', 'ACTIVA'),
(141, '129945', 'SUBCUENTA', 'Derechos fiduciarios', 'ACTIVA'),
(142, '129950', 'SUBCUENTA', 'Derechos de recompra de inversiones negociadas', 'ACTIVA'),
(143, '129955', 'SUBCUENTA', 'Obligatorias', 'ACTIVA'),
(144, '129960', 'SUBCUENTA', 'Cuentas en participación', 'ACTIVA'),
(145, '129995', 'SUBCUENTA', 'Otras inversiones', 'ACTIVA'),
(146, '13', 'GRUPO', 'Deudores', 'ACTIVA'),
(147, '1305', 'CUENTA', 'Clientes', 'ACTIVA'),
(148, '130505', 'SUBCUENTA', 'Nacionales', 'ACTIVA'),
(149, '130510', 'SUBCUENTA', 'Del exterior', 'ACTIVA'),
(150, '130515', 'SUBCUENTA', 'Deudores del sistema', 'ACTIVA'),
(151, '1310', 'CUENTA', 'Cuentas corrientes comerciales', 'ACTIVA'),
(152, '131005', 'SUBCUENTA', 'Casa matriz', 'ACTIVA'),
(153, '131010', 'SUBCUENTA', 'Compañías vinculadas', 'ACTIVA'),
(154, '131015', 'SUBCUENTA', 'Accionistas o socios', 'ACTIVA'),
(155, '131020', 'SUBCUENTA', 'Particulares', 'ACTIVA'),
(156, '131095', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(157, '1315', 'CUENTA', 'Cuentas por cobrar a casa matriz', 'ACTIVA'),
(158, '131505', 'SUBCUENTA', 'Ventas', 'ACTIVA'),
(159, '131510', 'SUBCUENTA', 'Pagos a nombre de casa matriz', 'ACTIVA'),
(160, '131515', 'SUBCUENTA', 'Valores recibidos por casa matriz', 'ACTIVA'),
(161, '131520', 'SUBCUENTA', 'Préstamos', 'ACTIVA'),
(162, '1320', 'CUENTA', 'Cuentas por cobrar a vinculados económicos', 'ACTIVA'),
(163, '132005', 'SUBCUENTA', 'Filiales', 'ACTIVA'),
(164, '132010', 'SUBCUENTA', 'Subsidiarias', 'ACTIVA'),
(165, '132015', 'SUBCUENTA', 'Sucursales', 'ACTIVA'),
(166, '1323', 'CUENTA', 'Cuentas por cobrar a directores', 'ACTIVA'),
(167, '1325', 'CUENTA', 'Cuentas por cobrar a socios y accionistas', 'ACTIVA'),
(168, '132505', 'SUBCUENTA', 'A socios', 'ACTIVA'),
(169, '132510', 'SUBCUENTA', 'A accionistas', 'ACTIVA'),
(170, '1328', 'CUENTA', 'Aportes por cobrar', 'ACTIVA'),
(171, '1330', 'CUENTA', 'Anticipos y avances', 'ACTIVA'),
(172, '133005', 'SUBCUENTA', 'A proveedores', 'ACTIVA'),
(173, '133010', 'SUBCUENTA', 'A contratistas', 'ACTIVA'),
(174, '133015', 'SUBCUENTA', 'A trabajadores', 'ACTIVA'),
(175, '133020', 'SUBCUENTA', 'A agentes', 'ACTIVA'),
(176, '133025', 'SUBCUENTA', 'A concesionarios', 'ACTIVA'),
(177, '133030', 'SUBCUENTA', 'De adjudicaciones', 'ACTIVA'),
(178, '133095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(179, '133099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(180, '1332', 'CUENTA', 'Cuentas de operación conjunta', 'ACTIVA'),
(181, '1335', 'CUENTA', 'Depósitos', 'ACTIVA'),
(182, '133505', 'SUBCUENTA', 'Para importaciones', 'ACTIVA'),
(183, '133510', 'SUBCUENTA', 'Para servicios', 'ACTIVA'),
(184, '133515', 'SUBCUENTA', 'Para contratos', 'ACTIVA'),
(185, '133520', 'SUBCUENTA', 'Para responsabilidades', 'ACTIVA'),
(186, '133525', 'SUBCUENTA', 'Para juicios ejecutivos', 'ACTIVA'),
(187, '133530', 'SUBCUENTA', 'Para adquisición de acciones  cuotas o derechos sociales', 'ACTIVA'),
(188, '133535', 'SUBCUENTA', 'En garantía', 'ACTIVA'),
(189, '133595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(190, '1340', 'CUENTA', 'Promesas de compra venta', 'ACTIVA'),
(191, '134005', 'SUBCUENTA', 'De bienes raíces', 'ACTIVA'),
(192, '134010', 'SUBCUENTA', 'De maquinaria y equipo', 'ACTIVA'),
(193, '134015', 'SUBCUENTA', 'De flota y equipo de transporte', 'ACTIVA'),
(194, '134020', 'SUBCUENTA', 'De flota y equipo aéreo', 'ACTIVA'),
(195, '134025', 'SUBCUENTA', 'De flota y equipo férreo', 'ACTIVA'),
(196, '134030', 'SUBCUENTA', 'De flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(197, '134035', 'SUBCUENTA', 'De semovientes', 'ACTIVA'),
(198, '134095', 'SUBCUENTA', 'De otros bienes', 'ACTIVA'),
(199, '1345', 'CUENTA', 'Ingresos por cobrar', 'ACTIVA'),
(200, '134505', 'SUBCUENTA', 'Dividendos y/o participaciones', 'ACTIVA'),
(201, '134510', 'SUBCUENTA', 'Intereses', 'ACTIVA'),
(202, '134515', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(203, '134520', 'SUBCUENTA', 'Honorarios', 'ACTIVA'),
(204, '134525', 'SUBCUENTA', 'Servicios', 'ACTIVA'),
(205, '134530', 'SUBCUENTA', 'Arrendamientos', 'ACTIVA'),
(206, '134535', 'SUBCUENTA', 'CERT por cobrar', 'ACTIVA'),
(207, '134595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(208, '1350', 'CUENTA', 'Retención sobre contratos', 'ACTIVA'),
(209, '135005', 'SUBCUENTA', 'De construcción', 'ACTIVA'),
(210, '135010', 'SUBCUENTA', 'De prestación de servicios', 'ACTIVA'),
(211, '135095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(212, '1355', 'CUENTA', 'Anticipo de impuestos y contribuciones o saldos a favor', 'ACTIVA'),
(213, '135505', 'SUBCUENTA', 'Anticipo de impuestos de renta y complementarios', 'ACTIVA'),
(214, '135510', 'SUBCUENTA', 'Anticipo de impuestos de industria y comercio', 'ACTIVA'),
(215, '135515', 'SUBCUENTA', 'Retención en la fuente', 'ACTIVA'),
(216, '135517', 'SUBCUENTA', 'Impuesto a las ventas retenido', 'ACTIVA'),
(217, '135518', 'SUBCUENTA', 'Impuesto de industria y comercio retenido', 'ACTIVA'),
(218, '135520', 'SUBCUENTA', 'Sobrantes en liquidación privada de impuestos', 'ACTIVA'),
(219, '135525', 'SUBCUENTA', 'Contribuciones', 'ACTIVA'),
(220, '135530', 'SUBCUENTA', 'Impuestos descontables', 'ACTIVA'),
(221, '135595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(222, '1360', 'CUENTA', 'Reclamaciones', 'ACTIVA'),
(223, '136005', 'SUBCUENTA', 'A compañías aseguradoras', 'ACTIVA'),
(224, '136010', 'SUBCUENTA', 'A transportadores', 'ACTIVA'),
(225, '136015', 'SUBCUENTA', 'Por tiquetes aéreos', 'ACTIVA'),
(226, '136095', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(227, '1365', 'CUENTA', 'Cuentas por cobrar a trabajadores', 'ACTIVA'),
(228, '136505', 'SUBCUENTA', 'Vivienda', 'ACTIVA'),
(229, '136510', 'SUBCUENTA', 'Vehículos', 'ACTIVA'),
(230, '136515', 'SUBCUENTA', 'Educación', 'ACTIVA'),
(231, '136520', 'SUBCUENTA', 'Médicos  odontológicos y similares', 'ACTIVA'),
(232, '136525', 'SUBCUENTA', 'Calamidad doméstica', 'ACTIVA'),
(233, '136530', 'SUBCUENTA', 'Responsabilidades', 'ACTIVA'),
(234, '136595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(235, '1370', 'CUENTA', 'Préstamos a particulares', 'ACTIVA'),
(236, '137005', 'SUBCUENTA', 'Con garantía real', 'ACTIVA'),
(237, '137010', 'SUBCUENTA', 'Con garantía personal', 'ACTIVA'),
(238, '1380', 'CUENTA', 'Deudores varios', 'ACTIVA'),
(239, '138005', 'SUBCUENTA', 'Depositarios', 'ACTIVA'),
(240, '138010', 'SUBCUENTA', 'Comisionistas de bolsas', 'ACTIVA'),
(241, '138015', 'SUBCUENTA', 'Fondo de inversión', 'ACTIVA'),
(242, '138020', 'SUBCUENTA', 'Cuentas por cobrar de terceros', 'ACTIVA'),
(243, '138025', 'SUBCUENTA', 'Pagos por cuenta de terceros', 'ACTIVA'),
(244, '138030', 'SUBCUENTA', 'Fondos de inversión social', 'ACTIVA'),
(245, '138095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(246, '1385', 'CUENTA', 'Derechos de recompra de cartera negociada', 'ACTIVA'),
(247, '1390', 'CUENTA', 'Deudas de difícil cobro', 'ACTIVA'),
(248, '1399', 'CUENTA', 'Provisiones', 'ACTIVA'),
(249, '139905', 'SUBCUENTA', 'Clientes', 'ACTIVA'),
(250, '139910', 'SUBCUENTA', 'Cuentas corrientes comerciales', 'ACTIVA'),
(251, '139915', 'SUBCUENTA', 'Cuentas por cobrar a casa matriz', 'ACTIVA'),
(252, '139920', 'SUBCUENTA', 'Cuentas por cobrar a vinculados económicos', 'ACTIVA'),
(253, '139925', 'SUBCUENTA', 'Cuentas por cobrar a socios y accionistas', 'ACTIVA'),
(254, '139930', 'SUBCUENTA', 'Anticipos y avances', 'ACTIVA'),
(255, '139932', 'SUBCUENTA', 'Cuentas de operación conjunta', 'ACTIVA'),
(256, '139935', 'SUBCUENTA', 'Depósitos', 'ACTIVA'),
(257, '139940', 'SUBCUENTA', 'Promesas de compraventa', 'ACTIVA'),
(258, '139945', 'SUBCUENTA', 'Ingresos por cobrar', 'ACTIVA'),
(259, '139950', 'SUBCUENTA', 'Retención sobre contratos', 'ACTIVA'),
(260, '139955', 'SUBCUENTA', 'Reclamaciones', 'ACTIVA'),
(261, '139960', 'SUBCUENTA', 'Cuentas por cobrar a trabajadores', 'ACTIVA'),
(262, '139965', 'SUBCUENTA', 'Préstamos a particulares', 'ACTIVA'),
(263, '139975', 'SUBCUENTA', 'Deudores varios', 'ACTIVA'),
(264, '139980', 'SUBCUENTA', 'Derechos de recompra de cartera negociada', 'ACTIVA'),
(265, '14', 'GRUPO', 'Inventarios', 'ACTIVA'),
(266, '1405', 'CUENTA', 'Materias primas', 'ACTIVA'),
(267, '140599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(268, '1410', 'CUENTA', 'Productos en proceso', 'ACTIVA'),
(269, '141099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(270, '1415', 'CUENTA', 'Obras de construcción en curso', 'ACTIVA'),
(271, '141599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(272, '1417', 'CUENTA', 'Obras de urbanismo', 'ACTIVA'),
(273, '141799', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(274, '1420', 'CUENTA', 'Contratos en ejecución', 'ACTIVA'),
(275, '142099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(276, '1425', 'CUENTA', 'Cultivos en desarrollo', 'ACTIVA'),
(277, '142599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(278, '1428', 'CUENTA', 'Plantaciones agrícolas', 'ACTIVA'),
(279, '142899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(280, '1430', 'CUENTA', 'Productos terminados', 'ACTIVA'),
(281, '143005', 'SUBCUENTA', 'Productos manufacturados', 'ACTIVA'),
(282, '143010', 'SUBCUENTA', 'Productos extraídos y/o procesados', 'ACTIVA'),
(283, '143015', 'SUBCUENTA', 'Productos agrícolas y forestales', 'ACTIVA'),
(284, '143020', 'SUBCUENTA', 'Subproductos', 'ACTIVA'),
(285, '143025', 'SUBCUENTA', 'Productos de pesca', 'ACTIVA'),
(286, '143099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(287, '1435', 'CUENTA', 'Mercancías no fabricadas por la empresa', 'ACTIVA'),
(288, '143599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(289, '1440', 'CUENTA', 'Bienes raíces para la venta', 'ACTIVA'),
(290, '144099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(291, '1445', 'CUENTA', 'Semovientes', 'ACTIVA'),
(292, '144599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(293, '1450', 'CUENTA', 'Terrenos', 'ACTIVA'),
(294, '145005', 'SUBCUENTA', 'Por urbanizar', 'ACTIVA'),
(295, '145010', 'SUBCUENTA', 'Urbanizados por construir', 'ACTIVA'),
(296, '145099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(297, '1455', 'CUENTA', 'Materiales  repuestos y accesorios', 'ACTIVA'),
(298, '145599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(299, '1460', 'CUENTA', 'Envases y empaques', 'ACTIVA'),
(300, '146099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(301, '1465', 'CUENTA', 'Inventarios en tránsito', 'ACTIVA'),
(302, '146599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(303, '1499', 'CUENTA', 'Provisiones', 'ACTIVA'),
(304, '149905', 'SUBCUENTA', 'Para obsolescencia', 'ACTIVA'),
(305, '149910', 'SUBCUENTA', 'Para diferencia de inventario físico', 'ACTIVA'),
(306, '149915', 'SUBCUENTA', 'Para pérdidas de inventarios', 'ACTIVA'),
(307, '149920', 'SUBCUENTA', 'Lifo', 'ACTIVA'),
(308, '15', 'GRUPO', 'Propiedades  planta y equipo', 'ACTIVA'),
(309, '1504', 'CUENTA', 'Terrenos', 'ACTIVA'),
(310, '150405', 'SUBCUENTA', 'Urbanos', 'ACTIVA'),
(311, '150410', 'SUBCUENTA', 'Rurales', 'ACTIVA'),
(312, '150499', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(313, '1506', 'CUENTA', 'Materiales proyectos petroleros', 'ACTIVA'),
(314, '150605', 'SUBCUENTA', 'Tuberías y equipo', 'ACTIVA'),
(315, '150610', 'SUBCUENTA', 'Costos de importación materiales', 'ACTIVA'),
(316, '150615', 'SUBCUENTA', 'Proyectos de construcción', 'ACTIVA'),
(317, '150699', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(318, '1508', 'CUENTA', 'Construcciones en curso', 'ACTIVA'),
(319, '150805', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(320, '150810', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(321, '150815', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(322, '150820', 'SUBCUENTA', 'Pozos artesianos', 'ACTIVA'),
(323, '150825', 'SUBCUENTA', 'Proyectos de exploración', 'ACTIVA'),
(324, '150830', 'SUBCUENTA', 'Proyectos de desarrollo', 'ACTIVA'),
(325, '150899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(326, '1512', 'CUENTA', 'Maquinaria y equipos en montaje', 'ACTIVA'),
(327, '151205', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(328, '151210', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(329, '151215', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(330, '151220', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(331, '151225', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(332, '151230', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(333, '151235', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(334, '151240', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(335, '151245', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(336, '151250', 'SUBCUENTA', 'Plantas y redes', 'ACTIVA'),
(337, '151299', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(338, '1516', 'CUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(339, '151605', 'SUBCUENTA', 'Edificios', 'ACTIVA'),
(340, '151610', 'SUBCUENTA', 'Oficinas', 'ACTIVA'),
(341, '151615', 'SUBCUENTA', 'Almacenes', 'ACTIVA'),
(342, '151620', 'SUBCUENTA', 'Fábricas y plantas industriales', 'ACTIVA'),
(343, '151625', 'SUBCUENTA', 'Salas de exhibición y ventas', 'ACTIVA'),
(344, '151630', 'SUBCUENTA', 'Cafetería y casinos', 'ACTIVA'),
(345, '151635', 'SUBCUENTA', 'Silos', 'ACTIVA'),
(346, '151640', 'SUBCUENTA', 'Invernaderos', 'ACTIVA'),
(347, '151645', 'SUBCUENTA', 'Casetas y campamentos', 'ACTIVA'),
(348, '151650', 'SUBCUENTA', 'Instalaciones agropecuarias', 'ACTIVA'),
(349, '151655', 'SUBCUENTA', 'Viviendas para empleados y obreros', 'ACTIVA'),
(350, '151660', 'SUBCUENTA', 'Terminal de buses y taxis', 'ACTIVA'),
(351, '151663', 'SUBCUENTA', 'Terminal marítimo', 'ACTIVA'),
(352, '151665', 'SUBCUENTA', 'Terminal férreo', 'ACTIVA'),
(353, '151670', 'SUBCUENTA', 'Parqueaderos  garajes y depósitos', 'ACTIVA'),
(354, '151675', 'SUBCUENTA', 'Hangares', 'ACTIVA'),
(355, '151680', 'SUBCUENTA', 'Bodegas', 'ACTIVA'),
(356, '151695', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(357, '151699', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(358, '1520', 'CUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(359, '152099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(360, '1524', 'CUENTA', 'Equipo de oficina', 'ACTIVA'),
(361, '152405', 'SUBCUENTA', 'Muebles y enseres', 'ACTIVA'),
(362, '152410', 'SUBCUENTA', 'Equipos', 'ACTIVA'),
(363, '152495', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(364, '152499', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(365, '1528', 'CUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(366, '152805', 'SUBCUENTA', 'Equipos de procesamiento de datos', 'ACTIVA'),
(367, '152810', 'SUBCUENTA', 'Equipos de telecomunicaciones', 'ACTIVA'),
(368, '152815', 'SUBCUENTA', 'Equipos de radio', 'ACTIVA'),
(369, '152820', 'SUBCUENTA', 'Satélites y antenas', 'ACTIVA'),
(370, '152825', 'SUBCUENTA', 'Líneas telefónicas', 'ACTIVA'),
(371, '152895', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(372, '152899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(373, '1532', 'CUENTA', 'Equipo médico-científico', 'ACTIVA'),
(374, '153205', 'SUBCUENTA', 'Médico', 'ACTIVA'),
(375, '153210', 'SUBCUENTA', 'Odontológico', 'ACTIVA'),
(376, '153215', 'SUBCUENTA', 'Laboratorio', 'ACTIVA'),
(377, '153220', 'SUBCUENTA', 'Instrumental', 'ACTIVA'),
(378, '153295', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(379, '153299', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(380, '1536', 'CUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(381, '153605', 'SUBCUENTA', 'De habitaciones', 'ACTIVA'),
(382, '153610', 'SUBCUENTA', 'De comestibles y bebidas', 'ACTIVA'),
(383, '153695', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(384, '153699', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(385, '1540', 'CUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(386, '154005', 'SUBCUENTA', 'Autos  camionetas y camperos', 'ACTIVA'),
(387, '154008', 'SUBCUENTA', 'Camiones  volquetas y furgones', 'ACTIVA'),
(388, '154010', 'SUBCUENTA', 'Tractomulas y remolques', 'ACTIVA'),
(389, '154015', 'SUBCUENTA', 'Buses y busetas', 'ACTIVA'),
(390, '154017', 'SUBCUENTA', 'Recolectores y contenedores', 'ACTIVA'),
(391, '154020', 'SUBCUENTA', 'Montacargas', 'ACTIVA'),
(392, '154025', 'SUBCUENTA', 'Palas y grúas', 'ACTIVA'),
(393, '154030', 'SUBCUENTA', 'Motocicletas', 'ACTIVA'),
(394, '154035', 'SUBCUENTA', 'Bicicletas', 'ACTIVA'),
(395, '154040', 'SUBCUENTA', 'Estibas y carretas', 'ACTIVA'),
(396, '154045', 'SUBCUENTA', 'Bandas transportadoras', 'ACTIVA'),
(397, '154095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(398, '154099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(399, '1544', 'CUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(400, '154405', 'SUBCUENTA', 'Buques', 'ACTIVA'),
(401, '154410', 'SUBCUENTA', 'Lanchas', 'ACTIVA'),
(402, '154415', 'SUBCUENTA', 'Remolcadoras', 'ACTIVA'),
(403, '154420', 'SUBCUENTA', 'Botes', 'ACTIVA'),
(404, '154425', 'SUBCUENTA', 'Boyas', 'ACTIVA'),
(405, '154430', 'SUBCUENTA', 'Amarres', 'ACTIVA'),
(406, '154435', 'SUBCUENTA', 'Contenedores y chasises', 'ACTIVA'),
(407, '154440', 'SUBCUENTA', 'Gabarras', 'ACTIVA'),
(408, '154495', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(409, '154499', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(410, '1548', 'CUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(411, '154805', 'SUBCUENTA', 'Aviones', 'ACTIVA'),
(412, '154810', 'SUBCUENTA', 'Avionetas', 'ACTIVA'),
(413, '154815', 'SUBCUENTA', 'Helicópteros', 'ACTIVA'),
(414, '154820', 'SUBCUENTA', 'Turbinas y motores', 'ACTIVA'),
(415, '154825', 'SUBCUENTA', 'Manuales de entrenamiento personal técnico', 'ACTIVA'),
(416, '154830', 'SUBCUENTA', 'Equipos de vuelo', 'ACTIVA'),
(417, '154895', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(418, '154899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(419, '1552', 'CUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(420, '155205', 'SUBCUENTA', 'Locomotoras', 'ACTIVA'),
(421, '155210', 'SUBCUENTA', 'Vagones', 'ACTIVA'),
(422, '155215', 'SUBCUENTA', 'Redes férreas', 'ACTIVA'),
(423, '155295', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(424, '155299', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(425, '1556', 'CUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(426, '155605', 'SUBCUENTA', 'Instalaciones para agua y energía', 'ACTIVA'),
(427, '155610', 'SUBCUENTA', 'Acueducto  acequias y canalizaciones', 'ACTIVA'),
(428, '155615', 'SUBCUENTA', 'Plantas de generación hidráulica', 'ACTIVA'),
(429, '155620', 'SUBCUENTA', 'Plantas de generación térmica', 'ACTIVA'),
(430, '155625', 'SUBCUENTA', 'Plantas de generación a gas', 'ACTIVA'),
(431, '155628', 'SUBCUENTA', 'Plantas de generación diesel  gasolina y petróleo', 'ACTIVA'),
(432, '155630', 'SUBCUENTA', 'Plantas de distribución', 'ACTIVA'),
(433, '155635', 'SUBCUENTA', 'Plantas de transmisión y subestaciones', 'ACTIVA'),
(434, '155640', 'SUBCUENTA', 'Oleoductos', 'ACTIVA'),
(435, '155645', 'SUBCUENTA', 'Gasoductos', 'ACTIVA'),
(436, '155647', 'SUBCUENTA', 'Poliductos', 'ACTIVA'),
(437, '155650', 'SUBCUENTA', 'Redes de distribución', 'ACTIVA'),
(438, '155655', 'SUBCUENTA', 'Plantas de tratamiento', 'ACTIVA'),
(439, '155660', 'SUBCUENTA', 'Redes de recolección de aguas negras', 'ACTIVA'),
(440, '155665', 'SUBCUENTA', 'Instalaciones y equipo de bombeo', 'ACTIVA'),
(441, '155670', 'SUBCUENTA', 'Redes de distribución de vapor', 'ACTIVA'),
(442, '155675', 'SUBCUENTA', 'Redes de aire', 'ACTIVA'),
(443, '155680', 'SUBCUENTA', 'Redes alimentación de gas', 'ACTIVA'),
(444, '155682', 'SUBCUENTA', 'Redes externas de telefonía', 'ACTIVA'),
(445, '155685', 'SUBCUENTA', 'Plantas deshidratadoras', 'ACTIVA'),
(446, '155695', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(447, '155699', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(448, '1560', 'CUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(449, '156099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(450, '1562', 'CUENTA', 'Envases y empaques', 'ACTIVA'),
(451, '156299', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(452, '1564', 'CUENTA', 'Plantaciones agrícolas y forestales', 'ACTIVA'),
(453, '156405', 'SUBCUENTA', 'Cultivos en desarrollo', 'ACTIVA'),
(454, '156410', 'SUBCUENTA', 'Cultivos amortizables', 'ACTIVA'),
(455, '156499', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(456, '1568', 'CUENTA', 'Vías de comunicación', 'ACTIVA'),
(457, '156805', 'SUBCUENTA', 'Pavimentación y patios', 'ACTIVA'),
(458, '156810', 'SUBCUENTA', 'Vías', 'ACTIVA'),
(459, '156815', 'SUBCUENTA', 'Puentes', 'ACTIVA'),
(460, '156820', 'SUBCUENTA', 'Calles', 'ACTIVA'),
(461, '156825', 'SUBCUENTA', 'Aeródromos', 'ACTIVA'),
(462, '156895', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(463, '156899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(464, '1572', 'CUENTA', 'Minas y canteras', 'ACTIVA'),
(465, '157205', 'SUBCUENTA', 'Minas', 'ACTIVA'),
(466, '157210', 'SUBCUENTA', 'Canteras', 'ACTIVA'),
(467, '157299', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(468, '1576', 'CUENTA', 'Pozos artesianos', 'ACTIVA'),
(469, '157699', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(470, '1580', 'CUENTA', 'Yacimientos', 'ACTIVA'),
(471, '158099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(472, '1584', 'CUENTA', 'Semovientes', 'ACTIVA'),
(473, '158499', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(474, '1588', 'CUENTA', 'Propiedades  planta y equipo en tránsito', 'ACTIVA'),
(475, '158805', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(476, '158810', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(477, '158815', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(478, '158820', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(479, '158825', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(480, '158830', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(481, '158835', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(482, '158840', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(483, '158845', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(484, '158850', 'SUBCUENTA', 'Plantas y redes', 'ACTIVA'),
(485, '158855', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(486, '158860', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(487, '158865', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(488, '158899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(489, '1592', 'CUENTA', 'Depreciación acumulada', 'ACTIVA'),
(490, '159205', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(491, '159210', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(492, '159215', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(493, '159220', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(494, '159225', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(495, '159230', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(496, '159235', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(497, '159240', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(498, '159245', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(499, '159250', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(500, '159255', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(501, '159260', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(502, '159265', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(503, '159299', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(504, '1596', 'CUENTA', 'Depreciación diferida', 'ACTIVA'),
(505, '159605', 'SUBCUENTA', 'Exceso fiscal sobre la contable', 'ACTIVA'),
(506, '159610', 'SUBCUENTA', 'Defecto fiscal sobre la contable (CR)', 'ACTIVA'),
(507, '159699', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(508, '1597', 'CUENTA', 'Amortización acumulada', 'ACTIVA'),
(509, '159705', 'SUBCUENTA', 'Plantaciones agrícolas y forestales', 'ACTIVA'),
(510, '159710', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(511, '159715', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(512, '159799', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(513, '1598', 'CUENTA', 'Agotamiento acumulado', 'ACTIVA'),
(514, '159805', 'SUBCUENTA', 'Minas y canteras', 'ACTIVA'),
(515, '159815', 'SUBCUENTA', 'Pozos artesianos', 'ACTIVA'),
(516, '159820', 'SUBCUENTA', 'Yacimientos', 'ACTIVA'),
(517, '159899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(518, '1599', 'CUENTA', 'Provisiones', 'ACTIVA'),
(519, '159904', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(520, '159906', 'SUBCUENTA', 'Materiales proyectos petroleros', 'ACTIVA'),
(521, '159908', 'SUBCUENTA', 'Construcciones en curso', 'ACTIVA'),
(522, '159912', 'SUBCUENTA', 'Maquinaria en montaje', 'ACTIVA'),
(523, '159916', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(524, '159920', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(525, '159924', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(526, '159928', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(527, '159932', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(528, '159936', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(529, '159940', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(530, '159944', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(531, '159948', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(532, '159952', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(533, '159956', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(534, '159960', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(535, '159962', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(536, '159964', 'SUBCUENTA', 'Plantaciones agrícolas y forestales', 'ACTIVA'),
(537, '159968', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(538, '159972', 'SUBCUENTA', 'Minas y canteras', 'ACTIVA'),
(539, '159980', 'SUBCUENTA', 'Pozos artesianos', 'ACTIVA'),
(540, '159984', 'SUBCUENTA', 'Yacimientos', 'ACTIVA'),
(541, '159988', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(542, '159992', 'SUBCUENTA', 'Propiedades  planta y equipo en tránsito', 'ACTIVA'),
(543, '16', 'GRUPO', 'Intangibles', 'ACTIVA'),
(544, '1605', 'CUENTA', 'Crédito mercantil', 'ACTIVA'),
(545, '160505', 'SUBCUENTA', 'Formado o estimado', 'ACTIVA'),
(546, '160510', 'SUBCUENTA', 'Adquirido o comprado', 'ACTIVA'),
(547, '160599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(548, '1610', 'CUENTA', 'Marcas', 'ACTIVA'),
(549, '161005', 'SUBCUENTA', 'Adquiridas', 'ACTIVA'),
(550, '161010', 'SUBCUENTA', 'Formadas', 'ACTIVA'),
(551, '161099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(552, '1615', 'CUENTA', 'Patentes', 'ACTIVA'),
(553, '161505', 'SUBCUENTA', 'Adquiridas', 'ACTIVA'),
(554, '161510', 'SUBCUENTA', 'Formadas', 'ACTIVA'),
(555, '161599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(556, '1620', 'CUENTA', 'Concesiones y franquicias', 'ACTIVA'),
(557, '162005', 'SUBCUENTA', 'Concesiones', 'ACTIVA'),
(558, '162010', 'SUBCUENTA', 'Franquicias', 'ACTIVA'),
(559, '162099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(560, '1625', 'CUENTA', 'Derechos', 'ACTIVA'),
(561, '162505', 'SUBCUENTA', 'Derechos de autor', 'ACTIVA'),
(562, '162510', 'SUBCUENTA', 'Puesto de bolsa', 'ACTIVA'),
(563, '162515', 'SUBCUENTA', 'En fideicomisos inmobiliarios', 'ACTIVA'),
(564, '162520', 'SUBCUENTA', 'En fideicomisos de garantía', 'ACTIVA'),
(565, '162525', 'SUBCUENTA', 'En fideicomisos de administración', 'ACTIVA'),
(566, '162530', 'SUBCUENTA', 'De exhibición - películas', 'ACTIVA'),
(567, '162535', 'SUBCUENTA', 'En bienes recibidos en arrendamiento financiero (leasing)', 'ACTIVA'),
(568, '162595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(569, '162599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(570, '1630', 'CUENTA', 'Know how', 'ACTIVA'),
(571, '163099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(572, '1635', 'CUENTA', 'Licencias', 'ACTIVA'),
(573, '163599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(574, '1698', 'CUENTA', 'Depreciación y/o amortización acumulada', 'ACTIVA'),
(575, '169805', 'SUBCUENTA', 'Crédito mercantil', 'ACTIVA'),
(576, '169810', 'SUBCUENTA', 'Marcas', 'ACTIVA'),
(577, '169815', 'SUBCUENTA', 'Patentes', 'ACTIVA'),
(578, '169820', 'SUBCUENTA', 'Concesiones y franquicias', 'ACTIVA'),
(579, '169830', 'SUBCUENTA', 'Derechos', 'ACTIVA'),
(580, '169835', 'SUBCUENTA', 'Know how', 'ACTIVA'),
(581, '169840', 'SUBCUENTA', 'Licencias', 'ACTIVA'),
(582, '169899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(583, '1699', 'CUENTA', 'Provisiones', 'ACTIVA'),
(584, '17', 'GRUPO', 'Diferidos', 'ACTIVA'),
(585, '1705', 'CUENTA', 'Gastos pagados por anticipado', 'ACTIVA'),
(586, '170505', 'SUBCUENTA', 'Intereses', 'ACTIVA'),
(587, '170510', 'SUBCUENTA', 'Honorarios', 'ACTIVA'),
(588, '170515', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(589, '170520', 'SUBCUENTA', 'Seguros y fianzas', 'ACTIVA'),
(590, '170525', 'SUBCUENTA', 'Arrendamientos', 'ACTIVA'),
(591, '170530', 'SUBCUENTA', 'Bodegajes', 'ACTIVA'),
(592, '170535', 'SUBCUENTA', 'Mantenimiento equipos', 'ACTIVA'),
(593, '170540', 'SUBCUENTA', 'Servicios', 'ACTIVA'),
(594, '170545', 'SUBCUENTA', 'Suscripciones', 'ACTIVA'),
(595, '170595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(596, '1710', 'CUENTA', 'Cargos diferidos', 'ACTIVA'),
(597, '171004', 'SUBCUENTA', 'Organización y preoperativos', 'ACTIVA'),
(598, '171008', 'SUBCUENTA', 'Remodelaciones', 'ACTIVA'),
(599, '171012', 'SUBCUENTA', 'Estudios  investigaciones y proyectos', 'ACTIVA'),
(600, '171016', 'SUBCUENTA', 'Programas para computador (software)', 'ACTIVA'),
(601, '171020', 'SUBCUENTA', 'Útiles y papelería', 'ACTIVA'),
(602, '171024', 'SUBCUENTA', 'Mejoras a propiedades ajenas', 'ACTIVA'),
(603, '171028', 'SUBCUENTA', 'Contribuciones y afiliaciones', 'ACTIVA'),
(604, '171032', 'SUBCUENTA', 'Entrenamiento de personal', 'ACTIVA'),
(605, '171036', 'SUBCUENTA', 'Ferias y exposiciones', 'ACTIVA'),
(606, '171040', 'SUBCUENTA', 'Licencias', 'ACTIVA'),
(607, '171044', 'SUBCUENTA', 'Publicidad  propaganda y promoción', 'ACTIVA'),
(608, '171048', 'SUBCUENTA', 'Elementos de aseo y cafetería', 'ACTIVA'),
(609, '171052', 'SUBCUENTA', 'Moldes y troqueles', 'ACTIVA'),
(610, '171056', 'SUBCUENTA', 'Instrumental quirúrgico', 'ACTIVA'),
(611, '171060', 'SUBCUENTA', 'Dotación y suministro a trabajadores', 'ACTIVA'),
(612, '171064', 'SUBCUENTA', 'Elementos de ropería y lencería', 'ACTIVA'),
(613, '171068', 'SUBCUENTA', 'Loza y cristalería', 'ACTIVA'),
(614, '171069', 'SUBCUENTA', 'Platería', 'ACTIVA'),
(615, '171070', 'SUBCUENTA', 'Cubiertería', 'ACTIVA'),
(616, '171076', 'SUBCUENTA', 'Impuesto de renta diferido ?débitos? por diferencias temporales', 'ACTIVA'),
(617, '171080', 'SUBCUENTA', 'Concursos y licitaciones', 'ACTIVA'),
(618, '171095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(619, '171099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(620, '1715', 'CUENTA', 'Costos de exploración por amortizar', 'ACTIVA'),
(621, '171505', 'SUBCUENTA', 'Pozos secos', 'ACTIVA'),
(622, '171510', 'SUBCUENTA', 'Pozos no comerciales', 'ACTIVA'),
(623, '171515', 'SUBCUENTA', 'Otros costos de exploración', 'ACTIVA'),
(624, '171599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(625, '1720', 'CUENTA', 'Costos de explotación y desarrollo', 'ACTIVA'),
(626, '172005', 'SUBCUENTA', 'Perforación y explotación', 'ACTIVA'),
(627, '172010', 'SUBCUENTA', 'Perforaciones campos en desarrollo', 'ACTIVA'),
(628, '172015', 'SUBCUENTA', 'Facilidades de producción', 'ACTIVA'),
(629, '172020', 'SUBCUENTA', 'Servicio a pozos', 'ACTIVA'),
(630, '172099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(631, '1730', 'CUENTA', 'Cargos por corrección monetaria diferida', 'ACTIVA'),
(632, '1798', 'CUENTA', 'Amortización acumulada', 'ACTIVA'),
(633, '179805', 'SUBCUENTA', 'Costos de exploración por amortizar', 'ACTIVA'),
(634, '179810', 'SUBCUENTA', 'Costos de explotación y desarrollo', 'ACTIVA'),
(635, '179899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(636, '18', 'GRUPO', 'Otros activos', 'ACTIVA'),
(637, '1805', 'CUENTA', 'Bienes de arte y cultura', 'ACTIVA'),
(638, '180505', 'SUBCUENTA', 'Obras de arte', 'ACTIVA'),
(639, '180510', 'SUBCUENTA', 'Bibliotecas', 'ACTIVA'),
(640, '180595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(641, '180599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(642, '1895', 'CUENTA', 'Diversos', 'ACTIVA'),
(643, '189505', 'SUBCUENTA', 'Máquinas porteadoras', 'ACTIVA'),
(644, '189510', 'SUBCUENTA', 'Bienes entregados en comodato', 'ACTIVA'),
(645, '189515', 'SUBCUENTA', 'Amortización acumulada de bienes entregados en comodato (CR)', 'ACTIVA'),
(646, '189520', 'SUBCUENTA', 'Bienes recibidos en pago', 'ACTIVA'),
(647, '189525', 'SUBCUENTA', 'Derechos sucesorales', 'ACTIVA'),
(648, '189530', 'SUBCUENTA', 'Estampillas', 'ACTIVA'),
(649, '189595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(650, '189599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(651, '1899', 'CUENTA', 'Provisiones', 'ACTIVA'),
(652, '189905', 'SUBCUENTA', 'Bienes de arte y cultura', 'ACTIVA'),
(653, '189995', 'SUBCUENTA', 'Diversos', 'ACTIVA'),
(654, '19', 'GRUPO', 'Valorizaciones', 'ACTIVA'),
(655, '1905', 'CUENTA', 'De inversiones', 'ACTIVA'),
(656, '190505', 'SUBCUENTA', 'Acciones', 'ACTIVA'),
(657, '190510', 'SUBCUENTA', 'Cuotas o partes de interés social', 'ACTIVA'),
(658, '190515', 'SUBCUENTA', 'Derechos fiduciarios', 'ACTIVA'),
(659, '1910', 'CUENTA', 'De propiedades  planta y equipo', 'ACTIVA'),
(660, '191004', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(661, '191006', 'SUBCUENTA', 'Materiales proyectos petroleros', 'ACTIVA'),
(662, '191008', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(663, '191012', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(664, '191016', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(665, '191020', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(666, '191024', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(667, '191028', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(668, '191032', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(669, '191036', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(670, '191040', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(671, '191044', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(672, '191048', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(673, '191052', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(674, '191056', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(675, '191060', 'SUBCUENTA', 'Plantaciones agrícolas y forestales', 'ACTIVA'),
(676, '191064', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(677, '191068', 'SUBCUENTA', 'Minas y canteras', 'ACTIVA'),
(678, '191072', 'SUBCUENTA', 'Pozos artesianos', 'ACTIVA'),
(679, '191076', 'SUBCUENTA', 'Yacimientos', 'ACTIVA'),
(680, '191080', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(681, '1995', 'CUENTA', 'De otros activos', 'ACTIVA'),
(682, '199505', 'SUBCUENTA', 'Bienes de arte y cultura', 'ACTIVA'),
(683, '199510', 'SUBCUENTA', 'Bienes entregados en comodato', 'ACTIVA'),
(684, '199515', 'SUBCUENTA', 'Bienes recibidos en pago', 'ACTIVA'),
(685, '199520', 'SUBCUENTA', 'Inventario de semovientes', 'ACTIVA'),
(686, '2', 'CLASE', 'Pasivo', 'ACTIVA'),
(687, '21', 'GRUPO', 'Obligaciones financieras', 'ACTIVA'),
(688, '2105', 'CUENTA', 'Bancos nacionales', 'ACTIVA'),
(689, '210505', 'SUBCUENTA', 'Sobregiros', 'ACTIVA'),
(690, '210510', 'SUBCUENTA', 'Pagarés', 'ACTIVA'),
(691, '210515', 'SUBCUENTA', 'Cartas de crédito', 'ACTIVA'),
(692, '210520', 'SUBCUENTA', 'Aceptaciones bancarias', 'ACTIVA'),
(693, '2110', 'CUENTA', 'Bancos del exterior', 'ACTIVA'),
(694, '211005', 'SUBCUENTA', 'Sobregiros', 'ACTIVA'),
(695, '211010', 'SUBCUENTA', 'Pagarés', 'ACTIVA'),
(696, '211015', 'SUBCUENTA', 'Cartas de crédito', 'ACTIVA'),
(697, '211020', 'SUBCUENTA', 'Aceptaciones bancarias', 'ACTIVA'),
(698, '2115', 'CUENTA', 'Corporaciones financieras', 'ACTIVA'),
(699, '211505', 'SUBCUENTA', 'Pagarés', 'ACTIVA'),
(700, '211510', 'SUBCUENTA', 'Aceptaciones financieras', 'ACTIVA'),
(701, '211515', 'SUBCUENTA', 'Cartas de crédito', 'ACTIVA'),
(702, '211520', 'SUBCUENTA', 'Contratos de arrendamiento financiero (leasing)', 'ACTIVA'),
(703, '2120', 'CUENTA', 'Compañías de financiamiento comercial', 'ACTIVA'),
(704, '212005', 'SUBCUENTA', 'Pagarés', 'ACTIVA'),
(705, '212010', 'SUBCUENTA', 'Aceptaciones financieras', 'ACTIVA'),
(706, '212020', 'SUBCUENTA', 'Contratos de arrendamiento financiero (leasing)', 'ACTIVA'),
(707, '2125', 'CUENTA', 'Corporaciones de ahorro y vivienda', 'ACTIVA'),
(708, '212505', 'SUBCUENTA', 'Sobregiros', 'ACTIVA'),
(709, '212510', 'SUBCUENTA', 'Pagarés', 'ACTIVA'),
(710, '212515', 'SUBCUENTA', 'Hipotecarias', 'ACTIVA'),
(711, '2130', 'CUENTA', 'Entidades financieras del exterior', 'ACTIVA'),
(712, '2135', 'CUENTA', 'Compromisos de recompra de inversiones negociadas', 'ACTIVA'),
(713, '213505', 'SUBCUENTA', 'Acciones', 'ACTIVA'),
(714, '213510', 'SUBCUENTA', 'Cuotas o partes de interés social', 'ACTIVA'),
(715, '213515', 'SUBCUENTA', 'Bonos', 'ACTIVA'),
(716, '213520', 'SUBCUENTA', 'Cédulas', 'ACTIVA'),
(717, '213525', 'SUBCUENTA', 'Certificados', 'ACTIVA'),
(718, '213530', 'SUBCUENTA', 'Papeles comerciales', 'ACTIVA'),
(719, '213535', 'SUBCUENTA', 'Títulos', 'ACTIVA'),
(720, '213540', 'SUBCUENTA', 'Aceptaciones bancarias o financieras', 'ACTIVA'),
(721, '213595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(722, '2140', 'CUENTA', 'Compromisos de recompra de cartera negociada', 'ACTIVA'),
(723, '2145', 'CUENTA', 'Obligaciones gubernamentales', 'ACTIVA'),
(724, '214505', 'SUBCUENTA', 'Gobierno Nacional', 'ACTIVA'),
(725, '214510', 'SUBCUENTA', 'Entidades oficiales', 'ACTIVA'),
(726, '2195', 'CUENTA', 'Otras obligaciones', 'ACTIVA'),
(727, '219505', 'SUBCUENTA', 'Particulares', 'ACTIVA'),
(728, '219510', 'SUBCUENTA', 'Compañías vinculadas', 'ACTIVA'),
(729, '219515', 'SUBCUENTA', 'Casa matriz', 'ACTIVA'),
(730, '219520', 'SUBCUENTA', 'Socios o accionistas', 'ACTIVA'),
(731, '219525', 'SUBCUENTA', 'Fondos y cooperativas', 'ACTIVA'),
(732, '219530', 'SUBCUENTA', 'Directores', 'ACTIVA'),
(733, '219595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(734, '22', 'GRUPO', 'Proveedores', 'ACTIVA'),
(735, '2205', 'CUENTA', 'Nacionales', 'ACTIVA'),
(736, '2210', 'CUENTA', 'Del exterior', 'ACTIVA'),
(737, '2215', 'CUENTA', 'Cuentas corrientes comerciales', 'ACTIVA'),
(738, '2220', 'CUENTA', 'Casa matriz', 'ACTIVA'),
(739, '2225', 'CUENTA', 'Compañías vinculadas', 'ACTIVA'),
(740, '23', 'GRUPO', 'Cuentas por pagar', 'ACTIVA'),
(741, '2305', 'CUENTA', 'Cuentas corrientes comerciales', 'ACTIVA'),
(742, '2310', 'CUENTA', 'A casa matriz', 'ACTIVA'),
(743, '2315', 'CUENTA', 'A compañías vinculadas', 'ACTIVA'),
(744, '2320', 'CUENTA', 'A contratistas', 'ACTIVA'),
(745, '2330', 'CUENTA', 'Órdenes de compra por utilizar', 'ACTIVA'),
(746, '2335', 'CUENTA', 'Costos y gastos por pagar', 'ACTIVA'),
(747, '233505', 'SUBCUENTA', 'Gastos financieros', 'ACTIVA'),
(748, '233510', 'SUBCUENTA', 'Gastos legales', 'ACTIVA'),
(749, '233515', 'SUBCUENTA', 'Libros', 'ACTIVA'),
(750, '233520', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(751, '233525', 'SUBCUENTA', 'Honorarios', 'ACTIVA'),
(752, '233530', 'SUBCUENTA', 'Servicios técnicos', 'ACTIVA'),
(753, '233535', 'SUBCUENTA', 'Servicios de mantenimiento', 'ACTIVA'),
(754, '233540', 'SUBCUENTA', 'Arrendamientos', 'ACTIVA'),
(755, '233545', 'SUBCUENTA', 'Transportes', 'ACTIVA'),
(756, '233550', 'SUBCUENTA', 'Servicios públicos', 'ACTIVA'),
(757, '233555', 'SUBCUENTA', 'Seguros', 'ACTIVA'),
(758, '233560', 'SUBCUENTA', 'Gastos de viaje', 'ACTIVA'),
(759, '233565', 'SUBCUENTA', 'Gastos de representación y relaciones públicas', 'ACTIVA'),
(760, '233570', 'SUBCUENTA', 'Servicios aduaneros', 'ACTIVA'),
(761, '233595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(762, '2340', 'CUENTA', 'Instalamentos por pagar', 'ACTIVA'),
(763, '2345', 'CUENTA', 'Acreedores oficiales', 'ACTIVA'),
(764, '2350', 'CUENTA', 'Regalías por pagar', 'ACTIVA'),
(765, '2355', 'CUENTA', 'Deudas con accionistas o socios', 'ACTIVA'),
(766, '235505', 'SUBCUENTA', 'Accionistas', 'ACTIVA'),
(767, '235510', 'SUBCUENTA', 'Socios', 'ACTIVA'),
(768, '2357', 'CUENTA', 'Deudas con directores', 'ACTIVA'),
(769, '2360', 'CUENTA', 'Dividendos o participaciones por pagar', 'ACTIVA'),
(770, '236005', 'SUBCUENTA', 'Dividendos', 'ACTIVA'),
(771, '236010', 'SUBCUENTA', 'Participaciones', 'ACTIVA'),
(772, '2365', 'CUENTA', 'Retención en la fuente', 'ACTIVA'),
(773, '236505', 'SUBCUENTA', 'Salarios y pagos laborales', 'ACTIVA'),
(774, '236510', 'SUBCUENTA', 'Dividendos y/o participaciones', 'ACTIVA'),
(775, '236515', 'SUBCUENTA', 'Honorarios', 'ACTIVA'),
(776, '236520', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(777, '236525', 'SUBCUENTA', 'Servicios', 'ACTIVA'),
(778, '236530', 'SUBCUENTA', 'Arrendamientos', 'ACTIVA'),
(779, '236535', 'SUBCUENTA', 'Rendimientos financieros', 'ACTIVA'),
(780, '236540', 'SUBCUENTA', 'Compras', 'ACTIVA'),
(781, '236545', 'SUBCUENTA', 'Loterías', 'ACTIVA'),
(782, '236550', 'SUBCUENTA', 'Por pagos al exterior', 'ACTIVA'),
(783, '236555', 'SUBCUENTA', 'Por ingresos obtenidos en el exterior', 'ACTIVA'),
(784, '236560', 'SUBCUENTA', 'Enajenación propiedades planta y equipo', 'ACTIVA'),
(785, '236565', 'SUBCUENTA', 'Por impuesto de timbre', 'ACTIVA'),
(786, '236570', 'SUBCUENTA', 'Otras retenciones y patrimonio', 'ACTIVA'),
(787, '236575', 'SUBCUENTA', 'Autorretenciones', 'ACTIVA'),
(788, '2367', 'CUENTA', 'Impuesto a las ventas retenido', 'ACTIVA'),
(789, '2368', 'CUENTA', 'Impuesto de industria y comercio retenido', 'ACTIVA'),
(790, '2370', 'CUENTA', 'Retenciones y aportes de nómina', 'ACTIVA'),
(791, '237005', 'SUBCUENTA', 'Aportes a entidades promotoras de salud', 'ACTIVA'),
(792, '237006', 'SUBCUENTA', 'Aportes a administradoras de riesgos profesionales', 'ACTIVA'),
(793, '237010', 'SUBCUENTA', 'Aportes al ICBF', 'ACTIVA'),
(794, '237015', 'SUBCUENTA', 'Aportes al FIC', 'ACTIVA'),
(795, '237025', 'SUBCUENTA', 'Embargos judiciales', 'ACTIVA'),
(796, '237030', 'SUBCUENTA', 'Libranzas', 'ACTIVA'),
(797, '237035', 'SUBCUENTA', 'Sindicatos', 'ACTIVA'),
(798, '237040', 'SUBCUENTA', 'Cooperativas', 'ACTIVA'),
(799, '237045', 'SUBCUENTA', 'Fondos', 'ACTIVA'),
(800, '237095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(801, '2375', 'CUENTA', 'Cuotas por devolver', 'ACTIVA'),
(802, '2380', 'CUENTA', 'Acreedores varios', 'ACTIVA'),
(803, '238005', 'SUBCUENTA', 'Depositarios', 'ACTIVA'),
(804, '238010', 'SUBCUENTA', 'Comisionistas de bolsas', 'ACTIVA'),
(805, '238015', 'SUBCUENTA', 'Sociedad administradora-Fondos de inversión', 'ACTIVA'),
(806, '238020', 'SUBCUENTA', 'Reintegros por pagar', 'ACTIVA'),
(807, '238025', 'SUBCUENTA', 'Fondo de perseverancia', 'ACTIVA'),
(808, '238030', 'SUBCUENTA', 'Fondos de cesantías y/o pensiones', 'ACTIVA');
INSERT INTO `puc` (`id`, `cuenta`, `tipo`, `descripcion`, `estado`) VALUES
(809, '238035', 'SUBCUENTA', 'Donaciones asignadas por pagar', 'ACTIVA'),
(810, '238095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(811, '24', 'GRUPO', 'Impuestos', 'ACTIVA'),
(812, '2404', 'CUENTA', 'De renta y complementarios', 'ACTIVA'),
(813, '240405', 'SUBCUENTA', 'Vigencia fiscal corriente', 'ACTIVA'),
(814, '240410', 'SUBCUENTA', 'Vigencias fiscales anteriores', 'ACTIVA'),
(815, '2408', 'CUENTA', 'Impuesto sobre las ventas por pagar', 'ACTIVA'),
(816, '2412', 'CUENTA', 'De industria y comercio', 'ACTIVA'),
(817, '241205', 'SUBCUENTA', 'Vigencia fiscal corriente', 'ACTIVA'),
(818, '241210', 'SUBCUENTA', 'Vigencias fiscales anteriores', 'ACTIVA'),
(819, '2416', 'CUENTA', 'A la propiedad raíz', 'ACTIVA'),
(820, '2420', 'CUENTA', 'Derechos sobre instrumentos públicos', 'ACTIVA'),
(821, '2424', 'CUENTA', 'De valorización', 'ACTIVA'),
(822, '242405', 'SUBCUENTA', 'Vigencia fiscal corriente', 'ACTIVA'),
(823, '242410', 'SUBCUENTA', 'Vigencias fiscales anteriores', 'ACTIVA'),
(824, '2428', 'CUENTA', 'De turismo', 'ACTIVA'),
(825, '2432', 'CUENTA', 'Tasa por utilización de puertos', 'ACTIVA'),
(826, '2436', 'CUENTA', 'De vehículos', 'ACTIVA'),
(827, '243605', 'SUBCUENTA', 'Vigencia fiscal corriente', 'ACTIVA'),
(828, '243610', 'SUBCUENTA', 'Vigencias fiscales anteriores', 'ACTIVA'),
(829, '2440', 'CUENTA', 'De espectáculos públicos', 'ACTIVA'),
(830, '2444', 'CUENTA', 'De hidrocarburos y minas', 'ACTIVA'),
(831, '244405', 'SUBCUENTA', 'De hidrocarburos', 'ACTIVA'),
(832, '244410', 'SUBCUENTA', 'De minas', 'ACTIVA'),
(833, '2448', 'CUENTA', 'Regalías e impuestos a la pequeña y mediana minería', 'ACTIVA'),
(834, '2452', 'CUENTA', 'A las exportaciones cafeteras', 'ACTIVA'),
(835, '2456', 'CUENTA', 'A las importaciones', 'ACTIVA'),
(836, '2460', 'CUENTA', 'Cuotas de fomento', 'ACTIVA'),
(837, '2464', 'CUENTA', 'De licores', 'ACTIVA'),
(838, '246405', 'SUBCUENTA', 'De licores', 'ACTIVA'),
(839, '246410', 'SUBCUENTA', 'De cervezas', 'ACTIVA'),
(840, '246415', 'SUBCUENTA', 'De cigarrillos', 'ACTIVA'),
(841, '2468', 'CUENTA', 'Al sacrificio de ganado', 'ACTIVA'),
(842, '2472', 'CUENTA', 'Al azar y juegos', 'ACTIVA'),
(843, '2476', 'CUENTA', 'Gravámenes y regalías por utilización del suelo', 'ACTIVA'),
(844, '2495', 'CUENTA', 'Otros', 'ACTIVA'),
(845, '25', 'GRUPO', 'Obligaciones laborales', 'ACTIVA'),
(846, '2505', 'CUENTA', 'Salarios por pagar', 'ACTIVA'),
(847, '2510', 'CUENTA', 'Cesantías consolidadas', 'ACTIVA'),
(848, '251005', 'SUBCUENTA', 'Ley laboral anterior', 'ACTIVA'),
(849, '251010', 'SUBCUENTA', 'Ley 50 de 1990 y normas posteriores', 'ACTIVA'),
(850, '2515', 'CUENTA', 'Intereses sobre cesantías', 'ACTIVA'),
(851, '2520', 'CUENTA', 'Prima de servicios', 'ACTIVA'),
(852, '2525', 'CUENTA', 'Vacaciones consolidadas', 'ACTIVA'),
(853, '2530', 'CUENTA', 'Prestaciones extralegales', 'ACTIVA'),
(854, '253005', 'SUBCUENTA', 'Primas', 'ACTIVA'),
(855, '253010', 'SUBCUENTA', 'Auxilios', 'ACTIVA'),
(856, '253015', 'SUBCUENTA', 'Dotación y suministro a trabajadores', 'ACTIVA'),
(857, '253020', 'SUBCUENTA', 'Bonificaciones', 'ACTIVA'),
(858, '253025', 'SUBCUENTA', 'Seguros', 'ACTIVA'),
(859, '253095', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(860, '2532', 'CUENTA', 'Pensiones por pagar', 'ACTIVA'),
(861, '2535', 'CUENTA', 'Cuotas partes pensiones de jubilación', 'ACTIVA'),
(862, '2540', 'CUENTA', 'Indemnizaciones laborales', 'ACTIVA'),
(863, '26', 'GRUPO', 'Pasivos estimados y provisiones', 'ACTIVA'),
(864, '2605', 'CUENTA', 'Para costos y gastos', 'ACTIVA'),
(865, '260505', 'SUBCUENTA', 'Intereses', 'ACTIVA'),
(866, '260510', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(867, '260515', 'SUBCUENTA', 'Honorarios', 'ACTIVA'),
(868, '260520', 'SUBCUENTA', 'Servicios técnicos', 'ACTIVA'),
(869, '260525', 'SUBCUENTA', 'Transportes', 'ACTIVA'),
(870, '260530', 'SUBCUENTA', 'Gastos de viaje', 'ACTIVA'),
(871, '260535', 'SUBCUENTA', 'Servicios públicos', 'ACTIVA'),
(872, '260540', 'SUBCUENTA', 'Regalías', 'ACTIVA'),
(873, '260545', 'SUBCUENTA', 'Garantías', 'ACTIVA'),
(874, '260550', 'SUBCUENTA', 'Materiales y repuestos', 'ACTIVA'),
(875, '260595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(876, '2610', 'CUENTA', 'Para obligaciones laborales', 'ACTIVA'),
(877, '261005', 'SUBCUENTA', 'Cesantías', 'ACTIVA'),
(878, '261010', 'SUBCUENTA', 'Intereses sobre cesantías', 'ACTIVA'),
(879, '261015', 'SUBCUENTA', 'Vacaciones', 'ACTIVA'),
(880, '261020', 'SUBCUENTA', 'Prima de servicios', 'ACTIVA'),
(881, '261025', 'SUBCUENTA', 'Prestaciones extralegales', 'ACTIVA'),
(882, '261030', 'SUBCUENTA', 'Viáticos', 'ACTIVA'),
(883, '261095', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(884, '2615', 'CUENTA', 'Para obligaciones fiscales', 'ACTIVA'),
(885, '261505', 'SUBCUENTA', 'De renta y complementarios', 'ACTIVA'),
(886, '261510', 'SUBCUENTA', 'De industria y comercio', 'ACTIVA'),
(887, '261515', 'SUBCUENTA', 'Tasa por utilización de puertos', 'ACTIVA'),
(888, '261520', 'SUBCUENTA', 'De vehículos', 'ACTIVA'),
(889, '261525', 'SUBCUENTA', 'De hidrocarburos y minas', 'ACTIVA'),
(890, '261595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(891, '2620', 'CUENTA', 'Pensiones de jubilación', 'ACTIVA'),
(892, '262005', 'SUBCUENTA', 'Cálculo actuarial pensiones de jubilación', 'ACTIVA'),
(893, '262010', 'SUBCUENTA', 'Pensiones de jubilación por amortizar (DB)', 'ACTIVA'),
(894, '2625', 'CUENTA', 'Para obras de urbanismo', 'ACTIVA'),
(895, '262505', 'SUBCUENTA', 'Acueducto y alcantarillado', 'ACTIVA'),
(896, '262510', 'SUBCUENTA', 'Energía eléctrica', 'ACTIVA'),
(897, '262515', 'SUBCUENTA', 'Teléfonos', 'ACTIVA'),
(898, '262595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(899, '2630', 'CUENTA', 'Para mantenimiento y reparaciones', 'ACTIVA'),
(900, '263005', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(901, '263010', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(902, '263015', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(903, '263020', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(904, '263025', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(905, '263030', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(906, '263035', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(907, '263040', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(908, '263045', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(909, '263050', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(910, '263055', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(911, '263060', 'SUBCUENTA', 'Acueductos', 'ACTIVA'),
(912, '263065', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(913, '263070', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(914, '263075', 'SUBCUENTA', 'Plantaciones agrícolas y forestales', 'ACTIVA'),
(915, '263080', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(916, '263085', 'SUBCUENTA', 'Pozos artesianos', 'ACTIVA'),
(917, '263095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(918, '2635', 'CUENTA', 'Para contingencias', 'ACTIVA'),
(919, '263505', 'SUBCUENTA', 'Multas y sanciones autoridades administrativas', 'ACTIVA'),
(920, '263510', 'SUBCUENTA', 'Intereses por multas y sanciones', 'ACTIVA'),
(921, '263515', 'SUBCUENTA', 'Reclamos', 'ACTIVA'),
(922, '263520', 'SUBCUENTA', 'Laborales', 'ACTIVA'),
(923, '263525', 'SUBCUENTA', 'Civiles', 'ACTIVA'),
(924, '263530', 'SUBCUENTA', 'Penales', 'ACTIVA'),
(925, '263535', 'SUBCUENTA', 'Administrativos', 'ACTIVA'),
(926, '263540', 'SUBCUENTA', 'Comerciales', 'ACTIVA'),
(927, '263595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(928, '2640', 'CUENTA', 'Para obligaciones de garantías', 'ACTIVA'),
(929, '2695', 'CUENTA', 'Provisiones diversas', 'ACTIVA'),
(930, '269505', 'SUBCUENTA', 'Para beneficencia', 'ACTIVA'),
(931, '269510', 'SUBCUENTA', 'Para comunicaciones', 'ACTIVA'),
(932, '269515', 'SUBCUENTA', 'Para pérdida en transporte', 'ACTIVA'),
(933, '269520', 'SUBCUENTA', 'Para operación', 'ACTIVA'),
(934, '269525', 'SUBCUENTA', 'Para protección de bienes agotables', 'ACTIVA'),
(935, '269530', 'SUBCUENTA', 'Para ajustes en redención de unidades', 'ACTIVA'),
(936, '269535', 'SUBCUENTA', 'Autoseguro', 'ACTIVA'),
(937, '269540', 'SUBCUENTA', 'Planes y programas de reforestación y electrificación', 'ACTIVA'),
(938, '269595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(939, '27', 'GRUPO', 'Diferidos', 'ACTIVA'),
(940, '2705', 'CUENTA', 'Ingresos recibidos por anticipado', 'ACTIVA'),
(941, '270505', 'SUBCUENTA', 'Intereses', 'ACTIVA'),
(942, '270510', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(943, '270515', 'SUBCUENTA', 'Arrendamientos', 'ACTIVA'),
(944, '270520', 'SUBCUENTA', 'Honorarios', 'ACTIVA'),
(945, '270525', 'SUBCUENTA', 'Servicios técnicos', 'ACTIVA'),
(946, '270530', 'SUBCUENTA', 'De suscriptores', 'ACTIVA'),
(947, '270535', 'SUBCUENTA', 'Transportes', 'ACTIVA'),
(948, '270540', 'SUBCUENTA', 'Mercancía en tránsito ya vendida', 'ACTIVA'),
(949, '270545', 'SUBCUENTA', 'Matrículas y pensiones', 'ACTIVA'),
(950, '270550', 'SUBCUENTA', 'Cuotas de administración', 'ACTIVA'),
(951, '270595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(952, '2710', 'CUENTA', 'Abonos diferidos', 'ACTIVA'),
(953, '271005', 'SUBCUENTA', 'Reajuste del sistema', 'ACTIVA'),
(954, '2715', 'CUENTA', 'Utilidad diferida en ventas a plazos', 'ACTIVA'),
(955, '2720', 'CUENTA', 'Crédito por corrección monetaria diferida', 'ACTIVA'),
(956, '2725', 'CUENTA', 'Impuestos diferidos', 'ACTIVA'),
(957, '272505', 'SUBCUENTA', 'Por depreciación flexible', 'ACTIVA'),
(958, '272595', 'SUBCUENTA', 'Diversos', 'ACTIVA'),
(959, '272599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(960, '28', 'GRUPO', 'Otros pasivos', 'ACTIVA'),
(961, '2805', 'CUENTA', 'Anticipos y avances recibidos', 'ACTIVA'),
(962, '280505', 'SUBCUENTA', 'De clientes', 'ACTIVA'),
(963, '280510', 'SUBCUENTA', 'Sobre contratos', 'ACTIVA'),
(964, '280515', 'SUBCUENTA', 'Para obras en proceso', 'ACTIVA'),
(965, '280595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(966, '2810', 'CUENTA', 'Depósitos recibidos', 'ACTIVA'),
(967, '281005', 'SUBCUENTA', 'Para futura suscripción de acciones', 'ACTIVA'),
(968, '281010', 'SUBCUENTA', 'Para futuro pago de cuotas o derechos sociales', 'ACTIVA'),
(969, '281015', 'SUBCUENTA', 'Para garantía en la prestación de servicios', 'ACTIVA'),
(970, '281020', 'SUBCUENTA', 'Para garantía de contratos', 'ACTIVA'),
(971, '281025', 'SUBCUENTA', 'De licitaciones', 'ACTIVA'),
(972, '281030', 'SUBCUENTA', 'De manejo de bienes', 'ACTIVA'),
(973, '281035', 'SUBCUENTA', 'Fondo de reserva', 'ACTIVA'),
(974, '281095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(975, '2815', 'CUENTA', 'Ingresos recibidos para terceros', 'ACTIVA'),
(976, '281505', 'SUBCUENTA', 'Valores recibidos para terceros', 'ACTIVA'),
(977, '281510', 'SUBCUENTA', 'Venta por cuenta de terceros', 'ACTIVA'),
(978, '2820', 'CUENTA', 'Cuentas de operación conjunta', 'ACTIVA'),
(979, '2825', 'CUENTA', 'Retenciones a terceros sobre contratos', 'ACTIVA'),
(980, '282505', 'SUBCUENTA', 'Cumplimiento obligaciones laborales', 'ACTIVA'),
(981, '282510', 'SUBCUENTA', 'Para estabilidad de obra', 'ACTIVA'),
(982, '282515', 'SUBCUENTA', 'Garantía cumplimiento de contratos', 'ACTIVA'),
(983, '2830', 'CUENTA', 'Embargos judiciales', 'ACTIVA'),
(984, '283005', 'SUBCUENTA', 'Indemnizaciones', 'ACTIVA'),
(985, '283010', 'SUBCUENTA', 'Depósitos judiciales', 'ACTIVA'),
(986, '2835', 'CUENTA', 'Acreedores del sistema', 'ACTIVA'),
(987, '283505', 'SUBCUENTA', 'Cuotas netas', 'ACTIVA'),
(988, '283510', 'SUBCUENTA', 'Grupos en formación', 'ACTIVA'),
(989, '2840', 'CUENTA', 'Cuentas en participación', 'ACTIVA'),
(990, '2895', 'CUENTA', 'Diversos', 'ACTIVA'),
(991, '289505', 'SUBCUENTA', 'Préstamos de productos', 'ACTIVA'),
(992, '289510', 'SUBCUENTA', 'Reembolso de costos exploratorios', 'ACTIVA'),
(993, '289515', 'SUBCUENTA', 'Programa de extensión agropecuaria', 'ACTIVA'),
(994, '29', 'GRUPO', 'Bonos y papeles comerciales', 'ACTIVA'),
(995, '2905', 'CUENTA', 'Bonos en circulación', 'ACTIVA'),
(996, '2910', 'CUENTA', 'Bonos obligatoriamente convertibles en acciones', 'ACTIVA'),
(997, '2915', 'CUENTA', 'Papeles comerciales', 'ACTIVA'),
(998, '2920', 'CUENTA', 'Bonos pensionales', 'ACTIVA'),
(999, '292005', 'SUBCUENTA', 'Valor bonos pensionales', 'ACTIVA'),
(1000, '292010', 'SUBCUENTA', 'Bonos pensionales por amortizar (DB)', 'ACTIVA'),
(1001, '292015', 'SUBCUENTA', 'Intereses causados sobre bonos pensionales', 'ACTIVA'),
(1002, '2925', 'CUENTA', 'Títulos pensionales', 'ACTIVA'),
(1003, '292505', 'SUBCUENTA', 'Valor títulos pensionales', 'ACTIVA'),
(1004, '292510', 'SUBCUENTA', 'Títulos pensionales por amortizar (DB)', 'ACTIVA'),
(1005, '292515', 'SUBCUENTA', 'Intereses causados sobre títulos pensionales', 'ACTIVA'),
(1006, '3', 'CLASE', 'Patrimonio', 'ACTIVA'),
(1007, '31', 'GRUPO', 'Capital social', 'ACTIVA'),
(1008, '3105', 'CUENTA', 'Capital suscrito y pagado', 'ACTIVA'),
(1009, '310505', 'SUBCUENTA', 'Capital autorizado', 'ACTIVA'),
(1010, '310510', 'SUBCUENTA', 'Capital por suscribir (DB)', 'ACTIVA'),
(1011, '310515', 'SUBCUENTA', 'Capital suscrito por cobrar (DB)', 'ACTIVA'),
(1012, '3115', 'CUENTA', 'Aportes sociales', 'ACTIVA'),
(1013, '311505', 'SUBCUENTA', 'Cuotas o partes de interés social', 'ACTIVA'),
(1014, '311510', 'SUBCUENTA', 'Aportes de socios-fondo mutuo de inversión', 'ACTIVA'),
(1015, '311515', 'SUBCUENTA', 'Contribución de la empresa-fondo mutuo de inversión', 'ACTIVA'),
(1016, '311520', 'SUBCUENTA', 'Suscripciones del público', 'ACTIVA'),
(1017, '3120', 'CUENTA', 'Capital asignado', 'ACTIVA'),
(1018, '3125', 'CUENTA', 'Inversión suplementaria al capital asignado', 'ACTIVA'),
(1019, '3130', 'CUENTA', 'Capital de personas naturales', 'ACTIVA'),
(1020, '3135', 'CUENTA', 'Aportes del Estado', 'ACTIVA'),
(1021, '3140', 'CUENTA', 'Fondo social', 'ACTIVA'),
(1022, '32', 'GRUPO', 'Superávit de capital', 'ACTIVA'),
(1023, '3205', 'CUENTA', 'Prima en colocación de acciones', 'ACTIVA'),
(1024, '320505', 'SUBCUENTA', 'Prima en colocación de acciones', 'ACTIVA'),
(1025, '320510', 'SUBCUENTA', 'Prima en colocación de acciones por cobrar (DB)', 'ACTIVA'),
(1026, '320515', 'SUBCUENTA', 'Prima en colocación de cuotas o partes de interés social', 'ACTIVA'),
(1027, '3210', 'CUENTA', 'Donaciones', 'ACTIVA'),
(1028, '321005', 'SUBCUENTA', 'En dinero', 'ACTIVA'),
(1029, '321010', 'SUBCUENTA', 'En valores mobiliarios', 'ACTIVA'),
(1030, '321015', 'SUBCUENTA', 'En bienes muebles', 'ACTIVA'),
(1031, '321020', 'SUBCUENTA', 'En bienes inmuebles', 'ACTIVA'),
(1032, '321025', 'SUBCUENTA', 'En intangibles', 'ACTIVA'),
(1033, '3215', 'CUENTA', 'Crédito mercantil', 'ACTIVA'),
(1034, '3220', 'CUENTA', 'Know how', 'ACTIVA'),
(1035, '3225', 'CUENTA', 'Superávit método de participación', 'ACTIVA'),
(1036, '322505', 'SUBCUENTA', 'De acciones', 'ACTIVA'),
(1037, '322510', 'SUBCUENTA', 'De cuotas o partes de interés social', 'ACTIVA'),
(1038, '33', 'GRUPO', 'Reservas', 'ACTIVA'),
(1039, '3305', 'CUENTA', 'Reservas obligatorias', 'ACTIVA'),
(1040, '330505', 'SUBCUENTA', 'Reserva legal', 'ACTIVA'),
(1041, '330510', 'SUBCUENTA', 'Reservas por disposiciones fiscales', 'ACTIVA'),
(1042, '330515', 'SUBCUENTA', 'Reserva para readquisición de acciones', 'ACTIVA'),
(1043, '330516', 'SUBCUENTA', 'Acciones propias readquiridas (DB)', 'ACTIVA'),
(1044, '330517', 'SUBCUENTA', 'Reserva para readquisición de cuotas o partes de interés social', 'ACTIVA'),
(1045, '330518', 'SUBCUENTA', 'Cuotas o partes de interés social propias readquiridas (DB)', 'ACTIVA'),
(1046, '330520', 'SUBCUENTA', 'Reserva para extensión agropecuaria', 'ACTIVA'),
(1047, '330525', 'SUBCUENTA', 'Reserva Ley 7ª de 1990', 'ACTIVA'),
(1048, '330530', 'SUBCUENTA', 'Reserva para reposición de semovientes', 'ACTIVA'),
(1049, '330535', 'SUBCUENTA', 'Reserva Ley 4ª de 1980', 'ACTIVA'),
(1050, '330595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(1051, '3310', 'CUENTA', 'Reservas estatutarias', 'ACTIVA'),
(1052, '331005', 'SUBCUENTA', 'Para futuras capitalizaciones', 'ACTIVA'),
(1053, '331010', 'SUBCUENTA', 'Para reposición de activos', 'ACTIVA'),
(1054, '331015', 'SUBCUENTA', 'Para futuros ensanches', 'ACTIVA'),
(1055, '331095', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(1056, '3315', 'CUENTA', 'Reservas ocasionales', 'ACTIVA'),
(1057, '331505', 'SUBCUENTA', 'Para beneficencia y civismo', 'ACTIVA'),
(1058, '331510', 'SUBCUENTA', 'Para futuras capitalizaciones', 'ACTIVA'),
(1059, '331515', 'SUBCUENTA', 'Para futuros ensanches', 'ACTIVA'),
(1060, '331520', 'SUBCUENTA', 'Para adquisición o reposición de propiedades', 'ACTIVA'),
(1061, '331525', 'SUBCUENTA', 'Para investigaciones y desarrollo', 'ACTIVA'),
(1062, '331530', 'SUBCUENTA', 'Para fomento económico', 'ACTIVA'),
(1063, '331535', 'SUBCUENTA', 'Para capital de trabajo', 'ACTIVA'),
(1064, '331540', 'SUBCUENTA', 'Para estabilización de rendimientos', 'ACTIVA'),
(1065, '331545', 'SUBCUENTA', 'A disposición del máximo órgano social', 'ACTIVA'),
(1066, '331595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(1067, '34', 'GRUPO', 'Revalorización del patrimonio', 'ACTIVA'),
(1068, '3405', 'CUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1069, '340505', 'SUBCUENTA', 'De capital social', 'ACTIVA'),
(1070, '340510', 'SUBCUENTA', 'De superávit de capital', 'ACTIVA'),
(1071, '340515', 'SUBCUENTA', 'De reservas', 'ACTIVA'),
(1072, '340520', 'SUBCUENTA', 'De resultados de ejercicios anteriores', 'ACTIVA'),
(1073, '340525', 'SUBCUENTA', 'De activos en período improductivo', 'ACTIVA'),
(1074, '340530', 'SUBCUENTA', 'De saneamiento fiscal', 'ACTIVA'),
(1075, '340535', 'SUBCUENTA', 'De ajustes Decreto 3019 de 1989', 'ACTIVA'),
(1076, '340540', 'SUBCUENTA', 'De dividendos y participaciones decretadas en acciones', 'ACTIVA'),
(1077, '340545', 'SUBCUENTA', 'Superávit método de participación', 'ACTIVA'),
(1078, '3410', 'CUENTA', 'Saneamiento fiscal', 'ACTIVA'),
(1079, '3415', 'CUENTA', 'Ajustes por inflación Decreto 3019 de 1989', 'ACTIVA'),
(1080, '35', 'GRUPO', 'Dividendos o participaciones decretados en acciones', 'ACTIVA'),
(1081, '3505', 'CUENTA', 'Dividendos decretados en acciones', 'ACTIVA'),
(1082, '3510', 'CUENTA', 'Participaciones decretadas en cuotas o partes de interés social', 'ACTIVA'),
(1083, '36', 'GRUPO', 'Resultados del ejercicio', 'ACTIVA'),
(1084, '3605', 'CUENTA', 'Utilidad del ejercicio', 'ACTIVA'),
(1085, '3610', 'CUENTA', 'Pérdida del ejercicio', 'ACTIVA'),
(1086, '37', 'GRUPO', 'Resultados de ejercicios anteriores', 'ACTIVA'),
(1087, '3705', 'CUENTA', 'Utilidades acumuladas', 'ACTIVA'),
(1088, '3710', 'CUENTA', 'Pérdidas acumuladas', 'ACTIVA'),
(1089, '38', 'GRUPO', 'Superávit por valorizaciones', 'ACTIVA'),
(1090, '3805', 'CUENTA', 'De inversiones', 'ACTIVA'),
(1091, '380505', 'SUBCUENTA', 'Acciones', 'ACTIVA'),
(1092, '380510', 'SUBCUENTA', 'Cuotas o partes de interés social', 'ACTIVA'),
(1093, '380515', 'SUBCUENTA', 'Derechos fiduciarios', 'ACTIVA'),
(1094, '3810', 'CUENTA', 'De propiedades', 'ACTIVA'),
(1095, '381004', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(1096, '381006', 'SUBCUENTA', 'Materiales proyectos petroleros', 'ACTIVA'),
(1097, '381008', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(1098, '381012', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(1099, '381016', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(1100, '381020', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(1101, '381024', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(1102, '381028', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(1103, '381032', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1104, '381036', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1105, '381040', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1106, '381044', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1107, '381048', 'SUBCUENTA', 'Acueductos', 'ACTIVA'),
(1108, '381052', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(1109, '381056', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(1110, '381060', 'SUBCUENTA', 'Plantaciones agrícolas y forestales', 'ACTIVA'),
(1111, '381064', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(1112, '381068', 'SUBCUENTA', 'Minas y canteras', 'ACTIVA'),
(1113, '381072', 'SUBCUENTA', 'Pozos artesianos', 'ACTIVA'),
(1114, '381076', 'SUBCUENTA', 'Yacimientos', 'ACTIVA'),
(1115, '381080', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(1116, '3895', 'CUENTA', 'De otros activos', 'ACTIVA'),
(1117, '389505', 'SUBCUENTA', 'Bienes de arte y cultura', 'ACTIVA'),
(1118, '389510', 'SUBCUENTA', 'Bienes entregados en comodato', 'ACTIVA'),
(1119, '389515', 'SUBCUENTA', 'Bienes recibidos en pago', 'ACTIVA'),
(1120, '389520', 'SUBCUENTA', 'Inventario de semovientes', 'ACTIVA'),
(1121, '4', 'CLASE', 'Ingresos', 'ACTIVA'),
(1122, '41', 'GRUPO', 'Operacionales', 'ACTIVA'),
(1123, '4105', 'CUENTA', 'Agricultura  ganadería  caza y silvicultura', 'ACTIVA'),
(1124, '410505', 'SUBCUENTA', 'Cultivo de cereales', 'ACTIVA'),
(1125, '410510', 'SUBCUENTA', 'Cultivos de hortalizas  legumbres y plantas ornamentales', 'ACTIVA'),
(1126, '410515', 'SUBCUENTA', 'Cultivos de frutas  nueces y plantas aromáticas', 'ACTIVA'),
(1127, '410520', 'SUBCUENTA', 'Cultivo de café', 'ACTIVA'),
(1128, '410525', 'SUBCUENTA', 'Cultivo de flores', 'ACTIVA'),
(1129, '410530', 'SUBCUENTA', 'Cultivo de caña de azúcar', 'ACTIVA'),
(1130, '410535', 'SUBCUENTA', 'Cultivo de algodón y plantas para material textil', 'ACTIVA'),
(1131, '410540', 'SUBCUENTA', 'Cultivo de banano', 'ACTIVA'),
(1132, '410545', 'SUBCUENTA', 'Otros cultivos agrícolas', 'ACTIVA'),
(1133, '410550', 'SUBCUENTA', 'Cría de ovejas  cabras  asnos  mulas y burdéganos', 'ACTIVA'),
(1134, '410555', 'SUBCUENTA', 'Cría de ganado caballar y vacuno', 'ACTIVA'),
(1135, '410560', 'SUBCUENTA', 'Producción avícola', 'ACTIVA'),
(1136, '410565', 'SUBCUENTA', 'Cría de otros animales', 'ACTIVA'),
(1137, '410570', 'SUBCUENTA', 'Servicios agrícolas y ganaderos', 'ACTIVA'),
(1138, '410575', 'SUBCUENTA', 'Actividad de caza', 'ACTIVA'),
(1139, '410580', 'SUBCUENTA', 'Actividad de silvicultura', 'ACTIVA'),
(1140, '410595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1141, '410599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1142, '4110', 'CUENTA', 'Pesca', 'ACTIVA'),
(1143, '411005', 'SUBCUENTA', 'Actividad de pesca', 'ACTIVA'),
(1144, '411010', 'SUBCUENTA', 'Explotación de criaderos de peces', 'ACTIVA'),
(1145, '411095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1146, '411099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1147, '4115', 'CUENTA', 'Explotación de minas y canteras', 'ACTIVA'),
(1148, '411505', 'SUBCUENTA', 'Carbón', 'ACTIVA'),
(1149, '411510', 'SUBCUENTA', 'Petróleo crudo', 'ACTIVA'),
(1150, '411512', 'SUBCUENTA', 'Gas natural', 'ACTIVA'),
(1151, '411514', 'SUBCUENTA', 'Servicios relacionados con extracción de petróleo y gas', 'ACTIVA'),
(1152, '411515', 'SUBCUENTA', 'Minerales de hierro', 'ACTIVA'),
(1153, '411520', 'SUBCUENTA', 'Minerales metalíferos no ferrosos', 'ACTIVA'),
(1154, '411525', 'SUBCUENTA', 'Piedra  arena y arcilla', 'ACTIVA'),
(1155, '411527', 'SUBCUENTA', 'Piedras preciosas', 'ACTIVA'),
(1156, '411528', 'SUBCUENTA', 'Oro', 'ACTIVA'),
(1157, '411530', 'SUBCUENTA', 'Otras minas y canteras', 'ACTIVA'),
(1158, '411532', 'SUBCUENTA', 'Prestación de servicios sector minero', 'ACTIVA'),
(1159, '411595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1160, '411599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1161, '4120', 'CUENTA', 'Industrias manufactureras', 'ACTIVA'),
(1162, '412001', 'SUBCUENTA', 'Producción y procesamiento de carnes y productos cárnicos', 'ACTIVA'),
(1163, '412002', 'SUBCUENTA', 'Productos de pescado', 'ACTIVA'),
(1164, '412003', 'SUBCUENTA', 'Productos de frutas  legumbres y hortalizas', 'ACTIVA'),
(1165, '412004', 'SUBCUENTA', 'Elaboración de aceites y grasas', 'ACTIVA'),
(1166, '412005', 'SUBCUENTA', 'Elaboración de productos lácteos', 'ACTIVA'),
(1167, '412006', 'SUBCUENTA', 'Elaboración de productos de molinería', 'ACTIVA'),
(1168, '412007', 'SUBCUENTA', 'Elaboración de almidones y derivados', 'ACTIVA'),
(1169, '412008', 'SUBCUENTA', 'Elaboración de alimentos para animales', 'ACTIVA'),
(1170, '412009', 'SUBCUENTA', 'Elaboración de productos para panadería', 'ACTIVA'),
(1171, '412010', 'SUBCUENTA', 'Elaboración de azúcar y melazas', 'ACTIVA'),
(1172, '412011', 'SUBCUENTA', 'Elaboración de cacao  chocolate y confitería', 'ACTIVA'),
(1173, '412012', 'SUBCUENTA', 'Elaboración de pastas y productos farináceos', 'ACTIVA'),
(1174, '412013', 'SUBCUENTA', 'Elaboración de productos de café', 'ACTIVA'),
(1175, '412014', 'SUBCUENTA', 'Elaboración de otros productos alimenticios', 'ACTIVA'),
(1176, '412015', 'SUBCUENTA', 'Elaboración de bebidas alcohólicas y alcohol etílico', 'ACTIVA'),
(1177, '412016', 'SUBCUENTA', 'Elaboración de vinos', 'ACTIVA'),
(1178, '412017', 'SUBCUENTA', 'Elaboración de bebidas malteadas y de malta', 'ACTIVA'),
(1179, '412018', 'SUBCUENTA', 'Elaboración de bebidas no alcohólicas', 'ACTIVA'),
(1180, '412019', 'SUBCUENTA', 'Elaboración de productos de tabaco', 'ACTIVA'),
(1181, '412020', 'SUBCUENTA', 'Preparación e hilatura de fibras textiles y tejeduría', 'ACTIVA'),
(1182, '412021', 'SUBCUENTA', 'Acabado de productos textiles', 'ACTIVA'),
(1183, '412022', 'SUBCUENTA', 'Elaboración de artículos de materiales textiles', 'ACTIVA'),
(1184, '412023', 'SUBCUENTA', 'Elaboración de tapices y alfombras', 'ACTIVA'),
(1185, '412024', 'SUBCUENTA', 'Elaboración de cuerdas  cordeles  bramantes y redes', 'ACTIVA'),
(1186, '412025', 'SUBCUENTA', 'Elaboración de otros productos textiles', 'ACTIVA'),
(1187, '412026', 'SUBCUENTA', 'Elaboración de tejidos', 'ACTIVA'),
(1188, '412027', 'SUBCUENTA', 'Elaboración de prendas de vestir', 'ACTIVA'),
(1189, '412028', 'SUBCUENTA', 'Preparación  adobo y teñido de pieles', 'ACTIVA'),
(1190, '412029', 'SUBCUENTA', 'Curtido  adobo o preparación de cuero', 'ACTIVA'),
(1191, '412030', 'SUBCUENTA', 'Elaboración de maletas  bolsos y similares', 'ACTIVA'),
(1192, '412031', 'SUBCUENTA', 'Elaboración de calzado', 'ACTIVA'),
(1193, '412032', 'SUBCUENTA', 'Producción de madera  artículos de madera y corcho', 'ACTIVA'),
(1194, '412033', 'SUBCUENTA', 'Elaboración de pasta y productos de madera  papel y cartón', 'ACTIVA'),
(1195, '412034', 'SUBCUENTA', 'Ediciones y publicaciones', 'ACTIVA'),
(1196, '412035', 'SUBCUENTA', 'Impresión', 'ACTIVA'),
(1197, '412036', 'SUBCUENTA', 'Servicios relacionados con la edición y la impresión', 'ACTIVA'),
(1198, '412037', 'SUBCUENTA', 'Reproducción de grabaciones', 'ACTIVA'),
(1199, '412038', 'SUBCUENTA', 'Elaboración de productos de horno de coque', 'ACTIVA'),
(1200, '412039', 'SUBCUENTA', 'Elaboración de productos de la refinación de petróleo', 'ACTIVA'),
(1201, '412040', 'SUBCUENTA', 'Elaboración de sustancias químicas básicas', 'ACTIVA'),
(1202, '412041', 'SUBCUENTA', 'Elaboración de abonos y compuestos de nitrógeno', 'ACTIVA'),
(1203, '412042', 'SUBCUENTA', 'Elaboración de plástico y caucho sintético', 'ACTIVA'),
(1204, '412043', 'SUBCUENTA', 'Elaboración de productos químicos de uso agropecuario', 'ACTIVA'),
(1205, '412044', 'SUBCUENTA', 'Elaboración de pinturas  tintas y masillas', 'ACTIVA'),
(1206, '412045', 'SUBCUENTA', 'Elaboración de productos farmacéuticos y botánicos', 'ACTIVA'),
(1207, '412046', 'SUBCUENTA', 'Elaboración de jabones  detergentes y preparados de tocador', 'ACTIVA'),
(1208, '412047', 'SUBCUENTA', 'Elaboración de otros productos químicos', 'ACTIVA'),
(1209, '412048', 'SUBCUENTA', 'Elaboración de fibras', 'ACTIVA'),
(1210, '412049', 'SUBCUENTA', 'Elaboración de otros productos de caucho', 'ACTIVA'),
(1211, '412050', 'SUBCUENTA', 'Elaboración de productos de plástico', 'ACTIVA'),
(1212, '412051', 'SUBCUENTA', 'Elaboración de vidrio y productos de vidrio', 'ACTIVA'),
(1213, '412052', 'SUBCUENTA', 'Elaboración de productos de cerámica  loza  piedra  arcilla y porcelana', 'ACTIVA'),
(1214, '412053', 'SUBCUENTA', 'Elaboración de cemento  cal y yeso', 'ACTIVA'),
(1215, '412054', 'SUBCUENTA', 'Elaboración de artículos de hormigón  cemento y yeso', 'ACTIVA'),
(1216, '412055', 'SUBCUENTA', 'Corte  tallado y acabado de la piedra', 'ACTIVA'),
(1217, '412056', 'SUBCUENTA', 'Elaboración de otros productos minerales no metálicos', 'ACTIVA'),
(1218, '412057', 'SUBCUENTA', 'Industrias básicas y fundición de hierro y acero', 'ACTIVA'),
(1219, '412058', 'SUBCUENTA', 'Productos primarios de metales preciosos y de metales no ferrosos', 'ACTIVA'),
(1220, '412059', 'SUBCUENTA', 'Fundición de metales no ferrosos', 'ACTIVA'),
(1221, '412060', 'SUBCUENTA', 'Fabricación de productos metálicos para uso estructural', 'ACTIVA'),
(1222, '412061', 'SUBCUENTA', 'Forja  prensado  estampado  laminado de metal y pulvimetalurgia', 'ACTIVA'),
(1223, '412062', 'SUBCUENTA', 'Revestimiento de metales y obras de ingeniería mecánica', 'ACTIVA'),
(1224, '412063', 'SUBCUENTA', 'Fabricación de artículos de ferretería', 'ACTIVA'),
(1225, '412064', 'SUBCUENTA', 'Elaboración de otros productos de metal', 'ACTIVA'),
(1226, '412065', 'SUBCUENTA', 'Fabricación de maquinaria y equipo', 'ACTIVA'),
(1227, '412066', 'SUBCUENTA', 'Fabricación de equipos de elevación y manipulación', 'ACTIVA'),
(1228, '412067', 'SUBCUENTA', 'Elaboración de aparatos de uso doméstico', 'ACTIVA'),
(1229, '412068', 'SUBCUENTA', 'Elaboración de equipo de oficina', 'ACTIVA'),
(1230, '412069', 'SUBCUENTA', 'Elaboración de pilas y baterías primarias', 'ACTIVA'),
(1231, '412070', 'SUBCUENTA', 'Elaboración de equipo de iluminación', 'ACTIVA'),
(1232, '412071', 'SUBCUENTA', 'Elaboración de otros tipos de equipo eléctrico', 'ACTIVA'),
(1233, '412072', 'SUBCUENTA', 'Fabricación de equipos de radio  televisión y comunicaciones', 'ACTIVA'),
(1234, '412073', 'SUBCUENTA', 'Fabricación de aparatos e instrumentos médicos', 'ACTIVA'),
(1235, '412074', 'SUBCUENTA', 'Fabricación de instrumentos de medición y control', 'ACTIVA'),
(1236, '412075', 'SUBCUENTA', 'Fabricación de instrumentos de óptica y equipo fotográfico', 'ACTIVA'),
(1237, '412076', 'SUBCUENTA', 'Fabricación de relojes', 'ACTIVA'),
(1238, '412077', 'SUBCUENTA', 'Fabricación de vehículos automotores', 'ACTIVA'),
(1239, '412078', 'SUBCUENTA', 'Fabricación de carrocerías para automotores', 'ACTIVA'),
(1240, '412079', 'SUBCUENTA', 'Fabricación de partes piezas y accesorios para automotores', 'ACTIVA'),
(1241, '412080', 'SUBCUENTA', 'Fabricación y reparación de buques y otras embarcaciones', 'ACTIVA'),
(1242, '412081', 'SUBCUENTA', 'Fabricación de locomotoras y material rodante para ferrocarriles', 'ACTIVA'),
(1243, '412082', 'SUBCUENTA', 'Fabricación de aeronaves', 'ACTIVA'),
(1244, '412083', 'SUBCUENTA', 'Fabricación de motocicletas', 'ACTIVA'),
(1245, '412084', 'SUBCUENTA', 'Fabricación de bicicletas y sillas de ruedas', 'ACTIVA'),
(1246, '412085', 'SUBCUENTA', 'Fabricación de otros tipos de transporte', 'ACTIVA'),
(1247, '412086', 'SUBCUENTA', 'Fabricación de muebles', 'ACTIVA'),
(1248, '412087', 'SUBCUENTA', 'Fabricación de joyas y artículos conexos', 'ACTIVA'),
(1249, '412088', 'SUBCUENTA', 'Fabricación de instrumentos de música', 'ACTIVA'),
(1250, '412089', 'SUBCUENTA', 'Fabricación de artículos y equipo para deporte', 'ACTIVA'),
(1251, '412090', 'SUBCUENTA', 'Fabricación de juegos y juguetes', 'ACTIVA'),
(1252, '412091', 'SUBCUENTA', 'Reciclamiento de desperdicios', 'ACTIVA'),
(1253, '412095', 'SUBCUENTA', 'Productos de otras industrias manufactureras', 'ACTIVA'),
(1254, '412099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1255, '4125', 'CUENTA', 'Suministro de electricidad  gas y agua', 'ACTIVA'),
(1256, '412505', 'SUBCUENTA', 'Generación  captación y distribución de energía eléctrica', 'ACTIVA'),
(1257, '412510', 'SUBCUENTA', 'Fabricación de gas y distribución de combustibles gaseosos', 'ACTIVA'),
(1258, '412515', 'SUBCUENTA', 'Captación  depuración y distribución de agua', 'ACTIVA'),
(1259, '412595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1260, '412599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1261, '4130', 'CUENTA', 'Construcción', 'ACTIVA'),
(1262, '413005', 'SUBCUENTA', 'Preparación de terrenos', 'ACTIVA'),
(1263, '413010', 'SUBCUENTA', 'Construcción de edificios y obras de ingeniería civil', 'ACTIVA'),
(1264, '413015', 'SUBCUENTA', 'Acondicionamiento de edificios', 'ACTIVA'),
(1265, '413020', 'SUBCUENTA', 'Terminación de edificaciones', 'ACTIVA'),
(1266, '413025', 'SUBCUENTA', 'Alquiler de equipo con operarios', 'ACTIVA'),
(1267, '413095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1268, '413099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1269, '4135', 'CUENTA', 'Comercio al por mayor y al por menor', 'ACTIVA'),
(1270, '413502', 'SUBCUENTA', 'Venta de vehículos automotores', 'ACTIVA'),
(1271, '413504', 'SUBCUENTA', 'Mantenimiento  reparación y lavado de vehículos automotores', 'ACTIVA'),
(1272, '413506', 'SUBCUENTA', 'Venta de partes  piezas y accesorios de vehículos automotores', 'ACTIVA'),
(1273, '413508', 'SUBCUENTA', 'Venta de combustibles sólidos  líquidos  gaseosos', 'ACTIVA'),
(1274, '413510', 'SUBCUENTA', 'Venta de lubricantes  aditivos  llantas y lujos para automotores', 'ACTIVA'),
(1275, '413512', 'SUBCUENTA', 'Venta a cambio de retribución o por contrata', 'ACTIVA'),
(1276, '413514', 'SUBCUENTA', 'Venta de insumos  materias primas agropecuarias y flores', 'ACTIVA'),
(1277, '413516', 'SUBCUENTA', 'Venta de otros insumos y materias primas no agropecuarias', 'ACTIVA'),
(1278, '413518', 'SUBCUENTA', 'Venta de animales vivos y cueros', 'ACTIVA'),
(1279, '413520', 'SUBCUENTA', 'Venta de productos en almacenes no especializados', 'ACTIVA'),
(1280, '413522', 'SUBCUENTA', 'Venta de productos agropecuarios', 'ACTIVA'),
(1281, '413524', 'SUBCUENTA', 'Venta de productos textiles  de vestir  de cuero y calzado', 'ACTIVA'),
(1282, '413526', 'SUBCUENTA', 'Venta de papel y cartón', 'ACTIVA'),
(1283, '413528', 'SUBCUENTA', 'Venta de libros  revistas  elementos de papelería  útiles y textos escolares', 'ACTIVA'),
(1284, '413530', 'SUBCUENTA', 'Venta de juegos  juguetes y artículos deportivos', 'ACTIVA'),
(1285, '413532', 'SUBCUENTA', 'Venta de instrumentos quirúrgicos y ortopédicos', 'ACTIVA'),
(1286, '413534', 'SUBCUENTA', 'Venta de artículos en relojerías y joyerías', 'ACTIVA'),
(1287, '413536', 'SUBCUENTA', 'Venta de electrodomésticos y muebles', 'ACTIVA'),
(1288, '413538', 'SUBCUENTA', 'Venta de productos de aseo  farmacéuticos  medicinales  y artículos de tocador', 'ACTIVA'),
(1289, '413540', 'SUBCUENTA', 'Venta de cubiertos  vajillas  cristalería  porcelanas  cerámicas y otros artículos de uso doméstico', 'ACTIVA'),
(1290, '413542', 'SUBCUENTA', 'Venta de materiales de construcción  fontanería y calefacción', 'ACTIVA'),
(1291, '413544', 'SUBCUENTA', 'Venta de pinturas y lacas', 'ACTIVA'),
(1292, '413546', 'SUBCUENTA', 'Venta de productos de vidrios y marquetería', 'ACTIVA'),
(1293, '413548', 'SUBCUENTA', 'Venta de herramientas y artículos de ferretería', 'ACTIVA'),
(1294, '413550', 'SUBCUENTA', 'Venta de químicos', 'ACTIVA'),
(1295, '413552', 'SUBCUENTA', 'Venta de productos intermedios  desperdicios y desechos', 'ACTIVA'),
(1296, '413554', 'SUBCUENTA', 'Venta de maquinaria  equipo de oficina y programas de computador', 'ACTIVA'),
(1297, '413556', 'SUBCUENTA', 'Venta de artículos en cacharrerías y misceláneas', 'ACTIVA'),
(1298, '413558', 'SUBCUENTA', 'Venta de instrumentos musicales', 'ACTIVA'),
(1299, '413560', 'SUBCUENTA', 'Venta de artículos en casas de empeño y prenderías', 'ACTIVA'),
(1300, '413562', 'SUBCUENTA', 'Venta de equipo fotográfico', 'ACTIVA'),
(1301, '413564', 'SUBCUENTA', 'Venta de equipo óptico y de precisión', 'ACTIVA'),
(1302, '413566', 'SUBCUENTA', 'Venta de empaques', 'ACTIVA'),
(1303, '413568', 'SUBCUENTA', 'Venta de equipo profesional y científico', 'ACTIVA'),
(1304, '413570', 'SUBCUENTA', 'Venta de loterías  rifas  chance  apuestas y similares', 'ACTIVA'),
(1305, '413572', 'SUBCUENTA', 'Reparación de efectos personales y electrodomésticos', 'ACTIVA'),
(1306, '413595', 'SUBCUENTA', 'Venta de otros productos', 'ACTIVA'),
(1307, '413599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1308, '4140', 'CUENTA', 'Hoteles y restaurantes', 'ACTIVA'),
(1309, '414005', 'SUBCUENTA', 'Hotelería', 'ACTIVA'),
(1310, '414010', 'SUBCUENTA', 'Campamento y otros tipos de hospedaje', 'ACTIVA'),
(1311, '414015', 'SUBCUENTA', 'Restaurantes', 'ACTIVA'),
(1312, '414020', 'SUBCUENTA', 'Bares y cantinas', 'ACTIVA'),
(1313, '414095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1314, '414099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1315, '4145', 'CUENTA', 'Transporte  almacenamiento y comunicaciones', 'ACTIVA'),
(1316, '414505', 'SUBCUENTA', 'Servicio de transporte por carretera', 'ACTIVA'),
(1317, '414510', 'SUBCUENTA', 'Servicio de transporte por vía férrea', 'ACTIVA'),
(1318, '414515', 'SUBCUENTA', 'Servicio de transporte por vía acuática', 'ACTIVA'),
(1319, '414520', 'SUBCUENTA', 'Servicio de transporte por vía aérea', 'ACTIVA'),
(1320, '414525', 'SUBCUENTA', 'Servicio de transporte por tuberías', 'ACTIVA'),
(1321, '414530', 'SUBCUENTA', 'Manipulación de carga', 'ACTIVA'),
(1322, '414535', 'SUBCUENTA', 'Almacenamiento y depósito', 'ACTIVA'),
(1323, '414540', 'SUBCUENTA', 'Servicios complementarios para el transporte', 'ACTIVA'),
(1324, '414545', 'SUBCUENTA', 'Agencias de viaje', 'ACTIVA'),
(1325, '414550', 'SUBCUENTA', 'Otras agencias de transporte', 'ACTIVA'),
(1326, '414555', 'SUBCUENTA', 'Servicio postal y de correo', 'ACTIVA'),
(1327, '414560', 'SUBCUENTA', 'Servicio telefónico', 'ACTIVA'),
(1328, '414565', 'SUBCUENTA', 'Servicio de telégrafo', 'ACTIVA'),
(1329, '414570', 'SUBCUENTA', 'Servicio de transmisión de datos', 'ACTIVA'),
(1330, '414575', 'SUBCUENTA', 'Servicio de radio y televisión por cable', 'ACTIVA'),
(1331, '414580', 'SUBCUENTA', 'Transmisión de sonido e imágenes por contrato', 'ACTIVA'),
(1332, '414595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1333, '414599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1334, '4150', 'CUENTA', 'Actividad financiera', 'ACTIVA'),
(1335, '415005', 'SUBCUENTA', 'Venta de inversiones', 'ACTIVA'),
(1336, '415010', 'SUBCUENTA', 'Dividendos de sociedades anónimas y/o asimiladas', 'ACTIVA'),
(1337, '415015', 'SUBCUENTA', 'Participaciones de sociedades limitadas y/o asimiladas', 'ACTIVA'),
(1338, '415020', 'SUBCUENTA', 'Intereses', 'ACTIVA'),
(1339, '415025', 'SUBCUENTA', 'Reajuste monetario-UPAC (hoy UVR)', 'ACTIVA'),
(1340, '415030', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(1341, '415035', 'SUBCUENTA', 'Operaciones de descuento', 'ACTIVA'),
(1342, '415040', 'SUBCUENTA', 'Cuotas de inscripción-consorcios', 'ACTIVA'),
(1343, '415045', 'SUBCUENTA', 'Cuotas de administración-consorcios', 'ACTIVA'),
(1344, '415050', 'SUBCUENTA', 'Reajuste del sistema-consorcios', 'ACTIVA'),
(1345, '415055', 'SUBCUENTA', 'Eliminación de suscriptores-consorcios', 'ACTIVA'),
(1346, '415060', 'SUBCUENTA', 'Cuotas de ingreso o retiro-sociedad administradora', 'ACTIVA'),
(1347, '415065', 'SUBCUENTA', 'Servicios a comisionistas', 'ACTIVA'),
(1348, '415070', 'SUBCUENTA', 'Inscripciones y cuotas', 'ACTIVA'),
(1349, '415075', 'SUBCUENTA', 'Recuperación de garantías', 'ACTIVA'),
(1350, '415080', 'SUBCUENTA', 'Ingresos método de participación', 'ACTIVA'),
(1351, '415095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1352, '415099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1353, '4155', 'CUENTA', 'Actividades inmobiliarias  empresariales y de alquiler', 'ACTIVA'),
(1354, '415505', 'SUBCUENTA', 'Arrendamientos de bienes inmuebles', 'ACTIVA'),
(1355, '415510', 'SUBCUENTA', 'Inmobiliarias por retribución o contrata', 'ACTIVA'),
(1356, '415515', 'SUBCUENTA', 'Alquiler equipo de transporte', 'ACTIVA'),
(1357, '415520', 'SUBCUENTA', 'Alquiler maquinaria y equipo', 'ACTIVA'),
(1358, '415525', 'SUBCUENTA', 'Alquiler de efectos personales y enseres domésticos', 'ACTIVA'),
(1359, '415530', 'SUBCUENTA', 'Consultoría en equipo y programas de informática', 'ACTIVA'),
(1360, '415535', 'SUBCUENTA', 'Procesamiento de datos', 'ACTIVA'),
(1361, '415540', 'SUBCUENTA', 'Mantenimiento y reparación de maquinaria de oficina', 'ACTIVA'),
(1362, '415545', 'SUBCUENTA', 'Investigaciones científicas y de desarrollo', 'ACTIVA'),
(1363, '415550', 'SUBCUENTA', 'Actividades empresariales de consultoría', 'ACTIVA'),
(1364, '415555', 'SUBCUENTA', 'Publicidad', 'ACTIVA'),
(1365, '415560', 'SUBCUENTA', 'Dotación de personal', 'ACTIVA'),
(1366, '415565', 'SUBCUENTA', 'Investigación y seguridad', 'ACTIVA'),
(1367, '415570', 'SUBCUENTA', 'Limpieza de inmuebles', 'ACTIVA'),
(1368, '415575', 'SUBCUENTA', 'Fotografía', 'ACTIVA'),
(1369, '415580', 'SUBCUENTA', 'Envase y empaque', 'ACTIVA'),
(1370, '415585', 'SUBCUENTA', 'Fotocopiado', 'ACTIVA'),
(1371, '415590', 'SUBCUENTA', 'Mantenimiento y reparación de maquinaria y equipo', 'ACTIVA'),
(1372, '415595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1373, '415599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1374, '4160', 'CUENTA', 'Enseñanza', 'ACTIVA'),
(1375, '416005', 'SUBCUENTA', 'Actividades relacionadas con la educación', 'ACTIVA'),
(1376, '416095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1377, '416099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1378, '4165', 'CUENTA', 'Servicios sociales y de salud', 'ACTIVA'),
(1379, '416505', 'SUBCUENTA', 'Servicio hospitalario', 'ACTIVA'),
(1380, '416510', 'SUBCUENTA', 'Servicio médico', 'ACTIVA'),
(1381, '416515', 'SUBCUENTA', 'Servicio odontológico', 'ACTIVA'),
(1382, '416520', 'SUBCUENTA', 'Servicio de laboratorio', 'ACTIVA'),
(1383, '416525', 'SUBCUENTA', 'Actividades veterinarias', 'ACTIVA'),
(1384, '416530', 'SUBCUENTA', 'Actividades de servicios sociales', 'ACTIVA'),
(1385, '416595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1386, '416599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1387, '4170', 'CUENTA', 'Otras actividades de servicios comunitarios  sociales y personales', 'ACTIVA'),
(1388, '417005', 'SUBCUENTA', 'Eliminación de desperdicios y aguas residuales', 'ACTIVA'),
(1389, '417010', 'SUBCUENTA', 'Actividades de asociación', 'ACTIVA'),
(1390, '417015', 'SUBCUENTA', 'Producción y distribución de filmes y videocintas', 'ACTIVA'),
(1391, '417020', 'SUBCUENTA', 'Exhibición de filmes y videocintas', 'ACTIVA'),
(1392, '417025', 'SUBCUENTA', 'Actividad de radio y televisión', 'ACTIVA'),
(1393, '417030', 'SUBCUENTA', 'Actividad teatral  musical y artística', 'ACTIVA'),
(1394, '417035', 'SUBCUENTA', 'Grabación y producción de discos', 'ACTIVA'),
(1395, '417040', 'SUBCUENTA', 'Entretenimiento y esparcimiento', 'ACTIVA'),
(1396, '417045', 'SUBCUENTA', 'Agencias de noticias', 'ACTIVA'),
(1397, '417050', 'SUBCUENTA', 'Lavanderías y similares', 'ACTIVA'),
(1398, '417055', 'SUBCUENTA', 'Peluquerías y similares', 'ACTIVA'),
(1399, '417060', 'SUBCUENTA', 'Servicios funerarios', 'ACTIVA'),
(1400, '417065', 'SUBCUENTA', 'Zonas francas', 'ACTIVA'),
(1401, '417095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(1402, '417099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1403, '4175', 'CUENTA', 'Devoluciones en ventas (DB)', 'ACTIVA'),
(1404, '417599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1405, '42', 'GRUPO', 'No operacionales', 'ACTIVA'),
(1406, '4205', 'CUENTA', 'Otras ventas', 'ACTIVA'),
(1407, '420505', 'SUBCUENTA', 'Materia prima', 'ACTIVA'),
(1408, '420510', 'SUBCUENTA', 'Material de desecho', 'ACTIVA'),
(1409, '420515', 'SUBCUENTA', 'Materiales varios', 'ACTIVA'),
(1410, '420520', 'SUBCUENTA', 'Productos de diversificación', 'ACTIVA'),
(1411, '420525', 'SUBCUENTA', 'Excedentes de exportación', 'ACTIVA'),
(1412, '420530', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(1413, '420535', 'SUBCUENTA', 'Productos agrícolas', 'ACTIVA'),
(1414, '420540', 'SUBCUENTA', 'De propaganda', 'ACTIVA'),
(1415, '420545', 'SUBCUENTA', 'Productos en remate', 'ACTIVA'),
(1416, '420550', 'SUBCUENTA', 'Combustibles y lubricantes', 'ACTIVA'),
(1417, '420599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1418, '4210', 'CUENTA', 'Financieros', 'ACTIVA'),
(1419, '421005', 'SUBCUENTA', 'Intereses', 'ACTIVA'),
(1420, '421010', 'SUBCUENTA', 'Reajuste monetario-UPAC (hoy UVR)', 'ACTIVA'),
(1421, '421015', 'SUBCUENTA', 'Descuentos amortizados', 'ACTIVA'),
(1422, '421020', 'SUBCUENTA', 'Diferencia en cambio', 'ACTIVA'),
(1423, '421025', 'SUBCUENTA', 'Financiación vehículos', 'ACTIVA'),
(1424, '421030', 'SUBCUENTA', 'Financiación sistemas de viajes', 'ACTIVA'),
(1425, '421035', 'SUBCUENTA', 'Aceptaciones bancarias', 'ACTIVA'),
(1426, '421040', 'SUBCUENTA', 'Descuentos comerciales condicionados', 'ACTIVA'),
(1427, '421045', 'SUBCUENTA', 'Descuentos bancarios', 'ACTIVA'),
(1428, '421050', 'SUBCUENTA', 'Comisiones cheques de otras plazas', 'ACTIVA'),
(1429, '421055', 'SUBCUENTA', 'Multas y recargos', 'ACTIVA'),
(1430, '421060', 'SUBCUENTA', 'Sanciones cheques devueltos', 'ACTIVA'),
(1431, '421095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1432, '421099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1433, '4215', 'CUENTA', 'Dividendos y participaciones', 'ACTIVA'),
(1434, '421505', 'SUBCUENTA', 'De sociedades anónimas y/o asimiladas', 'ACTIVA'),
(1435, '421510', 'SUBCUENTA', 'De sociedades limitadas y/o asimiladas', 'ACTIVA'),
(1436, '421599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1437, '4218', 'CUENTA', 'Ingresos método de participación', 'ACTIVA'),
(1438, '421805', 'SUBCUENTA', 'De sociedades anónimas y/o asimiladas', 'ACTIVA'),
(1439, '421810', 'SUBCUENTA', 'De sociedades limitadas y/o asimiladas', 'ACTIVA'),
(1440, '4220', 'CUENTA', 'Arrendamientos', 'ACTIVA'),
(1441, '422005', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(1442, '422010', 'SUBCUENTA', 'Construcciones y edificios', 'ACTIVA'),
(1443, '422015', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(1444, '422020', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(1445, '422025', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(1446, '422030', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(1447, '422035', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(1448, '422040', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1449, '422045', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1450, '422050', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1451, '422055', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1452, '422060', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(1453, '422062', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(1454, '422065', 'SUBCUENTA', 'Plantaciones agrícolas y forestales', 'ACTIVA'),
(1455, '422070', 'SUBCUENTA', 'Aeródromos', 'ACTIVA'),
(1456, '422075', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(1457, '422099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1458, '4225', 'CUENTA', 'Comisiones', 'ACTIVA'),
(1459, '422505', 'SUBCUENTA', 'Sobre inversiones', 'ACTIVA'),
(1460, '422510', 'SUBCUENTA', 'De concesionarios', 'ACTIVA'),
(1461, '422515', 'SUBCUENTA', 'De actividades financieras', 'ACTIVA'),
(1462, '422520', 'SUBCUENTA', 'Por venta de servicios de taller', 'ACTIVA'),
(1463, '422525', 'SUBCUENTA', 'Por venta de seguros', 'ACTIVA'),
(1464, '422530', 'SUBCUENTA', 'Por ingresos para terceros', 'ACTIVA'),
(1465, '422535', 'SUBCUENTA', 'Por distribución de películas', 'ACTIVA'),
(1466, '422540', 'SUBCUENTA', 'Derechos de autor', 'ACTIVA'),
(1467, '422545', 'SUBCUENTA', 'Derechos de programación', 'ACTIVA'),
(1468, '422599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1469, '4230', 'CUENTA', 'Honorarios', 'ACTIVA'),
(1470, '423005', 'SUBCUENTA', 'Asesorías', 'ACTIVA'),
(1471, '423010', 'SUBCUENTA', 'Asistencia técnica', 'ACTIVA'),
(1472, '423015', 'SUBCUENTA', 'Administración de vinculadas', 'ACTIVA'),
(1473, '423099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1474, '4235', 'CUENTA', 'Servicios', 'ACTIVA'),
(1475, '423505', 'SUBCUENTA', 'De báscula', 'ACTIVA'),
(1476, '423510', 'SUBCUENTA', 'De transporte', 'ACTIVA'),
(1477, '423515', 'SUBCUENTA', 'De prensa', 'ACTIVA'),
(1478, '423520', 'SUBCUENTA', 'Administrativos', 'ACTIVA'),
(1479, '423525', 'SUBCUENTA', 'Técnicos', 'ACTIVA'),
(1480, '423530', 'SUBCUENTA', 'De computación', 'ACTIVA'),
(1481, '423535', 'SUBCUENTA', 'De telefax', 'ACTIVA'),
(1482, '423540', 'SUBCUENTA', 'Taller de vehículos', 'ACTIVA'),
(1483, '423545', 'SUBCUENTA', 'De recepción de aeronaves', 'ACTIVA'),
(1484, '423550', 'SUBCUENTA', 'De transporte programa gas natural', 'ACTIVA'),
(1485, '423555', 'SUBCUENTA', 'Por contratos', 'ACTIVA'),
(1486, '423560', 'SUBCUENTA', 'De trilla', 'ACTIVA'),
(1487, '423565', 'SUBCUENTA', 'De mantenimiento', 'ACTIVA'),
(1488, '423570', 'SUBCUENTA', 'Al personal', 'ACTIVA'),
(1489, '423575', 'SUBCUENTA', 'De casino', 'ACTIVA'),
(1490, '423580', 'SUBCUENTA', 'Fletes', 'ACTIVA'),
(1491, '423585', 'SUBCUENTA', 'Entre compañías', 'ACTIVA'),
(1492, '423595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1493, '423599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1494, '4240', 'CUENTA', 'Utilidad en venta de inversiones', 'ACTIVA'),
(1495, '424005', 'SUBCUENTA', 'Acciones', 'ACTIVA'),
(1496, '424010', 'SUBCUENTA', 'Cuotas o partes de interés social', 'ACTIVA'),
(1497, '424015', 'SUBCUENTA', 'Bonos', 'ACTIVA'),
(1498, '424020', 'SUBCUENTA', 'Cédulas', 'ACTIVA'),
(1499, '424025', 'SUBCUENTA', 'Certificados', 'ACTIVA'),
(1500, '424030', 'SUBCUENTA', 'Papeles comerciales', 'ACTIVA'),
(1501, '424035', 'SUBCUENTA', 'Títulos', 'ACTIVA'),
(1502, '424045', 'SUBCUENTA', 'Derechos fiduciarios', 'ACTIVA'),
(1503, '424050', 'SUBCUENTA', 'Obligatorias', 'ACTIVA'),
(1504, '424095', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(1505, '424099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1506, '4245', 'CUENTA', 'Utilidad en venta de propiedades  planta y equipo', 'ACTIVA'),
(1507, '424504', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(1508, '424506', 'SUBCUENTA', 'Materiales industria petrolera', 'ACTIVA'),
(1509, '424508', 'SUBCUENTA', 'Construcciones en curso', 'ACTIVA'),
(1510, '424512', 'SUBCUENTA', 'Maquinaria en montaje', 'ACTIVA'),
(1511, '424516', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(1512, '424520', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(1513, '424524', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(1514, '424528', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(1515, '424532', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(1516, '424536', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(1517, '424540', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1518, '424544', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1519, '424548', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1520, '424552', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1521, '424556', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(1522, '424560', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(1523, '424562', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(1524, '424564', 'SUBCUENTA', 'Plantaciones agrícolas y forestales', 'ACTIVA'),
(1525, '424568', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(1526, '424572', 'SUBCUENTA', 'Minas y Canteras', 'ACTIVA'),
(1527, '424580', 'SUBCUENTA', 'Pozos artesianos', 'ACTIVA'),
(1528, '424584', 'SUBCUENTA', 'Yacimientos', 'ACTIVA'),
(1529, '424588', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(1530, '424599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1531, '4248', 'CUENTA', 'Utilidad en venta de otros bienes', 'ACTIVA'),
(1532, '424805', 'SUBCUENTA', 'Intangibles', 'ACTIVA'),
(1533, '424810', 'SUBCUENTA', 'Otros activos', 'ACTIVA');
INSERT INTO `puc` (`id`, `cuenta`, `tipo`, `descripcion`, `estado`) VALUES
(1534, '424899', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1535, '4250', 'CUENTA', 'Recuperaciones', 'ACTIVA'),
(1536, '425005', 'SUBCUENTA', 'Deudas malas', 'ACTIVA'),
(1537, '425010', 'SUBCUENTA', 'Seguros', 'ACTIVA'),
(1538, '425015', 'SUBCUENTA', 'Reclamos', 'ACTIVA'),
(1539, '425020', 'SUBCUENTA', 'Reintegro por personal en comisión', 'ACTIVA'),
(1540, '425025', 'SUBCUENTA', 'Reintegro garantías', 'ACTIVA'),
(1541, '425030', 'SUBCUENTA', 'Descuentos concedidos', 'ACTIVA'),
(1542, '425035', 'SUBCUENTA', 'De provisiones', 'ACTIVA'),
(1543, '425040', 'SUBCUENTA', 'Gastos bancarios', 'ACTIVA'),
(1544, '425045', 'SUBCUENTA', 'De depreciación', 'ACTIVA'),
(1545, '425050', 'SUBCUENTA', 'Reintegro de otros costos y gastos', 'ACTIVA'),
(1546, '425099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1547, '4255', 'CUENTA', 'Indemnizaciones', 'ACTIVA'),
(1548, '425505', 'SUBCUENTA', 'Por siniestro', 'ACTIVA'),
(1549, '425510', 'SUBCUENTA', 'Por suministros', 'ACTIVA'),
(1550, '425515', 'SUBCUENTA', 'Lucro cesante compañías de seguros', 'ACTIVA'),
(1551, '425520', 'SUBCUENTA', 'Daño emergente compañías de seguros', 'ACTIVA'),
(1552, '425525', 'SUBCUENTA', 'Por pérdida de mercancía', 'ACTIVA'),
(1553, '425530', 'SUBCUENTA', 'Por incumplimiento de contratos', 'ACTIVA'),
(1554, '425535', 'SUBCUENTA', 'De terceros', 'ACTIVA'),
(1555, '425540', 'SUBCUENTA', 'Por incapacidades ISS', 'ACTIVA'),
(1556, '425595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(1557, '425599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1558, '4260', 'CUENTA', 'Participaciones en concesiones', 'ACTIVA'),
(1559, '426099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1560, '4265', 'CUENTA', 'Ingresos de ejercicios anteriores', 'ACTIVA'),
(1561, '426599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1562, '4275', 'CUENTA', 'Devoluciones en otras ventas (DB)', 'ACTIVA'),
(1563, '427599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1564, '4295', 'CUENTA', 'Diversos', 'ACTIVA'),
(1565, '429503', 'SUBCUENTA', 'CERT', 'ACTIVA'),
(1566, '429505', 'SUBCUENTA', 'Aprovechamientos', 'ACTIVA'),
(1567, '429507', 'SUBCUENTA', 'Auxilios', 'ACTIVA'),
(1568, '429509', 'SUBCUENTA', 'Subvenciones', 'ACTIVA'),
(1569, '429511', 'SUBCUENTA', 'Ingresos por investigación y desarrollo', 'ACTIVA'),
(1570, '429513', 'SUBCUENTA', 'Por trabajos ejecutados', 'ACTIVA'),
(1571, '429515', 'SUBCUENTA', 'Regalías', 'ACTIVA'),
(1572, '429517', 'SUBCUENTA', 'Derivados de las exportaciones', 'ACTIVA'),
(1573, '429519', 'SUBCUENTA', 'Otros ingresos de explotación', 'ACTIVA'),
(1574, '429521', 'SUBCUENTA', 'De la actividad ganadera', 'ACTIVA'),
(1575, '429525', 'SUBCUENTA', 'Derechos y licitaciones', 'ACTIVA'),
(1576, '429530', 'SUBCUENTA', 'Ingresos por elementos perdidos', 'ACTIVA'),
(1577, '429533', 'SUBCUENTA', 'Multas y recargos', 'ACTIVA'),
(1578, '429535', 'SUBCUENTA', 'Preavisos descontados', 'ACTIVA'),
(1579, '429537', 'SUBCUENTA', 'Reclamos', 'ACTIVA'),
(1580, '429540', 'SUBCUENTA', 'Recobro de daños', 'ACTIVA'),
(1581, '429543', 'SUBCUENTA', 'Premios', 'ACTIVA'),
(1582, '429545', 'SUBCUENTA', 'Bonificaciones', 'ACTIVA'),
(1583, '429547', 'SUBCUENTA', 'Productos descontados', 'ACTIVA'),
(1584, '429549', 'SUBCUENTA', 'Reconocimientos ISS', 'ACTIVA'),
(1585, '429551', 'SUBCUENTA', 'Excedentes', 'ACTIVA'),
(1586, '429553', 'SUBCUENTA', 'Sobrantes de caja', 'ACTIVA'),
(1587, '429555', 'SUBCUENTA', 'Sobrantes en liquidación fletes', 'ACTIVA'),
(1588, '429557', 'SUBCUENTA', 'Subsidios estatales', 'ACTIVA'),
(1589, '429559', 'SUBCUENTA', 'Capacitación distribuidores', 'ACTIVA'),
(1590, '429561', 'SUBCUENTA', 'De escrituración', 'ACTIVA'),
(1591, '429563', 'SUBCUENTA', 'Registro promesas de venta', 'ACTIVA'),
(1592, '429567', 'SUBCUENTA', 'Útiles  papelería y fotocopias', 'ACTIVA'),
(1593, '429571', 'SUBCUENTA', 'Resultados  matrículas y traspasos', 'ACTIVA'),
(1594, '429573', 'SUBCUENTA', 'Decoraciones', 'ACTIVA'),
(1595, '429575', 'SUBCUENTA', 'Manejo de carga', 'ACTIVA'),
(1596, '429579', 'SUBCUENTA', 'Historia clínica', 'ACTIVA'),
(1597, '429581', 'SUBCUENTA', 'Ajuste al peso', 'ACTIVA'),
(1598, '429583', 'SUBCUENTA', 'Llamadas telefónicas', 'ACTIVA'),
(1599, '429595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1600, '429599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1601, '47', 'GRUPO', 'Ajustes por inflación', 'ACTIVA'),
(1602, '4705', 'CUENTA', 'Corrección monetaria', 'ACTIVA'),
(1603, '470505', 'SUBCUENTA', 'Inversiones (CR)', 'ACTIVA'),
(1604, '470510', 'SUBCUENTA', 'Inventarios (CR)', 'ACTIVA'),
(1605, '470515', 'SUBCUENTA', 'Propiedades  planta y equipo (CR)', 'ACTIVA'),
(1606, '470520', 'SUBCUENTA', 'Intangibles (CR)', 'ACTIVA'),
(1607, '470525', 'SUBCUENTA', 'Activos diferidos', 'ACTIVA'),
(1608, '470530', 'SUBCUENTA', 'Otros activos (CR)', 'ACTIVA'),
(1609, '470535', 'SUBCUENTA', 'Pasivos sujetos de ajuste', 'ACTIVA'),
(1610, '470540', 'SUBCUENTA', 'Patrimonio', 'ACTIVA'),
(1611, '470545', 'SUBCUENTA', 'Depreciación acumulada (DB)', 'ACTIVA'),
(1612, '470550', 'SUBCUENTA', 'Depreciación diferida (CR)', 'ACTIVA'),
(1613, '470555', 'SUBCUENTA', 'Agotamiento acumulado (DB)', 'ACTIVA'),
(1614, '470560', 'SUBCUENTA', 'Amortización acumulada (DB)', 'ACTIVA'),
(1615, '470565', 'SUBCUENTA', 'Ingresos operacionales (DB)', 'ACTIVA'),
(1616, '470568', 'SUBCUENTA', 'Devoluciones en ventas (CR)', 'ACTIVA'),
(1617, '470570', 'SUBCUENTA', 'Ingresos no operacionales (DB)', 'ACTIVA'),
(1618, '470575', 'SUBCUENTA', 'Gastos operacionales de administración (CR)', 'ACTIVA'),
(1619, '470580', 'SUBCUENTA', 'Gastos operacionales de ventas (CR)', 'ACTIVA'),
(1620, '470585', 'SUBCUENTA', 'Gastos no operacionales (CR)', 'ACTIVA'),
(1621, '470590', 'SUBCUENTA', 'Compras (CR)', 'ACTIVA'),
(1622, '470591', 'SUBCUENTA', 'Devoluciones en compras (DB)', 'ACTIVA'),
(1623, '470592', 'SUBCUENTA', 'Costo de ventas (CR)', 'ACTIVA'),
(1624, '470594', 'SUBCUENTA', 'Costos de producción o de operación (CR)', 'ACTIVA'),
(1625, '5', 'CLASE', 'Gastos', 'ACTIVA'),
(1626, '51', 'GRUPO', 'Operacionales de administración', 'ACTIVA'),
(1627, '5105', 'CUENTA', 'Gastos de personal', 'ACTIVA'),
(1628, '510503', 'SUBCUENTA', 'Salario integral', 'ACTIVA'),
(1629, '510506', 'SUBCUENTA', 'Sueldos', 'ACTIVA'),
(1630, '510512', 'SUBCUENTA', 'Jornales', 'ACTIVA'),
(1631, '510515', 'SUBCUENTA', 'Horas extras y recargos', 'ACTIVA'),
(1632, '510518', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(1633, '510521', 'SUBCUENTA', 'Viáticos', 'ACTIVA'),
(1634, '510524', 'SUBCUENTA', 'Incapacidades', 'ACTIVA'),
(1635, '510527', 'SUBCUENTA', 'Auxilio de transporte', 'ACTIVA'),
(1636, '510530', 'SUBCUENTA', 'Cesantías', 'ACTIVA'),
(1637, '510533', 'SUBCUENTA', 'Intereses sobre cesantías', 'ACTIVA'),
(1638, '510536', 'SUBCUENTA', 'Prima de servicios', 'ACTIVA'),
(1639, '510539', 'SUBCUENTA', 'Vacaciones', 'ACTIVA'),
(1640, '510542', 'SUBCUENTA', 'Primas extralegales', 'ACTIVA'),
(1641, '510545', 'SUBCUENTA', 'Auxilios', 'ACTIVA'),
(1642, '510548', 'SUBCUENTA', 'Bonificaciones', 'ACTIVA'),
(1643, '510551', 'SUBCUENTA', 'Dotación y suministro a trabajadores', 'ACTIVA'),
(1644, '510554', 'SUBCUENTA', 'Seguros', 'ACTIVA'),
(1645, '510557', 'SUBCUENTA', 'Cuotas partes pensiones de jubilación', 'ACTIVA'),
(1646, '510558', 'SUBCUENTA', 'Amortización cálculo actuarial pensiones de jubilación', 'ACTIVA'),
(1647, '510559', 'SUBCUENTA', 'Pensiones de jubilación', 'ACTIVA'),
(1648, '510560', 'SUBCUENTA', 'Indemnizaciones laborales', 'ACTIVA'),
(1649, '510561', 'SUBCUENTA', 'Amortización bonos pensionales', 'ACTIVA'),
(1650, '510562', 'SUBCUENTA', 'Amortización títulos pensionales', 'ACTIVA'),
(1651, '510563', 'SUBCUENTA', 'Capacitación al personal', 'ACTIVA'),
(1652, '510566', 'SUBCUENTA', 'Gastos deportivos y de recreación', 'ACTIVA'),
(1653, '510568', 'SUBCUENTA', 'Aportes a administradoras de riesgos profesionales  ARP', 'ACTIVA'),
(1654, '510569', 'SUBCUENTA', 'Aportes a entidades promotoras de salud  EPS', 'ACTIVA'),
(1655, '510570', 'SUBCUENTA', 'Aportes a fondos de pensiones y/o cesantías', 'ACTIVA'),
(1656, '510572', 'SUBCUENTA', 'Aportes cajas de compensación familiar', 'ACTIVA'),
(1657, '510575', 'SUBCUENTA', 'Aportes ICBF', 'ACTIVA'),
(1658, '510578', 'SUBCUENTA', 'SENA', 'ACTIVA'),
(1659, '510581', 'SUBCUENTA', 'Aportes sindicales', 'ACTIVA'),
(1660, '510584', 'SUBCUENTA', 'Gastos médicos y drogas', 'ACTIVA'),
(1661, '510595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1662, '510599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1663, '5110', 'CUENTA', 'Honorarios', 'ACTIVA'),
(1664, '511005', 'SUBCUENTA', 'Junta directiva', 'ACTIVA'),
(1665, '511010', 'SUBCUENTA', 'Revisoría fiscal', 'ACTIVA'),
(1666, '511015', 'SUBCUENTA', 'Auditoría externa', 'ACTIVA'),
(1667, '511020', 'SUBCUENTA', 'Avalúos', 'ACTIVA'),
(1668, '511025', 'SUBCUENTA', 'Asesoría jurídica', 'ACTIVA'),
(1669, '511030', 'SUBCUENTA', 'Asesoría financiera', 'ACTIVA'),
(1670, '511035', 'SUBCUENTA', 'Asesoría técnica', 'ACTIVA'),
(1671, '511095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1672, '511099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1673, '5115', 'CUENTA', 'Impuestos', 'ACTIVA'),
(1674, '511505', 'SUBCUENTA', 'Industria y comercio', 'ACTIVA'),
(1675, '511510', 'SUBCUENTA', 'De timbres', 'ACTIVA'),
(1676, '511515', 'SUBCUENTA', 'A la propiedad raíz', 'ACTIVA'),
(1677, '511520', 'SUBCUENTA', 'Derechos sobre instrumentos públicos', 'ACTIVA'),
(1678, '511525', 'SUBCUENTA', 'De valorización', 'ACTIVA'),
(1679, '511530', 'SUBCUENTA', 'De turismo', 'ACTIVA'),
(1680, '511535', 'SUBCUENTA', 'Tasa por utilización de puertos', 'ACTIVA'),
(1681, '511540', 'SUBCUENTA', 'De vehículos', 'ACTIVA'),
(1682, '511545', 'SUBCUENTA', 'De espectáculos públicos', 'ACTIVA'),
(1683, '511550', 'SUBCUENTA', 'Cuotas de fomento', 'ACTIVA'),
(1684, '511570', 'SUBCUENTA', 'IVA descontable', 'ACTIVA'),
(1685, '511595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1686, '511599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1687, '5120', 'CUENTA', 'Arrendamientos', 'ACTIVA'),
(1688, '512005', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(1689, '512010', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(1690, '512015', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(1691, '512020', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(1692, '512025', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(1693, '512030', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(1694, '512035', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(1695, '512040', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1696, '512045', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1697, '512050', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1698, '512055', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1699, '512060', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(1700, '512065', 'SUBCUENTA', 'Aeródromos', 'ACTIVA'),
(1701, '512070', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(1702, '512095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1703, '512099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1704, '5125', 'CUENTA', 'Contribuciones y afiliaciones', 'ACTIVA'),
(1705, '512505', 'SUBCUENTA', 'Contribuciones', 'ACTIVA'),
(1706, '512510', 'SUBCUENTA', 'Afiliaciones y sostenimiento', 'ACTIVA'),
(1707, '512599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1708, '5130', 'CUENTA', 'Seguros', 'ACTIVA'),
(1709, '513005', 'SUBCUENTA', 'Manejo', 'ACTIVA'),
(1710, '513010', 'SUBCUENTA', 'Cumplimiento', 'ACTIVA'),
(1711, '513015', 'SUBCUENTA', 'Corriente débil', 'ACTIVA'),
(1712, '513020', 'SUBCUENTA', 'Vida colectiva', 'ACTIVA'),
(1713, '513025', 'SUBCUENTA', 'Incendio', 'ACTIVA'),
(1714, '513030', 'SUBCUENTA', 'Terremoto', 'ACTIVA'),
(1715, '513035', 'SUBCUENTA', 'Sustracción y hurto', 'ACTIVA'),
(1716, '513040', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1717, '513045', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1718, '513050', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1719, '513055', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1720, '513060', 'SUBCUENTA', 'Responsabilidad civil y extracontractual', 'ACTIVA'),
(1721, '513065', 'SUBCUENTA', 'Vuelo', 'ACTIVA'),
(1722, '513070', 'SUBCUENTA', 'Rotura de maquinaria', 'ACTIVA'),
(1723, '513075', 'SUBCUENTA', 'Obligatorio accidente de tránsito', 'ACTIVA'),
(1724, '513080', 'SUBCUENTA', 'Lucro cesante', 'ACTIVA'),
(1725, '513085', 'SUBCUENTA', 'Transporte de mercancía', 'ACTIVA'),
(1726, '513095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1727, '513099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1728, '5135', 'CUENTA', 'Servicios', 'ACTIVA'),
(1729, '513505', 'SUBCUENTA', 'Aseo y vigilancia', 'ACTIVA'),
(1730, '513510', 'SUBCUENTA', 'Temporales', 'ACTIVA'),
(1731, '513515', 'SUBCUENTA', 'Asistencia técnica', 'ACTIVA'),
(1732, '513520', 'SUBCUENTA', 'Procesamiento electrónico de datos', 'ACTIVA'),
(1733, '513525', 'SUBCUENTA', 'Acueducto y alcantarillado', 'ACTIVA'),
(1734, '513530', 'SUBCUENTA', 'Energía eléctrica', 'ACTIVA'),
(1735, '513535', 'SUBCUENTA', 'Teléfono', 'ACTIVA'),
(1736, '513540', 'SUBCUENTA', 'Correo  portes y telegramas', 'ACTIVA'),
(1737, '513545', 'SUBCUENTA', 'Fax y télex', 'ACTIVA'),
(1738, '513550', 'SUBCUENTA', 'Transporte  fletes y acarreos', 'ACTIVA'),
(1739, '513555', 'SUBCUENTA', 'Gas', 'ACTIVA'),
(1740, '513595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1741, '513599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1742, '5140', 'CUENTA', 'Gastos legales', 'ACTIVA'),
(1743, '514005', 'SUBCUENTA', 'Notariales', 'ACTIVA'),
(1744, '514010', 'SUBCUENTA', 'Registro mercantil', 'ACTIVA'),
(1745, '514015', 'SUBCUENTA', 'Trámites y licencias', 'ACTIVA'),
(1746, '514020', 'SUBCUENTA', 'Aduaneros', 'ACTIVA'),
(1747, '514025', 'SUBCUENTA', 'Consulares', 'ACTIVA'),
(1748, '514095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1749, '514099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1750, '5145', 'CUENTA', 'Mantenimiento y reparaciones', 'ACTIVA'),
(1751, '514505', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(1752, '514510', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(1753, '514515', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(1754, '514520', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(1755, '514525', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(1756, '514530', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(1757, '514535', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(1758, '514540', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1759, '514545', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1760, '514550', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1761, '514555', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1762, '514560', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(1763, '514565', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(1764, '514570', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(1765, '514599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1766, '5150', 'CUENTA', 'Adecuación e instalación', 'ACTIVA'),
(1767, '515005', 'SUBCUENTA', 'Instalaciones eléctricas', 'ACTIVA'),
(1768, '515010', 'SUBCUENTA', 'Arreglos ornamentales', 'ACTIVA'),
(1769, '515015', 'SUBCUENTA', 'Reparaciones locativas', 'ACTIVA'),
(1770, '515095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1771, '515099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1772, '5155', 'CUENTA', 'Gastos de viaje', 'ACTIVA'),
(1773, '515505', 'SUBCUENTA', 'Alojamiento y manutención', 'ACTIVA'),
(1774, '515510', 'SUBCUENTA', 'Pasajes fluviales y/o marítimos', 'ACTIVA'),
(1775, '515515', 'SUBCUENTA', 'Pasajes aéreos', 'ACTIVA'),
(1776, '515520', 'SUBCUENTA', 'Pasajes terrestres', 'ACTIVA'),
(1777, '515525', 'SUBCUENTA', 'Pasajes férreos', 'ACTIVA'),
(1778, '515595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1779, '515599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1780, '5160', 'CUENTA', 'Depreciaciones', 'ACTIVA'),
(1781, '516005', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(1782, '516010', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(1783, '516015', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(1784, '516020', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(1785, '516025', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(1786, '516030', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(1787, '516035', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1788, '516040', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1789, '516045', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1790, '516050', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1791, '516055', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(1792, '516060', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(1793, '516099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1794, '5165', 'CUENTA', 'Amortizaciones', 'ACTIVA'),
(1795, '516505', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(1796, '516510', 'SUBCUENTA', 'Intangibles', 'ACTIVA'),
(1797, '516515', 'SUBCUENTA', 'Cargos diferidos', 'ACTIVA'),
(1798, '516595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(1799, '516599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1800, '5195', 'CUENTA', 'Diversos', 'ACTIVA'),
(1801, '519505', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(1802, '519510', 'SUBCUENTA', 'Libros  suscripciones  periódicos y revistas', 'ACTIVA'),
(1803, '519515', 'SUBCUENTA', 'Música ambiental', 'ACTIVA'),
(1804, '519520', 'SUBCUENTA', 'Gastos de representación y relaciones públicas', 'ACTIVA'),
(1805, '519525', 'SUBCUENTA', 'Elementos de aseo y cafetería', 'ACTIVA'),
(1806, '519530', 'SUBCUENTA', 'Útiles  papelería y fotocopias', 'ACTIVA'),
(1807, '519535', 'SUBCUENTA', 'Combustibles y lubricantes', 'ACTIVA'),
(1808, '519540', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(1809, '519545', 'SUBCUENTA', 'Taxis y buses', 'ACTIVA'),
(1810, '519550', 'SUBCUENTA', 'Estampillas', 'ACTIVA'),
(1811, '519555', 'SUBCUENTA', 'Microfilmación', 'ACTIVA'),
(1812, '519560', 'SUBCUENTA', 'Casino y restaurante', 'ACTIVA'),
(1813, '519565', 'SUBCUENTA', 'Parqueaderos', 'ACTIVA'),
(1814, '519570', 'SUBCUENTA', 'Indemnización por daños a terceros', 'ACTIVA'),
(1815, '519575', 'SUBCUENTA', 'Pólvora y similares', 'ACTIVA'),
(1816, '519595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1817, '519599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1818, '5199', 'CUENTA', 'Provisiones', 'ACTIVA'),
(1819, '519905', 'SUBCUENTA', 'Inversiones', 'ACTIVA'),
(1820, '519910', 'SUBCUENTA', 'Deudores', 'ACTIVA'),
(1821, '519915', 'SUBCUENTA', 'Propiedades  planta y equipo', 'ACTIVA'),
(1822, '519995', 'SUBCUENTA', 'Otros activos', 'ACTIVA'),
(1823, '519999', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1824, '52', 'GRUPO', 'Operacionales de ventas', 'ACTIVA'),
(1825, '5205', 'CUENTA', 'Gastos de personal', 'ACTIVA'),
(1826, '520503', 'SUBCUENTA', 'Salario integral', 'ACTIVA'),
(1827, '520506', 'SUBCUENTA', 'Sueldos', 'ACTIVA'),
(1828, '520512', 'SUBCUENTA', 'Jornales', 'ACTIVA'),
(1829, '520515', 'SUBCUENTA', 'Horas extras y recargos', 'ACTIVA'),
(1830, '520518', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(1831, '520521', 'SUBCUENTA', 'Viáticos', 'ACTIVA'),
(1832, '520524', 'SUBCUENTA', 'Incapacidades', 'ACTIVA'),
(1833, '520527', 'SUBCUENTA', 'Auxilio de transporte', 'ACTIVA'),
(1834, '520530', 'SUBCUENTA', 'Cesantías', 'ACTIVA'),
(1835, '520533', 'SUBCUENTA', 'Intereses sobre cesantías', 'ACTIVA'),
(1836, '520536', 'SUBCUENTA', 'Prima de servicios', 'ACTIVA'),
(1837, '520539', 'SUBCUENTA', 'Vacaciones', 'ACTIVA'),
(1838, '520542', 'SUBCUENTA', 'Primas extralegales', 'ACTIVA'),
(1839, '520545', 'SUBCUENTA', 'Auxilios', 'ACTIVA'),
(1840, '520548', 'SUBCUENTA', 'Bonificaciones', 'ACTIVA'),
(1841, '520551', 'SUBCUENTA', 'Dotación y suministro a trabajadores', 'ACTIVA'),
(1842, '520554', 'SUBCUENTA', 'Seguros', 'ACTIVA'),
(1843, '520557', 'SUBCUENTA', 'Cuotas partes pensiones de jubilación', 'ACTIVA'),
(1844, '520558', 'SUBCUENTA', 'Amortización cálculo actuarial pensiones de jubilación', 'ACTIVA'),
(1845, '520559', 'SUBCUENTA', 'Pensiones de jubilación', 'ACTIVA'),
(1846, '520560', 'SUBCUENTA', 'Indemnizaciones laborales', 'ACTIVA'),
(1847, '520561', 'SUBCUENTA', 'Amortización bonos pensionales', 'ACTIVA'),
(1848, '520562', 'SUBCUENTA', 'Amortización títulos pensionales', 'ACTIVA'),
(1849, '520563', 'SUBCUENTA', 'Capacitación al personal', 'ACTIVA'),
(1850, '520566', 'SUBCUENTA', 'Gastos deportivos y de recreación', 'ACTIVA'),
(1851, '520568', 'SUBCUENTA', 'Aportes a administradoras de riesgos profesionales  ARP', 'ACTIVA'),
(1852, '520569', 'SUBCUENTA', 'Aportes a entidades promotoras de salud  EPS', 'ACTIVA'),
(1853, '520570', 'SUBCUENTA', 'Aportes a fondos de pensiones y/o cesantías', 'ACTIVA'),
(1854, '520572', 'SUBCUENTA', 'Aportes cajas de compensación familiar', 'ACTIVA'),
(1855, '520575', 'SUBCUENTA', 'Aportes ICBF', 'ACTIVA'),
(1856, '520578', 'SUBCUENTA', 'SENA', 'ACTIVA'),
(1857, '520581', 'SUBCUENTA', 'Aportes sindicales', 'ACTIVA'),
(1858, '520584', 'SUBCUENTA', 'Gastos médicos y drogas', 'ACTIVA'),
(1859, '520595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1860, '520599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1861, '5210', 'CUENTA', 'Honorarios', 'ACTIVA'),
(1862, '521005', 'SUBCUENTA', 'Junta directiva', 'ACTIVA'),
(1863, '521010', 'SUBCUENTA', 'Revisoría fiscal', 'ACTIVA'),
(1864, '521015', 'SUBCUENTA', 'Auditoría externa', 'ACTIVA'),
(1865, '521020', 'SUBCUENTA', 'Avalúos', 'ACTIVA'),
(1866, '521025', 'SUBCUENTA', 'Asesoría jurídica', 'ACTIVA'),
(1867, '521030', 'SUBCUENTA', 'Asesoría financiera', 'ACTIVA'),
(1868, '521035', 'SUBCUENTA', 'Asesoría técnica', 'ACTIVA'),
(1869, '521095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1870, '521099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1871, '5215', 'CUENTA', 'Impuestos', 'ACTIVA'),
(1872, '521505', 'SUBCUENTA', 'Industria y comercio', 'ACTIVA'),
(1873, '521510', 'SUBCUENTA', 'De timbres', 'ACTIVA'),
(1874, '521515', 'SUBCUENTA', 'A la propiedad raíz', 'ACTIVA'),
(1875, '521520', 'SUBCUENTA', 'Derechos sobre instrumentos públicos', 'ACTIVA'),
(1876, '521525', 'SUBCUENTA', 'De valorización', 'ACTIVA'),
(1877, '521530', 'SUBCUENTA', 'De turismo', 'ACTIVA'),
(1878, '521535', 'SUBCUENTA', 'Tasa por utilización de puertos', 'ACTIVA'),
(1879, '521540', 'SUBCUENTA', 'De vehículos', 'ACTIVA'),
(1880, '521545', 'SUBCUENTA', 'De espectáculos públicos', 'ACTIVA'),
(1881, '521550', 'SUBCUENTA', 'Cuotas de fomento', 'ACTIVA'),
(1882, '521555', 'SUBCUENTA', 'Licores', 'ACTIVA'),
(1883, '521560', 'SUBCUENTA', 'Cervezas', 'ACTIVA'),
(1884, '521565', 'SUBCUENTA', 'Cigarrillos', 'ACTIVA'),
(1885, '521570', 'SUBCUENTA', 'IVA descontable', 'ACTIVA'),
(1886, '521595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1887, '521599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1888, '5220', 'CUENTA', 'Arrendamientos', 'ACTIVA'),
(1889, '522005', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(1890, '522010', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(1891, '522015', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(1892, '522020', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(1893, '522025', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(1894, '522030', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(1895, '522035', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(1896, '522040', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1897, '522045', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1898, '522050', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1899, '522055', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1900, '522060', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(1901, '522065', 'SUBCUENTA', 'Aeródromos', 'ACTIVA'),
(1902, '522070', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(1903, '522095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1904, '522099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1905, '5225', 'CUENTA', 'Contribuciones y afiliaciones', 'ACTIVA'),
(1906, '522505', 'SUBCUENTA', 'Contribuciones', 'ACTIVA'),
(1907, '522510', 'SUBCUENTA', 'Afiliaciones y sostenimiento', 'ACTIVA'),
(1908, '522599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1909, '5230', 'CUENTA', 'Seguros', 'ACTIVA'),
(1910, '523005', 'SUBCUENTA', 'Manejo', 'ACTIVA'),
(1911, '523010', 'SUBCUENTA', 'Cumplimiento', 'ACTIVA'),
(1912, '523015', 'SUBCUENTA', 'Corriente débil', 'ACTIVA'),
(1913, '523020', 'SUBCUENTA', 'Vida colectiva', 'ACTIVA'),
(1914, '523025', 'SUBCUENTA', 'Incendio', 'ACTIVA'),
(1915, '523030', 'SUBCUENTA', 'Terremoto', 'ACTIVA'),
(1916, '523035', 'SUBCUENTA', 'Sustracción y hurto', 'ACTIVA'),
(1917, '523040', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1918, '523045', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1919, '523050', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1920, '523055', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1921, '523060', 'SUBCUENTA', 'Responsabilidad civil y extracontractual', 'ACTIVA'),
(1922, '523065', 'SUBCUENTA', 'Vuelo', 'ACTIVA'),
(1923, '523070', 'SUBCUENTA', 'Rotura de maquinaria', 'ACTIVA'),
(1924, '523075', 'SUBCUENTA', 'Obligatorio accidente de tránsito', 'ACTIVA'),
(1925, '523080', 'SUBCUENTA', 'Lucro cesante', 'ACTIVA'),
(1926, '523095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1927, '523099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1928, '5235', 'CUENTA', 'Servicios', 'ACTIVA'),
(1929, '523505', 'SUBCUENTA', 'Aseo y vigilancia', 'ACTIVA'),
(1930, '523510', 'SUBCUENTA', 'Temporales', 'ACTIVA'),
(1931, '523515', 'SUBCUENTA', 'Asistencia técnica', 'ACTIVA'),
(1932, '523520', 'SUBCUENTA', 'Procesamiento electrónico de datos', 'ACTIVA'),
(1933, '523525', 'SUBCUENTA', 'Acueducto y alcantarillado', 'ACTIVA'),
(1934, '523530', 'SUBCUENTA', 'Energía eléctrica', 'ACTIVA'),
(1935, '523535', 'SUBCUENTA', 'Teléfono', 'ACTIVA'),
(1936, '523540', 'SUBCUENTA', 'Correo  portes y telegramas', 'ACTIVA'),
(1937, '523545', 'SUBCUENTA', 'Fax y télex', 'ACTIVA'),
(1938, '523550', 'SUBCUENTA', 'Transporte  fletes y acarreos', 'ACTIVA'),
(1939, '523555', 'SUBCUENTA', 'Gas', 'ACTIVA'),
(1940, '523560', 'SUBCUENTA', 'Publicidad  propaganda y promoción', 'ACTIVA'),
(1941, '523595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1942, '523599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1943, '5240', 'CUENTA', 'Gastos legales', 'ACTIVA'),
(1944, '524005', 'SUBCUENTA', 'Notariales', 'ACTIVA'),
(1945, '524010', 'SUBCUENTA', 'Registro mercantil', 'ACTIVA'),
(1946, '524015', 'SUBCUENTA', 'Trámites y licencias', 'ACTIVA'),
(1947, '524020', 'SUBCUENTA', 'Aduaneros', 'ACTIVA'),
(1948, '524025', 'SUBCUENTA', 'Consulares', 'ACTIVA'),
(1949, '524095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1950, '524099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1951, '5245', 'CUENTA', 'Mantenimiento y reparaciones', 'ACTIVA'),
(1952, '524505', 'SUBCUENTA', 'Terrenos', 'ACTIVA'),
(1953, '524510', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(1954, '524515', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(1955, '524520', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(1956, '524525', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(1957, '524530', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(1958, '524535', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(1959, '524540', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1960, '524545', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1961, '524550', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1962, '524555', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1963, '524560', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(1964, '524565', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(1965, '524570', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(1966, '524599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1967, '5250', 'CUENTA', 'Adecuación e instalación', 'ACTIVA'),
(1968, '525005', 'SUBCUENTA', 'Instalaciones eléctricas', 'ACTIVA'),
(1969, '525010', 'SUBCUENTA', 'Arreglos ornamentales', 'ACTIVA'),
(1970, '525015', 'SUBCUENTA', 'Reparaciones locativas', 'ACTIVA'),
(1971, '525095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1972, '525099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1973, '5255', 'CUENTA', 'Gastos de viaje', 'ACTIVA'),
(1974, '525505', 'SUBCUENTA', 'Alojamiento y manutención', 'ACTIVA'),
(1975, '525510', 'SUBCUENTA', 'Pasajes fluviales y/o marítimos', 'ACTIVA'),
(1976, '525515', 'SUBCUENTA', 'Pasajes aéreos', 'ACTIVA'),
(1977, '525520', 'SUBCUENTA', 'Pasajes terrestres', 'ACTIVA'),
(1978, '525525', 'SUBCUENTA', 'Pasajes férreos', 'ACTIVA'),
(1979, '525595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(1980, '525599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1981, '5260', 'CUENTA', 'Depreciaciones', 'ACTIVA'),
(1982, '526005', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(1983, '526010', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(1984, '526015', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(1985, '526020', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(1986, '526025', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(1987, '526030', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(1988, '526035', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(1989, '526040', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(1990, '526045', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(1991, '526050', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(1992, '526055', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(1993, '526060', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(1994, '526065', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(1995, '526099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(1996, '5265', 'CUENTA', 'Amortizaciones', 'ACTIVA'),
(1997, '526505', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(1998, '526510', 'SUBCUENTA', 'Intangibles', 'ACTIVA'),
(1999, '526515', 'SUBCUENTA', 'Cargos diferidos', 'ACTIVA'),
(2000, '526595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(2001, '526599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2002, '5270', 'CUENTA', 'Financieros-reajuste del sistema', 'ACTIVA'),
(2003, '527099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2004, '5275', 'CUENTA', 'Pérdidas método de participación', 'ACTIVA'),
(2005, '527505', 'SUBCUENTA', 'De sociedades anónimas y/o asimiladas', 'ACTIVA'),
(2006, '527510', 'SUBCUENTA', 'De sociedades limitadas y/o asimiladas', 'ACTIVA'),
(2007, '5295', 'CUENTA', 'Diversos', 'ACTIVA'),
(2008, '529505', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(2009, '529510', 'SUBCUENTA', 'Libros  suscripciones  periódicos y revistas', 'ACTIVA'),
(2010, '529515', 'SUBCUENTA', 'Música ambiental', 'ACTIVA'),
(2011, '529520', 'SUBCUENTA', 'Gastos de representación y relaciones públicas', 'ACTIVA'),
(2012, '529525', 'SUBCUENTA', 'Elementos de aseo y cafetería', 'ACTIVA'),
(2013, '529530', 'SUBCUENTA', 'Útiles  papelería y fotocopias', 'ACTIVA'),
(2014, '529535', 'SUBCUENTA', 'Combustibles y lubricantes', 'ACTIVA'),
(2015, '529540', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(2016, '529545', 'SUBCUENTA', 'Taxis y buses', 'ACTIVA'),
(2017, '529550', 'SUBCUENTA', 'Estampillas', 'ACTIVA'),
(2018, '529555', 'SUBCUENTA', 'Microfilmación', 'ACTIVA'),
(2019, '529560', 'SUBCUENTA', 'Casino y restaurante', 'ACTIVA'),
(2020, '529565', 'SUBCUENTA', 'Parqueaderos', 'ACTIVA'),
(2021, '529570', 'SUBCUENTA', 'Indemnización por daños a terceros', 'ACTIVA'),
(2022, '529575', 'SUBCUENTA', 'Pólvora y similares', 'ACTIVA'),
(2023, '529595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(2024, '529599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2025, '5299', 'CUENTA', 'Provisiones', 'ACTIVA'),
(2026, '529905', 'SUBCUENTA', 'Inversiones', 'ACTIVA'),
(2027, '529910', 'SUBCUENTA', 'Deudores', 'ACTIVA'),
(2028, '529915', 'SUBCUENTA', 'Inventarios', 'ACTIVA'),
(2029, '529920', 'SUBCUENTA', 'Propiedades  planta y equipo', 'ACTIVA'),
(2030, '529995', 'SUBCUENTA', 'Otros activos', 'ACTIVA'),
(2031, '529999', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2032, '53', 'GRUPO', 'No operacionales', 'ACTIVA'),
(2033, '5305', 'CUENTA', 'Financieros', 'ACTIVA'),
(2034, '530505', 'SUBCUENTA', 'Gastos bancarios', 'ACTIVA'),
(2035, '530510', 'SUBCUENTA', 'Reajuste monetario-UPAC (hoy UVR)', 'ACTIVA'),
(2036, '530515', 'SUBCUENTA', 'Comisiones', 'ACTIVA'),
(2037, '530520', 'SUBCUENTA', 'Intereses', 'ACTIVA'),
(2038, '530525', 'SUBCUENTA', 'Diferencia en cambio', 'ACTIVA'),
(2039, '530530', 'SUBCUENTA', 'Gastos en negociación certificados de cambio', 'ACTIVA'),
(2040, '530535', 'SUBCUENTA', 'Descuentos comerciales condicionados', 'ACTIVA'),
(2041, '530540', 'SUBCUENTA', 'Gastos manejo y emisión de bonos', 'ACTIVA'),
(2042, '530545', 'SUBCUENTA', 'Prima amortizada', 'ACTIVA'),
(2043, '530595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(2044, '530599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2045, '5310', 'CUENTA', 'Pérdida en venta y retiro de bienes', 'ACTIVA'),
(2046, '531005', 'SUBCUENTA', 'Venta de inversiones', 'ACTIVA'),
(2047, '531010', 'SUBCUENTA', 'Venta de cartera', 'ACTIVA'),
(2048, '531015', 'SUBCUENTA', 'Venta de propiedades  planta y equipo', 'ACTIVA'),
(2049, '531020', 'SUBCUENTA', 'Venta de intangibles', 'ACTIVA'),
(2050, '531025', 'SUBCUENTA', 'Venta de otros activos', 'ACTIVA'),
(2051, '531030', 'SUBCUENTA', 'Retiro de propiedades  planta y equipo', 'ACTIVA'),
(2052, '531035', 'SUBCUENTA', 'Retiro de otros activos', 'ACTIVA'),
(2053, '531040', 'SUBCUENTA', 'Pérdidas por siniestros', 'ACTIVA'),
(2054, '531095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(2055, '531099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2056, '5313', 'CUENTA', 'Pérdidas método de participación', 'ACTIVA'),
(2057, '531305', 'SUBCUENTA', 'De sociedades anónimas y/o asimiladas', 'ACTIVA'),
(2058, '531310', 'SUBCUENTA', 'De sociedades limitadas y/o asimiladas', 'ACTIVA'),
(2059, '5315', 'CUENTA', 'Gastos extraordinarios', 'ACTIVA'),
(2060, '531505', 'SUBCUENTA', 'Costas y procesos judiciales', 'ACTIVA'),
(2061, '531510', 'SUBCUENTA', 'Actividades culturales y cívicas', 'ACTIVA'),
(2062, '531515', 'SUBCUENTA', 'Costos y gastos de ejercicios anteriores', 'ACTIVA'),
(2063, '531520', 'SUBCUENTA', 'Impuestos asumidos', 'ACTIVA'),
(2064, '531595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(2065, '531599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2066, '5395', 'CUENTA', 'Gastos diversos', 'ACTIVA'),
(2067, '539505', 'SUBCUENTA', 'Demandas laborales', 'ACTIVA'),
(2068, '539510', 'SUBCUENTA', 'Demandas por incumplimiento de contratos', 'ACTIVA'),
(2069, '539515', 'SUBCUENTA', 'Indemnizaciones', 'ACTIVA'),
(2070, '539520', 'SUBCUENTA', 'Multas  sanciones y litigios', 'ACTIVA'),
(2071, '539525', 'SUBCUENTA', 'Donaciones', 'ACTIVA'),
(2072, '539530', 'SUBCUENTA', 'Constitución de garantías', 'ACTIVA'),
(2073, '539535', 'SUBCUENTA', 'Amortización de bienes entregados en comodato', 'ACTIVA'),
(2074, '539595', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(2075, '539599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2076, '54', 'GRUPO', 'Impuesto de renta y complementarios', 'ACTIVA'),
(2077, '5405', 'CUENTA', 'Impuesto de renta y complementarios', 'ACTIVA'),
(2078, '540505', 'SUBCUENTA', 'Impuesto de renta y complementarios', 'ACTIVA'),
(2079, '59', 'GRUPO', 'Ganancias y pérdidas', 'ACTIVA'),
(2080, '5905', 'CUENTA', 'Ganancias y pérdidas', 'ACTIVA'),
(2081, '590505', 'SUBCUENTA', 'Ganancias y pérdidas', 'ACTIVA'),
(2082, '6', 'CLASE', 'Costos de ventas', 'ACTIVA'),
(2083, '61', 'GRUPO', 'Costo de ventas y de prestación de servicios', 'ACTIVA'),
(2084, '6105', 'CUENTA', 'Agricultura  ganadería  caza y silvicultura', 'ACTIVA'),
(2085, '610505', 'SUBCUENTA', 'Cultivo de cereales', 'ACTIVA'),
(2086, '610510', 'SUBCUENTA', 'Cultivos de hortalizas  legumbres y plantas ornamentales', 'ACTIVA'),
(2087, '610515', 'SUBCUENTA', 'Cultivos de frutas  nueces y plantas aromáticas', 'ACTIVA'),
(2088, '610520', 'SUBCUENTA', 'Cultivo de café', 'ACTIVA'),
(2089, '610525', 'SUBCUENTA', 'Cultivo de flores', 'ACTIVA'),
(2090, '610530', 'SUBCUENTA', 'Cultivo de caña de azúcar', 'ACTIVA'),
(2091, '610535', 'SUBCUENTA', 'Cultivo de algodón y plantas para material textil', 'ACTIVA'),
(2092, '610540', 'SUBCUENTA', 'Cultivo de banano', 'ACTIVA'),
(2093, '610545', 'SUBCUENTA', 'Otros cultivos agrícolas', 'ACTIVA'),
(2094, '610550', 'SUBCUENTA', 'Cría de ovejas  cabras  asnos  mulas y burdéganos', 'ACTIVA'),
(2095, '610555', 'SUBCUENTA', 'Cría de ganado caballar y vacuno', 'ACTIVA'),
(2096, '610560', 'SUBCUENTA', 'Producción avícola', 'ACTIVA'),
(2097, '610565', 'SUBCUENTA', 'Cría de otros animales', 'ACTIVA'),
(2098, '610570', 'SUBCUENTA', 'Servicios agrícolas y ganaderos', 'ACTIVA'),
(2099, '610575', 'SUBCUENTA', 'Actividad de caza', 'ACTIVA'),
(2100, '610580', 'SUBCUENTA', 'Actividad de silvicultura', 'ACTIVA'),
(2101, '610595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2102, '610599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2103, '6110', 'CUENTA', 'Pesca', 'ACTIVA'),
(2104, '611005', 'SUBCUENTA', 'Actividad de pesca', 'ACTIVA'),
(2105, '611010', 'SUBCUENTA', 'Explotación de criaderos de peces', 'ACTIVA'),
(2106, '611095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2107, '611099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2108, '6115', 'CUENTA', 'Explotación de minas y canteras', 'ACTIVA'),
(2109, '611505', 'SUBCUENTA', 'Carbón', 'ACTIVA'),
(2110, '611510', 'SUBCUENTA', 'Petróleo crudo', 'ACTIVA'),
(2111, '611512', 'SUBCUENTA', 'Gas natural', 'ACTIVA'),
(2112, '611514', 'SUBCUENTA', 'Servicios relacionados con extracción de petróleo y gas', 'ACTIVA'),
(2113, '611515', 'SUBCUENTA', 'Minerales de hierro', 'ACTIVA'),
(2114, '611520', 'SUBCUENTA', 'Minerales metalíferos no ferrosos', 'ACTIVA'),
(2115, '611525', 'SUBCUENTA', 'Piedra  arena y arcilla', 'ACTIVA'),
(2116, '611527', 'SUBCUENTA', 'Piedras preciosas', 'ACTIVA'),
(2117, '611528', 'SUBCUENTA', 'Oro', 'ACTIVA'),
(2118, '611530', 'SUBCUENTA', 'Otras minas y canteras', 'ACTIVA'),
(2119, '611532', 'SUBCUENTA', 'Prestación de servicios sector minero', 'ACTIVA'),
(2120, '611595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2121, '611599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2122, '6120', 'CUENTA', 'Industrias manufactureras', 'ACTIVA'),
(2123, '612001', 'SUBCUENTA', 'Producción y procesamiento de carnes y productos cárnicos', 'ACTIVA'),
(2124, '612002', 'SUBCUENTA', 'Productos de pescado', 'ACTIVA'),
(2125, '612003', 'SUBCUENTA', 'Productos de frutas  legumbres y hortalizas', 'ACTIVA'),
(2126, '612004', 'SUBCUENTA', 'Elaboración de aceites y grasas', 'ACTIVA'),
(2127, '612005', 'SUBCUENTA', 'Elaboración de productos lácteos', 'ACTIVA'),
(2128, '612006', 'SUBCUENTA', 'Elaboración de productos de molinería', 'ACTIVA'),
(2129, '612007', 'SUBCUENTA', 'Elaboración de almidones y derivados', 'ACTIVA'),
(2130, '612008', 'SUBCUENTA', 'Elaboración de alimentos para animales', 'ACTIVA'),
(2131, '612009', 'SUBCUENTA', 'Elaboración de productos para panadería', 'ACTIVA'),
(2132, '612010', 'SUBCUENTA', 'Elaboración de azúcar y melazas', 'ACTIVA'),
(2133, '612011', 'SUBCUENTA', 'Elaboración de cacao  chocolate y confitería', 'ACTIVA'),
(2134, '612012', 'SUBCUENTA', 'Elaboración de pastas y productos farináceos', 'ACTIVA'),
(2135, '612013', 'SUBCUENTA', 'Elaboración de productos de café', 'ACTIVA'),
(2136, '612014', 'SUBCUENTA', 'Elaboración de otros productos alimenticios', 'ACTIVA'),
(2137, '612015', 'SUBCUENTA', 'Elaboración de bebidas alcohólicas y alcohol etílico', 'ACTIVA'),
(2138, '612016', 'SUBCUENTA', 'Elaboración de vinos', 'ACTIVA'),
(2139, '612017', 'SUBCUENTA', 'Elaboración de bebidas malteadas y de malta', 'ACTIVA'),
(2140, '612018', 'SUBCUENTA', 'Elaboración de bebidas no alcohólicas', 'ACTIVA'),
(2141, '612019', 'SUBCUENTA', 'Elaboración de productos de tabaco', 'ACTIVA'),
(2142, '612020', 'SUBCUENTA', 'Preparación e hilatura de fibras textiles y tejeduría', 'ACTIVA'),
(2143, '612021', 'SUBCUENTA', 'Acabado de productos textiles', 'ACTIVA'),
(2144, '612022', 'SUBCUENTA', 'Elaboración de artículos de materiales textiles', 'ACTIVA'),
(2145, '612023', 'SUBCUENTA', 'Elaboración de tapices y alfombras', 'ACTIVA'),
(2146, '612024', 'SUBCUENTA', 'Elaboración de cuerdas  cordeles  bramantes y redes', 'ACTIVA'),
(2147, '612025', 'SUBCUENTA', 'Elaboración de otros productos textiles', 'ACTIVA'),
(2148, '612026', 'SUBCUENTA', 'Elaboración de tejidos', 'ACTIVA'),
(2149, '612027', 'SUBCUENTA', 'Elaboración de prendas de vestir', 'ACTIVA'),
(2150, '612028', 'SUBCUENTA', 'Preparación  adobo y teñido de pieles', 'ACTIVA'),
(2151, '612029', 'SUBCUENTA', 'Curtido  adobo o preparación de cuero', 'ACTIVA'),
(2152, '612030', 'SUBCUENTA', 'Elaboración de maletas  bolsos y similares', 'ACTIVA'),
(2153, '612031', 'SUBCUENTA', 'Elaboración de calzado', 'ACTIVA'),
(2154, '612032', 'SUBCUENTA', 'Producción de madera  artículos de madera y corcho', 'ACTIVA'),
(2155, '612033', 'SUBCUENTA', 'Elaboración de pasta y productos de madera  papel y cartón', 'ACTIVA'),
(2156, '612034', 'SUBCUENTA', 'Ediciones y publicaciones', 'ACTIVA'),
(2157, '612035', 'SUBCUENTA', 'Impresión', 'ACTIVA'),
(2158, '612036', 'SUBCUENTA', 'Servicios relacionados con la edición y la impresión', 'ACTIVA'),
(2159, '612037', 'SUBCUENTA', 'Reproducción de grabaciones', 'ACTIVA'),
(2160, '612038', 'SUBCUENTA', 'Elaboración de productos de horno de coque', 'ACTIVA'),
(2161, '612039', 'SUBCUENTA', 'Elaboración de productos de la refinación de petróleo', 'ACTIVA'),
(2162, '612040', 'SUBCUENTA', 'Elaboración de sustancias químicas básicas', 'ACTIVA'),
(2163, '612041', 'SUBCUENTA', 'Elaboración de abonos y compuestos de nitrógeno', 'ACTIVA'),
(2164, '612042', 'SUBCUENTA', 'Elaboración de plástico y caucho sintético', 'ACTIVA'),
(2165, '612043', 'SUBCUENTA', 'Elaboración de productos químicos de uso agropecuario', 'ACTIVA'),
(2166, '612044', 'SUBCUENTA', 'Elaboración de pinturas  tintas y masillas', 'ACTIVA'),
(2167, '612045', 'SUBCUENTA', 'Elaboración de productos farmacéuticos y botánicos', 'ACTIVA'),
(2168, '612046', 'SUBCUENTA', 'Elaboración de jabones  detergentes y preparados de tocador', 'ACTIVA'),
(2169, '612047', 'SUBCUENTA', 'Elaboración de otros productos químicos', 'ACTIVA'),
(2170, '612048', 'SUBCUENTA', 'Elaboración de fibras', 'ACTIVA'),
(2171, '612049', 'SUBCUENTA', 'Elaboración de otros productos de caucho', 'ACTIVA'),
(2172, '612050', 'SUBCUENTA', 'Elaboración de productos de plástico', 'ACTIVA'),
(2173, '612051', 'SUBCUENTA', 'Elaboración de vidrio y productos de vidrio', 'ACTIVA'),
(2174, '612052', 'SUBCUENTA', 'Elaboración de productos de cerámica  loza  piedra  arcilla y porcelana', 'ACTIVA'),
(2175, '612053', 'SUBCUENTA', 'Elaboración de cemento  cal y yeso', 'ACTIVA'),
(2176, '612054', 'SUBCUENTA', 'Elaboración de artículos de hormigón  cemento y yeso', 'ACTIVA'),
(2177, '612055', 'SUBCUENTA', 'Corte  tallado y acabado de la piedra', 'ACTIVA'),
(2178, '612056', 'SUBCUENTA', 'Elaboración de otros productos minerales no metálicos', 'ACTIVA'),
(2179, '612057', 'SUBCUENTA', 'Industrias básicas y fundición de hierro y acero', 'ACTIVA'),
(2180, '612058', 'SUBCUENTA', 'Productos primarios de metales preciosos y de metales no ferrosos', 'ACTIVA'),
(2181, '612059', 'SUBCUENTA', 'Fundición de metales no ferrosos', 'ACTIVA'),
(2182, '612060', 'SUBCUENTA', 'Fabricación de productos metálicos para uso estructural', 'ACTIVA'),
(2183, '612061', 'SUBCUENTA', 'Forja  prensado  estampado  laminado de metal y pulvimetalurgia', 'ACTIVA'),
(2184, '612062', 'SUBCUENTA', 'Revestimiento de metales y obras de ingeniería mecánica', 'ACTIVA'),
(2185, '612063', 'SUBCUENTA', 'Fabricación de artículos de ferretería', 'ACTIVA'),
(2186, '612064', 'SUBCUENTA', 'Elaboración de otros productos de metal', 'ACTIVA'),
(2187, '612065', 'SUBCUENTA', 'Fabricación de maquinaria y equipo', 'ACTIVA'),
(2188, '612066', 'SUBCUENTA', 'Fabricación de equipos de elevación y manipulación', 'ACTIVA'),
(2189, '612067', 'SUBCUENTA', 'Elaboración de aparatos de uso doméstico', 'ACTIVA'),
(2190, '612068', 'SUBCUENTA', 'Elaboración de equipo de oficina', 'ACTIVA'),
(2191, '612069', 'SUBCUENTA', 'Elaboración de pilas y baterías primarias', 'ACTIVA'),
(2192, '612070', 'SUBCUENTA', 'Elaboración de equipo de iluminación', 'ACTIVA'),
(2193, '612071', 'SUBCUENTA', 'Elaboración de otros tipos de equipo eléctrico', 'ACTIVA'),
(2194, '612072', 'SUBCUENTA', 'Fabricación de equipos de radio  televisión y comunicaciones', 'ACTIVA'),
(2195, '612073', 'SUBCUENTA', 'Fabricación de aparatos e instrumentos médicos', 'ACTIVA'),
(2196, '612074', 'SUBCUENTA', 'Fabricación de instrumentos de medición y control', 'ACTIVA'),
(2197, '612075', 'SUBCUENTA', 'Fabricación de instrumentos de óptica y equipo fotográfico', 'ACTIVA'),
(2198, '612076', 'SUBCUENTA', 'Fabricación de relojes', 'ACTIVA'),
(2199, '612077', 'SUBCUENTA', 'Fabricación de vehículos automotores', 'ACTIVA'),
(2200, '612078', 'SUBCUENTA', 'Fabricación de carrocerías para automotores', 'ACTIVA'),
(2201, '612079', 'SUBCUENTA', 'Fabricación de partes  piezas y accesorios para automotores', 'ACTIVA'),
(2202, '612080', 'SUBCUENTA', 'Fabricación y reparación de buques y otras embarcaciones', 'ACTIVA'),
(2203, '612081', 'SUBCUENTA', 'Fabricación de locomotoras y material rodante para ferrocarriles', 'ACTIVA'),
(2204, '612082', 'SUBCUENTA', 'Fabricación de aeronaves', 'ACTIVA'),
(2205, '612083', 'SUBCUENTA', 'Fabricación de motocicletas', 'ACTIVA'),
(2206, '612084', 'SUBCUENTA', 'Fabricación de bicicletas y sillas de ruedas', 'ACTIVA'),
(2207, '612085', 'SUBCUENTA', 'Fabricación de otros tipos de transporte', 'ACTIVA'),
(2208, '612086', 'SUBCUENTA', 'Fabricación de muebles', 'ACTIVA'),
(2209, '612087', 'SUBCUENTA', 'Fabricación de joyas y artículos conexos', 'ACTIVA'),
(2210, '612088', 'SUBCUENTA', 'Fabricación de instrumentos de música', 'ACTIVA'),
(2211, '612089', 'SUBCUENTA', 'Fabricación de artículos y equipo para deporte', 'ACTIVA'),
(2212, '612090', 'SUBCUENTA', 'Fabricación de juegos y juguetes', 'ACTIVA'),
(2213, '612091', 'SUBCUENTA', 'Reciclamiento de desperdicios', 'ACTIVA'),
(2214, '612095', 'SUBCUENTA', 'Productos de otras industrias manufactureras', 'ACTIVA'),
(2215, '612099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2216, '6125', 'CUENTA', 'Suministro de electricidad  gas y agua', 'ACTIVA'),
(2217, '612505', 'SUBCUENTA', 'Generación  captación y distribución de energía eléctrica', 'ACTIVA'),
(2218, '612510', 'SUBCUENTA', 'Fabricación de gas y distribución de combustibles gaseosos', 'ACTIVA'),
(2219, '612515', 'SUBCUENTA', 'Captación  depuración y distribución de agua', 'ACTIVA'),
(2220, '612595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2221, '612599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2222, '6130', 'CUENTA', 'Construcción', 'ACTIVA'),
(2223, '613005', 'SUBCUENTA', 'Preparación de terrenos', 'ACTIVA'),
(2224, '613010', 'SUBCUENTA', 'Construcción de edificios y obras de ingeniería civil', 'ACTIVA'),
(2225, '613015', 'SUBCUENTA', 'Acondicionamiento de edificios', 'ACTIVA'),
(2226, '613020', 'SUBCUENTA', 'Terminación de edificaciones', 'ACTIVA'),
(2227, '613025', 'SUBCUENTA', 'Alquiler de equipo con operario', 'ACTIVA'),
(2228, '613095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2229, '613099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2230, '6135', 'CUENTA', 'Comercio al por mayor y al por menor', 'ACTIVA'),
(2231, '613502', 'SUBCUENTA', 'Venta de vehículos automotores', 'ACTIVA'),
(2232, '613504', 'SUBCUENTA', 'Mantenimiento  reparación y lavado de vehículos automotores', 'ACTIVA'),
(2233, '613506', 'SUBCUENTA', 'Venta de partes  piezas y accesorios de vehículos automotores', 'ACTIVA'),
(2234, '613508', 'SUBCUENTA', 'Venta de combustibles sólidos  líquidos  gaseosos', 'ACTIVA'),
(2235, '613510', 'SUBCUENTA', 'Venta de lubricantes  aditivos  llantas y lujos para automotores', 'ACTIVA'),
(2236, '613512', 'SUBCUENTA', 'Venta a cambio de retribución o por contrata', 'ACTIVA'),
(2237, '613514', 'SUBCUENTA', 'Venta de insumos  materias primas agropecuarias y flores', 'ACTIVA'),
(2238, '613516', 'SUBCUENTA', 'Venta de otros insumos y materias primas no agropecuarias', 'ACTIVA'),
(2239, '613518', 'SUBCUENTA', 'Venta de animales vivos y cueros', 'ACTIVA'),
(2240, '613520', 'SUBCUENTA', 'Venta de productos en almacenes no especializados', 'ACTIVA'),
(2241, '613522', 'SUBCUENTA', 'Venta de productos agropecuarios', 'ACTIVA'),
(2242, '613524', 'SUBCUENTA', 'Venta de productos textiles  de vestir  de cuero y calzado', 'ACTIVA'),
(2243, '613526', 'SUBCUENTA', 'Venta de papel y cartón', 'ACTIVA'),
(2244, '613528', 'SUBCUENTA', 'Venta de libros  revistas  elementos de papelería  útiles y textos escolares', 'ACTIVA'),
(2245, '613530', 'SUBCUENTA', 'Venta de juegos  juguetes y artículos deportivos', 'ACTIVA'),
(2246, '613532', 'SUBCUENTA', 'Venta de instrumentos quirúrgicos y ortopédicos', 'ACTIVA'),
(2247, '613534', 'SUBCUENTA', 'Venta de artículos en relojerías y joyerías', 'ACTIVA'),
(2248, '613536', 'SUBCUENTA', 'Venta de electrodomésticos y muebles', 'ACTIVA'),
(2249, '613538', 'SUBCUENTA', 'Venta de productos de aseo  farmacéuticos  medicinales y artículos de tocador', 'ACTIVA'),
(2250, '613540', 'SUBCUENTA', 'Venta de cubiertos  vajillas  cristalería  porcelanas  cerámicas y otros artículos de uso doméstico', 'ACTIVA'),
(2251, '613542', 'SUBCUENTA', 'Venta de materiales de construcción  fontanería y calefacción', 'ACTIVA'),
(2252, '613544', 'SUBCUENTA', 'Venta de pinturas y lacas', 'ACTIVA'),
(2253, '613546', 'SUBCUENTA', 'Venta de productos de vidrios y marquetería', 'ACTIVA'),
(2254, '613548', 'SUBCUENTA', 'Venta de herramientas y artículos de ferretería', 'ACTIVA'),
(2255, '613550', 'SUBCUENTA', 'Venta de químicos', 'ACTIVA'),
(2256, '613552', 'SUBCUENTA', 'Venta de productos intermedios  desperdicios y desechos', 'ACTIVA'),
(2257, '613554', 'SUBCUENTA', 'Venta de maquinaria  equipo de oficina y programas de computador', 'ACTIVA'),
(2258, '613556', 'SUBCUENTA', 'Venta de artículos en cacharrerías y misceláneas', 'ACTIVA'),
(2259, '613558', 'SUBCUENTA', 'Venta de instrumentos musicales', 'ACTIVA'),
(2260, '613560', 'SUBCUENTA', 'Venta de artículos en casas de empeño y prenderías', 'ACTIVA'),
(2261, '613562', 'SUBCUENTA', 'Venta de equipo fotográfico', 'ACTIVA'),
(2262, '613564', 'SUBCUENTA', 'Venta de equipo óptico y de precisión', 'ACTIVA'),
(2263, '613566', 'SUBCUENTA', 'Venta de empaques', 'ACTIVA'),
(2264, '613568', 'SUBCUENTA', 'Venta de equipo profesional y científico', 'ACTIVA'),
(2265, '613570', 'SUBCUENTA', 'Venta de loterías  rifas  chance  apuestas y similares', 'ACTIVA'),
(2266, '613572', 'SUBCUENTA', 'Reparación de efectos personales y electrodomésticos', 'ACTIVA'),
(2267, '613595', 'SUBCUENTA', 'Venta de otros productos', 'ACTIVA'),
(2268, '613599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2269, '6140', 'CUENTA', 'Hoteles y restaurantes', 'ACTIVA'),
(2270, '614005', 'SUBCUENTA', 'Hotelería', 'ACTIVA'),
(2271, '614010', 'SUBCUENTA', 'Campamento y otros tipos de hospedaje', 'ACTIVA'),
(2272, '614015', 'SUBCUENTA', 'Restaurantes', 'ACTIVA'),
(2273, '614020', 'SUBCUENTA', 'Bares y cantinas', 'ACTIVA'),
(2274, '614095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2275, '614099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA');
INSERT INTO `puc` (`id`, `cuenta`, `tipo`, `descripcion`, `estado`) VALUES
(2276, '6145', 'CUENTA', 'Transporte  almacenamiento y comunicaciones', 'ACTIVA'),
(2277, '614505', 'SUBCUENTA', 'Servicio de transporte por carretera', 'ACTIVA'),
(2278, '614510', 'SUBCUENTA', 'Servicio de transporte por vía férrea', 'ACTIVA'),
(2279, '614515', 'SUBCUENTA', 'Servicio de transporte por vía acuática', 'ACTIVA'),
(2280, '614520', 'SUBCUENTA', 'Servicio de transporte por vía aérea', 'ACTIVA'),
(2281, '614525', 'SUBCUENTA', 'Servicio de transporte por tuberías', 'ACTIVA'),
(2282, '614530', 'SUBCUENTA', 'Manipulación de carga', 'ACTIVA'),
(2283, '614535', 'SUBCUENTA', 'Almacenamiento y depósito', 'ACTIVA'),
(2284, '614540', 'SUBCUENTA', 'Servicios complementarios para el transporte', 'ACTIVA'),
(2285, '614545', 'SUBCUENTA', 'Agencias de viaje', 'ACTIVA'),
(2286, '614550', 'SUBCUENTA', 'Otras agencias de transporte', 'ACTIVA'),
(2287, '614555', 'SUBCUENTA', 'Servicio postal y de correo', 'ACTIVA'),
(2288, '614560', 'SUBCUENTA', 'Servicio telefónico', 'ACTIVA'),
(2289, '614565', 'SUBCUENTA', 'Servicio de telégrafo', 'ACTIVA'),
(2290, '614570', 'SUBCUENTA', 'Servicio de transmisión de datos', 'ACTIVA'),
(2291, '614575', 'SUBCUENTA', 'Servicio de radio y televisión por cable', 'ACTIVA'),
(2292, '614580', 'SUBCUENTA', 'Transmisión de sonido e imágenes por contrato', 'ACTIVA'),
(2293, '614595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2294, '614599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2295, '6150', 'CUENTA', 'Actividad financiera', 'ACTIVA'),
(2296, '615005', 'SUBCUENTA', 'De inversiones', 'ACTIVA'),
(2297, '615010', 'SUBCUENTA', 'De servicio de bolsa', 'ACTIVA'),
(2298, '615099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2299, '6155', 'CUENTA', 'Actividades inmobiliarias  empresariales y de alquiler', 'ACTIVA'),
(2300, '615505', 'SUBCUENTA', 'Arrendamientos de bienes inmuebles', 'ACTIVA'),
(2301, '615510', 'SUBCUENTA', 'Inmobiliarias por retribución o contrata', 'ACTIVA'),
(2302, '615515', 'SUBCUENTA', 'Alquiler equipo de transporte', 'ACTIVA'),
(2303, '615520', 'SUBCUENTA', 'Alquiler maquinaria y equipo', 'ACTIVA'),
(2304, '615525', 'SUBCUENTA', 'Alquiler de efectos personales y enseres domésticos', 'ACTIVA'),
(2305, '615530', 'SUBCUENTA', 'Consultoría en equipo y programas de informática', 'ACTIVA'),
(2306, '615535', 'SUBCUENTA', 'Procesamiento de datos', 'ACTIVA'),
(2307, '615540', 'SUBCUENTA', 'Mantenimiento y reparación de maquinaria de oficina', 'ACTIVA'),
(2308, '615545', 'SUBCUENTA', 'Investigaciones científicas y de desarrollo', 'ACTIVA'),
(2309, '615550', 'SUBCUENTA', 'Actividades empresariales de consultoría', 'ACTIVA'),
(2310, '615555', 'SUBCUENTA', 'Publicidad', 'ACTIVA'),
(2311, '615560', 'SUBCUENTA', 'Dotación de personal', 'ACTIVA'),
(2312, '615565', 'SUBCUENTA', 'Investigación y seguridad', 'ACTIVA'),
(2313, '615570', 'SUBCUENTA', 'Limpieza de inmuebles', 'ACTIVA'),
(2314, '615575', 'SUBCUENTA', 'Fotografía', 'ACTIVA'),
(2315, '615580', 'SUBCUENTA', 'Envase y empaque', 'ACTIVA'),
(2316, '615585', 'SUBCUENTA', 'Fotocopiado', 'ACTIVA'),
(2317, '615590', 'SUBCUENTA', 'Mantenimiento y reparación de maquinaria y equipo', 'ACTIVA'),
(2318, '615595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2319, '615599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2320, '6160', 'CUENTA', 'Enseñanza', 'ACTIVA'),
(2321, '616005', 'SUBCUENTA', 'Actividades relacionadas con la educación', 'ACTIVA'),
(2322, '616095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2323, '616099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2324, '6165', 'CUENTA', 'Servicios sociales y de salud', 'ACTIVA'),
(2325, '616505', 'SUBCUENTA', 'Servicio hospitalario', 'ACTIVA'),
(2326, '616510', 'SUBCUENTA', 'Servicio médico', 'ACTIVA'),
(2327, '616515', 'SUBCUENTA', 'Servicio odontológico', 'ACTIVA'),
(2328, '616520', 'SUBCUENTA', 'Servicio de laboratorio', 'ACTIVA'),
(2329, '616525', 'SUBCUENTA', 'Actividades veterinarias', 'ACTIVA'),
(2330, '616530', 'SUBCUENTA', 'Actividades de servicios sociales', 'ACTIVA'),
(2331, '616595', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2332, '616599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2333, '6170', 'CUENTA', 'Otras actividades de servicios comunitarios  sociales y personales', 'ACTIVA'),
(2334, '617005', 'SUBCUENTA', 'Eliminación de desperdicios y aguas residuales', 'ACTIVA'),
(2335, '617010', 'SUBCUENTA', 'Actividades de asociación', 'ACTIVA'),
(2336, '617015', 'SUBCUENTA', 'Producción y distribución de filmes y videocintas', 'ACTIVA'),
(2337, '617020', 'SUBCUENTA', 'Exhibición de filmes y videocintas', 'ACTIVA'),
(2338, '617025', 'SUBCUENTA', 'Actividad de radio y televisión', 'ACTIVA'),
(2339, '617030', 'SUBCUENTA', 'Actividad teatral  musical y artística', 'ACTIVA'),
(2340, '617035', 'SUBCUENTA', 'Grabación y producción de discos', 'ACTIVA'),
(2341, '617040', 'SUBCUENTA', 'Entretenimiento y esparcimiento', 'ACTIVA'),
(2342, '617045', 'SUBCUENTA', 'Agencias de noticias', 'ACTIVA'),
(2343, '617050', 'SUBCUENTA', 'Lavanderías y similares', 'ACTIVA'),
(2344, '617055', 'SUBCUENTA', 'Peluquerías y similares', 'ACTIVA'),
(2345, '617060', 'SUBCUENTA', 'Servicios funerarios', 'ACTIVA'),
(2346, '617065', 'SUBCUENTA', 'Zonas francas', 'ACTIVA'),
(2347, '617095', 'SUBCUENTA', 'Actividades conexas', 'ACTIVA'),
(2348, '617099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2349, '62', 'GRUPO', 'Compras', 'ACTIVA'),
(2350, '6205', 'CUENTA', 'De mercancías', 'ACTIVA'),
(2351, '620599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2352, '6210', 'CUENTA', 'De materias primas', 'ACTIVA'),
(2353, '621099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2354, '6215', 'CUENTA', 'De materiales indirectos', 'ACTIVA'),
(2355, '621599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2356, '6220', 'CUENTA', 'Compra de energía', 'ACTIVA'),
(2357, '622099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2358, '6225', 'CUENTA', 'Devoluciones en compras (CR)', 'ACTIVA'),
(2359, '622599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2360, '7', 'CLASE', 'Costos de producción o de operación', 'ACTIVA'),
(2361, '71', 'GRUPO', 'Materia prima', 'ACTIVA'),
(2362, '72', 'GRUPO', 'Mano de obra directa', 'ACTIVA'),
(2363, '73', 'GRUPO', 'Costos indirectos', 'ACTIVA'),
(2364, '74', 'GRUPO', 'Contratos de servicios', 'ACTIVA'),
(2365, '8', 'CLASE', 'Cuentas de orden deudoras', 'ACTIVA'),
(2366, '81', 'GRUPO', 'Derechos contingentes', 'ACTIVA'),
(2367, '8105', 'CUENTA', 'Bienes y valores entregados en custodia', 'ACTIVA'),
(2368, '810505', 'SUBCUENTA', 'Valores mobiliarios', 'ACTIVA'),
(2369, '810510', 'SUBCUENTA', 'Bienes muebles', 'ACTIVA'),
(2370, '810599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2371, '8110', 'CUENTA', 'Bienes y valores entregados en garantía', 'ACTIVA'),
(2372, '811005', 'SUBCUENTA', 'Valores mobiliarios', 'ACTIVA'),
(2373, '811010', 'SUBCUENTA', 'Bienes muebles', 'ACTIVA'),
(2374, '811015', 'SUBCUENTA', 'Bienes inmuebles', 'ACTIVA'),
(2375, '811020', 'SUBCUENTA', 'Contratos de ganado en participación', 'ACTIVA'),
(2376, '811099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2377, '8115', 'CUENTA', 'Bienes y valores en poder de terceros', 'ACTIVA'),
(2378, '811505', 'SUBCUENTA', 'En arrendamiento', 'ACTIVA'),
(2379, '811510', 'SUBCUENTA', 'En préstamo', 'ACTIVA'),
(2380, '811515', 'SUBCUENTA', 'En depósito', 'ACTIVA'),
(2381, '811520', 'SUBCUENTA', 'En consignación', 'ACTIVA'),
(2382, '811599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2383, '8120', 'CUENTA', 'Litigios y/o demandas', 'ACTIVA'),
(2384, '812005', 'SUBCUENTA', 'Ejecutivos', 'ACTIVA'),
(2385, '812010', 'SUBCUENTA', 'Incumplimiento de contratos', 'ACTIVA'),
(2386, '8125', 'CUENTA', 'Promesas de compraventa', 'ACTIVA'),
(2387, '8195', 'CUENTA', 'Diversas', 'ACTIVA'),
(2388, '819505', 'SUBCUENTA', 'Valores adquiridos por recibir', 'ACTIVA'),
(2389, '819595', 'SUBCUENTA', 'Otras', 'ACTIVA'),
(2390, '819599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2391, '82', 'GRUPO', 'Deudoras fiscales', 'ACTIVA'),
(2392, '83', 'GRUPO', 'Deudoras de control', 'ACTIVA'),
(2393, '8305', 'CUENTA', 'Bienes recibidos en arrendamiento financiero', 'ACTIVA'),
(2394, '830505', 'SUBCUENTA', 'Bienes muebles', 'ACTIVA'),
(2395, '830510', 'SUBCUENTA', 'Bienes inmuebles', 'ACTIVA'),
(2396, '830599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2397, '8310', 'CUENTA', 'Títulos de inversión no colocados', 'ACTIVA'),
(2398, '831005', 'SUBCUENTA', 'Acciones', 'ACTIVA'),
(2399, '831010', 'SUBCUENTA', 'Bonos', 'ACTIVA'),
(2400, '831095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(2401, '8315', 'CUENTA', 'Propiedades  planta y equipo totalmente depreciados  agotados y/o amortizados', 'ACTIVA'),
(2402, '831506', 'SUBCUENTA', 'Materiales proyectos petroleros', 'ACTIVA'),
(2403, '831516', 'SUBCUENTA', 'Construcciones y edificaciones', 'ACTIVA'),
(2404, '831520', 'SUBCUENTA', 'Maquinaria y equipo', 'ACTIVA'),
(2405, '831524', 'SUBCUENTA', 'Equipo de oficina', 'ACTIVA'),
(2406, '831528', 'SUBCUENTA', 'Equipo de computación y comunicación', 'ACTIVA'),
(2407, '831532', 'SUBCUENTA', 'Equipo médico-científico', 'ACTIVA'),
(2408, '831536', 'SUBCUENTA', 'Equipo de hoteles y restaurantes', 'ACTIVA'),
(2409, '831540', 'SUBCUENTA', 'Flota y equipo de transporte', 'ACTIVA'),
(2410, '831544', 'SUBCUENTA', 'Flota y equipo fluvial y/o marítimo', 'ACTIVA'),
(2411, '831548', 'SUBCUENTA', 'Flota y equipo aéreo', 'ACTIVA'),
(2412, '831552', 'SUBCUENTA', 'Flota y equipo férreo', 'ACTIVA'),
(2413, '831556', 'SUBCUENTA', 'Acueductos  plantas y redes', 'ACTIVA'),
(2414, '831560', 'SUBCUENTA', 'Armamento de vigilancia', 'ACTIVA'),
(2415, '831562', 'SUBCUENTA', 'Envases y empaques', 'ACTIVA'),
(2416, '831564', 'SUBCUENTA', 'Plantaciones agrícolas y forestales', 'ACTIVA'),
(2417, '831568', 'SUBCUENTA', 'Vías de comunicación', 'ACTIVA'),
(2418, '831572', 'SUBCUENTA', 'Minas y canteras', 'ACTIVA'),
(2419, '831576', 'SUBCUENTA', 'Pozos artesianos', 'ACTIVA'),
(2420, '831580', 'SUBCUENTA', 'Yacimientos', 'ACTIVA'),
(2421, '831584', 'SUBCUENTA', 'Semovientes', 'ACTIVA'),
(2422, '831599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2423, '8320', 'CUENTA', 'Créditos a favor no utilizados', 'ACTIVA'),
(2424, '832005', 'SUBCUENTA', 'País', 'ACTIVA'),
(2425, '832010', 'SUBCUENTA', 'Exterior', 'ACTIVA'),
(2426, '8325', 'CUENTA', 'Activos castigados', 'ACTIVA'),
(2427, '832505', 'SUBCUENTA', 'Inversiones', 'ACTIVA'),
(2428, '832510', 'SUBCUENTA', 'Deudores', 'ACTIVA'),
(2429, '832595', 'SUBCUENTA', 'Otros activos', 'ACTIVA'),
(2430, '8330', 'CUENTA', 'Títulos de inversión amortizados', 'ACTIVA'),
(2431, '833005', 'SUBCUENTA', 'Bonos', 'ACTIVA'),
(2432, '833095', 'SUBCUENTA', 'Otros', 'ACTIVA'),
(2433, '8335', 'CUENTA', 'Capitalización por revalorización de patrimonio', 'ACTIVA'),
(2434, '8395', 'CUENTA', 'Otras cuentas deudoras de control', 'ACTIVA'),
(2435, '839505', 'SUBCUENTA', 'Cheques posfechados', 'ACTIVA'),
(2436, '839510', 'SUBCUENTA', 'Certificados de depósito a término', 'ACTIVA'),
(2437, '839515', 'SUBCUENTA', 'Cheques devueltos', 'ACTIVA'),
(2438, '839520', 'SUBCUENTA', 'Bienes y valores en fideicomiso', 'ACTIVA'),
(2439, '839525', 'SUBCUENTA', 'Intereses sobre deudas vencidas', 'ACTIVA'),
(2440, '839595', 'SUBCUENTA', 'Diversas', 'ACTIVA'),
(2441, '839599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2442, '8399', 'CUENTA', 'Ajustes por inflación activos', 'ACTIVA'),
(2443, '839905', 'SUBCUENTA', 'Inversiones', 'ACTIVA'),
(2444, '839910', 'SUBCUENTA', 'Inventarios', 'ACTIVA'),
(2445, '839915', 'SUBCUENTA', 'Propiedades  planta y equipo', 'ACTIVA'),
(2446, '839920', 'SUBCUENTA', 'Intangibles', 'ACTIVA'),
(2447, '839925', 'SUBCUENTA', 'Cargos diferidos', 'ACTIVA'),
(2448, '839995', 'SUBCUENTA', 'Otros activos', 'ACTIVA'),
(2449, '84', 'GRUPO', 'Derechos contingentes por contra (CR)', 'ACTIVA'),
(2450, '85', 'GRUPO', 'Deudoras fiscales por contra (CR)', 'ACTIVA'),
(2451, '86', 'GRUPO', 'Deudoras de control por contra (CR)', 'ACTIVA'),
(2452, '9', 'CLASE', 'Cuentas de orden acreedoras', 'ACTIVA'),
(2453, '91', 'GRUPO', 'Responsabilidades contingentes', 'ACTIVA'),
(2454, '9105', 'CUENTA', 'Bienes y valores recibidos en custodia', 'ACTIVA'),
(2455, '910505', 'SUBCUENTA', 'Valores mobiliarios', 'ACTIVA'),
(2456, '910510', 'SUBCUENTA', 'Bienes muebles', 'ACTIVA'),
(2457, '910599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2458, '9110', 'CUENTA', 'Bienes y valores recibidos en garantía', 'ACTIVA'),
(2459, '911005', 'SUBCUENTA', 'Valores mobiliarios', 'ACTIVA'),
(2460, '911010', 'SUBCUENTA', 'Bienes muebles', 'ACTIVA'),
(2461, '911015', 'SUBCUENTA', 'Bienes inmuebles', 'ACTIVA'),
(2462, '911020', 'SUBCUENTA', 'Contratos de ganado en participación', 'ACTIVA'),
(2463, '911099', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2464, '9115', 'CUENTA', 'Bienes y valores recibidos de terceros', 'ACTIVA'),
(2465, '911505', 'SUBCUENTA', 'En arrendamiento', 'ACTIVA'),
(2466, '911510', 'SUBCUENTA', 'En préstamo', 'ACTIVA'),
(2467, '911515', 'SUBCUENTA', 'En depósito', 'ACTIVA'),
(2468, '911520', 'SUBCUENTA', 'En consignación', 'ACTIVA'),
(2469, '911525', 'SUBCUENTA', 'En comodato', 'ACTIVA'),
(2470, '911599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2471, '9120', 'CUENTA', 'Litigios y/o demandas', 'ACTIVA'),
(2472, '912005', 'SUBCUENTA', 'Laborales', 'ACTIVA'),
(2473, '912010', 'SUBCUENTA', 'Civiles', 'ACTIVA'),
(2474, '912015', 'SUBCUENTA', 'Administrativos o arbitrales', 'ACTIVA'),
(2475, '912020', 'SUBCUENTA', 'Tributarios', 'ACTIVA'),
(2476, '9125', 'CUENTA', 'Promesas de compraventa', 'ACTIVA'),
(2477, '9130', 'CUENTA', 'Contratos de administración delegada', 'ACTIVA'),
(2478, '9135', 'CUENTA', 'Cuentas en participación', 'ACTIVA'),
(2479, '9195', 'CUENTA', 'Otras responsabilidades contingentes', 'ACTIVA'),
(2480, '92', 'GRUPO', 'Acreedoras fiscales', 'ACTIVA'),
(2481, '93', 'GRUPO', 'Acreedoras de control', 'ACTIVA'),
(2482, '9305', 'CUENTA', 'Contratos de arrendamiento financiero', 'ACTIVA'),
(2483, '930505', 'SUBCUENTA', 'Bienes muebles', 'ACTIVA'),
(2484, '930510', 'SUBCUENTA', 'Bienes inmuebles', 'ACTIVA'),
(2485, '9395', 'CUENTA', 'Otras cuentas de orden acreedoras de control', 'ACTIVA'),
(2486, '939505', 'SUBCUENTA', 'Documentos por cobrar descontados', 'ACTIVA'),
(2487, '939510', 'SUBCUENTA', 'Convenios de pago', 'ACTIVA'),
(2488, '939515', 'SUBCUENTA', 'Contratos de construcciones e instalaciones por ejecutar', 'ACTIVA'),
(2489, '939525', 'SUBCUENTA', 'Adjudicaciones pendientes de legalizar', 'ACTIVA'),
(2490, '939530', 'SUBCUENTA', 'Reserva artículo 3º Ley 4ª de 1980', 'ACTIVA'),
(2491, '939535', 'SUBCUENTA', 'Reserva costo reposición semovientes', 'ACTIVA'),
(2492, '939595', 'SUBCUENTA', 'Diversas', 'ACTIVA'),
(2493, '939599', 'SUBCUENTA', 'Ajustes por inflación', 'ACTIVA'),
(2494, '9399', 'CUENTA', 'Ajustes por inflación patrimonio', 'ACTIVA'),
(2495, '939905', 'SUBCUENTA', 'Capital social', 'ACTIVA'),
(2496, '939910', 'SUBCUENTA', 'Superávit de capital', 'ACTIVA'),
(2497, '939915', 'SUBCUENTA', 'Reservas', 'ACTIVA'),
(2498, '939925', 'SUBCUENTA', 'Dividendos o participaciones decretadas en acciones  cuotas o partes de interés social', 'ACTIVA'),
(2499, '939930', 'SUBCUENTA', 'Resultados de ejercicios anteriores', 'ACTIVA'),
(2500, '94', 'GRUPO', 'Responsabilidades contingentes por contra (DB)', 'ACTIVA'),
(2501, '95', 'GRUPO', 'Acreedoras fiscales por contra (DB)', 'ACTIVA'),
(2502, '96', 'GRUPO', 'Acreedoras de control por contra (DB)', 'ACTIVA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `idreceta` int(11) NOT NULL,
  `nombrereceta` varchar(100) NOT NULL,
  `idgrupoplato` int(11) NOT NULL,
  `tiporeceta` varchar(1) NOT NULL COMMENT 'R(Receta)/S(subreceta)',
  `descripcion` varchar(400) NOT NULL,
  `porciones` tinyint(4) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT 'S(Activo)/N(Inactivo)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`idreceta`, `nombrereceta`, `idgrupoplato`, `tiporeceta`, `descripcion`, `porciones`, `estado`) VALUES
(1, 'ADEREZO ENSALADA', 1, 'S', 'PRUEBA RECETA ESTANDAR', 10, 'S'),
(1, 'MEDALLON DE LOMO DE CERDO', 2, 'R', 'PROTEINA MEDALLON DE LOMO DE CERDO PRUEBA', 1, 'S'),
(2, 'ENTRADA PRUEBA', 1, 'R', 'PRUEBA RECETA ESTANDAR', 10, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas_detalle`
--

CREATE TABLE `recetas_detalle` (
  `iddetalle` int(11) NOT NULL,
  `idreceta` int(11) NOT NULL,
  `idgrupoplato` int(11) NOT NULL,
  `idarticulo` varchar(10) NOT NULL,
  `tipoarticulo` varchar(10) NOT NULL,
  `cantidad` float NOT NULL,
  `valorunitario` int(11) NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `recetas_detalle`
--

INSERT INTO `recetas_detalle` (`iddetalle`, `idreceta`, `idgrupoplato`, `idarticulo`, `tipoarticulo`, `cantidad`, `valorunitario`, `unidad`, `valor`) VALUES
(11, 2, 1, '01040109', 'ARTICULO', 500, 0, '12', 0),
(12, 2, 1, '01060217', 'ARTICULO', 500, 0, '12', 0),
(13, 2, 1, '1', 'SUBRECETA', 10, 0, '1', 0),
(14, 1, 1, '01041083', 'ARTICULO', 50, 0, '42', 0),
(15, 1, 1, '01041010', 'ARTICULO', 10, 0, '12', 0),
(16, 1, 1, '01040108', 'ARTICULO', 50, 0, '42', 0),
(17, 1, 2, '01010270', 'ARTICULO', 1, 0, '22', 0),
(18, 1, 2, '01041083', 'ARTICULO', 5, 0, '42', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisiciones`
--

CREATE TABLE `requisiciones` (
  `idrequisicion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idusuario` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `bodega` varchar(2) NOT NULL,
  `bodega2` varchar(2) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `usuarioaprueba` varchar(2) DEFAULT NULL,
  `fechaaproba` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisiciones_detalle`
--

CREATE TABLE `requisiciones_detalle` (
  `iddetalle` double NOT NULL,
  `idrequisicion` int(11) NOT NULL,
  `idarticulo` varchar(20) NOT NULL,
  `cantidad` float NOT NULL,
  `unidad` varchar(4) NOT NULL,
  `vu` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idrol` int(11) NOT NULL,
  `nombrerol` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idrol`, `nombrerol`, `descripcion`, `estado`) VALUES
(1, 'SuperAdmin', 'Super administrador', 'S'),
(2, 'Recepcionista', 'recepcionista de laboratorio', 'S'),
(3, 'Auxiliar Admin', 'Auxiliar administrativa y facturacion', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_opciones`
--

CREATE TABLE `roles_opciones` (
  `idrol` int(11) NOT NULL,
  `idopcion` int(11) NOT NULL,
  `crear` varchar(1) NOT NULL,
  `modificar` varchar(1) NOT NULL,
  `eliminar` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `roles_opciones`
--

INSERT INTO `roles_opciones` (`idrol`, `idopcion`, `crear`, `modificar`, `eliminar`) VALUES
(3, 4, '1', '1', '1'),
(1, 35, '1', '1', '1'),
(1, 14, '1', '1', '1'),
(1, 45, '1', '1', '1'),
(1, 17, '1', '1', '1'),
(1, 19, '1', '1', '1'),
(1, 21, '1', '1', '1'),
(1, 20, '1', '1', '1'),
(1, 12, '1', '1', '1'),
(1, 8, '1', '1', '1'),
(1, 48, '1', '1', '1'),
(1, 49, '1', '1', '1'),
(1, 55, '1', '1', '1'),
(1, 54, '1', '1', '1'),
(1, 36, '1', '1', '1'),
(1, 29, '1', '1', '1'),
(1, 56, '1', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `IdServicios` int(11) NOT NULL,
  `NombreServicios` varchar(50) NOT NULL,
  `ImpuestoServicios` double NOT NULL,
  `ValorServicios` decimal(25,0) NOT NULL,
  `ObservacionesServicios` varchar(120) DEFAULT NULL,
  `DescripcionServicios` varchar(120) DEFAULT NULL,
  `IdServicioTipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`IdServicios`, `NombreServicios`, `ImpuestoServicios`, `ValorServicios`, `ObservacionesServicios`, `DescripcionServicios`, `IdServicioTipo`) VALUES
(1, 'DESAYUNO', 0, 8000, 'NINGUNA', 'CALDO DE COSTILLA Y HUEVOS AL GUSTO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciotipo`
--

CREATE TABLE `serviciotipo` (
  `IdServicioTipo` int(11) NOT NULL,
  `NombreServicioTipo` varchar(50) NOT NULL,
  `ObservicioServicioTipo` varchar(200) NOT NULL,
  `ImpuestoServicioTipo` double NOT NULL,
  `CentroContableServicioTipo` varchar(50) NOT NULL,
  `CuentaContableServicioTipo` varchar(50) NOT NULL,
  `ConceptoContableServicioTipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `serviciotipo`
--

INSERT INTO `serviciotipo` (`IdServicioTipo`, `NombreServicioTipo`, `ObservicioServicioTipo`, `ImpuestoServicioTipo`, `CentroContableServicioTipo`, `CuentaContableServicioTipo`, `ConceptoContableServicioTipo`) VALUES
(1, 'Restaurante', 'ninguno', 0, '', '9', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terceros`
--

CREATE TABLE `terceros` (
  `id_tercero` int(11) NOT NULL,
  `nombre1` varchar(50) NOT NULL,
  `nombre2` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `razonsocial` varchar(200) DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `celular` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `web` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipodoc` varchar(40) NOT NULL,
  `cedulanit` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `codver` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `depto` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mnpio` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `persona` varchar(11) DEFAULT NULL,
  `regimen` varchar(11) DEFAULT NULL,
  `cliente` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proveedor` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `empleado` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `estado` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `terceros`
--

INSERT INTO `terceros` (`id_tercero`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `razonsocial`, `direccion`, `telefono`, `celular`, `email`, `web`, `tipodoc`, `cedulanit`, `codver`, `depto`, `mnpio`, `persona`, `regimen`, `cliente`, `proveedor`, `empleado`, `estado`) VALUES
(1, '', '', '', '', 'AGROVIZCAYA SAS', 'CARRERA 17B #2-102 ', '3133085491', '3133085491', 'rafaelvizcaya@hotmail.com', '', 'NIT', '901156911', '', '20', '20', '2', '', '', '1', '', 'S'),
(2, '', '', '', '', 'ITALCOL SAS', 'KM 7 VIA ACACIAS', '0986703483', '', '', 'WWW.ITALCOL.COM', 'NIT', '860026895', '', '20', '20', '2', '', '', '1', '', 'S'),
(0, 'JAIR', '', 'sadaa', '', '', 'KM 1 GUAYURIBA', '324422', '3138415972', 'EVA@GMAIL.COM', '', 'CEDULA DE CIUDADANIA', '86070388', '', '', '', '', '', '1', '', '1', 'S'),
(0, 'juan', '', 'nnnnn', '', '', 'KM 1 GUAYURIBA', '31225544', '3138415972', 'ingjacavi@gmail.com', '', 'CEDULA DE CIUDADANIA', '123456', '', '', '', '', '', '1', '', '1', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terceros_nomina`
--

CREATE TABLE `terceros_nomina` (
  `cedulanit` varchar(50) NOT NULL,
  `fechaing` date NOT NULL,
  `fechanac` date NOT NULL,
  `eps` varchar(30) NOT NULL,
  `arp` varchar(30) NOT NULL,
  `afp` varchar(30) NOT NULL,
  `fondocesantias` varchar(30) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `asignacion` double NOT NULL,
  `arl` varchar(4) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `cajacompensacion` varchar(4) NOT NULL,
  `tipoarl` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `terceros_nomina`
--

INSERT INTO `terceros_nomina` (`cedulanit`, `fechaing`, `fechanac`, `eps`, `arp`, `afp`, `fondocesantias`, `cargo`, `asignacion`, `arl`, `estado`, `cajacompensacion`, `tipoarl`) VALUES
('86070388', '2022-11-02', '2022-11-08', '1', '1', '1', '', '', 0, '1', 'S', '1', '3'),
('123456', '2022-11-01', '2022-11-28', '1', '1', '1', '', '0', 0, '1', 'S', '1', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipobienes`
--

CREATE TABLE `tipobienes` (
  `IdTipoBienes` int(11) NOT NULL,
  `NombreTipoBienes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_comprobantes`
--

CREATE TABLE `tipos_comprobantes` (
  `id_comprobante` int(11) NOT NULL,
  `nombre_comprobante` varchar(300) DEFAULT NULL,
  `eatado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_comprobantes`
--

INSERT INTO `tipos_comprobantes` (`id_comprobante`, `nombre_comprobante`, `eatado`) VALUES
(1, 'Comprobante Manual', 'S'),
(2, 'Comprobante Compras', 'S'),
(3, 'Comprobante Ventas', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tomainventarios`
--

CREATE TABLE `tomainventarios` (
  `idtoma` double NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `centrocosto` varchar(4) NOT NULL,
  `grupo` varchar(4) DEFAULT NULL,
  `subgrupo` varchar(4) DEFAULT NULL,
  `clasifica` varchar(4) DEFAULT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tomainventarios_det`
--

CREATE TABLE `tomainventarios_det` (
  `idtoma_det` double NOT NULL,
  `idtoma` double NOT NULL,
  `codarticulo` varchar(20) NOT NULL,
  `nomarticulo` varchar(100) NOT NULL,
  `unidad` varchar(100) NOT NULL,
  `saldo` float NOT NULL,
  `fisico` float NOT NULL,
  `diferencia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferenciacomporbanteingreso`
--

CREATE TABLE `transferenciacomporbanteingreso` (
  `IdTransferencia` int(11) NOT NULL,
  `IdMovimientoReceptorTransferencia` int(11) NOT NULL,
  `ValorTransferencia` decimal(25,0) NOT NULL,
  `FechaTransferencia` datetime NOT NULL,
  `IdMovimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslados`
--

CREATE TABLE `traslados` (
  `idtraslado` int(11) NOT NULL,
  `idrequisicion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idusuario` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslados_detalle`
--

CREATE TABLE `traslados_detalle` (
  `iddetalle` double NOT NULL,
  `idtraslado` int(11) NOT NULL,
  `idarticulo` varchar(20) NOT NULL,
  `cantidad` float NOT NULL,
  `unidad` varchar(4) NOT NULL,
  `vu` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL COMMENT 'Identificador de usuarios',
  `nombre` varchar(20) NOT NULL COMMENT 'Nombre del usuario a registrar\r\n',
  `apellido` varchar(20) NOT NULL COMMENT 'Apellido del usuario a registrar',
  `tipo_documento` varchar(10) NOT NULL COMMENT 'Tipo de documento del usuario a registrar',
  `documento` varchar(20) NOT NULL COMMENT 'Numero de documento del usuario a registrar',
  `telefono` varchar(20) NOT NULL COMMENT 'Numero de telefono del usuario a registrar',
  `correo` varchar(50) NOT NULL COMMENT 'Direccion de correo electronico del usuario a registrar',
  `cargo` varchar(50) NOT NULL COMMENT 'Cargo en la empresa del usuario a registrar',
  `usuario` varchar(20) NOT NULL COMMENT 'Credencial del usuario para iniciar sesion',
  `contrasena` varchar(250) NOT NULL COMMENT 'Contraseña para iniciar sesion',
  `id_perfil` int(11) NOT NULL COMMENT 'Identificador del perfil al que corresponde'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `tipo_documento`, `documento`, `telefono`, `correo`, `cargo`, `usuario`, `contrasena`, `id_perfil`) VALUES
(18, 'JUAN', 'PEREZ', '1', '123456789', '666', 'INGJQ@FF.COM', 'DDD', 'ADMIN', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_basesdatos`
--

CREATE TABLE `usuarios_basesdatos` (
  `IdUsuario` int(11) NOT NULL,
  `IdBases` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_basesdatos`
--

INSERT INTO `usuarios_basesdatos` (`IdUsuario`, `IdBases`) VALUES
(1, 1),
(2, 1),
(8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_roles`
--

CREATE TABLE `usuarios_roles` (
  `IdUsuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_roles`
--

INSERT INTO `usuarios_roles` (`IdUsuario`, `id_rol`) VALUES
(1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `analisiscarnico_cab`
--
ALTER TABLE `analisiscarnico_cab`
  ADD PRIMARY KEY (`idanalisis`);

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`CodArticulo`);

--
-- Indices de la tabla `comprobante_cab`
--
ALTER TABLE `comprobante_cab`
  ADD PRIMARY KEY (`num_comprobante`,`tipo_comprobante`);

--
-- Indices de la tabla `comprobante_det`
--
ALTER TABLE `comprobante_det`
  ADD PRIMARY KEY (`id_det`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`idopcion`);

--
-- Indices de la tabla `puc`
--
ALTER TABLE `puc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_comprobantes`
--
ALTER TABLE `tipos_comprobantes`
  ADD PRIMARY KEY (`id_comprobante`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comprobante_det`
--
ALTER TABLE `comprobante_det`
  MODIFY `id_det` double NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puc`
--
ALTER TABLE `puc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2503;

--
-- AUTO_INCREMENT de la tabla `tipos_comprobantes`
--
ALTER TABLE `tipos_comprobantes`
  MODIFY `id_comprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de usuarios', AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

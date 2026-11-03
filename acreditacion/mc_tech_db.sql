-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2026 a las 02:37:31
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
-- Base de datos: `mc_tech_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `usuario`, `password`, `creado_en`) VALUES
(1, 'admin', 'admin123', '2026-11-02 19:44:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `asunto` varchar(150) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `leida` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id`, `nombre`, `email`, `telefono`, `asunto`, `mensaje`, `fecha`, `leida`) VALUES
(1, 'Juan Pérez', 'juan.perez@mail.com', '3815551234', 'Consulta por reparación', 'Hola, tengo una notebook que no enciende. ¿Cuánto sale el diagnóstico?', '2026-11-02 19:44:25', 0),
(2, 'María Gómez', 'maria.gomez@mail.com', NULL, 'Presupuesto red', 'Necesito armar una red para una oficina de 8 puestos. ¿Me pueden pasar un presupuesto?', '2026-11-02 19:44:25', 1),
(3, 'Carlos Ruiz', 'carlos.ruiz@mail.com', '3814449876', 'Sitio web para mi negocio', 'Quiero una página web para mi panadería con catálogo y formulario de contacto.', '2026-11-02 19:44:25', 0),
(4, 'Quezada Franco', 'Quezadafran98@gmail.com', NULL, 'Consulta desde la portada', 'nose la verda', '2026-11-02 22:35:57', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `icono` varchar(50) DEFAULT 'fa-microchip',
  `precio` decimal(10,2) DEFAULT NULL,
  `consultar` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `icono`, `precio`, `consultar`) VALUES
(1, 'Reparación de PC', 'Diagnóstico, limpieza, cambio de componentes y optimización del sistema operativo.', 'fa-tools', NULL, 1),
(2, 'Instalación de Redes', 'Cableado estructurado, configuración de routers y switches, Wi-Fi empresarial.', 'fa-network-wired', 15000.00, 0),
(3, 'Soporte Técnico Remoto', 'Asistencia a distancia para software, configuración y resolución de problemas.', 'fa-headset', 5000.00, 0),
(4, 'Desarrollo Web', 'Sitios corporativos, landing pages y aplicaciones web a medida.', 'fa-code', NULL, 1),
(5, 'Mantenimiento Preventivo', 'Revisión periódica de equipos para evitar fallas y pérdida de datos.', 'fa-shield-halved', 8000.00, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

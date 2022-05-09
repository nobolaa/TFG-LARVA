-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2020 a las 19:20:02
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `larva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `idConfig` int(20) NOT NULL,
  `asignatura` enum('DBA','MP') COLLATE utf8_unicode_ci NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT current_timestamp(),
  `titulo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `autor` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` enum('Grupal','Individual') COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `resumen` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`idConfig`, `asignatura`, `fechaAlta`, `titulo`, `autor`, `email`, `tipo`, `descripcion`, `resumen`, `img`) VALUES
(1, 'DBA', '2020-05-12 20:22:58', 'Práctica 2', 'Luis Castillo Vidal', 'L.Castillo@decsai.ugr.es', 'Grupal', 'Esta práctica consiste en realizar una primera implementación de agentes simples en la que se va a poner especial énfasis en la capacidad de resolución de problemas y autonomía de un agente en un entorno estable.', 'Definiendo el entorno para el agente', 'img/proyectos/p2.png'),
(2, 'DBA', '2019-09-26 17:57:08', 'Goku', 'Luis Castillo Vidal', 'L.Castillo@decsai.ugr.es', 'Individual', 'Enviar un mensaje de saludo a Goku', 'Primer contacto con magentix', 'img/proyectos/goku.png'),
(3, 'DBA', '2020-08-11 13:55:13', 'Songoanda', 'Luis Castillo Vidal', 'L.Castillo@decsai.ugr.es', 'Individual', 'Tener un corto diálogo con Songoanda.', 'Segundo contacto con Magentix', 'img/proyectos/3_proyectos_songoanda.png'),
(4, 'DBA', '2020-08-11 14:44:13', 'Práctica 3', 'Luis Castillo Vidal', 'L.Castillo@decsai.ugr.es', 'Grupal', 'Esta práctica consiste en la implementación de un equipo de agentes heterogéneos  en la que se va a poner especial énfasis en la capacidad de auto-organización del equipo de agentes para distribuir sus objetivos y en su capacidad de gestionar recursos compartidos de forma que colaboren en un objetivo común.', 'Usando comunicación entre agentes', 'img/proyectos/4_proyectos_p3.png'),
(5, 'DBA', '2020-08-11 15:14:01', 'Hackaton Jake', 'Luis Castillo Vidal', 'L.Castillo@decsai.ugr.es', 'Individual', 'Construir un agente que sea capaz de adivinar un número secreto que ha creado un agente llamado “Jake” en una plataforma exterior-', 'Hackaton para el primer grupo.', 'img/proyectos/5_proyectos_hackaton.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_hito`
--

CREATE TABLE `conf_hito` (
  `idConfig` int(20) NOT NULL,
  `idHito` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `conf_hito`
--

INSERT INTO `conf_hito` (`idConfig`, `idHito`) VALUES
(1, 'Best solution'),
(1, 'First message'),
(1, 'First success'),
(1, 'Last message'),
(1, 'Latency'),
(1, 'Messages received'),
(1, 'ProgressP2'),
(1, 'Software exceptions'),
(2, 'First message'),
(2, 'First success'),
(2, 'Last message'),
(2, 'Messages received'),
(2, 'ProgressTriple'),
(2, 'Software exceptions'),
(3, 'Feature'),
(3, 'First message'),
(3, 'First success'),
(3, 'Last message'),
(3, 'Messages received'),
(3, 'ProgressTriple'),
(3, 'Software exceptions'),
(4, 'First full rescue'),
(4, 'First message'),
(4, 'First rescue'),
(4, 'LatencyR'),
(4, 'Messages received'),
(4, 'ProgressP3'),
(4, 'Rescue'),
(5, 'First message'),
(5, 'First success'),
(5, 'Last message'),
(5, 'Messages received'),
(5, 'ProgressTriple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_hito_insig`
--

CREATE TABLE `conf_hito_insig` (
  `idConfig` int(20) NOT NULL,
  `idHito` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `idInsignia` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `conf_hito_insig`
--

INSERT INTO `conf_hito_insig` (`idConfig`, `idHito`, `idInsignia`) VALUES
(1, 'Best solution', 'Shortest'),
(1, 'First success', 'Early bird'),
(1, 'Latency', 'Flash'),
(2, 'First success', 'Early bird'),
(3, 'First success', 'Early bird'),
(3, 'Messages received', 'Verbose'),
(4, 'First full rescue', 'Early bird'),
(4, 'First rescue', 'Early Rescue'),
(4, 'LatencyR', 'Flash'),
(4, 'Rescue', 'Rescue'),
(5, 'First success', 'Early bird');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_grupo`
--

CREATE TABLE `datos_grupo` (
  `idProyecto` int(20) NOT NULL,
  `idDatos` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `datos` longtext COLLATE utf8_unicode_ci NOT NULL,
  `idGrupo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `curso` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `datos_grupo`
--

INSERT INTO `datos_grupo` (`idProyecto`, `idDatos`, `datos`, `idGrupo`, `curso`) VALUES
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"05/11/2019_18:54:43\",\"Best solution\":140,\"Latency\":\"008:29:52\",\"Messages received\":1650,\"First message\":\"05/11/2019_10:24:51\",\"Last message\":\"10/11/2019_23:20:48\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"29/10/2019_10:43:08\",\"Best solution\":148,\"Latency\":\"286:45:25\",\"Messages received\":10150,\"First message\":\"17/10/2019_11:57:43\",\"Last message\":\"10/11/2019_15:18:51\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"23/10/2019_19:27:03\",\"Best solution\":155,\"Latency\":\"000:00:18\",\"Messages received\":4728,\"First message\":\"23/10/2019_19:26:45\",\"Last message\":\"06/11/2019_18:38:38\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"17/10/2019_01:20:58\",\"Best solution\":158,\"Latency\":\"001:36:40\",\"Messages received\":4515,\"First message\":\"16/10/2019_23:44:18\",\"Last message\":\"02/11/2019_14:58:12\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"28/10/2019_02:10:41\",\"Best solution\":140,\"Latency\":\"143:20:43\",\"Messages received\":13987,\"First message\":\"22/10/2019_02:49:58\",\"Last message\":\"11/11/2019_01:04:31\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"15/10/2019_11:01:54\",\"Best solution\":158,\"Latency\":\"016:46:11\",\"Messages received\":1537,\"First message\":\"14/10/2019_18:15:43\",\"Last message\":\"10/11/2019_22:31:22\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"21/10/2019_13:46:18\",\"Best solution\":158,\"Latency\":\"000:00:05\",\"Messages received\":1117,\"First message\":\"21/10/2019_13:46:13\",\"Last message\":\"08/11/2019_15:18:47\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"09/11/2019_01:24:56\",\"Best solution\":140,\"Latency\":\"206:48:43\",\"Messages received\":2089,\"First message\":\"31/10/2019_10:36:13\",\"Last message\":\"10/11/2019_18:07:36\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"28/10/2019_09:56:17\",\"Best solution\":160,\"Latency\":\"283:10:15\",\"Messages received\":12265,\"First message\":\"16/10/2019_14:46:02\",\"Last message\":\"10/11/2019_20:22:40\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"24/10/2019_23:06:31\",\"Best solution\":168,\"Latency\":\"181:35:12\",\"Messages received\":3956,\"First message\":\"17/10/2019_09:31:19\",\"Last message\":\"07/11/2019_21:31:16\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"23/10/2019_10:23:00\",\"Best solution\":152,\"Latency\":\"039:47:40\",\"Messages received\":2196,\"First message\":\"21/10/2019_18:35:20\",\"Last message\":\"05/11/2019_10:15:59\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map1', '{\"id\":\"map1\",\"ProgressP2\":100,\"First success\":\"08/11/2019_06:44:38\",\"Best solution\":151,\"Latency\":\"008:47:54\",\"Messages received\":542,\"First message\":\"07/11/2019_21:56:44\",\"Last message\":\"10/11/2019_08:31:13\",\"Software exceptions\":-1}', 'N', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":30068,\"First message\":\"07/11/2019_11:35:00\",\"Last message\":\"07/11/2019_20:41:44\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":6348,\"First message\":\"29/10/2019_12:51:57\",\"Last message\":\"10/11/2019_15:36:47\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":21771,\"First message\":\"25/10/2019_16:28:45\",\"Last message\":\"06/11/2019_19:27:15\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":58194,\"First message\":\"15/10/2019_00:46:16\",\"Last message\":\"05/11/2019_11:53:37\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":52265,\"First message\":\"28/10/2019_10:08:13\",\"Last message\":\"10/11/2019_22:22:59\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":62653,\"First message\":\"15/10/2019_11:07:34\",\"Last message\":\"10/11/2019_22:45:43\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":11259,\"First message\":\"05/11/2019_22:12:18\",\"Last message\":\"07/11/2019_10:11:10\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":-1,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":8733,\"First message\":\"31/10/2019_10:21:18\",\"Last message\":\"09/11/2019_01:14:05\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":1206,\"First message\":\"07/11/2019_09:51:12\",\"Last message\":\"07/11/2019_10:51:09\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":16183,\"First message\":\"04/11/2019_17:18:44\",\"Last message\":\"09/11/2019_00:38:54\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map10', '{\"id\":\"map10\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":32059,\"First message\":\"10/11/2019_19:13:30\",\"Last message\":\"10/11/2019_20:30:41\",\"Software exceptions\":-1}', 'N', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"05/11/2019_19:06:45\",\"Best solution\":138,\"Latency\":\"000:06:57\",\"Messages received\":1621,\"First message\":\"05/11/2019_18:59:48\",\"Last message\":\"10/11/2019_23:22:40\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"29/10/2019_10:45:53\",\"Best solution\":141,\"Latency\":\"286:28:27\",\"Messages received\":3773,\"First message\":\"17/10/2019_12:17:26\",\"Last message\":\"10/11/2019_15:20:17\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"23/10/2019_19:27:32\",\"Best solution\":141,\"Latency\":\"000:00:18\",\"Messages received\":3058,\"First message\":\"23/10/2019_19:27:14\",\"Last message\":\"06/11/2019_18:39:19\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"17/10/2019_01:21:27\",\"Best solution\":138,\"Latency\":\"000:00:10\",\"Messages received\":1946,\"First message\":\"17/10/2019_01:21:17\",\"Last message\":\"02/11/2019_14:58:52\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"28/10/2019_02:11:26\",\"Best solution\":137,\"Latency\":\"001:08:54\",\"Messages received\":4371,\"First message\":\"28/10/2019_01:02:32\",\"Last message\":\"11/11/2019_01:05:00\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"15/10/2019_11:03:10\",\"Best solution\":140,\"Latency\":\"000:00:04\",\"Messages received\":564,\"First message\":\"15/10/2019_11:03:06\",\"Last message\":\"10/11/2019_22:31:45\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"21/10/2019_13:45:22\",\"Best solution\":138,\"Latency\":\"000:00:05\",\"Messages received\":419,\"First message\":\"21/10/2019_13:45:17\",\"Last message\":\"08/11/2019_15:19:32\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"09/11/2019_01:30:58\",\"Best solution\":138,\"Latency\":\"000:00:12\",\"Messages received\":834,\"First message\":\"09/11/2019_01:30:46\",\"Last message\":\"10/11/2019_17:45:50\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"28/10/2019_09:57:11\",\"Best solution\":140,\"Latency\":\"262:12:01\",\"Messages received\":3259,\"First message\":\"17/10/2019_11:45:10\",\"Last message\":\"10/11/2019_20:23:44\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"29/10/2019_10:30:20\",\"Best solution\":153,\"Latency\":\"287:53:02\",\"Messages received\":1752,\"First message\":\"17/10/2019_10:37:18\",\"Last message\":\"07/11/2019_21:32:16\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"23/10/2019_17:43:24\",\"Best solution\":138,\"Latency\":\"000:00:04\",\"Messages received\":560,\"First message\":\"23/10/2019_17:43:20\",\"Last message\":\"04/11/2019_17:22:42\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map2', '{\"id\":\"map2\",\"ProgressP2\":100,\"First success\":\"08/11/2019_06:44:00\",\"Best solution\":138,\"Latency\":\"002:07:12\",\"Messages received\":687,\"First message\":\"08/11/2019_04:36:48\",\"Last message\":\"10/11/2019_08:32:22\",\"Software exceptions\":-1}', 'N', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"06/11/2019_20:23:09\",\"Best solution\":287,\"Latency\":\"025:15:05\",\"Messages received\":4920,\"First message\":\"05/11/2019_19:08:04\",\"Last message\":\"10/11/2019_23:23:54\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"29/10/2019_12:30:46\",\"Best solution\":310,\"Latency\":\"288:09:58\",\"Messages received\":9784,\"First message\":\"17/10/2019_12:20:48\",\"Last message\":\"10/11/2019_15:21:42\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"23/10/2019_19:54:23\",\"Best solution\":259,\"Latency\":\"000:26:36\",\"Messages received\":6216,\"First message\":\"23/10/2019_19:27:47\",\"Last message\":\"06/11/2019_18:39:50\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"17/10/2019_01:32:11\",\"Best solution\":255,\"Latency\":\"000:10:35\",\"Messages received\":4633,\"First message\":\"17/10/2019_01:21:36\",\"Last message\":\"02/11/2019_14:59:35\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"28/10/2019_10:06:17\",\"Best solution\":255,\"Latency\":\"008:52:43\",\"Messages received\":10158,\"First message\":\"28/10/2019_01:13:34\",\"Last message\":\"11/11/2019_01:00:48\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"15/10/2019_11:40:34\",\"Best solution\":261,\"Latency\":\"000:37:07\",\"Messages received\":1109,\"First message\":\"15/10/2019_11:03:27\",\"Last message\":\"10/11/2019_22:32:21\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"21/10/2019_13:49:48\",\"Best solution\":257,\"Latency\":\"000:00:08\",\"Messages received\":1110,\"First message\":\"21/10/2019_13:49:40\",\"Last message\":\"08/11/2019_15:20:37\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"09/11/2019_02:51:04\",\"Best solution\":253,\"Latency\":\"001:19:55\",\"Messages received\":3798,\"First message\":\"09/11/2019_01:31:09\",\"Last message\":\"10/11/2019_17:46:26\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"31/10/2019_09:50:48\",\"Best solution\":259,\"Latency\":\"071:53:14\",\"Messages received\":11041,\"First message\":\"28/10/2019_09:57:34\",\"Last message\":\"10/11/2019_20:24:29\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"29/10/2019_10:10:07\",\"Best solution\":343,\"Latency\":\"287:32:38\",\"Messages received\":1050,\"First message\":\"17/10/2019_10:37:29\",\"Last message\":\"07/11/2019_21:38:52\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"23/10/2019_17:44:15\",\"Best solution\":255,\"Latency\":\"000:00:07\",\"Messages received\":809,\"First message\":\"23/10/2019_17:44:08\",\"Last message\":\"04/11/2019_17:23:18\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map3', '{\"id\":\"map3\",\"ProgressP2\":100,\"First success\":\"10/11/2019_08:33:10\",\"Best solution\":290,\"Latency\":\"051:33:31\",\"Messages received\":2425,\"First message\":\"08/11/2019_04:59:39\",\"Last message\":\"10/11/2019_19:43:48\",\"Software exceptions\":-1}', 'N', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"06/11/2019_18:00:35\",\"Best solution\":261,\"Latency\":\"000:06:51\",\"Messages received\":3763,\"First message\":\"06/11/2019_17:53:44\",\"Last message\":\"10/11/2019_23:43:25\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"29/10/2019_12:31:51\",\"Best solution\":275,\"Latency\":\"000:00:08\",\"Messages received\":4389,\"First message\":\"29/10/2019_12:31:43\",\"Last message\":\"10/11/2019_15:23:02\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"23/10/2019_19:55:17\",\"Best solution\":249,\"Latency\":\"000:00:28\",\"Messages received\":4664,\"First message\":\"23/10/2019_19:54:49\",\"Last message\":\"06/11/2019_18:40:21\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"17/10/2019_01:35:54\",\"Best solution\":262,\"Latency\":\"000:00:20\",\"Messages received\":2672,\"First message\":\"17/10/2019_01:35:34\",\"Last message\":\"28/10/2019_16:31:29\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"28/10/2019_10:06:40\",\"Best solution\":242,\"Latency\":\"144:31:17\",\"Messages received\":10168,\"First message\":\"22/10/2019_09:35:23\",\"Last message\":\"11/11/2019_00:59:48\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"15/10/2019_11:04:10\",\"Best solution\":268,\"Latency\":\"000:00:09\",\"Messages received\":1938,\"First message\":\"15/10/2019_11:04:01\",\"Last message\":\"10/11/2019_22:32:59\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"21/10/2019_13:50:31\",\"Best solution\":268,\"Latency\":\"000:00:08\",\"Messages received\":847,\"First message\":\"21/10/2019_13:50:23\",\"Last message\":\"08/11/2019_15:21:17\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"09/11/2019_02:52:08\",\"Best solution\":245,\"Latency\":\"000:00:20\",\"Messages received\":1452,\"First message\":\"09/11/2019_02:51:48\",\"Last message\":\"10/11/2019_17:47:00\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"31/10/2019_10:52:16\",\"Best solution\":264,\"Latency\":\"072:34:48\",\"Messages received\":6078,\"First message\":\"28/10/2019_10:17:28\",\"Last message\":\"10/11/2019_20:25:02\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"29/10/2019_15:16:35\",\"Best solution\":302,\"Latency\":\"112:05:45\",\"Messages received\":30128,\"First message\":\"24/10/2019_23:10:50\",\"Last message\":\"07/11/2019_22:44:37\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"23/10/2019_18:09:23\",\"Best solution\":260,\"Latency\":\"000:00:07\",\"Messages received\":16436,\"First message\":\"23/10/2019_18:09:16\",\"Last message\":\"04/11/2019_17:24:10\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map4', '{\"id\":\"map4\",\"ProgressP2\":100,\"First success\":\"10/11/2019_10:01:43\",\"Best solution\":285,\"Latency\":\"050:17:34\",\"Messages received\":9073,\"First message\":\"08/11/2019_07:44:09\",\"Last message\":\"10/11/2019_19:21:45\",\"Software exceptions\":-1}', 'N', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"07/11/2019_10:39:41\",\"Best solution\":602,\"Latency\":\"016:38:07\",\"Messages received\":9764,\"First message\":\"06/11/2019_18:01:34\",\"Last message\":\"10/11/2019_23:46:04\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"29/10/2019_12:32:37\",\"Best solution\":636,\"Latency\":\"000:00:17\",\"Messages received\":7463,\"First message\":\"29/10/2019_12:32:20\",\"Last message\":\"10/11/2019_15:24:36\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"23/10/2019_19:58:30\",\"Best solution\":590,\"Latency\":\"000:02:58\",\"Messages received\":10611,\"First message\":\"23/10/2019_19:55:32\",\"Last message\":\"06/11/2019_18:41:30\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"17/10/2019_14:27:08\",\"Best solution\":564,\"Latency\":\"012:51:04\",\"Messages received\":18150,\"First message\":\"17/10/2019_01:36:04\",\"Last message\":\"28/10/2019_16:32:39\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"28/10/2019_10:05:18\",\"Best solution\":555,\"Latency\":\"009:00:17\",\"Messages received\":50847,\"First message\":\"28/10/2019_01:05:01\",\"Last message\":\"10/11/2019_20:21:23\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"21/10/2019_12:26:12\",\"Best solution\":610,\"Latency\":\"145:21:48\",\"Messages received\":21410,\"First message\":\"15/10/2019_11:04:24\",\"Last message\":\"10/11/2019_22:34:12\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"21/10/2019_14:09:17\",\"Best solution\":558,\"Latency\":\"000:18:15\",\"Messages received\":4867,\"First message\":\"21/10/2019_13:51:02\",\"Last message\":\"08/11/2019_15:22:22\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"09/11/2019_02:52:59\",\"Best solution\":560,\"Latency\":\"000:00:40\",\"Messages received\":2254,\"First message\":\"09/11/2019_02:52:19\",\"Last message\":\"10/11/2019_17:47:53\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"02/11/2019_20:09:35\",\"Best solution\":562,\"Latency\":\"128:05:31\",\"Messages received\":18466,\"First message\":\"28/10/2019_12:04:04\",\"Last message\":\"10/11/2019_20:42:19\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"29/10/2019_15:19:35\",\"Best solution\":648,\"Latency\":\"112:08:17\",\"Messages received\":21296,\"First message\":\"24/10/2019_23:11:18\",\"Last message\":\"08/11/2019_20:03:02\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"23/10/2019_17:52:03\",\"Best solution\":556,\"Latency\":\"000:07:25\",\"Messages received\":6244,\"First message\":\"23/10/2019_17:44:38\",\"Last message\":\"04/11/2019_17:25:08\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map5', '{\"id\":\"map5\",\"ProgressP2\":100,\"First success\":\"10/11/2019_08:22:45\",\"Best solution\":564,\"Latency\":\"048:35:58\",\"Messages received\":3434,\"First message\":\"08/11/2019_07:46:47\",\"Last message\":\"10/11/2019_10:17:16\",\"Software exceptions\":-1}', 'N', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"07/11/2019_11:27:38\",\"Best solution\":142,\"Latency\":\"000:00:09\",\"Messages received\":580,\"First message\":\"07/11/2019_11:27:29\",\"Last message\":\"07/11/2019_19:01:07\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"05/11/2019_13:20:27\",\"Best solution\":142,\"Latency\":\"168:41:22\",\"Messages received\":6867,\"First message\":\"29/10/2019_12:39:05\",\"Last message\":\"10/11/2019_15:25:44\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"25/10/2019_16:26:40\",\"Best solution\":119,\"Latency\":\"044:27:05\",\"Messages received\":3569,\"First message\":\"23/10/2019_19:59:35\",\"Last message\":\"06/11/2019_18:41:51\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"23/10/2019_10:50:38\",\"Best solution\":133,\"Latency\":\"153:05:31\",\"Messages received\":18750,\"First message\":\"17/10/2019_01:45:07\",\"Last message\":\"31/10/2019_12:25:14\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"01/11/2019_20:53:11\",\"Best solution\":117,\"Latency\":\"106:46:20\",\"Messages received\":43672,\"First message\":\"28/10/2019_10:06:51\",\"Last message\":\"11/11/2019_00:26:10\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"15/10/2019_11:44:44\",\"Best solution\":119,\"Latency\":\"000:38:34\",\"Messages received\":574,\"First message\":\"15/10/2019_11:06:10\",\"Last message\":\"10/11/2019_22:34:37\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"28/10/2019_12:22:12\",\"Best solution\":121,\"Latency\":\"000:56:53\",\"Messages received\":9254,\"First message\":\"28/10/2019_11:25:19\",\"Last message\":\"08/11/2019_15:25:42\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"09/11/2019_13:26:53\",\"Best solution\":129,\"Latency\":\"000:15:50\",\"Messages received\":12333,\"First message\":\"09/11/2019_13:11:03\",\"Last message\":\"10/11/2019_17:51:18\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"07/11/2019_08:54:46\",\"Best solution\":122,\"Latency\":\"166:38:15\",\"Messages received\":7406,\"First message\":\"31/10/2019_10:16:31\",\"Last message\":\"10/11/2019_20:42:39\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"29/10/2019_15:40:00\",\"Best solution\":161,\"Latency\":\"000:00:04\",\"Messages received\":495,\"First message\":\"29/10/2019_15:39:56\",\"Last message\":\"08/11/2019_20:04:12\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"31/10/2019_11:10:14\",\"Best solution\":119,\"Latency\":\"064:30:34\",\"Messages received\":10800,\"First message\":\"28/10/2019_18:39:40\",\"Last message\":\"09/11/2019_00:24:27\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map6', '{\"id\":\"map6\",\"ProgressP2\":100,\"First success\":\"10/11/2019_19:37:57\",\"Best solution\":121,\"Latency\":\"010:58:40\",\"Messages received\":2698,\"First message\":\"10/11/2019_08:39:17\",\"Last message\":\"10/11/2019_19:37:57\",\"Software exceptions\":-1}', 'N', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"07/11/2019_11:28:22\",\"Best solution\":271,\"Latency\":\"000:00:19\",\"Messages received\":1620,\"First message\":\"07/11/2019_11:28:03\",\"Last message\":\"09/11/2019_13:51:02\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"07/11/2019_20:34:43\",\"Best solution\":312,\"Latency\":\"223:58:08\",\"Messages received\":36575,\"First message\":\"29/10/2019_12:36:35\",\"Last message\":\"10/11/2019_15:27:03\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"25/10/2019_16:27:15\",\"Best solution\":247,\"Latency\":\"000:00:29\",\"Messages received\":3877,\"First message\":\"25/10/2019_16:26:46\",\"Last message\":\"06/11/2019_19:25:59\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"22/10/2019_23:13:31\",\"Best solution\":257,\"Latency\":\"141:27:33\",\"Messages received\":1273,\"First message\":\"17/10/2019_01:45:58\",\"Last message\":\"05/11/2019_10:00:50\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"01/11/2019_20:55:47\",\"Best solution\":228,\"Latency\":\"106:48:10\",\"Messages received\":41285,\"First message\":\"28/10/2019_10:07:37\",\"Last message\":\"11/11/2019_01:03:16\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"15/10/2019_11:06:41\",\"Best solution\":258,\"Latency\":\"000:00:07\",\"Messages received\":1699,\"First message\":\"15/10/2019_11:06:34\",\"Last message\":\"10/11/2019_22:35:16\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"28/10/2019_12:22:37\",\"Best solution\":227,\"Latency\":\"001:01:07\",\"Messages received\":7991,\"First message\":\"28/10/2019_11:21:30\",\"Last message\":\"08/11/2019_15:26:15\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"09/11/2019_21:23:05\",\"Best solution\":278,\"Latency\":\"007:49:56\",\"Messages received\":3084,\"First message\":\"09/11/2019_13:33:09\",\"Last message\":\"10/11/2019_17:51:55\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"07/11/2019_08:55:38\",\"Best solution\":228,\"Latency\":\"166:38:05\",\"Messages received\":42453,\"First message\":\"31/10/2019_10:17:33\",\"Last message\":\"10/11/2019_20:43:17\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"29/10/2019_15:40:23\",\"Best solution\":320,\"Latency\":\"000:00:10\",\"Messages received\":2584,\"First message\":\"29/10/2019_15:40:13\",\"Last message\":\"08/11/2019_20:04:38\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"31/10/2019_11:22:52\",\"Best solution\":227,\"Latency\":\"000:00:04\",\"Messages received\":724,\"First message\":\"31/10/2019_11:22:48\",\"Last message\":\"09/11/2019_00:28:20\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map7', '{\"id\":\"map7\",\"ProgressP2\":100,\"First success\":\"10/11/2019_10:13:55\",\"Best solution\":621,\"Latency\":\"001:33:33\",\"Messages received\":780,\"First message\":\"10/11/2019_08:40:22\",\"Last message\":\"10/11/2019_10:13:55\",\"Software exceptions\":-1}', 'N', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"07/11/2019_12:08:16\",\"Best solution\":111,\"Latency\":\"000:39:38\",\"Messages received\":1193,\"First message\":\"07/11/2019_11:28:38\",\"Last message\":\"07/11/2019_19:30:58\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"09/11/2019_18:14:57\",\"Best solution\":137,\"Latency\":\"269:35:57\",\"Messages received\":5682,\"First message\":\"29/10/2019_12:39:00\",\"Last message\":\"10/11/2019_21:47:34\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"25/10/2019_16:27:29\",\"Best solution\":80,\"Latency\":\"000:00:07\",\"Messages received\":1781,\"First message\":\"25/10/2019_16:27:22\",\"Last message\":\"06/11/2019_18:52:36\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"23/10/2019_13:41:20\",\"Best solution\":109,\"Latency\":\"155:54:38\",\"Messages received\":1406,\"First message\":\"17/10/2019_01:46:42\",\"Last message\":\"28/10/2019_16:34:28\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"01/11/2019_20:56:24\",\"Best solution\":87,\"Latency\":\"106:48:39\",\"Messages received\":13303,\"First message\":\"28/10/2019_10:07:45\",\"Last message\":\"11/11/2019_01:06:28\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"15/10/2019_11:07:00\",\"Best solution\":111,\"Latency\":\"000:00:03\",\"Messages received\":1588,\"First message\":\"15/10/2019_11:06:57\",\"Last message\":\"10/11/2019_22:36:32\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"31/10/2019_10:27:34\",\"Best solution\":111,\"Latency\":\"000:34:22\",\"Messages received\":2725,\"First message\":\"31/10/2019_09:53:12\",\"Last message\":\"08/11/2019_15:27:09\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"09/11/2019_21:24:02\",\"Best solution\":131,\"Latency\":\"000:00:12\",\"Messages received\":553,\"First message\":\"09/11/2019_21:23:50\",\"Last message\":\"10/11/2019_23:39:35\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"07/11/2019_08:55:58\",\"Best solution\":111,\"Latency\":\"166:36:05\",\"Messages received\":6654,\"First message\":\"31/10/2019_10:19:53\",\"Last message\":\"10/11/2019_20:16:43\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":67397,\"First message\":\"31/10/2019_11:18:44\",\"Last message\":\"11/11/2019_00:16:57\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"31/10/2019_11:23:44\",\"Best solution\":109,\"Latency\":\"000:00:04\",\"Messages received\":1200,\"First message\":\"31/10/2019_11:23:40\",\"Last message\":\"09/11/2019_00:40:14\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map8', '{\"id\":\"map8\",\"ProgressP2\":100,\"First success\":\"10/11/2019_19:39:21\",\"Best solution\":214,\"Latency\":\"009:20:22\",\"Messages received\":10782,\"First message\":\"10/11/2019_10:18:59\",\"Last message\":\"10/11/2019_19:39:21\",\"Software exceptions\":-1}', 'N', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":100,\"First success\":\"07/11/2019_15:48:05\",\"Best solution\":1173,\"Latency\":\"004:15:05\",\"Messages received\":35875,\"First message\":\"07/11/2019_11:33:00\",\"Last message\":\"07/11/2019_21:35:14\",\"Software exceptions\":-1}', 'B', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":31880,\"First message\":\"17/10/2019_12:02:23\",\"Last message\":\"10/11/2019_15:32:45\",\"Software exceptions\":-1}', 'C', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":100,\"First success\":\"25/10/2019_16:46:09\",\"Best solution\":1195,\"Latency\":\"000:17:49\",\"Messages received\":20000,\"First message\":\"25/10/2019_16:28:20\",\"Last message\":\"09/11/2019_16:22:53\",\"Software exceptions\":-1}', 'D', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":100,\"First success\":\"25/10/2019_00:30:27\",\"Best solution\":1099,\"Latency\":\"190:43:12\",\"Messages received\":13887,\"First message\":\"17/10/2019_01:47:15\",\"Last message\":\"29/10/2019_10:39:33\",\"Software exceptions\":-1}', 'E', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":100,\"First success\":\"01/11/2019_21:13:44\",\"Best solution\":841,\"Latency\":\"107:05:51\",\"Messages received\":207903,\"First message\":\"28/10/2019_10:07:53\",\"Last message\":\"11/11/2019_01:21:46\",\"Software exceptions\":-1}', 'F', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":100,\"First success\":\"07/11/2019_09:48:00\",\"Best solution\":1075,\"Latency\":\"550:40:50\",\"Messages received\":171976,\"First message\":\"15/10/2019_11:07:10\",\"Last message\":\"10/11/2019_22:40:59\",\"Software exceptions\":-1}', 'H', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":100,\"First success\":\"04/11/2019_19:41:24\",\"Best solution\":1091,\"Latency\":\"009:00:36\",\"Messages received\":64493,\"First message\":\"04/11/2019_10:40:48\",\"Last message\":\"08/11/2019_15:28:52\",\"Software exceptions\":-1}', 'I', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":50,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":90,\"First message\":\"09/11/2019_21:24:39\",\"Last message\":\"11/11/2019_00:00:59\",\"Software exceptions\":-1}', 'J', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":100,\"First success\":\"07/11/2019_16:00:28\",\"Best solution\":1083,\"Latency\":\"173:39:43\",\"Messages received\":119149,\"First message\":\"31/10/2019_10:20:45\",\"Last message\":\"10/11/2019_20:58:07\",\"Software exceptions\":-1}', 'K', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":50,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":30,\"First message\":\"31/10/2019_11:20:59\",\"Last message\":\"07/11/2019_20:23:12\",\"Software exceptions\":-1}', 'L', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":100,\"First success\":\"04/11/2019_16:41:25\",\"Best solution\":1075,\"Latency\":\"000:00:28\",\"Messages received\":10586,\"First message\":\"04/11/2019_16:40:57\",\"Last message\":\"10/11/2019_18:59:04\",\"Software exceptions\":-1}', 'M', '19/20'),
(1, 'map9', '{\"id\":\"map9\",\"ProgressP2\":70,\"First success\":\"\",\"Best solution\":-1,\"Latency\":\"\",\"Messages received\":3268,\"First message\":\"10/11/2019_19:08:59\",\"Last message\":\"10/11/2019_20:38:40\",\"Software exceptions\":-1}', 'N', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'A', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"18/12/2019_20:57:06\"}', 'B', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":100,\"First rescue\":\"17/12/2019_16:11:32\",\"First full rescue\":\"17/12/2019_16:11:50\",\"Rescue\":4,\"LatencyR\":\"030:07:36\",\"Messages received\":-1,\"First message\":\"16/12/2019_10:04:14\"}', 'C', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":100,\"First rescue\":\"14/12/2019_16:24:02\",\"First full rescue\":\"14/12/2019_16:48:51\",\"Rescue\":4,\"LatencyR\":\"192:30:56\",\"Messages received\":-1,\"First message\":\"06/12/2019_16:17:55\"}', 'D', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":100,\"First rescue\":\"13/12/2019_14:44:45\",\"First full rescue\":\"18/12/2019_09:40:58\",\"Rescue\":4,\"LatencyR\":\"375:55:58\",\"Messages received\":-1,\"First message\":\"02/12/2019_17:45:00\"}', 'E', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":100,\"First rescue\":\"15/12/2019_17:44:08\",\"First full rescue\":\"15/12/2019_17:44:23\",\"Rescue\":4,\"LatencyR\":\"014:34:32\",\"Messages received\":-1,\"First message\":\"15/12/2019_03:09:51\"}', 'F', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":80,\"First rescue\":\"19/12/2019_06:37:51\",\"First full rescue\":\"\",\"Rescue\":1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"06/12/2019_02:50:41\"}', 'H', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":100,\"First rescue\":\"13/12/2019_00:55:01\",\"First full rescue\":\"13/12/2019_00:55:24\",\"Rescue\":4,\"LatencyR\":\"182:26:31\",\"Messages received\":-1,\"First message\":\"05/12/2019_10:28:53\"}', 'I', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":20,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"19/12/2019_01:57:52\"}', 'J', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":80,\"First rescue\":\"17/12/2019_17:48:03\",\"First full rescue\":\"\",\"Rescue\":2,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"13/12/2019_20:01:58\"}', 'K', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":100,\"First rescue\":\"16/12/2019_19:08:52\",\"First full rescue\":\"18/12/2019_19:17:37\",\"Rescue\":4,\"LatencyR\":\"354:01:14\",\"Messages received\":-1,\"First message\":\"04/12/2019_01:16:23\"}', 'L', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":100,\"First rescue\":\"12/12/2019_13:17:37\",\"First full rescue\":\"12/12/2019_13:27:31\",\"Rescue\":4,\"LatencyR\":\"027:05:04\",\"Messages received\":-1,\"First message\":\"11/12/2019_10:22:27\"}', 'M', '19/20'),
(5, 'map0', '{\"id\":\"map0\",\"ProgressP3\":20,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"14/12/2019_18:46:36\"}', 'N', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":20,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"05/12/2019_14:02:04\"}', 'A', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"18/12/2019_23:31:10\"}', 'B', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":100,\"First rescue\":\"15/12/2019_02:35:00\",\"First full rescue\":\"17/12/2019_22:59:51\",\"Rescue\":5,\"LatencyR\":\"365:41:08\",\"Messages received\":-1,\"First message\":\"02/12/2019_17:18:43\"}', 'C', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":100,\"First rescue\":\"15/12/2019_15:33:58\",\"First full rescue\":\"15/12/2019_16:14:55\",\"Rescue\":5,\"LatencyR\":\"307:57:59\",\"Messages received\":-1,\"First message\":\"02/12/2019_20:16:56\"}', 'D', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":100,\"First rescue\":\"18/12/2019_12:44:48\",\"First full rescue\":\"18/12/2019_14:32:42\",\"Rescue\":5,\"LatencyR\":\"362:22:12\",\"Messages received\":-1,\"First message\":\"03/12/2019_12:10:30\"}', 'E', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":100,\"First rescue\":\"15/12/2019_18:52:36\",\"First full rescue\":\"15/12/2019_18:53:13\",\"Rescue\":5,\"LatencyR\":\"000:00:41\",\"Messages received\":-1,\"First message\":\"15/12/2019_18:52:32\"}', 'F', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":60,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"05/12/2019_10:28:51\"}', 'H', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":100,\"First rescue\":\"10/12/2019_18:29:33\",\"First full rescue\":\"13/12/2019_00:52:23\",\"Rescue\":5,\"LatencyR\":\"182:21:05\",\"Messages received\":-1,\"First message\":\"05/12/2019_10:31:18\"}', 'I', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'J', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":80,\"First rescue\":\"17/12/2019_18:38:23\",\"First full rescue\":\"\",\"Rescue\":1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"10/12/2019_16:29:29\"}', 'K', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":100,\"First rescue\":\"18/12/2019_19:19:17\",\"First full rescue\":\"18/12/2019_20:31:35\",\"Rescue\":5,\"LatencyR\":\"321:53:52\",\"Messages received\":-1,\"First message\":\"05/12/2019_10:37:43\"}', 'L', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":100,\"First rescue\":\"16/12/2019_00:20:01\",\"First full rescue\":\"16/12/2019_00:24:24\",\"Rescue\":5,\"LatencyR\":\"000:04:31\",\"Messages received\":-1,\"First message\":\"16/12/2019_00:19:53\"}', 'M', '19/20'),
(5, 'map1', '{\"id\":\"map1\",\"ProgressP3\":20,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"14/12/2019_18:24:37\"}', 'N', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'A', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"19/12/2019_00:21:14\"}', 'B', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":100,\"First rescue\":\"17/12/2019_23:01:49\",\"First full rescue\":\"18/12/2019_10:30:59\",\"Rescue\":5,\"LatencyR\":\"021:25:19\",\"Messages received\":-1,\"First message\":\"17/12/2019_13:05:40\"}', 'C', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":100,\"First rescue\":\"15/12/2019_15:44:06\",\"First full rescue\":\"15/12/2019_15:50:13\",\"Rescue\":5,\"LatencyR\":\"000:06:21\",\"Messages received\":-1,\"First message\":\"15/12/2019_15:43:52\"}', 'D', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":100,\"First rescue\":\"18/12/2019_14:44:01\",\"First full rescue\":\"18/12/2019_14:54:46\",\"Rescue\":5,\"LatencyR\":\"002:35:15\",\"Messages received\":-1,\"First message\":\"18/12/2019_12:19:31\"}', 'E', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":100,\"First rescue\":\"15/12/2019_19:16:32\",\"First full rescue\":\"15/12/2019_19:33:45\",\"Rescue\":5,\"LatencyR\":\"000:17:21\",\"Messages received\":-1,\"First message\":\"15/12/2019_19:16:24\"}', 'F', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"06/12/2019_02:49:31\"}', 'H', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":100,\"First rescue\":\"17/12/2019_18:29:18\",\"First full rescue\":\"17/12/2019_18:29:50\",\"Rescue\":5,\"LatencyR\":\"000:01:32\",\"Messages received\":-1,\"First message\":\"17/12/2019_18:28:18\"}', 'I', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'J', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":80,\"First rescue\":\"18/12/2019_23:12:45\",\"First full rescue\":\"\",\"Rescue\":1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"18/12/2019_20:15:45\"}', 'K', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":100,\"First rescue\":\"18/12/2019_20:32:12\",\"First full rescue\":\"18/12/2019_20:48:10\",\"Rescue\":5,\"LatencyR\":\"142:07:14\",\"Messages received\":-1,\"First message\":\"12/12/2019_22:40:56\"}', 'L', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":100,\"First rescue\":\"15/12/2019_23:19:09\",\"First full rescue\":\"16/12/2019_00:18:49\",\"Rescue\":5,\"LatencyR\":\"079:06:11\",\"Messages received\":-1,\"First message\":\"12/12/2019_17:12:38\"}', 'M', '19/20'),
(5, 'map2', '{\"id\":\"map2\",\"ProgressP3\":20,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"18/12/2019_15:25:20\"}', 'N', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'A', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"19/12/2019_00:21:34\"}', 'B', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":100,\"First rescue\":\"18/12/2019_10:32:01\",\"First full rescue\":\"18/12/2019_16:59:38\",\"Rescue\":6,\"LatencyR\":\"017:37:01\",\"Messages received\":-1,\"First message\":\"17/12/2019_23:22:37\"}', 'C', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":100,\"First rescue\":\"15/12/2019_15:59:55\",\"First full rescue\":\"15/12/2019_20:06:37\",\"Rescue\":6,\"LatencyR\":\"004:13:17\",\"Messages received\":-1,\"First message\":\"15/12/2019_15:53:20\"}', 'D', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":100,\"First rescue\":\"18/12/2019_15:05:14\",\"First full rescue\":\"18/12/2019_16:41:42\",\"Rescue\":6,\"LatencyR\":\"001:45:20\",\"Messages received\":-1,\"First message\":\"18/12/2019_14:56:22\"}', 'E', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":80,\"First rescue\":\"15/12/2019_20:18:03\",\"First full rescue\":\"\",\"Rescue\":4,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"15/12/2019_20:10:29\"}', 'F', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"06/12/2019_02:49:47\"}', 'H', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":80,\"First rescue\":\"17/12/2019_20:30:13\",\"First full rescue\":\"\",\"Rescue\":4,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"17/12/2019_18:31:25\"}', 'I', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'J', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":60,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"18/12/2019_20:16:37\"}', 'K', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":80,\"First rescue\":\"18/12/2019_20:48:43\",\"First full rescue\":\"\",\"Rescue\":1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"13/12/2019_11:31:23\"}', 'L', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":100,\"First rescue\":\"16/12/2019_00:43:02\",\"First full rescue\":\"16/12/2019_18:03:09\",\"Rescue\":6,\"LatencyR\":\"017:20:17\",\"Messages received\":-1,\"First message\":\"16/12/2019_00:42:52\"}', 'M', '19/20'),
(5, 'map3', '{\"id\":\"map3\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'N', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'A', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"19/12/2019_00:22:20\"}', 'B', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":100,\"First rescue\":\"18/12/2019_10:32:56\",\"First full rescue\":\"18/12/2019_17:27:37\",\"Rescue\":8,\"LatencyR\":\"006:54:47\",\"Messages received\":-1,\"First message\":\"18/12/2019_10:32:50\"}', 'C', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":100,\"First rescue\":\"15/12/2019_20:14:56\",\"First full rescue\":\"15/12/2019_20:18:52\",\"Rescue\":8,\"LatencyR\":\"000:07:38\",\"Messages received\":-1,\"First message\":\"15/12/2019_20:11:14\"}', 'D', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":100,\"First rescue\":\"18/12/2019_16:43:22\",\"First full rescue\":\"18/12/2019_16:50:08\",\"Rescue\":8,\"LatencyR\":\"000:07:23\",\"Messages received\":-1,\"First message\":\"18/12/2019_16:42:45\"}', 'E', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":80,\"First rescue\":\"15/12/2019_19:47:47\",\"First full rescue\":\"\",\"Rescue\":6,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"15/12/2019_19:36:05\"}', 'F', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"06/12/2019_02:50:08\"}', 'H', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":100,\"First rescue\":\"17/12/2019_18:33:37\",\"First full rescue\":\"17/12/2019_18:43:12\",\"Rescue\":8,\"LatencyR\":\"000:09:52\",\"Messages received\":-1,\"First message\":\"17/12/2019_18:33:20\"}', 'I', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'J', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"18/12/2019_20:19:21\"}', 'K', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":80,\"First rescue\":\"19/12/2019_10:06:28\",\"First full rescue\":\"\",\"Rescue\":4,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"19/12/2019_10:02:46\"}', 'L', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":100,\"First rescue\":\"16/12/2019_18:07:18\",\"First full rescue\":\"16/12/2019_21:06:20\",\"Rescue\":8,\"LatencyR\":\"003:00:00\",\"Messages received\":-1,\"First message\":\"16/12/2019_18:06:20\"}', 'M', '19/20'),
(5, 'map4', '{\"id\":\"map4\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'N', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'A', '19/20');
INSERT INTO `datos_grupo` (`idProyecto`, `idDatos`, `datos`, `idGrupo`, `curso`) VALUES
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"19/12/2019_00:22:34\"}', 'B', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":80,\"First rescue\":\"18/12/2019_17:28:56\",\"First full rescue\":\"\",\"Rescue\":9,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"16/12/2019_10:25:02\"}', 'C', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":80,\"First rescue\":\"15/12/2019_20:21:48\",\"First full rescue\":\"\",\"Rescue\":9,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"15/12/2019_20:20:50\"}', 'D', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":80,\"First rescue\":\"18/12/2019_16:52:05\",\"First full rescue\":\"\",\"Rescue\":6,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"18/12/2019_16:51:08\"}', 'E', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":80,\"First rescue\":\"17/12/2019_14:37:42\",\"First full rescue\":\"\",\"Rescue\":2,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"15/12/2019_20:01:54\"}', 'F', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"06/12/2019_02:50:28\"}', 'H', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":80,\"First rescue\":\"17/12/2019_18:45:54\",\"First full rescue\":\"\",\"Rescue\":1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"17/12/2019_18:44:52\"}', 'I', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'J', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"12/12/2019_10:32:44\"}', 'K', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":40,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"12/12/2019_22:41:18\"}', 'L', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":80,\"First rescue\":\"16/12/2019_18:45:23\",\"First full rescue\":\"\",\"Rescue\":3,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"16/12/2019_18:35:07\"}', 'M', '19/20'),
(5, 'map5', '{\"id\":\"map5\",\"ProgressP3\":-1,\"First rescue\":\"\",\"First full rescue\":\"\",\"Rescue\":-1,\"LatencyR\":\"\",\"Messages received\":-1,\"First message\":\"\"}', 'N', '19/20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_parti`
--

CREATE TABLE `datos_parti` (
  `idProyecto` int(20) NOT NULL,
  `idDatos` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `datos` longtext COLLATE utf8_unicode_ci NOT NULL,
  `participante` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `datos_parti`
--

INSERT INTO `datos_parti` (`idProyecto`, `idDatos`, `datos`, `participante`) VALUES
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_17:30:05\",\"Messages received\":2,\"First message\":\"23/09/2019_17:30:05\",\"Last message\":\"23/09/2019_17:37:02\",\"Software exceptions\":-1}', 'Adrian I.P.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_19:38:36\",\"Messages received\":1,\"First message\":\"23/09/2019_19:38:36\",\"Last message\":\"23/09/2019_19:38:36\",\"Software exceptions\":-1}', 'Alejandro M.M.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"10/09/2019_19:10:46\",\"Messages received\":13,\"First message\":\"10/09/2019_19:10:27\",\"Last message\":\"10/09/2019_20:02:24\",\"Software exceptions\":-1}', 'Ana B.F.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"10/09/2019_20:04:38\",\"Messages received\":6,\"First message\":\"10/09/2019_20:04:38\",\"Last message\":\"23/09/2019_19:40:27\",\"Software exceptions\":-1}', 'Celia B.L.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"10/09/2019_20:11:50\",\"Messages received\":4,\"First message\":\"10/09/2019_20:11:50\",\"Last message\":\"23/09/2019_18:24:51\",\"Software exceptions\":-1}', 'Diego C.H.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_19:39:06\",\"Messages received\":1,\"First message\":\"23/09/2019_19:39:06\",\"Last message\":\"23/09/2019_19:39:06\",\"Software exceptions\":-1}', 'Francisco B.C.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"10/09/2019_20:24:38\",\"Messages received\":3,\"First message\":\"10/09/2019_20:24:38\",\"Last message\":\"23/09/2019_18:06:08\",\"Software exceptions\":-1}', 'Michael Kieran B.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"10/09/2019_17:50:11\",\"Messages received\":2,\"First message\":\"10/09/2019_17:50:11\",\"Last message\":\"23/09/2019_19:33:40\",\"Software exceptions\":-1}', 'Miguel K.C.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_19:32:07\",\"Messages received\":1,\"First message\":\"23/09/2019_19:32:07\",\"Last message\":\"23/09/2019_19:32:07\",\"Software exceptions\":-1}', 'Monica C.G.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_17:51:48\",\"Messages received\":1,\"First message\":\"23/09/2019_17:51:48\",\"Last message\":\"23/09/2019_17:51:48\",\"Software exceptions\":-1}', 'Pablo A.M.'),
(3, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_18:05:13\",\"Messages received\":1,\"First message\":\"23/09/2019_18:05:13\",\"Last message\":\"23/09/2019_18:05:13\",\"Software exceptions\":-1}', 'Pablo D.G.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:41:07\",\"Messages received\":1,\"First message\":\"23/09/2019_20:41:07\",\"Last message\":\"23/09/2019_20:41:07\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Adrian I.P.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:44:50\",\"Messages received\":1,\"First message\":\"23/09/2019_20:44:50\",\"Last message\":\"23/09/2019_20:44:50\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Alejandro M.M.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"17/09/2019_20:24:16\",\"Messages received\":1,\"First message\":\"17/09/2019_20:24:16\",\"Last message\":\"17/09/2019_20:24:16\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Ana B.F.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"17/09/2019_20:25:07\",\"Messages received\":1,\"First message\":\"17/09/2019_20:25:07\",\"Last message\":\"17/09/2019_20:25:07\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Celia B.L.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"17/09/2019_21:35:18\",\"Messages received\":3,\"First message\":\"17/09/2019_21:35:18\",\"Last message\":\"17/09/2019_21:37:04\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Diego C.H.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Francisco B.C.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_19:51:23\",\"Messages received\":3,\"First message\":\"23/09/2019_19:51:23\",\"Last message\":\"23/09/2019_20:05:20\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Michael Kieran B.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":8,\"First message\":\"17/09/2019_20:00:15\",\"Last message\":\"23/09/2019_20:41:39\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Miguel K.C.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:44:40\",\"Messages received\":1,\"First message\":\"23/09/2019_20:44:40\",\"Last message\":\"23/09/2019_20:44:40\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Monica C.G.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:21:29\",\"Messages received\":4,\"First message\":\"23/09/2019_20:21:29\",\"Last message\":\"23/09/2019_20:34:03\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Nabil A.A.'),
(4, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:38:33\",\"Messages received\":1,\"First message\":\"23/09/2019_20:38:33\",\"Last message\":\"23/09/2019_20:38:33\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Pablo D.G.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:41:11\",\"Messages received\":1,\"First message\":\"23/09/2019_20:41:07\",\"Last message\":\"23/09/2019_20:41:07\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Adrian I.P.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:44:50\",\"Messages received\":1,\"First message\":\"23/09/2019_20:44:50\",\"Last message\":\"23/09/2019_20:44:50\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Alejandro M.M.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"17/09/2019_20:24:21\",\"Messages received\":1,\"First message\":\"17/09/2019_20:24:19\",\"Last message\":\"17/09/2019_20:24:19\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Ana B.F.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"17/09/2019_20:26:05\",\"Messages received\":1,\"First message\":\"17/09/2019_20:25:43\",\"Last message\":\"17/09/2019_20:25:44\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Celia B.L.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"17/09/2019_21:35:19\",\"Messages received\":3,\"First message\":\"17/09/2019_21:35:19\",\"Last message\":\"17/09/2019_21:37:05\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Diego C.H.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Francisco B.C.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":1,\"First message\":\"\",\"Last message\":\"23/09/2019_20:16:10\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Michael Kieran B.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":3,\"First message\":\"\",\"Last message\":\"23/09/2019_20:41:39\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Miguel K.C.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:44:40\",\"Messages received\":1,\"First message\":\"23/09/2019_20:44:40\",\"Last message\":\"23/09/2019_20:44:40\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Monica C.G.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:21:52\",\"Messages received\":4,\"First message\":\"23/09/2019_20:21:29\",\"Last message\":\"23/09/2019_20:34:03\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Nabil A.A.'),
(4, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"23/09/2019_20:38:39\",\"Messages received\":1,\"First message\":\"23/09/2019_20:38:33\",\"Last message\":\"23/09/2019_20:38:33\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Pablo D.G.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Bulma\"}', 'Adrian I.P.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Mutenroshi\"}', 'Alejandro M.M.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Kamisama\"}', 'Ana B.F.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Vegeta\"}', 'Celia B.L.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Satan\"}', 'Diego C.H.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"\"}', 'Francisco B.C.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Vegeta\"}', 'Michael Kieran B.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Mutenroshi\"}', 'Miguel K.C.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Satan\"}', 'Monica C.G.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Freezer\"}', 'Nabil A.A.'),
(4, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":50,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\",\"Software exceptions\":-1,\"Feature\":\"Bulma\"}', 'Pablo D.G.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":47,\"First message\":\"14/11/2019_10:53:45\",\"Last message\":\"14/11/2019_11:09:44\"}', 'Adrian I.P.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Alejandro M.M.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Ana B.F.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":259,\"First message\":\"14/11/2019_10:23:43\",\"Last message\":\"14/11/2019_11:26:56\"}', 'Celia B.L.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Diego Alfonso C.R.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":877,\"First message\":\"14/11/2019_10:18:42\",\"Last message\":\"14/11/2019_11:32:58\"}', 'Diego C.H.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":1279,\"First message\":\"14/11/2019_10:20:50\",\"Last message\":\"14/11/2019_11:49:32\"}', 'Fernando I.R.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":77,\"First message\":\"14/11/2019_10:18:22\",\"Last message\":\"14/11/2019_11:36:20\"}', 'Francisco B.C.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Francisco Jose C.L.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":54,\"First message\":\"14/11/2019_10:48:26\",\"Last message\":\"14/11/2019_10:48:30\"}', 'Juan Francisco D.M.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":729,\"First message\":\"14/11/2019_10:25:49\",\"Last message\":\"14/11/2019_11:19:36\"}', 'Maria Del Mar G.C.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":279,\"First message\":\"14/11/2019_10:28:18\",\"Last message\":\"14/11/2019_11:15:37\"}', 'Michael Kieran B.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":2121,\"First message\":\"14/11/2019_11:13:29\",\"Last message\":\"14/11/2019_11:32:18\"}', 'Miguel K.C.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Monica C.G.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":461,\"First message\":\"14/11/2019_10:45:46\",\"Last message\":\"14/11/2019_10:54:40\"}', 'Nabil A.A.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":87,\"First message\":\"14/11/2019_10:36:50\",\"Last message\":\"14/11/2019_10:53:30\"}', 'Pablo A.M.'),
(6, 'map1', '{\"id\":\"map1\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Pablo D.G.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":22,\"First message\":\"14/11/2019_10:55:20\",\"Last message\":\"14/11/2019_11:09:28\"}', 'Adrian I.P.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Alejandro M.M.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Ana B.F.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":174,\"First message\":\"14/11/2019_10:23:44\",\"Last message\":\"14/11/2019_11:26:56\"}', 'Celia B.L.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Diego Alfonso C.R.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":855,\"First message\":\"14/11/2019_11:17:09\",\"Last message\":\"14/11/2019_11:32:58\"}', 'Diego C.H.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":1007,\"First message\":\"14/11/2019_10:44:27\",\"Last message\":\"14/11/2019_11:49:32\"}', 'Fernando I.R.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":58,\"First message\":\"14/11/2019_11:13:51\",\"Last message\":\"14/11/2019_11:36:20\"}', 'Francisco B.C.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Francisco Jose C.L.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":46,\"First message\":\"14/11/2019_10:48:26\",\"Last message\":\"14/11/2019_10:48:29\"}', 'Juan Francisco D.M.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":685,\"First message\":\"14/11/2019_10:28:22\",\"Last message\":\"14/11/2019_11:19:36\"}', 'Maria Del Mar G.C.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":216,\"First message\":\"14/11/2019_10:43:00\",\"Last message\":\"14/11/2019_11:13:42\"}', 'Michael Kieran B.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":2087,\"First message\":\"14/11/2019_11:13:29\",\"Last message\":\"14/11/2019_11:32:16\"}', 'Miguel K.C.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Monica C.G.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":444,\"First message\":\"14/11/2019_10:45:47\",\"Last message\":\"14/11/2019_10:54:40\"}', 'Nabil A.A.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":100,\"First success\":\"\",\"Messages received\":53,\"First message\":\"14/11/2019_10:36:50\",\"Last message\":\"14/11/2019_10:53:30\"}', 'Pablo A.M.'),
(6, 'map2', '{\"id\":\"map2\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Pablo D.G.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_11:09:28\",\"Messages received\":7,\"First message\":\"14/11/2019_10:55:26\",\"Last message\":\"14/11/2019_11:09:28\"}', 'Adrian I.P.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Alejandro M.M.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Ana B.F.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_11:25:39\",\"Messages received\":21,\"First message\":\"14/11/2019_11:08:57\",\"Last message\":\"14/11/2019_11:26:56\"}', 'Celia B.L.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Diego Alfonso C.R.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_11:32:58\",\"Messages received\":850,\"First message\":\"14/11/2019_11:17:09\",\"Last message\":\"14/11/2019_11:32:58\"}', 'Diego C.H.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_11:49:32\",\"Messages received\":23,\"First message\":\"14/11/2019_11:48:37\",\"Last message\":\"14/11/2019_11:49:32\"}', 'Fernando I.R.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_11:36:20\",\"Messages received\":43,\"First message\":\"14/11/2019_11:36:16\",\"Last message\":\"14/11/2019_11:36:20\"}', 'Francisco B.C.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Francisco Jose C.L.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_10:48:30\",\"Messages received\":23,\"First message\":\"14/11/2019_10:48:26\",\"Last message\":\"14/11/2019_10:48:29\"}', 'Juan Francisco D.M.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_11:17:52\",\"Messages received\":238,\"First message\":\"14/11/2019_11:13:16\",\"Last message\":\"14/11/2019_11:19:36\"}', 'Maria Del Mar G.C.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_11:13:42\",\"Messages received\":17,\"First message\":\"14/11/2019_11:10:35\",\"Last message\":\"14/11/2019_11:13:42\"}', 'Michael Kieran B.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_11:32:16\",\"Messages received\":23,\"First message\":\"14/11/2019_11:13:29\",\"Last message\":\"14/11/2019_11:32:16\"}', 'Miguel K.C.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Monica C.G.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_10:54:40\",\"Messages received\":441,\"First message\":\"14/11/2019_10:45:47\",\"Last message\":\"14/11/2019_10:54:40\"}', 'Nabil A.A.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":100,\"First success\":\"14/11/2019_10:53:30\",\"Messages received\":35,\"First message\":\"14/11/2019_10:53:25\",\"Last message\":\"14/11/2019_10:53:30\"}', 'Pablo A.M.'),
(6, 'map3', '{\"id\":\"map3\",\"ProgressTriple\":-1,\"First success\":\"\",\"Messages received\":-1,\"First message\":\"\",\"Last message\":\"\"}', 'Pablo D.G.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escala`
--

CREATE TABLE `escala` (
  `idHito` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `idEscala` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `desde` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hasta` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `escala`
--

INSERT INTO `escala` (`idHito`, `idEscala`, `desde`, `hasta`, `imagen`, `descripcion`) VALUES
('ProgressP2', 'Goal', '71', '100', 'img/progreso/100p_1.png', 'Ciclo y objetivo alcanzado.'),
('ProgressP2', 'Login', '1', '20', 'img/progreso/20p_1.png', 'Login completado.'),
('ProgressP2', 'Move', '21', '50', 'img/progreso/50p_1.png', 'Login+Move completado.'),
('ProgressP2', 'Not started', '-1', '0', 'img/progreso/0p_1.png', 'Nivel no intentado.'),
('ProgressP2', 'Refuel', '51', '70', 'img/progreso/70p_1.png', 'Login + Move + Refuel completado.'),
('ProgressP3', 'Checkin', '21', '40', 'img/progreso/ProgressP3_Checkin_progreso_40p_5.png', 'Full Checkin Completed'),
('ProgressP3', 'Detection', '41', '60', 'img/progreso/ProgressP3_Detection_progreso_60p_5.png', 'First German detected'),
('ProgressP3', 'Goal', '81', '100', 'img/progreso/ProgressP3_Goal_progreso_100p_5.png', 'All German rescued'),
('ProgressP3', 'Not started', '-1', '0', 'img/progreso/ProgressP3_Not started_progreso_0p_5.png', 'Competence not started yet.'),
('ProgressP3', 'Partial Rescue', '61', '80', 'img/progreso/ProgressP3_Partial Rescue_progreso_80p_5.png', 'At least one German rescued'),
('ProgressP3', 'Subscribe', '1', '20', 'img/progreso/ProgressP3_Subscribe_progreso_20p_5.png', 'Subscribe completed.'),
('ProgressTriple', 'Completed', '100', '100', 'img/progreso/ProgressSongoanda_Completed_progreso_green2.png', 'Competencia finalizada.'),
('ProgressTriple', 'Not finished', '1', '99', 'img/progreso/ProgressSongoanda_Not finished_progreso_yellow2.png', 'Competencia no terminada.'),
('ProgressTriple', 'Not started', '-1', '0', 'img/progreso/ProgressSongoanda_Not started_progreso_red2.png', 'Competencia no empezada.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idGrupo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `curso` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`idGrupo`, `curso`) VALUES
('A', '18/19'),
('A', '19/20'),
('B', '18/19'),
('B', '19/20'),
('C', '18/19'),
('C', '19/20'),
('D', '19/20'),
('E', '18/19'),
('E', '19/20'),
('F', '19/20'),
('G', '19/20'),
('H', '19/20'),
('I', '19/20'),
('J', '19/20'),
('K', '19/20'),
('L', '19/20'),
('M', '19/20'),
('N', '19/20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_parti`
--

CREATE TABLE `grupo_parti` (
  `idGrupo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `curso` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grupo_parti`
--

INSERT INTO `grupo_parti` (`idGrupo`, `correo`, `curso`) VALUES
('M', 'diegocortesherranz@gmail.com', '19/20'),
('M', 'fernandoizquierdoromera@gmail.com', '19/20'),
('M', 'nabilaliasserhaou@gmail.com', '19/20'),
('M', 'pablodelgadogarcia@gmail.com', '19/20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_proy`
--

CREATE TABLE `grupo_proy` (
  `idGrupo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `curso` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `idProyecto` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grupo_proy`
--

INSERT INTO `grupo_proy` (`idGrupo`, `curso`, `idProyecto`) VALUES
('A', '19/20', 1),
('A', '19/20', 5),
('B', '19/20', 1),
('B', '19/20', 5),
('C', '19/20', 1),
('C', '19/20', 5),
('D', '19/20', 1),
('D', '19/20', 5),
('E', '19/20', 1),
('E', '19/20', 5),
('F', '19/20', 1),
('F', '19/20', 5),
('G', '19/20', 1),
('G', '19/20', 5),
('H', '19/20', 1),
('H', '19/20', 5),
('I', '19/20', 1),
('I', '19/20', 5),
('J', '19/20', 1),
('J', '19/20', 5),
('K', '19/20', 1),
('K', '19/20', 5),
('L', '19/20', 1),
('L', '19/20', 5),
('M', '19/20', 1),
('M', '19/20', 5),
('N', '19/20', 1),
('N', '19/20', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hito`
--

CREATE TABLE `hito` (
  `idHito` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `actualizacion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `clase` enum('Normal','Complejo','Autocalculable','') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `hito`
--

INSERT INTO `hito` (`idHito`, `actualizacion`, `tipo`, `descripcion`, `clase`) VALUES
('Best solution', 'min', 'number', 'Number of steps of the best solution found', 'Normal'),
('Feature', 'set', 'text', 'Feature (word) to to be validated with the teacher', 'Normal'),
('First full rescue', 'min', 'date', 'The time at wich all Germans have been rescued.', 'Normal'),
('First message', 'min', 'date', 'Date of first message received while acquiring this competence', 'Normal'),
('First rescue', 'min', 'date', 'The time at wich the first German has been rescued.', 'Normal'),
('First success', 'min', 'date', 'The time at wich this competence was fulfilled for the first time', 'Normal'),
('Last message', 'max', 'date', 'Date of last message received while acquiring this competence', 'Normal'),
('Latency', 'diff', 'time', 'Time to complete this competence since the first message', 'Autocalculable'),
('LatencyR', 'min', 'time', 'Time to complete this competence since the first message', 'Autocalculable'),
('Messages received', 'add', 'number', 'Number of messages received while acquiring this competence', 'Normal'),
('ProgressP2', 'max', 'number', 'Degree of acquisition of this competence', 'Complejo'),
('ProgressP3', 'max', 'number', 'Degree of acquisition of this competence.', 'Complejo'),
('ProgressTriple', 'max', 'number', 'Degree of acquisition of this competence.', 'Complejo'),
('Rescue', 'max', 'number', 'Number of germans rescued.', 'Normal'),
('Software exceptions', 'add', 'number', 'Number of exceptions produced in the server while acquiring this competence', 'Normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hito_autocalculable`
--

CREATE TABLE `hito_autocalculable` (
  `idHito` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `operacion` enum('suma','resta','multiplicacion','division') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `hito_autocalculable`
--

INSERT INTO `hito_autocalculable` (`idHito`, `operacion`) VALUES
('Latency', 'resta'),
('LatencyR', 'resta'),
('ProgressP2', 'suma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hito_complejo`
--

CREATE TABLE `hito_complejo` (
  `idHito` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `hito_complejo`
--

INSERT INTO `hito_complejo` (`idHito`) VALUES
('ProgressP2'),
('ProgressP3'),
('ProgressTriple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hito_factor_autocalculable`
--

CREATE TABLE `hito_factor_autocalculable` (
  `idHitoAut` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `idHito` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `hito_factor_autocalculable`
--

INSERT INTO `hito_factor_autocalculable` (`idHitoAut`, `idHito`) VALUES
('Latency', 'First message'),
('Latency', 'First success'),
('LatencyR', 'First full rescue'),
('LatencyR', 'First message');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insignia`
--

CREATE TABLE `insignia` (
  `seleccion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `idInsignia` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `insignia`
--

INSERT INTO `insignia` (`seleccion`, `imagen`, `idInsignia`, `descripcion`) VALUES
('min', 'img/insignias/earlybird.jpg', 'Early bird', 'Insignia para el primero que consiga completar el 100% de la competencia.'),
('min', 'img/insignias/Early Rescue_insignias_earlyrescue.png', 'Early Rescue', 'Insignia para el primero que rescate a un Alemán'),
('min', 'img/insignias/flash.png', 'Flash', 'Insignia para el que tarde menos en completar el mapa desde el primer intento.'),
('max', 'img/insignias/Rescue_insignias_rescue.png', 'Rescue', 'Insignia para el que más Alemanes rescate.'),
('min', 'img/insignias/shortest.png', 'Shortest', 'Insignia para el que consiga el camino más corto del nivel.'),
('max', 'img/insignias/Verbose_insignias_mailbox.png', 'Verbose', 'Insignia para el que más mensajes mande durante la competencia.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `idConfig` int(20) NOT NULL,
  `idNivel` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `dificultad` enum('facil','normal','dificil','extremo') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`idConfig`, `idNivel`, `descripcion`, `dificultad`) VALUES
(1, 'map1', 'Direct guiding towards the goal. No refuel needed.', 'facil'),
(1, 'map10', 'Surround obstacles (complex cycles required). Unknown refuels.', 'extremo'),
(1, 'map2', 'Direct guiding towards the goal. No refuel needed.', 'facil'),
(1, 'map3', 'Direct guiding towards the goal. One refuel needed.', 'facil'),
(1, 'map4', 'Direct guiding towards the goal. One refuel needed.', 'facil'),
(1, 'map5', 'Direct guiding towards the goal. Multiple refuel needed.', 'normal'),
(1, 'map6', 'Surround obstacles (no cycles allowed). No refuel needed.', 'normal'),
(1, 'map7', 'Surround obstacles (no cycles allowed). Unknown refuels.', 'dificil'),
(1, 'map8', 'Surround obstacles (simple cycles allowed). Unknown refuels.', 'dificil'),
(1, 'map9', 'Surround obstacles (complex cycles required). Unknown refuels.', 'dificil'),
(2, 'map1', 'Enviar mensaje \'hello\'.', 'facil'),
(3, 'map1', 'Hola Recibido.', 'facil'),
(3, 'map2', 'Contraseña volteada recibida.', 'facil'),
(3, 'map3', 'Personaje asignado.', 'facil'),
(4, 'map0', 'Mapa para entrenar con los drones.', 'facil'),
(4, 'map1', 'Mapa con objetivos fijos.', 'facil'),
(4, 'map2', '5 random Germans and 10000 units of energy.', 'normal'),
(4, 'map3', '6 random Germans & only 700 units of energy.', 'dificil'),
(4, 'map4', '8 random Germans & 10000 units of energy.', 'dificil'),
(4, 'map5', '10 random Germans and 5000 units of energy.', 'extremo'),
(5, 'map1', 'Sent a single message to Jake. Scores 0.1 points.', 'facil'),
(5, 'map2', 'Interchange messages with Jake within a conversation. Scores 0.1 points', 'normal'),
(5, 'map3', 'Dialog with Jake and win the game. Scores 0.2 points', 'dificil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participante`
--

CREATE TABLE `participante` (
  `usuario` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `dni` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` enum('Alumno','Profesor','','') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Alumno',
  `cursos` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Cursos matriculados por el estudiante separados por un espacio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `participante`
--

INSERT INTO `participante` (`usuario`, `pass`, `dni`, `correo`, `tipo`, `cursos`) VALUES
('Adrian I.P.', '$2y$10$18yQ5tygEPCRXN4fxk/kDuOMguz9fOMZvNEgK8q/vj3DMVkOe/S16', '77901445P', 'adrianizquierdopozo@gmail.com', 'Alumno', '19/20'),
('Alejandro M.M.', '$2y$10$k5.Jw6jGLav0aiOzVt3XneAuXZ.P5D3UE8iqwu3jaxi0HHsY0OXrC', '82846756C', 'alejandromedinamanzano@gmail.com', 'Alumno', '19/20'),
('Ana B.F.', '$2y$10$miaQVpv7TvZzy0u1OLKbdOTCjoPsRBWF221/b6uyqr9k9QA7JtB/2', '98633138F', 'anaboschfernandez@gmail.com', 'Alumno', '19/20'),
('Pepe Flores', '$2y$10$0fzP9UA.oPPryOoxoXpv8eySjEZrD5vTI4zint5MfaZxEx915ONle', '35485196G', 'antiguo@gmail.com', 'Alumno', '18/19'),
('Celia B.L.', '$2y$10$N7wkYEXD/NHt3nZuqDDXuee4QO6wmQtmr9Mu4ubyF/5vz99W9JSHe', '61120095X', 'celiabotellalopez@gmail.com', 'Alumno', '19/20'),
('Diego Alfonso C.R.', '$2y$10$LHSzOEHBxfwVTYjnHm.xk.jE5XucZoR9ZAeRtzPuCHP5PXP6zASLm', '30019348R', 'diegoalfonsocandelariarodriguez@gmail.com', 'Alumno', '19/20'),
('Diego C.H.', '$2y$10$H2v2iPUKNocWTzaM/OWtNO8ERnahHmEvuZfTFg7fOWXHYbkpQ/p1O', '00255048R', 'diegocortesherranz@gmail.com', 'Alumno', '19/20'),
('Fernando I.R.', '$2y$10$1SSUqEuzMCDYhbwyzeKI6u0IExmo35vyMfe/KWxvUtQMNXFI9DUoS', '44200195Z', 'fernandoizquierdoromera@gmail.com', 'Alumno', '19/20'),
('Francisco B.C.', '$2y$10$wL9KB7D5s4UyAKUJzWjftuJtdqD6I.O2oEA0hHOwYAgrxHUTWbkRS', '31277613M', 'franciscobenegascortes@gmail.com', 'Alumno', '19/20'),
('Francisco Jose C.L.', '$2y$10$Xq.UMwmoIrv9H0qCDVVGWOFSjaZkrKyqfLwHyfIo7DqI4mNsxTnQq', '09268094Z', 'franciscojosecotanlopez@gmail.com', 'Alumno', '19/20'),
('Juan Francisco D.M.', '$2y$10$c92hYsX.5dvq9WCvsWhn7O4ukMQnUepuKnM6JXAf/TYqi0SCX88.K', '56280682G', 'juanfranciscodiazmoreno@gmail.com', 'Alumno', '19/20'),
('Luis Castillo', '$2y$10$XsEib1FseHk5Dg4Ad8CdqezkOiNrBPDjpXaCvX9VbKtuFZPmagpo.', '123456789X', 'luis@ugr.es', 'Profesor', NULL),
('Maria Del Mar G.C.', '$2y$10$xhzZIfHwbpN8elgYAYc4K.XPju8H7VJFMnl7h.bLA8LHeg/OAZvx.', '82922831B', 'mariadelmargarciacabello@gmail.com', 'Alumno', '19/20'),
('Michael Kieran B.', '$2y$10$bVBWRdKWOjgz4FU7KpPus.Kfp0m4qZfwS9Dkq180.DTBNhxQHExm6', '66927184J', 'michaelkieranbowen@gmail.com', 'Alumno', '19/20'),
('Miguel K.C.', '$2y$10$TOvREgBe5Nu2z9EBo7KTMehAr9BnAuBQNt7bHvbd6YaIu1rCod7mi', '27287110W', 'miguelkeane@gmail.com', 'Alumno', '19/20'),
('Monica C.G.', '$2y$10$SEh2fnH/CnLaYDQ8/OmGdeRVAflmIgREwRGTrH8hBlLo1rdTX7h0m', '11572853N', 'monicacordovillagamez@gmail.com', 'Alumno', '19/20'),
('Nabil A.A.', '$2y$10$JQa5BGZT3YYWYGS6pfFxx.GYwOA.6iTYuB9pFf1EDU4WtX9SNqZTq', '45310556G', 'nabilaliasserhaou@gmail.com', 'Alumno', '18/19 19/20'),
('Pablo A.M.', '$2y$10$XOaow8jS2HWA4BEIcmBCWOV3riarWd1PKoOKDof6uM9yv3LCAant2', '69509412P', 'pabloalaminosmoron@gmail.com', 'Alumno', '19/20'),
('Pablo D.G.', '$2y$10$r1Z7GUe0jKkqm.u4JjX3M.TcVT9zDF24K3wpgFoaslll/L/Y.JYvO', '17330756A', 'pablodelgadogarcia@gmail.com', 'Alumno', '19/20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parti_proy`
--

CREATE TABLE `parti_proy` (
  `correo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `idProyecto` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parti_proy`
--

INSERT INTO `parti_proy` (`correo`, `idProyecto`) VALUES
('adrianizquierdopozo@gmail.com', 3),
('adrianizquierdopozo@gmail.com', 4),
('adrianizquierdopozo@gmail.com', 6),
('alejandromedinamanzano@gmail.com', 3),
('alejandromedinamanzano@gmail.com', 4),
('alejandromedinamanzano@gmail.com', 6),
('anaboschfernandez@gmail.com', 3),
('anaboschfernandez@gmail.com', 4),
('anaboschfernandez@gmail.com', 6),
('celiabotellalopez@gmail.com', 3),
('celiabotellalopez@gmail.com', 4),
('celiabotellalopez@gmail.com', 6),
('diegoalfonsocandelariarodriguez@gmail.com', 3),
('diegoalfonsocandelariarodriguez@gmail.com', 4),
('diegoalfonsocandelariarodriguez@gmail.com', 6),
('diegocortesherranz@gmail.com', 3),
('diegocortesherranz@gmail.com', 4),
('diegocortesherranz@gmail.com', 6),
('fernandoizquierdoromera@gmail.com', 3),
('fernandoizquierdoromera@gmail.com', 4),
('fernandoizquierdoromera@gmail.com', 6),
('franciscobenegascortes@gmail.com', 3),
('franciscobenegascortes@gmail.com', 4),
('franciscobenegascortes@gmail.com', 6),
('franciscojosecotanlopez@gmail.com', 3),
('franciscojosecotanlopez@gmail.com', 4),
('franciscojosecotanlopez@gmail.com', 6),
('juanfranciscodiazmoreno@gmail.com', 3),
('juanfranciscodiazmoreno@gmail.com', 4),
('juanfranciscodiazmoreno@gmail.com', 6),
('mariadelmargarciacabello@gmail.com', 3),
('mariadelmargarciacabello@gmail.com', 4),
('mariadelmargarciacabello@gmail.com', 6),
('michaelkieranbowen@gmail.com', 3),
('michaelkieranbowen@gmail.com', 4),
('michaelkieranbowen@gmail.com', 6),
('miguelkeane@gmail.com', 3),
('miguelkeane@gmail.com', 4),
('miguelkeane@gmail.com', 6),
('monicacordovillagamez@gmail.com', 3),
('monicacordovillagamez@gmail.com', 4),
('monicacordovillagamez@gmail.com', 6),
('nabilaliasserhaou@gmail.com', 3),
('nabilaliasserhaou@gmail.com', 4),
('nabilaliasserhaou@gmail.com', 6),
('pabloalaminosmoron@gmail.com', 3),
('pabloalaminosmoron@gmail.com', 4),
('pabloalaminosmoron@gmail.com', 6),
('pablodelgadogarcia@gmail.com', 3),
('pablodelgadogarcia@gmail.com', 4),
('pablodelgadogarcia@gmail.com', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `idProyecto` int(20) NOT NULL,
  `idConfig` int(20) DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL,
  `cursoAcademico` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`idProyecto`, `idConfig`, `fechaInicio`, `fechaFin`, `cursoAcademico`) VALUES
(1, 1, '2019-10-07', '2019-11-19', '19/20'),
(3, 2, '2019-09-21', NULL, '19/20'),
(4, 3, '2019-09-21', NULL, '19/20'),
(5, 4, '2019-11-25', '2019-12-19', '19/20'),
(6, 5, '2019-11-14', NULL, '19/20'),
(7, 1, '2018-10-01', '2018-11-01', '18/19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`idConfig`);

--
-- Indices de la tabla `conf_hito`
--
ALTER TABLE `conf_hito`
  ADD PRIMARY KEY (`idConfig`,`idHito`),
  ADD KEY `conf_hito_hito` (`idHito`);

--
-- Indices de la tabla `conf_hito_insig`
--
ALTER TABLE `conf_hito_insig`
  ADD PRIMARY KEY (`idConfig`,`idHito`,`idInsignia`),
  ADD KEY `conf_hito_insig_hito` (`idHito`),
  ADD KEY `conf_hito_insig_insig` (`idInsignia`);

--
-- Indices de la tabla `datos_grupo`
--
ALTER TABLE `datos_grupo`
  ADD PRIMARY KEY (`idProyecto`,`idDatos`,`idGrupo`,`curso`),
  ADD KEY `datos_grupo_grupo` (`idGrupo`,`curso`);

--
-- Indices de la tabla `datos_parti`
--
ALTER TABLE `datos_parti`
  ADD PRIMARY KEY (`idProyecto`,`idDatos`,`participante`),
  ADD KEY `datos_parti_parti` (`participante`);

--
-- Indices de la tabla `escala`
--
ALTER TABLE `escala`
  ADD PRIMARY KEY (`idHito`,`idEscala`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`,`curso`);

--
-- Indices de la tabla `grupo_parti`
--
ALTER TABLE `grupo_parti`
  ADD PRIMARY KEY (`idGrupo`,`correo`,`curso`),
  ADD KEY `parti_proy_correo` (`correo`),
  ADD KEY `parti_proy_grupo` (`idGrupo`,`curso`);

--
-- Indices de la tabla `grupo_proy`
--
ALTER TABLE `grupo_proy`
  ADD PRIMARY KEY (`idGrupo`,`curso`,`idProyecto`),
  ADD KEY `grupo_proy_proy` (`idProyecto`);

--
-- Indices de la tabla `hito`
--
ALTER TABLE `hito`
  ADD PRIMARY KEY (`idHito`);

--
-- Indices de la tabla `hito_autocalculable`
--
ALTER TABLE `hito_autocalculable`
  ADD PRIMARY KEY (`idHito`);

--
-- Indices de la tabla `hito_complejo`
--
ALTER TABLE `hito_complejo`
  ADD KEY `hitocomp_hito` (`idHito`);

--
-- Indices de la tabla `hito_factor_autocalculable`
--
ALTER TABLE `hito_factor_autocalculable`
  ADD PRIMARY KEY (`idHitoAut`,`idHito`),
  ADD KEY `restr_hito_factor` (`idHito`);

--
-- Indices de la tabla `insignia`
--
ALTER TABLE `insignia`
  ADD PRIMARY KEY (`idInsignia`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`idConfig`,`idNivel`);

--
-- Indices de la tabla `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`correo`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `parti_proy`
--
ALTER TABLE `parti_proy`
  ADD PRIMARY KEY (`correo`,`idProyecto`),
  ADD KEY `parti_proy_proy` (`idProyecto`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`idProyecto`),
  ADD KEY `proyecto_ibfk_1` (`idConfig`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `idConfig` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `idProyecto` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conf_hito`
--
ALTER TABLE `conf_hito`
  ADD CONSTRAINT `conf_hito_conf` FOREIGN KEY (`idConfig`) REFERENCES `configuracion` (`idConfig`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conf_hito_hito` FOREIGN KEY (`idHito`) REFERENCES `hito` (`idHito`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `conf_hito_insig`
--
ALTER TABLE `conf_hito_insig`
  ADD CONSTRAINT `conf_hito_insig_confhito` FOREIGN KEY (`idConfig`,`idHito`) REFERENCES `conf_hito` (`idConfig`, `idHito`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conf_hito_insig_insig` FOREIGN KEY (`idInsignia`) REFERENCES `insignia` (`idInsignia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_grupo`
--
ALTER TABLE `datos_grupo`
  ADD CONSTRAINT `datos_grupo_grupo` FOREIGN KEY (`idGrupo`,`curso`) REFERENCES `grupo` (`idGrupo`, `curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `datos_grupo_proy` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_parti`
--
ALTER TABLE `datos_parti`
  ADD CONSTRAINT `datos_parti_parti` FOREIGN KEY (`participante`) REFERENCES `participante` (`usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `datos_parti_proy` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `escala`
--
ALTER TABLE `escala`
  ADD CONSTRAINT `escala_hito` FOREIGN KEY (`idHito`) REFERENCES `hito_complejo` (`idHito`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo_parti`
--
ALTER TABLE `grupo_parti`
  ADD CONSTRAINT `parti_proy_correo` FOREIGN KEY (`correo`) REFERENCES `participante` (`correo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parti_proy_grupo` FOREIGN KEY (`idGrupo`,`curso`) REFERENCES `grupo` (`idGrupo`, `curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo_proy`
--
ALTER TABLE `grupo_proy`
  ADD CONSTRAINT `grupo_proy_grupo` FOREIGN KEY (`idGrupo`,`curso`) REFERENCES `grupo` (`idGrupo`, `curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo_proy_proy` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `hito_autocalculable`
--
ALTER TABLE `hito_autocalculable`
  ADD CONSTRAINT `rest_idhito` FOREIGN KEY (`idHito`) REFERENCES `hito` (`idHito`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `hito_complejo`
--
ALTER TABLE `hito_complejo`
  ADD CONSTRAINT `hitocomp_hito` FOREIGN KEY (`idHito`) REFERENCES `hito` (`idHito`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `hito_factor_autocalculable`
--
ALTER TABLE `hito_factor_autocalculable`
  ADD CONSTRAINT `restr_hito_autocalculable` FOREIGN KEY (`idHitoAut`) REFERENCES `hito_autocalculable` (`idHito`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restr_hito_factor` FOREIGN KEY (`idHito`) REFERENCES `hito` (`idHito`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD CONSTRAINT `nivel_conf` FOREIGN KEY (`idConfig`) REFERENCES `configuracion` (`idConfig`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parti_proy`
--
ALTER TABLE `parti_proy`
  ADD CONSTRAINT `parti_proy_parti` FOREIGN KEY (`correo`) REFERENCES `participante` (`correo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parti_proy_proy` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`idConfig`) REFERENCES `configuracion` (`idConfig`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

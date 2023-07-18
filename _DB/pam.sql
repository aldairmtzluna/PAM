-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2023 a las 02:31:58
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pama`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE `acciones` (
  `accion_id` int(11) NOT NULL,
  `accion_cmd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`accion_id`, `accion_cmd`) VALUES
(1, 'Crear Usuario'),
(2, 'Editar Usuario'),
(3, 'Inactivar Usuario '),
(4, 'Crear Minuta'),
(5, 'Editar Minuta'),
(6, 'Activar Minuta'),
(7, 'Inactivar Minuta'),
(8, 'Cerrar Minuta'),
(9, 'Crear Acuerdo'),
(10, 'Editar Acuerdo'),
(11, 'Activar Acuerdo'),
(12, 'Inactivar Acuerdo'),
(13, 'Cerrar Acuerdo'),
(14, 'Imprimir Minuta'),
(15, 'Crear Rol'),
(16, 'Editar Rol'),
(17, 'Eliminar Rol'),
(18, 'Crear Cargo'),
(19, 'Editar Cargo'),
(20, 'Eliminar Cargo'),
(21, 'Crear Titulo'),
(22, 'Editar Titulo'),
(23, 'Eliminar Titulo'),
(24, 'Crear Permisos'),
(25, 'Editar Permisos'),
(26, 'Imprimir Oficio'),
(27, 'Registrar Invitado'),
(28, 'Editar Invitado'),
(29, 'Eliminar Invitado'),
(30, 'Crear Reporte'),
(31, 'Editar Reporte'),
(32, 'Activar Reporte'),
(33, 'Inactivar Reporte'),
(34, 'Eliminar Reporte'),
(35, 'Crear Cadena'),
(36, 'Editar Cadena'),
(37, 'Borrar Cadena'),
(38, 'Imprimir Reporte'),
(39, 'Crear Persona'),
(40, 'Editar Persona'),
(41, 'Borrar Persona'),
(42, 'Crear Destinatario'),
(43, 'Editar Destinatario'),
(44, 'Borrar Destinatario'),
(45, 'Crear Remitente'),
(46, 'Editar Remitente'),
(47, 'Borrar Remitente'),
(48, 'Crear Empresa'),
(49, 'Editar Empresa'),
(50, 'Borrar Empresa'),
(51, 'Subir Oficio'),
(52, 'Editar Oficio'),
(53, 'Borrar Oficio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acuerdos`
--

CREATE TABLE `acuerdos` (
  `acuerdo_id` int(11) NOT NULL,
  `acuerdo_minuta` int(11) NOT NULL,
  `acuerdo_titulo` varchar(100) NOT NULL,
  `acuerdo_fecha_entrega` date NOT NULL,
  `acuerdo_responsable` int(11) NOT NULL,
  `acuerdo_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `acuerdo_status` int(11) NOT NULL DEFAULT 0 COMMENT '0-Pendiente, 1-Hecho',
  `minuta_prioridad` int(5) NOT NULL DEFAULT 0 COMMENT '0-Normal, 1-Urgente. 2-Paso Fecha'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `cargo_id` int(11) NOT NULL,
  `cargo_nom` varchar(100) NOT NULL,
  `cargo_tipo` int(2) NOT NULL DEFAULT 1 COMMENT '0=Externo 1=Interno',
  `cargo_estado` int(2) NOT NULL DEFAULT 1 COMMENT '0=Inactivo 1=Activo',
  `cargo_madeBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`cargo_id`, `cargo_nom`, `cargo_tipo`, `cargo_estado`, `cargo_madeBy`) VALUES
(1, 'Dirección Coordinadora de Innovación y Desarrollo Tecnológico', 1, 1, 0),
(2, 'Dirección de Desarrollo Tecnológico', 1, 1, 0),
(3, 'Dirección de Administración y Gestión Electrónica de Documentos', 1, 1, 0),
(4, 'Subdirección de Sistemas Administrativos', 1, 1, 0),
(5, 'Subdirección de Implementación y Administración de Aplicaciones', 1, 1, 0),
(6, 'Subdirección de Gestión Electrónica de Documentos', 1, 1, 0),
(7, 'Departamento de Portales y Administración de Contenido', 1, 1, 0),
(8, 'Departamento de Sistemas Ejecutivos', 1, 1, 0),
(9, 'Subdirección de Administración de Portales', 1, 1, 0),
(10, 'Subdirección de Politica de Transparencia e Información', 1, 1, 0),
(12, 'Subdirección de Innovación Tecnológica', 1, 1, 0),
(13, 'Subdirección de Comunicaciones e Ingeniería', 1, 1, 0),
(14, 'Subdirección de Seguridad Informática y Servicios de Voz', 1, 1, 0),
(15, 'Jefatura de Departamento de Informática', 1, 1, 0),
(16, 'Subdirección de Sistemas Sectoriales', 1, 1, 0),
(18, 'Jefatura de Departamento de Supervisión de Entrega de Servicios', 1, 1, 0),
(19, 'Subdirección de Administración de Soporte a Servicios de Tecnologías de Información y Comunicaciones', 1, 1, 0),
(20, 'Jefatura de Departamento de Comunicaciones e Ingeniería', 1, 1, 0),
(21, 'Jefatura de Departamento de Portales y Administración de Contenido', 1, 1, 0),
(22, 'Dirección de Normatividad en Tecnologías de la Información y Comunicaciones', 1, 1, 0),
(23, 'Dirección Coordinadora de Estrategía en Tecnología de Información y Comunicaciones', 1, 1, 0),
(24, 'Dirección de Comunicaciones', 1, 1, 0),
(25, 'Dirección de Servicios Informáticos', 1, 1, 0),
(26, 'Titular de la Unidad de Tecnologías de la Infomación y Comunicaciones', 1, 1, 0),
(27, 'Externo', 1, 1, 0),
(28, 'Coordinador de Infraestructura y Operaciones de TI', 1, 1, 0),
(29, 'Subdirección de Alineación Estratégica en Tecnologías de Información y Comunicación', 1, 1, 0),
(30, 'Dirección de Área', 1, 1, 0),
(31, 'Departamento de Análisis de Información de Comunicaciones', 1, 1, 0),
(32, 'Administrador de Contrato', 1, 1, 5),
(35, 'Director de Desarrollo Estratégico', 1, 1, 4),
(36, 'Titular de la Unidad de Transparencia', 1, 1, 4),
(37, 'Representante', 1, 1, 4),
(38, 'Director de Relaciones Institucionales', 1, 1, 4),
(39, 'Directora Coordinadora de Inclusión Digital', 1, 1, 4),
(40, 'Coordinadora Administrativa', 1, 1, 4),
(41, 'Director de Análisis de Accidentes e Incidentes de Aviación', 1, 1, 4),
(42, 'Directora Coordinadora de Administración de Personal', 1, 1, 4),
(43, 'Directora General', 1, 1, 4),
(44, 'Director Coordinador de Finanzas', 1, 1, 4),
(46, 'Dirección de Innovación y Operaciones de Sistemas', 1, 1, 4),
(47, 'Dirección General de Autotransporte Federal', 1, 1, 4),
(48, 'Titular de Unidad de Asuntos Jurídicos', 1, 1, 4),
(49, 'Director General de Recursos Humanos', 1, 1, 4),
(50, 'Titular del Área de Quejas', 1, 1, 4),
(51, 'Titular de la Unidad de Tecnologías de la Información y Comunicaciones', 1, 1, 4),
(52, 'Titular de Agencia Reguladora del Transporte Ferroviario', 1, 1, 4),
(53, 'Subdirector de Proyectos Tecnológicos y Operación de Sistemas', 1, 1, 4),
(55, 'Director General de Carreteras', 1, 1, 4),
(56, 'Director Ejecutivo de Planeación y Desarrollo', 1, 1, 4),
(57, 'Director General de Protección y Medicina Preventiva en el Transporte ', 1, 1, 4),
(58, 'Director General de Conservación de Carreteras', 1, 1, 4),
(59, 'Director de Informática', 1, 1, 4),
(60, 'Dirección Ejecutiva de Planeación y Desarrollo', 1, 1, 4),
(61, 'Director de Mejora Continua', 1, 1, 4),
(62, 'Director General Adjunto de Asuntos Jurídicos', 1, 1, 4),
(63, 'Director de Planeación y Control ', 1, 1, 4),
(64, 'Director de Servicios Internacionales de Autotransporte', 1, 1, 4),
(65, 'Director General de Planeación', 1, 1, 4),
(66, 'Director de Innovación Tecnológica y Operación de Sistemas', 1, 1, 4),
(67, 'Director General de Comunicación Social', 1, 1, 4),
(68, 'Representante Legal', 1, 1, 4),
(69, 'Jefe de la Unidad  de Vialidad y Proyectos', 1, 1, 4),
(70, 'Director de Normatividad en Tic', 1, 1, 4),
(71, 'Directores Generales y Titulares de Unidades', 1, 1, 4),
(72, 'Director Ejecutivo', 1, 1, 4),
(73, 'Coordinación Administrativa', 1, 1, 4),
(74, 'Director de Desarrollo Tecnológico', 1, 1, 4),
(75, 'Dirección de Estadística y Cartografía', 1, 1, 4),
(76, 'Director General de Servicios Técnicos', 1, 1, 4),
(77, 'Titular de la Agencia Reguladora de Transporte Ferroviario', 1, 1, 4),
(78, 'Subdirector de Comunicaciones e Ingeniería', 1, 1, 4),
(79, 'Administrador de Servicio', 1, 1, 4),
(80, 'Subdirectores de la D.C.I.T.', 1, 1, 4),
(81, 'Director General De Centro S.C.T. México', 1, 1, 4),
(82, 'Oficinas Centrales de la Secretaria de Comunicaciones y Transportes', 1, 1, 4),
(83, 'Coordinadora General de Puertos y Marina Mercante', 1, 1, 4),
(84, 'Subdirector de Estadística e Informática', 1, 1, 4),
(85, 'Director de la Industria Marítima', 1, 1, 4),
(86, 'Director Ejecutivo de Análisis', 1, 1, 4),
(87, 'Director Ejecutivo de Análisis Económico e Infraestructura', 1, 1, 4),
(88, 'Coordinador Jurídico de Transporte', 1, 1, 4),
(89, 'Director Ejecutivo de Administración', 1, 1, 4),
(90, 'Director de Administración de la Agencia Federal de Aviación Civil', 1, 1, 4),
(91, 'Cargo Validado', 1, 1, 4),
(92, 'Cargotest', 1, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entes`
--

CREATE TABLE `entes` (
  `ente_id` int(11) NOT NULL,
  `ente_nom` varchar(100) NOT NULL,
  `ente_tipo` int(2) NOT NULL DEFAULT 1 COMMENT '0=Externo 1=Interno',
  `ente_estado` int(11) NOT NULL DEFAULT 1 COMMENT '0-Inactivo, 1-Activo',
  `ente_categoria` int(11) NOT NULL COMMENT '1-dest, 2-rem, 3-emp',
  `ente_madeBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `entes`
--

INSERT INTO `entes` (`ente_id`, `ente_nom`, `ente_tipo`, `ente_estado`, `ente_categoria`, `ente_madeBy`) VALUES
(1, 'Alexis Villa, José Luis Sancen', 0, 1, 1, 5),
(2, 'People Media S.a. de C.v.', 0, 1, 3, 5),
(3, 'Mtro. José Antonio Rulfo Zaragoza', 1, 1, 2, 5),
(5, 'Lic. Ramiro Bernabé Martínez', 1, 1, 1, 4),
(6, 'Lic. Jacob González Macías', 1, 1, 1, 4),
(7, 'Lic. María Del Rocío Bello Castillo', 1, 1, 1, 4),
(8, 'Marco Neri Gómez', 1, 1, 1, 4),
(9, 'Jorge Luis Galindo Lara', 1, 1, 1, 4),
(10, 'Mario Carlos Saldívar', 1, 1, 1, 4),
(11, 'Leonardo N´haux', 1, 1, 1, 4),
(12, 'Aldo Córdoba', 1, 1, 1, 4),
(13, 'José Ángel Tinoco', 1, 1, 1, 4),
(14, 'Carlos Reyes Fernández', 1, 1, 1, 4),
(15, 'Juan Manuel Ramos', 1, 1, 1, 4),
(16, 'Luis Luna', 1, 1, 1, 4),
(17, 'Alberto Balderas', 1, 1, 1, 4),
(18, 'José Reyes', 1, 1, 1, 4),
(19, 'Janet Gutierrez', 1, 1, 1, 4),
(20, 'Javier Velázquez', 1, 1, 1, 4),
(21, 'Julián Méndez', 1, 1, 1, 4),
(22, 'Oscar Atriano', 1, 1, 1, 4),
(23, 'Roberto Montelongo', 1, 1, 1, 4),
(24, 'Carlos Rafael Aguilar Chávez', 1, 1, 1, 4),
(25, 'Carlos López Sisniega', 1, 1, 1, 4),
(26, 'Miranda Rafael Moreno', 1, 1, 1, 4),
(27, 'Lic. Iris Adriana Zurita Enríquez', 1, 1, 1, 4),
(28, 'Mtra. Ledénika Mackenzie Méndez Gonzalez', 1, 1, 1, 4),
(29, 'Lic. Elvis Ruth Sánchez Guevara', 1, 1, 1, 4),
(30, 'Mtro. José Antonio Rulfo Zaragoza', 1, 1, 1, 4),
(31, 'Ing. Armando Constantino Tercero', 1, 1, 1, 4),
(32, 'Lic. Blanca Estela Rivera Martínez', 1, 1, 1, 4),
(33, 'C.p. Laura Urrutia Mercado', 1, 1, 1, 4),
(34, 'Lic. María Eugenia Cruz Fernández', 1, 1, 1, 4),
(35, 'Lic. Oliver Noe Pasohondo Ramírez', 1, 1, 1, 4),
(36, 'Mtro. Ismael Cárdenas Mondragón', 1, 1, 1, 4),
(37, 'Ing. Aurora Del Carmen Castro Rolón', 1, 1, 1, 4),
(38, 'Lic. Alfredo Constantino Chávez', 1, 1, 1, 4),
(39, 'Lic. Román García Álvarez', 1, 1, 1, 4),
(40, 'Mao. José Antonio Santillán Flores', 1, 1, 1, 4),
(41, 'Lic. Viridiana García Flores', 1, 1, 1, 4),
(42, 'Dra. María Catalina Ovando Chico', 1, 1, 1, 4),
(43, 'Dr. David Camacho Alcocer', 1, 1, 1, 4),
(44, 'Lic. José Crispín Cortés González', 1, 1, 1, 4),
(45, 'Mtro. Manuel Eduardo Gómez Parra', 1, 1, 1, 4),
(46, 'Ing. Jesús Felipe Verdugo López', 1, 1, 1, 4),
(47, 'Mtra. Elvia Ivonne Vergara Maldonado', 1, 1, 1, 4),
(48, 'Dr. José Manuel Nogueira Fernández', 1, 1, 1, 4),
(49, 'Lic. Laura Nohemí Muñoz Benítez', 1, 1, 1, 4),
(50, 'Ing. Guillermo Hernandez Mercado', 1, 1, 1, 4),
(51, 'Lic. Salvador Escalante Heras', 1, 1, 1, 4),
(52, 'Mtro. Salvador Monroy Andrade', 1, 1, 1, 4),
(53, 'Ing. Ema Matías Morales', 1, 1, 1, 4),
(54, 'Mtro. José Arellano Duque', 1, 1, 1, 4),
(55, 'Mtra. Blanca Ivonne De La Cruz Almaráz', 1, 1, 1, 4),
(56, 'Ing. Jorge Leonel Wheatley Fernández', 1, 1, 1, 4),
(57, 'Ing. Elisa Salinas Rodriguez', 1, 1, 1, 4),
(58, 'Lic. Alejandra Mota Márquez', 1, 1, 1, 4),
(59, 'Liberty Finanzas S.a de C.v.', 1, 1, 3, 4),
(60, 'Ing. Juan Carlos Garza Peña', 1, 1, 1, 4),
(61, 'Mtro. Enrique Carrillo García', 1, 1, 1, 4),
(62, 'Directores Generales y Titulares de Unidades', 1, 1, 3, 4),
(63, 'Lic. Jorge Sanchez Núñez', 1, 1, 1, 4),
(64, 'Lic. Alfredo Santana Olvera', 1, 1, 1, 4),
(65, 'Mtro. Vinicio Andrés Serment Guerrero', 1, 1, 1, 4),
(66, 'Lic. Mario Marmolejo Cortés', 1, 1, 1, 4),
(67, 'Mtro. Armando Ahued Ahedo', 1, 1, 1, 4),
(68, 'Lic. Ernesto Javier Escalante González', 1, 1, 1, 4),
(69, 'Mtro. Evaristo Iván Ángeles Zermeño', 1, 1, 1, 4),
(70, 'Information Technology Consulting S.a. de C.v.', 1, 1, 3, 4),
(71, 'Tecnología en Sistemas de Apoyo S.a.', 1, 1, 3, 4),
(72, 'Evaristo Fernández Perea', 1, 1, 1, 4),
(73, 'Ileana Ortega', 1, 1, 1, 4),
(74, 'Planmedia Mex S.a de C.v.', 1, 1, 3, 4),
(75, 'Ing. Mario Cesar Herrera Gonzalez', 1, 1, 1, 4),
(76, 'Mtra. Bertha Ventura Navarrete', 1, 1, 1, 4),
(77, 'Lic. Daniela Cisneros Landín', 0, 1, 1, 4),
(78, 'Subdirectores de la D.C.I.D.T.', 1, 1, 3, 4),
(79, 'Ing. Apolonia Martinez Yáñez', 1, 1, 1, 4),
(80, 'Cap. Alt. Laura López Bautista', 1, 1, 1, 4),
(81, 'Ing. Salvador Fernández Ayala', 1, 1, 1, 4),
(82, 'Ing. Francisco Raúl Chavoya Cárdenas', 1, 1, 1, 4),
(83, 'Ing. Efrén Torres López', 1, 1, 1, 4),
(84, 'Lic. Ángel Asención Córtes Pérez', 1, 1, 1, 4),
(85, 'Lic. María Del Carmen Ramírez Neri', 1, 1, 1, 4),
(86, 'Lic. Juan José Ávila Maldonado', 1, 1, 1, 4),
(87, 'Mtro. Fernando Canul Juárez', 1, 1, 1, 4),
(88, 'Mtro. Luis Gregorio Ojinaga De La Luz', 1, 1, 1, 4),
(89, 'Ing. Armando Vega Gómez', 1, 1, 1, 4),
(90, 'People Media S.a De C.v.', 1, 1, 1, 4),
(91, 'Ing. Mario César Herrera González', 1, 1, 2, 4),
(93, 'Lic. Ramiro Bernabé Martinez', 1, 1, 2, 4),
(94, 'EXTERNO', 1, 1, 3, 4),
(99, 'AGENCIA FEDERAL DE  AVIACIóN CIVIL', 1, 1, 3, 4),
(100, 'Dirección Coordinadora de Innovación y Desarrollo Tecnológico', 1, 1, 3, 4),
(101, 'SECRETARIO DEL RAMO ', 1, 1, 3, 4),
(102, 'DIRECCIÓN GENERAL DE VINCULACIÓN', 1, 1, 3, 4),
(103, 'UNIDAD DE ASUNTOS JURÍDICOS', 1, 1, 3, 4),
(104, 'DIRECCIÓN GENERAL DE COMUNICACIÓN SOCIAL', 1, 1, 3, 4),
(105, 'ÓRGANO INTERNO DE CONTROL', 1, 1, 3, 4),
(106, 'DIRECCIÓN GENERAL DE PLANEACIÓN', 1, 1, 3, 4),
(107, 'SUBSECRETARIO DE INFRAESTRUCTURA', 1, 1, 3, 4),
(108, 'DIRECCIÓN GENERAL DE COMUNICACIÓN SOCIAL', 1, 1, 3, 4),
(109, 'SUBSECRETARIO DE INFRAESTRUCTURA', 1, 1, 3, 4),
(110, 'U. INFRAESTRUCTURA CARRETERA PARA EL DESARROLLO REG', 1, 1, 3, 4),
(111, 'DIR. GRAL. DE CARRETERAS', 1, 1, 3, 4),
(112, 'DIR. GRAL. DE CONSERVACIÓN DE CARRETERAS', 1, 1, 3, 4),
(113, 'Dir. Gral. De Servicios Tecnicos', 1, 1, 3, 5),
(114, 'Dir. Gral. De Desarrollo Carretero', 1, 1, 3, 4),
(115, 'Subsecretaria Del Transporte', 1, 1, 3, 4),
(116, 'Dir. Gral. De AeronÁutica Civil', 1, 1, 3, 4),
(117, 'DirecciÓn General De Desarrollo Ferroviario Y Multimodall', 1, 1, 3, 4),
(118, 'Dir. Gral. De Autotransporte Federal', 1, 1, 3, 4),
(119, 'Dir. Gral. De Protect. Y Med. Prev. En El Transp', 1, 1, 3, 4),
(120, 'Subsecretaria De Comunicaciones', 1, 1, 3, 4),
(121, 'Dir. Gral. De Sistemas De Radio Y TelevisiÓn', 1, 1, 3, 4),
(122, 'Dir. Gral. De PolÍtica De Telecomunicaciones Y RadiodifusiÓn', 1, 1, 3, 4),
(123, 'Unidad De La Red Federal', 1, 1, 3, 4),
(125, 'Coord. General De Puertos Y Marina Mercante', 1, 1, 3, 4),
(126, 'Dir. Gral. De Puertos', 1, 1, 3, 4),
(127, 'Dir. Gral. De Marina Mercante', 1, 1, 3, 4),
(128, 'Dir. Gral. De Fomento Y AdministraciÓn Portuaria', 1, 1, 3, 4),
(129, 'CoordinaciÓn General De Centro S.c.t.', 1, 1, 3, 4),
(130, 'Dir. Gral. De EvaluaciÓn', 1, 1, 3, 4),
(131, 'Centro S.c.t. Aguascalientes', 1, 1, 3, 4),
(132, 'Centro S.c.t. Baja California', 1, 1, 3, 4),
(133, 'Centro S.c.t. Baja California Sur', 1, 1, 3, 4),
(134, 'Centro S.c.t. Campeche', 1, 1, 3, 4),
(135, 'Centro S.c.t. Coahuila', 1, 1, 3, 4),
(136, 'Centro S.c.t. Colima', 1, 1, 3, 4),
(137, 'Centro S.c.t. Chiapas', 1, 1, 3, 4),
(138, 'Centro S.c.t. Chihuahua', 1, 1, 3, 4),
(139, 'Centro S.c.t. Durango', 1, 1, 3, 4),
(140, 'Centro S.c.t. Guanajuato', 1, 1, 3, 4),
(141, 'Centro S.c.t. Guerrero', 1, 1, 3, 4),
(142, 'Centro S.c.t. Hidalgo', 1, 1, 3, 4),
(143, 'Centro S.c.t. Jalisco', 1, 1, 3, 4),
(144, 'Centro S.c.t. MÉxico', 1, 1, 3, 4),
(145, 'Centro S.c.t MichoacÁn', 1, 1, 3, 4),
(146, 'Centro S.c.t. Morelos', 1, 1, 3, 4),
(147, 'Centro S.c.t. Nayarit', 1, 1, 3, 4),
(148, 'Centro S.c.t. Nuevo LeÓn', 1, 1, 3, 4),
(149, 'Centro S.c.t. Oaxaca', 1, 1, 3, 4),
(150, 'Centro S.c.t. Puebla', 1, 1, 3, 4),
(151, 'Centro S.c.t. QuerÉtaro', 1, 1, 3, 4),
(152, 'Centro S.c.t. Quintana Roo', 1, 1, 3, 4),
(153, 'Centro S.c.t. San Luis PotosÍ', 1, 1, 3, 4),
(154, 'Centro S.c.t. Sinaloa', 1, 1, 3, 4),
(155, 'Centro S.c.t. Sonora', 1, 1, 3, 4),
(156, 'Centro S.c.t. Tabasco', 1, 1, 3, 4),
(157, 'Centro S.c.t. Tamaulipas', 1, 1, 3, 4),
(158, 'Centro S.c.t. Tlaxcala', 1, 1, 3, 4),
(159, 'Centro S.c.t. Veracruz', 1, 1, 3, 4),
(160, 'Centro S.c.t. YucatÁn', 1, 1, 3, 4),
(161, 'Centro S.c.t. Zacatecas', 1, 1, 3, 4),
(162, 'Unidad De AdministraciÓn Y Finanzas', 1, 1, 3, 4),
(163, 'Dir. Gral. De Prog. OrganizaciÓn Y Presup.', 1, 1, 3, 4),
(164, 'Dir. Gral. De Recursos Humanos', 1, 1, 3, 4),
(165, 'Dir. Gral. De Recursos Materiales', 1, 1, 3, 4),
(166, 'Unidad De TecnologÍa De InformaciÓn Y Comunicaciones', 1, 1, 3, 4),
(167, 'Unidad De Transparencias', 1, 1, 3, 4),
(168, 'Asociación Federal De Aviación Civil', 1, 1, 3, 4),
(169, 'Nd Negocios Digitales S.a De C.v.', 0, 1, 3, 4),
(170, 'Infotec.', 0, 1, 3, 4),
(171, 'Gonet México S.a. De C.v.', 1, 1, 3, 4),
(172, 'Sye Software S.a De C.v.', 1, 1, 3, 4),
(173, 'Engine Core S.a De C.v.', 0, 1, 3, 4),
(174, 'Axity S.a De C.v.', 1, 1, 3, 4),
(175, 'Axsis Tecnología S.a De C.v.', 1, 1, 3, 4),
(176, 'Axtel S.a. De C.v.', 1, 1, 3, 4),
(177, 'Buzz Word Comunicacion S.a De C.v.', 0, 1, 3, 4),
(178, 'Capgemini México S De Rl De C.v.', 0, 1, 3, 4),
(179, 'Customsoft S.a.p.i. De C.v.', 0, 1, 3, 4),
(180, 'Ids Comercial S.a De C.v.', 0, 1, 3, 4),
(181, 'Kernel Servicios En Informática S.a. De C.v.', 0, 1, 3, 4),
(182, 'Lacertus Ti S.a De C.v.', 1, 1, 3, 4),
(183, 'Smartsoft America Business Applications S.a De C.v.', 0, 1, 3, 4),
(184, 'Softtek Information Services Bfs Ingeniería Aplicada S.a. De C.v.', 1, 1, 3, 4),
(185, 'Tecnología Aplicada A Negocios S.a. De C.v.', 0, 1, 3, 4),
(186, 'Tecnología De Gestión Y Comunicación S.a. De C.v.', 0, 1, 3, 4),
(187, 'Vision Consulting', 0, 1, 3, 4),
(188, 'Coordinación De La Sociedad De La Información Y Conocimiento', 0, 1, 3, 4),
(189, 'Oficina Del C. Secretario', 0, 1, 3, 4),
(190, 'Subsecretaria De Transportes', 1, 1, 3, 4),
(191, 'Agencia Reguladora Del Transporte Ferroviario', 1, 1, 3, 4),
(192, 'Registro Nacional De Población E Identidad', 1, 1, 3, 4),
(193, 'Oficinas Centrales De La Secretaría De Infraestructura', 1, 1, 3, 4),
(194, 'Sinergia De Consultores S De R.l. De C.v. Y Customsoft S.a.p.i De C.v.', 1, 1, 3, 4),
(195, 'Director General De Servicios Técnicos', 1, 1, 3, 4),
(196, 'Ultrasist S.a De C.v.', 0, 1, 3, 4),
(197, 'Iqsec S.a. De C.v.', 0, 1, 3, 4),
(198, 'Centro Sct México', 1, 1, 3, 4),
(199, 'Oficinas Centrales De La Secretaria De Comunicaciones Y Transportes', 1, 1, 3, 4),
(200, 'Puertos Y Marina Mercante', 1, 1, 3, 4),
(201, 'EXTERNO', 1, 1, 2, 4),
(202, 'Director de Desarrollo Estratégico', 1, 1, 2, 4),
(203, 'TITULAR DE LA UNIDAD DE TRANSPARENCIA', 1, 1, 2, 4),
(204, 'REPRESENTANTE', 1, 1, 2, 4),
(206, 'EXTERNO', 1, 1, 3, 4),
(207, 'Destinatario Validado', 1, 1, 1, 4),
(208, 'Remitente Validado', 1, 1, 2, 4),
(209, 'Unidad Validada', 1, 1, 3, 4),
(210, 'Destinatariotest', 1, 1, 1, 4),
(211, 'Empresatest', 1, 1, 3, 4),
(212, 'Remitentetest', 1, 1, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evidencias`
--

CREATE TABLE `evidencias` (
  `evidencia_id` int(11) NOT NULL,
  `evidencia_reporte` int(11) NOT NULL,
  `evidencia_origen` varchar(255) NOT NULL,
  `evidencia_fecha` date NOT NULL,
  `evidencia_razon` varchar(255) NOT NULL,
  `evidencia_destino` varchar(255) NOT NULL,
  `evidencia_prueba` varchar(255) DEFAULT NULL,
  `evidencia_fecha_sis` datetime NOT NULL DEFAULT current_timestamp(),
  `evidencia_status` int(11) NOT NULL DEFAULT 0 COMMENT '0-Pendiente, 1-Hecho',
  `evidencia_prioridad` int(5) NOT NULL DEFAULT 0 COMMENT '0-Normal, 1-Urgente. 2-Paso Fecha'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `hist_id` int(11) NOT NULL,
  `hist_user` int(11) NOT NULL,
  `hist_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `hist_ip` varchar(50) NOT NULL,
  `hist_accion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logos`
--

CREATE TABLE `logos` (
  `logo_id` int(11) NOT NULL,
  `logo_nombre` varchar(255) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `logo_anho` varchar(255) NOT NULL,
  `logo_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `minutas`
--

CREATE TABLE `minutas` (
  `minuta_id` int(11) NOT NULL,
  `minuta_madeBy` int(11) NOT NULL DEFAULT 1,
  `minuta_titulo` varchar(150) NOT NULL,
  `minuta_desarrollo` longtext NOT NULL,
  `minuta_lugar` varchar(100) NOT NULL,
  `minuta_fecha` date NOT NULL,
  `minuta_hora` varchar(11) NOT NULL,
  `minuta_hora_cierre` varchar(11) DEFAULT NULL,
  `minuta_unidad_admin` int(5) NOT NULL,
  `minuta_participantes` varchar(255) NOT NULL,
  `minuta_archivo` varchar(100) NOT NULL,
  `minuta_status` int(5) NOT NULL DEFAULT 1 COMMENT '0-Finalizada, 1-Activa, 2-En Espera',
  `minuta_prioridad` int(5) NOT NULL DEFAULT 0 COMMENT '0-Normal, 1-Urgente. 2-Paso Fecha',
  `minuta_fecha_PAM` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `minutas`
--

INSERT INTO `minutas` (`minuta_id`, `minuta_madeBy`, `minuta_titulo`, `minuta_desarrollo`, `minuta_lugar`, `minuta_fecha`, `minuta_hora`, `minuta_hora_cierre`, `minuta_unidad_admin`, `minuta_participantes`, `minuta_archivo`, `minuta_status`, `minuta_prioridad`, `minuta_fecha_PAM`) VALUES
(1, 4, 'NA', 'NA', 'NA', '2023-05-23', '00:00', '00:00', 32, '13', '', 1, 0, '2023-05-23 17:33:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `mod_id` int(11) NOT NULL,
  `mod_nombre` varchar(50) NOT NULL,
  `mod_estado` int(2) NOT NULL DEFAULT 1 COMMENT '0=inactivo 1=activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`mod_id`, `mod_nombre`, `mod_estado`) VALUES
(1, 'Modulo Usuarios', 1),
(2, 'Modulo Minutas', 1),
(3, 'Modulo Oficios', 1),
(4, 'Modulo CTR', 1),
(5, 'Modulo Logos', 1),
(6, 'Modulo Oficios', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficios`
--

CREATE TABLE `oficios` (
  `ofi_id` int(11) NOT NULL,
  `ofi_subidoPor` int(11) NOT NULL,
  `ofi_destinatario` int(11) NOT NULL,
  `ofi_cargoDest` int(11) DEFAULT NULL,
  `ofi_unidadDest` int(11) DEFAULT NULL,
  `ofi_remitente` int(11) NOT NULL,
  `ofi_cargoRem` int(11) NOT NULL,
  `ofi_unidadRem` int(11) DEFAULT NULL,
  `ofi_fechaE` date NOT NULL,
  `ofi_fechaRecep` date NOT NULL,
  `ofi_asunto` varchar(50) NOT NULL,
  `ofi_numero` varchar(50) NOT NULL,
  `ofi_observacion` varchar(250) NOT NULL,
  `ofi_fechaSOFI` datetime NOT NULL DEFAULT current_timestamp(),
  `ofi_activo` int(2) NOT NULL DEFAULT 1 COMMENT '0=Inactivo 1=Activo',
  `ofi_url` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `oficios`
--

INSERT INTO `oficios` (`ofi_id`, `ofi_subidoPor`, `ofi_destinatario`, `ofi_cargoDest`, `ofi_unidadDest`, `ofi_remitente`, `ofi_cargoRem`, `ofi_unidadRem`, `ofi_fechaE`, `ofi_fechaRecep`, `ofi_asunto`, `ofi_numero`, `ofi_observacion`, `ofi_fechaSOFI`, `ofi_activo`, `ofi_url`) VALUES
(2, 5, 5, 27, 65, 91, 1, 1, '2022-01-11', '2022-01-12', 'Solicitud de entrega de respaldo  de archivos y do', '5..4.2.001/2022', 'Solicitud de entrega de respaldo de archivos y documentos electrónicos.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_847270343.pdf'),
(3, 5, 6, 2, 66, 91, 1, 1, '2022-01-27', '2022-01-27', 'Baja de inventario de Sistema de Registro de Incid', '5.4.2.002/2022', 'Atención a oficio 4.1.0.4.-427, se da de baja el sistema RIAF.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_911707443.pdf'),
(4, 5, 5, 36, 67, 91, 1, 1, '2022-01-27', '2022-01-27', 'Baja de inventario del Sistema Alianza para el Gob', '5.4.2.003/2022', 'Atención a oficio SCT-UT-637-2021, se dio de baja el Sistema AGA.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_287501854.pdf'),
(5, 5, 6, 2, 68, 91, 1, 1, '2022-01-27', '2022-01-27', 'Entrega de sistema Viaja Seguro: Sprint 3', '5.4.2.004/2022', 'Se hace entrega de Sistema Viaja Seguro actualizado de acuerdo a las HU que se especifico dentro del ciclo \"Sprint3 AFAC-128\"', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_280652684.pdf'),
(6, 5, 6, 37, 69, 91, 1, 1, '2022-01-28', '0022-12-28', 'Solicitud de Cotización', '5.2.4.005/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_638657143.pdf'),
(7, 5, 7, 37, 70, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.006/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_557839620.pdf'),
(8, 5, 8, 37, 71, 91, 1, 1, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.007/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_528778932.pdf'),
(9, 5, 9, 37, 72, 91, 1, 1, '2022-01-28', '2022-02-20', 'Solicitud de Cotización', '5.4.2.008/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_368488503.pdf'),
(10, 5, 10, 37, 73, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.009/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_970244207.pdf'),
(11, 5, 11, 37, 74, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '4.5.2.010/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_665322300.pdf'),
(12, 5, 12, 37, 75, 91, 1, 1, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.47.2.011/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_681392400.pdf'),
(13, 5, 13, 37, 76, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.012/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_909365145.pdf'),
(14, 5, 14, 37, 77, 91, 1, 1, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.013/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_15575377.pdf'),
(15, 5, 15, 37, 78, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.014/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_421682874.pdf'),
(16, 5, 16, 37, 79, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.015/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_434302876.pdf'),
(17, 5, 17, 37, 80, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.016/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_195164613.pdf'),
(18, 5, 18, 37, 81, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización ', '5.4.2.017/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_186335773.pdf'),
(19, 5, 19, 37, 82, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.018/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_415621714.pdf'),
(20, 5, 20, 37, 83, 91, 1, 1, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.018/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_841469635.pdf'),
(21, 5, 207, 91, 209, 208, 91, 209, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.019/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_316167246.pdf'),
(22, 5, 207, 91, 209, 208, 91, 209, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.020/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_99223568.pdf'),
(23, 5, 207, 91, 209, 208, 91, 209, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.021/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_125859125.pdf'),
(24, 5, 207, 91, 209, 208, 91, 209, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.022/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_674627790.pdf'),
(25, 5, 207, 91, 209, 208, 91, 209, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.023/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_935992602.pdf'),
(26, 5, 207, 91, 209, 208, 91, 209, '2022-01-28', '2022-01-28', 'Solicitud de Cotización', '5.4.2.024/2022', '*Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_639640507.pdf'),
(27, 5, 207, 91, 209, 208, 91, 209, '2022-02-08', '2022-02-09', 'Traza tu ruta', '5.4.2.026/2022', 'Se realiza activación del sitio Traza tu ruta y se menciona que la actualización del mismo será atendida hasta que la UTIC cuente con el servicio de soporte y mantenimiento a sistemas .', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_86417283.pdf'),
(28, 5, 207, 91, 209, 208, 91, 209, '2022-02-10', '2022-02-10', 'Atención a Oficio 1.4.4.-009/2022', '5.4.2.027/2022', 'Se hace entrega de la información solicitada así como se comunica que para la actualización y mantenimiento de la aplicación mencionada no es posible en este momento ya que no e cuenta con proveedor para dar dicho servicio.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_388942924.pdf'),
(29, 5, 207, 91, 209, 208, 91, 209, '2022-02-11', '2022-02-11', 'Alta como Administrador Pegasus', '5.4.2.028/2022', 'Se habilita al Lic. Salvador Escalante Heras el modulo Administración para dar de Alta y Baja usuarios en Pegasus', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_210385860.pdf'),
(30, 5, 207, 91, 209, 208, 91, 209, '2022-02-23', '2022-02-23', 'Solicitud de concentrado de datos técnicos de los ', '5.4.2.030/2022', 'Solicitud de información de los sistemas de sus datos técnicos', '2022-12-09 00:00:00', 0, ',resources/oficios/2/2022/dic/09-12-22_861929313.pdf'),
(31, 5, 207, 91, 209, 208, 91, 209, '2022-03-01', '2022-03-01', 'Baja operacional Micrositio AFAC', '5.4.2.031/2022', 'Se informa que  se realza la baja operacional de Micrositio así como las cuentas que fungían como administradores de dicho sitio.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_377188645.pdf'),
(32, 5, 207, 91, 209, 208, 91, 209, '2022-03-01', '2022-03-01', 'Reinstalación de Página del DAAIA', '5.4.2.032/2022', 'Se habilita el sitio mencionado y se comunica que no es posible dar el mantenimiento adecuado hasta que no se cuente con un proveedor.', '2022-12-09 00:00:00', 1, ',resources/oficios/2/2022/dic/09-12-22_127013419.pdf'),
(33, 5, 207, 91, 209, 208, 91, 209, '2022-03-02', '2022-03-02', 'Reingeniería del SIA Servicios Personales', '5.4.2.033/2022', 'Se informa que por falta de un proveedor para e servicio de soporte y mantenimiento para los sistemas informáticos, no se puede realizar la actualización del SIA.', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_486057716.pdf'),
(34, 5, 207, 91, 209, 208, 91, 209, '2022-03-02', '2022-02-03', 'Actualización de FASTPAY a TotalPost', '5.4.2.034/2022', 'Se informa que ésta Dirección Coordinadora esta lista con el desarrollo, estando atento para que sea indicada la fecha para certificación con el banco.', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_542277623.pdf'),
(35, 5, 207, 91, 209, 208, 91, 209, '2022-03-07', '2022-03-07', 'Solitud de Suficiencia Presupuestal', '5.4.2.036/2022', 'Solicitud de Suficiencia Presupuestal 2022', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_479826778.pdf'),
(36, 5, 207, 91, 209, 208, 91, 209, '2022-03-04', '2022-03-07', 'Actualización de Fast Pay a  TotalPosteNet', '5.4.2.037/2022', 'Relatoría de los esfuerzos en la migración de la plataforma de FAST PAY a TotalPostNet', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_227053455.pdf'),
(37, 5, 207, 91, 209, 208, 91, 209, '2022-03-07', '2022-03-09', 'Soporte para entorno de contenedores', '5.4.2.038/2022', 'Solicitud de atención de la organización a tratar para el soporte a los contenedores', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_648395917.pdf'),
(38, 5, 207, 91, 209, 208, 91, 209, '2022-03-08', '2022-03-08', 'Atención similar 4.2.0.1.048/2022', '5.4.2.039/2022', 'Relatoría de los antecedentes así como las soluciones propuestas para atender los incidentes presentados por el sistema de MEDPREV', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_491872280.pdf'),
(39, 5, 207, 91, 209, 208, 91, 209, '2022-03-09', '2022-03-09', 'Adecuación a la Ventanilla Única de LFD', '5.4.2.040/2022', 'Atención a oficio 4.2.002/2022. \r\nSe informa que se hace cambio de concepto y tarifa conforme a la solicitud enviada.', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_221336887.pdf'),
(40, 5, 207, 91, 209, 208, 91, 209, '2022-03-09', '2022-03-10', 'Ficha de registro portal divulgación', '5.4.2.041/2022', 'Entrega de información  solicitada delos sistema y portales correspondientes a la unidad de asuntos jurídicos. Así como también se hace la solicitud de que sea remitida a ésta dirección coordinadora la ficha de registro del Portal de Divulgación Norm', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_818117945.pdf'),
(41, 2, 207, 91, 209, 208, 91, 209, '2022-03-14', '2022-03-16', 'Normateca Interna de SICT', '5.4.2.042/2022', 'De acuerdo a la solicitud en el oficio circular NO.5.4.0308/2022 , se informa que se ha generado el respaldo solicitado , así como también se realiza la actualización del portal identidad gráfica', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_966112051.pdf'),
(42, 2, 207, 91, 209, 208, 91, 209, '2022-03-17', '2022-03-17', 'Movimientos con diferencia de pago', '5.4.2.043/2022', 'En atención a la solicitud en el oficio no. 4.2.0.1-069/2022 se solicita sea compartida con esta dirección coordinadora , el brindar los identificadores de los movimientos y así buscar el histórico de lo mismos en conjunto.', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_619374142.pdf'),
(43, 2, 207, 91, 209, 208, 91, 209, '2022-03-28', '2022-03-29', 'Expediente 2022/SCT/DE222 y su acumulado 2022/SCT/', '5.4.2.044/2022', 'En atención al oficio No.09/200/0973/2022, se comunica que se efectúa la búsqueda en el sistema de Institucional ATF y no fue posible identificar el o los equipos de cómputo a través de los cuales realizaron los tramites citados.', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_774981467.pdf'),
(44, 2, 207, 91, 209, 208, 91, 209, '2022-03-30', '2022-03-31', 'Concentración de datos técnicos de los sistemas', '5.4.2.045/2022', 'Se da atención a la solicitud en el oficio 5.4.054/2022 y se hace entrega de la información solicitada.', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_384629375.pdf'),
(45, 2, 207, 91, 209, 208, 91, 209, '0022-03-30', '2022-03-31', 'Licencia Federal Digital Ferroviaria', '5.4.2.046/2022', 'De acuerdo a la solicitud en el oficio No.4.5.0013/2022 se informa que se realizaron la adecuaciones en la ventanilla única y en la emisión al formato e5Cinco mismo que ya fue desplegado', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_892554387.pdf'),
(46, 2, 207, 91, 209, 208, 91, 209, '2022-04-04', '2022-04-04', 'Solicitud de atención por excepción', '5.4.2.047/2022', 'Solicitud de Consideración especial para los ticket levantados a través de GLPi con ID 27269 y ID 27367.', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_721689610.pdf'),
(47, 2, 207, 91, 209, 208, 91, 209, '2022-04-22', '2022-04-22', '60 números de licencias', '5.4.2.048/2022', 'Se da atención de acuerdo al oficio 4.2.0.1.1.114/2022, dando 60 números de licencias con nomenclatura LDFXXXXXX.', '2022-12-12 00:00:00', 1, ',resources/oficios/2/2022/dic/12-12-22_904249377.pdf'),
(48, 2, 207, 91, 209, 208, 91, 209, '2022-04-25', '2022-04-25', 'Modulo de Administración de Obra Ferroviaria', '5.4.2.049/2022', 'Se informa que la solicitud de diseñar e incorporar el sistema MAOF, no es posible por el momento ya que el UTIC no cuenta aun con el proveedor de mantenimiento y soporte a los aplicativos de los sistemas', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_797957561.pdf'),
(49, 2, 207, 91, 209, 208, 91, 209, '2022-04-25', '2022-04-25', 'Sistema Institucional de Seguimiento Pavimentación', '5.4.2.050/2022', 'Se informa que una vez que la UTIC cuente con el proveedor para el soporte y mantenimiento de aplicaciones, se contactara con el product owner de la unidad para así conocer los alcances del desarrollo  solicitado', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_604895090.pdf'),
(50, 2, 207, 91, 209, 208, 91, 209, '2022-04-21', '2022-04-25', 'Sistema de Administración  para la Obra Pública', '5.4.2.051/2022', 'Se informa que una vez que la UTIC  cuente con el proveedor para el soporte y mantenimiento de las aplicaciones , se contactara con el prodcut owner de la unidad para así conocer el alcance del desarrollo solicitado.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_834649351.pdf'),
(51, 2, 207, 91, 209, 208, 91, 209, '2022-04-26', '2022-04-26', 'Módulo dentro del Sistema de Trámites de Ventanill', '5.4.2.052/2022', 'Se informa que para atender la solicitud, se debe designar un product owner por parte de la DGAF así como también debe cumplir con perfil en especifico.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_329531698.pdf'),
(52, 2, 207, 91, 209, 208, 91, 209, '0022-04-26', '2022-04-26', 'Designación de Product Owner', '5.4.2.053/2022', 'Solicitud de designación de Product Owner ', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_466993313.pdf'),
(53, 2, 207, 91, 209, 208, 91, 209, '2022-05-04', '2022-05-04', 'Cambio de horario de Alejandra Valdez', '5.4.2.054/2022', 'Cambio de horario de Alejandra Valdez', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_312630850.pdf'),
(54, 2, 207, 91, 209, 208, 91, 209, '2022-05-09', '2022-05-09', 'Solicitud de Registro de Aplicativo', '5.4.2.054/2022', 'Se informa que para poder dar registro a los sistemas solicitados se debe de enviar la Ficha de Registro por cada aplicativo.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_81878134.pdf'),
(55, 2, 207, 91, 209, 208, 91, 209, '2022-05-09', '2022-05-09', 'Solicitud de Ficha registro', '5.2.4.056/2022', 'Se informa que para poder dar mantenimiento y soporte a los aplicativos, es necesario enviar una Ficha de Registro de Sistema por cada aplicativo.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_26650930.pdf'),
(56, 2, 207, 91, 209, 208, 91, 209, '2022-05-09', '2022-05-09', 'Solicitud de registro de aplicativo', '5.4.2.057/2022', 'Se informa que para poder dar mantenimiento y soporte a los aplicativos, es necesario enviar una Ficha de Registro de Sistema por cada aplicativo.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_268096331.pdf'),
(57, 2, 207, 91, 209, 208, 91, 209, '2022-05-09', '2022-05-09', 'Solicitud de Ficha de Registro de Aplicativo', '5.4.2.058/2022', 'Se informa que para poder dar mantenimiento y soporte a los aplicativos, es necesario enviar una Ficha de Registro de Sistema por cada aplicativo.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_937945265.pdf'),
(58, 2, 207, 91, 209, 208, 91, 209, '2022-05-09', '2022-05-09', 'Solicitud de Ficha de Registro de Aplicativo', '5.4.2.059/2022', 'Se informa que para poder dar mantenimiento y soporte a los aplicativos, es necesario enviar una Ficha de Registro de Sistema por cada aplicativo.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_962835366.pdf'),
(59, 2, 207, 91, 209, 208, 91, 209, '2022-05-09', '2022-05-09', 'Solicitud de Ficha de Registro de Aplicativo', '5.4.2.060/2022', 'Se informa que para poder dar mantenimiento y soporte a los aplicativos, es necesario enviar una Ficha de Registro de Sistema por cada aplicativo.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_97996390.pdf'),
(60, 2, 207, 91, 209, 208, 91, 209, '2022-05-09', '2022-05-09', 'Solicitud de Ficha Registro de Aplicativo', '5.4.2.061/2022', 'Se informa que para poder dar mantenimiento y soporte a los aplicativos, es necesario enviar una Ficha de Registro de Sistema por cada aplicativo.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_541413657.pdf'),
(61, 2, 207, 91, 209, 208, 91, 209, '2022-05-12', '2022-05-12', 'Normateca Interna de la SICT', '5.4.2.063/2022', 'Se informa que por el momento no es posible incluir a la Normateca Interna al lista de aplicativos, ya que por el momento no se cuenta con el proveedor para el soporte y mantenimiento  de los aplicativos, una vez que se cuente con dicho proovedor, se', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_929137045.pdf'),
(62, 2, 207, 91, 209, 208, 91, 209, '2022-05-12', '2022-05-13', 'Ventana de Mantenimiento Licencia Federal de Condu', '5.4.2.064/2022', 'Se informa que el mantenimiento a la aplicación se llevó acabo en la fecha y hora señalado, así como también se recibió el visto bueno de la In. Ivonne Vergara  Maldonado Directora Ejecutiva de Planeación y Desarrollo desde entonces.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_322456467.pdf'),
(63, 2, 207, 91, 209, 208, 91, 209, '2022-05-18', '2022-05-18', 'Consulta \"Proyecto de Soporte y Mantenimiento\"', '5.4.2.065/2022', 'Solicitud al OIC para señalar el proceso a seguir después de solventar las observaciones señaladas la CDEN', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_599892140.pdf'),
(64, 2, 207, 91, 209, 208, 91, 209, '2022-05-19', '2022-05-20', 'Adecuación al módulo de Sistemas de E-Licencias', '5.4.2.066/2022', 'Se informa la UTIC no cuenta con  proveedor para el mantenimiento y soporte de los aplicativos, una vez que se cuente con dicho servicio , se contactara al product owner de la unidad para asi empezar a conocer la necesidades a solventar respecto al a', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_849276945.pdf'),
(65, 2, 207, 91, 209, 208, 91, 209, '2022-05-26', '2022-05-27', 'Información de la base de datos del Sistema de Med', '5.4.2.067/2022', 'Se entrega información solicitada, en el oficio No.4.4.1.1037/22 de acuerdo a las especificaciones señaladas', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_716552589.pdf'),
(66, 2, 207, 91, 209, 208, 91, 209, '2022-06-02', '2022-06-02', 'Incidente Reportado TICKET 29145 (licencia de cond', '5.4.2.068/2022', 'Se comparten hallazgos, sobre las búsquedas, consultas  y procesos que se realizaron sobre el incidente que se reporto a través de la herramienta GLPi.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_115072898.pdf'),
(67, 2, 207, 91, 209, 208, 91, 209, '2022-06-16', '2022-06-17', 'Baja del Sistema Único de Información', '5.4.2.070/2022', 'De acuerdo a la solicitud  del OF. 1.6.141/2022, se da de baja el sistema solicitado, así como también se informa que se genera un respaldo del sistema así como de su base datos.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_778814817.pdf'),
(68, 2, 207, 91, 209, 208, 91, 209, '2022-06-16', '2022-06-21', 'Repositorio Único de Sitios Públicos Conectados y ', '5.4.2.071/2022', 'Se informa la UTIC no cuenta con  proveedor para el mantenimiento y soporte de los aplicativos, una vez que se cuente con dicho servicio , se contactara al product owner de la unidad para asi empezar a conocer la necesidades a solventar respecto al a', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_273549947.pdf'),
(69, 2, 207, 91, 209, 208, 91, 209, '2022-06-23', '2022-06-24', 'Módulo dentro del Sistema de Trámites de Ventanill', '5.4.2.072/2022', 'Se solicita la migración al ambiente de producción en su plataforma para la consulta del CURP,, ya que las pruebas fueron satisfactorias en el sistema de citas para el trámite de Examen Psicofísico Integral en los ambientes de QA de esta dependencia.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_915677641.pdf'),
(70, 2, 207, 91, 209, 208, 91, 209, '2022-07-04', '2022-07-04', 'Datos Abiertos', '5.4.2.073/2022', 'Atendiendo a la Solicitud  del Of. No. SICT.UT.334-2022,  se informa que toda la información proporcionada  por la UT , se notifica que los documentos ya esta  en el portal solicitado dentro del apartado de la SICT', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_478055418.pdf'),
(71, 2, 207, 91, 209, 208, 91, 209, '2022-07-04', '2022-07-04', 'Migración Sistema SIE', '5.4.2.074/2022', 'Se informa la UTIC no cuenta con  proveedor para el mantenimiento y soporte de los aplicativos, una vez que se cuente con dicho servicio , se contactara al product owner de la unidad para así empezar a conocer la necesidades a solventar respecto al a', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_43718808.pdf'),
(72, 2, 207, 91, 209, 208, 91, 209, '2022-06-29', '2022-07-06', 'Expediente 2022/SCT/DE343', '5.4.2.075/2022', 'Se informa que la UTIC  a pesar aunque tiene la capacidad de generar altas, cambios y bajas de usuarios y oficinas, no cuenta con el perfil necesario  que permita tener acceso a la información solicitada.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_136180136.pdf'),
(73, 2, 207, 91, 209, 208, 91, 209, '2022-07-11', '2022-07-11', 'Evaluación de la Técnica de Licitación LA-00900098', '5.4.2.076/2022', 'En respuesta al Of. No.  5.4.173/2022 se informa que se recibieron 5 propuestas de licitantes.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_431595347.pdf'),
(74, 2, 207, 91, 209, 208, 91, 209, '2022-07-19', '2022-07-22', 'Errores en sistemas Ventanilla Única, ELICLINTTF y', '5.4.2.077/2022', 'Se informa que los incidentes que se muestran se han tratado de ir atendiendo a manera que se permitiera la operación continua del aplicativo', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_470470764.pdf'),
(75, 2, 207, 91, 209, 208, 91, 209, '2022-07-19', '2022-07-21', 'Falla de Proceso en captura de Biometricos', '5.4.2.078/2022', 'Se informa que se le brindó atención oportuna y se concluyó de manera satisfactoria la solución a la falla, no se omite mencionar que notifico y se valido con el personal del área', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_622716006.pdf'),
(76, 2, 207, 91, 209, 208, 91, 209, '2022-07-20', '2022-07-20', 'Atención a oficio 4.2.0.1.133 en respuesta a la re', '5.4.2.079/2022', 'Se informa que atendiendo a la solicitud del Of. 4.2.0.1.133 se informa que se dan de baja todos los usuarios internos y externos que tuvieran acceso a la aplicación  SIAF y E-Licencias.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_953320544.pdf'),
(77, 2, 207, 91, 209, 208, 91, 209, '2022-07-20', '2022-07-21', 'Designación de Enlace (Product Owner)', '5.4.2.080/2022', 'Solicitud para designación de Product Owner por la unidad correspondiente.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_472640997.pdf'),
(78, 2, 207, 91, 209, 208, 91, 209, '2022-07-20', '2022-07-20', 'Seguimiento a la Solicitud de Procesos de Apertura', '5.4.2.081/2022', 'Se informa que la información proporcionada por la UT ya se encuentra en el portal solicitados, dentro del apartado correspondiente a DGAC', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_690963689.pdf'),
(79, 2, 207, 91, 209, 208, 91, 209, '2022-07-21', '2022-07-21', 'Números de Licencias para solventar duplicados', '5.4.2.082/2022', 'En referencia a la solicitud que hizo a través de sus oficio número 4.2.0.1.1.235/2022, se hacen llegar 60 números  de Licencias con nomenclatura LDFXXXXXXXX, para continuar la  corrección manual de los registro los registros que se han detectado est', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_744175852.pdf'),
(80, 2, 207, 91, 209, 208, 91, 209, '2022-07-25', '2022-07-25', 'Póliza de Fianza Requerida', '5.4.2.083/2022', 'Se confirma que es requisito y parte integral del contrato , contar con una poliza de fianza requerida para responder los defectos y vicios ocultos de los bienes o la calidad de los servicios, asi como de cualquier  otra responsabilidad .', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_746087163.pdf'),
(81, 2, 207, 91, 209, 208, 91, 209, '2022-07-25', '2022-07-25', 'Póliza de Fianza Requerida', '5.4.2.084/2022', 'Se hace solicitud de Póliza de Fianza', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_118843877.pdf'),
(82, 2, 207, 91, 209, 208, 91, 209, '2022-07-26', '2022-07-26', 'Estatus SIGESPO', '5.4.2.085/2022', 'En respuesta a la solicitud en el Of. 6.28.306.163/2022.  Se informa que debe de ponerse en contacto con el Product Owner  de la Dirección General de Carreteras para proporcionarle la información requerida', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_830007276.pdf'),
(83, 2, 207, 91, 209, 208, 91, 209, '2022-07-29', '2022-07-29', 'Entrega de fianza cumplimiento Contrato 713-UTIC-L', '5.4.2.086/2022', 'Se presentan las polizas entregadas por ka empresa Tecnología Aplicada S.A de c.v.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_463534222.pdf'),
(84, 2, 207, 91, 209, 208, 91, 209, '2022-07-29', '2022-07-29', 'Ajuste de formato a fianza de calidad de servicio ', '5.4.2.087/2022', 'Se presenta ajuste de formato de póliza, presentada por la empresa Tecnología Aplicada a Negocios S.A. de CV.', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_766144855.pdf'),
(85, 2, 207, 91, 209, 208, 91, 209, '2022-07-29', '2022-07-29', 'Ratificación Designación del Product Owner', '5.4.2.088/2022', 'Se solicita la designación del Product Owner ', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_878536048.pdf'),
(86, 2, 207, 91, 209, 208, 91, 209, '2022-07-29', '2022-07-29', 'Sugerencia de Centralización de Solicitudes', '5.4.2.089/2022', 'Recomendación', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_961807103.pdf'),
(87, 2, 207, 91, 209, 208, 91, 209, '2022-08-01', '2022-08-01', 'Cambio de horario de David de León Muñoz', '5.4.2.090/2022', 'Solicitud de cambio de Horario  de David de León Muñoz ', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_163283017.pdf'),
(88, 2, 207, 91, 209, 208, 91, 209, '2022-08-04', '2022-08-05', 'Seguimiento a solicitud de Información de aplicaci', '5.4.2.091/2022', 'Se informa que se entrega información requerida en DVD y sobre cerrado, esto de acuerdo a la solicitud en el oficio 5.2.3.272', '2022-12-13 00:00:00', 1, ',resources/oficios/2/2022/dic/13-12-22_530349229.pdf'),
(89, 2, 207, 91, 209, 208, 91, 209, '2022-08-05', '2022-08-08', 'Expediente 2022/SCT/2711/2022', '5.4.2.092/2022', 'Se informa que el requerimiento de información no se puede atender, ya que ésta solo administra los sistemas y da soporte técnico a la infraestructura de TIC a solicitud de cada unidad administrativa.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_954494948.pdf'),
(90, 2, 207, 91, 209, 208, 91, 209, '2022-08-10', '2022-08-10', 'Sistema \"Tabulador de Grúas\"', '5.4.2.095/2022', 'Se informa que se atiende la solictud en el oficio 4.2.3.161 conforme al ticket ID31704 donde se indica donde se puede descargar el backup del filesystem.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_182858755.pdf'),
(91, 2, 207, 91, 209, 208, 91, 209, '2022-08-10', '2022-08-11', 'Se reitera la solicitud de atención de garantías', '5.4.2.096/2022', 'Se solicita que se atiendan con inmediatez los asuntos señalados en el oficio.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_179449448.pdf'),
(92, 2, 207, 91, 209, 208, 91, 209, '2022-08-23', '2022-08-23', 'Solicitud de automatización de procesos', '5.4.2.097/2022', 'En atención al Of. 4.2.3.160, se solicita el registro en la herramienta de las historias de usuario que definan las reglas de negocio', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_132273446.pdf'),
(93, 2, 207, 91, 209, 208, 91, 209, '2022-08-12', '2022-08-12', 'Información sobre cambios en WEB service RENAPO', '5.4.2.098/2022', 'Se solicita sea informado si la dependencia ha realizado modificaciones en el esquema de intercomunicación, mecanismos de validación o métodos de extracción de información en dicho servicio que pudiesen motivar  la falla de la integración de nuestro ', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_994551870.pdf'),
(94, 2, 207, 91, 209, 208, 91, 209, '2022-08-16', '2022-08-16', 'Atención a similar 3.3.1152 (SIAC)', '5.4.2.099/2022', 'En atención al similar  3.3.1152, se expone la relación de las funcionalidades, características y requerimientos, mínimos para el correcto funcionamiento del sistema.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_869050399.pdf'),
(95, 2, 207, 91, 209, 208, 91, 209, '2022-08-17', '2022-08-17', 'Requerimientos atendidos en las herramientas JIRA ', '5.4.2.100/2022', 'Se informa los requerimientos atendidos desde 2021', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_793104740.pdf'),
(96, 2, 207, 91, 209, 208, 91, 209, '2022-08-17', '2022-08-17', 'Movimientos en E- Licencias', '5.4.2.101/2022', 'Se da informe sobre los movimiento encontrado, según lo solicitado en el oficio 4.2.1.1.452/2022 ', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_235825354.pdf'),
(97, 2, 207, 91, 209, 208, 91, 209, '2022-08-19', '2022-08-19', 'Entregables del Mes de Julio', '5.4.2.102/2022', 'Se acepta los entregables del mes de julio 2022', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_755949639.pdf'),
(98, 2, 207, 91, 209, 208, 91, 209, '2022-08-23', '2022-08-23', 'Atención a Similar  5.1.1069/2022', '5.4.2.103/2022', 'De acuerdo  lo solicitado en el oficio 5.1.-1069/2022.  Se informa que se observa la no existencia de la adecuación de número 164700041 por la unidad 647( Tabasco) entre enviados a  validación a la DGPOP ', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_129596840.pdf'),
(99, 2, 207, 91, 209, 208, 91, 209, '2022-08-30', '2022-08-30', 'Funcionario Martín Durán Ruvalcaba', '5.4.2.105/2022', 'En atención al oficio 4.1.0.4.659 se informa que ésta dirección coordinadora no identifica que se haya realizado atención alguna a solicitud de la AFAC para otorgarle accesos en especifico al sistema de licencias  ', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_682575439.pdf'),
(100, 2, 207, 91, 209, 208, 91, 209, '2022-09-13', '2022-09-14', 'Problemática del SIA', '5.4.2.106/2022', ' Se informa que la anomalía ha sido corregida mediante el ticket de GLPi  ID32730', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_718903004.pdf'),
(101, 2, 207, 91, 209, 208, 91, 209, '2022-09-14', '2022-09-15', 'Notificación de hallazgos en el servicio de agosto', '5.4.2.107/2022', 'Se solicita se notifique las correcciones que tuvieron lugar , con la finalidad de que sean validadas , así mismo se solicita una vez sea entregada la carpeta corregida  se proceda a la expedición de la factura correspondiente al mes en cuestión.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_970035143.pdf'),
(102, 2, 207, 91, 209, 208, 91, 209, '2022-09-19', '2022-09-20', 'Facturación Mensual', '5.4.2.108/2022', 'Se solicita se expida la factura correspondiente para el mes de agosto del contrato. 713-UTIC-LPN-001-2022', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_310312893.pdf'),
(103, 2, 207, 91, 209, 208, 91, 209, '2022-09-21', '2022-09-22', 'Product Owner de Sistemas', '5.4.2.109/2022', 'Solicitud o ratificación  de Designación de product owner por parte de la Oficina del C. Secretario', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_223811159.pdf'),
(104, 2, 207, 91, 209, 208, 91, 209, '2022-09-20', '2022-09-20', 'Entregables del Mes de Agosto', '5.4.2.110/2022', 'Se informa que se aceptan los entregables del mes de agosto.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_315359310.pdf'),
(105, 2, 207, 91, 209, 208, 91, 209, '2022-09-21', '2022-09-21', 'Notificación de deductiva del servicio correspondi', '5.4.2.111/2022', 'Se notifica las deductivas en el servicio dado y se solicita  entregar la nota de crédito correspondiente por el monto indicado para así realizar el tramite de pago.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_556531064.pdf'),
(106, 2, 207, 91, 209, 208, 91, 209, '2022-09-22', '2022-09-22', 'Incremento de volumen de personal', '5.4.2.112/2022', 'Se solicita el apoyo para que se incremente de manera considerable el volumen del persona para afrontar el cierre de varios mantenimientos.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_796988860.pdf'),
(107, 2, 207, 91, 209, 208, 91, 209, '2022-09-22', '2022-09-22', 'Precisos de tiempos de entrega y revisión', '5.4.2.113/2022', 'Solicitud de apoyo en la revisión con detenimiento la información contenida en el mismo para si aprobación, cada vez que se cierre un sprint.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_452852760.pdf'),
(108, 2, 207, 91, 209, 208, 91, 209, '2022-09-23', '2022-09-23', 'Pago de factura de mes de agosto', '5.4.2.114/2022', 'Se solicite se realicen los tramites administrativos correspondientes para que se realice el pago por el servicio según el contrato 713-UTIC-LPN-001-2022.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_518320133.pdf'),
(109, 2, 207, 91, 209, 208, 91, 209, '2022-09-26', '2022-09-27', 'Solicitud de procesos para la instalación de unida', '5.4.2.115/2022', 'Solicitud para que se giren la instrucciones correspondientes y así estar en posibilidad de que el equipo de la NAS se encuentre bajo resguardo físico en el Centro de Datos Alterno de la UTIC', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_304129193.pdf'),
(110, 2, 207, 91, 209, 208, 91, 209, '2022-09-28', '2022-09-28', 'Acceso al Módulo a la ventanilla Única de ATF en a', '5.4.2.116/2022', 'En atención al oficio 4.2.3.166/2022 , para poder darle solución se solicita que se se registre la Historia de Usuario correspondiente dentro de la herramienta de JIRA.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_930366851.pdf'),
(111, 2, 207, 91, 209, 208, 91, 209, '2022-10-05', '2022-10-06', 'Migración sistema SIE', '5.4.2.117/2022', 'Se informa que no se podrá concluir la Migración del Sistema SIE al 30 de octubre ya que nos encontramos en un 25% de avance. Por lo anterior, se solicita continuidad a dicho proyecto, considerado como una acción de mejora durante el periodo 2023.', '2022-12-14 00:00:00', 0, ',resources/oficios/2/2022/dic/14-12-22_316419113.pdf'),
(112, 2, 207, 91, 209, 208, 91, 209, '2022-10-11', '2022-10-11', 'Instalación de unidad NAS', '5.4.2.118/2022', 'Se informa que el equipo NAS  será instalado en las oficinas de la UTIC.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_967733757.pdf'),
(113, 2, 207, 91, 209, 208, 91, 209, '2022-10-11', '2022-10-11', 'Solicitud de procesos para la instalación de la NA', '5.4.2.119/2022', 'Alcance a oficio 5.4.2.115/2022 para instalación de la NAS en Centro de Datos Alterno de la UTIC', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_240807367.pdf'),
(114, 2, 207, 91, 209, 208, 91, 209, '2022-10-11', '2022-10-12', 'Atención a los servicio indicados ', '5.4.2.120/2022', 'Se solicita una revisión a los proyectos señalados ya que no se observa avance por parte del proveedor.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_984489964.pdf'),
(115, 2, 207, 91, 209, 208, 91, 209, '2022-10-19', '2022-10-19', 'Entregables del mes de septiembre', '5.4.2.121/2022', 'Se notifica que la revisión de los entregables del mes de septiembre es aceptada, por lo que se solicita que se envíe la factura correspondiente.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_768338590.pdf'),
(116, 2, 207, 91, 209, 208, 91, 209, '2022-10-26', '2022-10-26', 'Correo temporal oficial para comunicación con DCID', '5.4.2.123/2022', 'Se informa el medio oficial por el cual se mantendrá la comunicación con ésta DCIDT', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_852733991.pdf'),
(117, 2, 207, 91, 209, 208, 91, 209, '2022-10-27', '2022-10-27', 'Pago de factura mes de septiembre', '5.4.2.126/2022', 'Se solicitan se realicen los procedimientos administrativos correspondientes para poder realizar el pago del mes de septiembre para el servicio de acuerdo a contrato 713-UTIC-LPN-001-2022.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_497744481.pdf'),
(118, 2, 207, 91, 209, 208, 91, 209, '2022-11-07', '2022-11-07', 'Migración del Sistema SIE', '5.4.2.127/2022', 'Se informa que se le dará continuidad a la migración ya que con base en la Historias de Usuario se integren en el sistema de JIRA', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_317958673.pdf'),
(119, 2, 207, 91, 209, 208, 91, 209, '2022-11-07', '2022-11-07', 'Correo electrónico inoperante', '5.4.2.128/2022', 'Se informa que el correo electrónico alterno, queda inoperante y retoman los canales de comunicación oficiales.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_994947962.pdf'),
(120, 2, 207, 91, 209, 208, 91, 209, '2022-11-16', '2022-11-16', 'Entregables del mes de octubre', '5.4.2.129/2022', 'Se informa que se aceptan lo entregables del mes de octubre, y se solicita se envié la factura correspondiente.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_583950034.pdf'),
(121, 2, 207, 91, 209, 208, 91, 209, '2022-11-22', '2022-11-22', 'Accesos a equipos de computo del consorcio', '5.4.2.130/2022', 'Se solicita al proveedor tomar las acciones indicadas para poder dar acceso a la computadoras del consorcio.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_594013683.pdf'),
(122, 2, 207, 91, 209, 208, 91, 209, '2022-11-28', '2022-11-30', 'Notificación deductiva al mes de octubre', '5.4.2.131/2022', 'Se notifican las deducciones a la factura del mes de octubre y se solicita se envié la nota de crédito con los monto correspondientes.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_834785073.pdf'),
(123, 2, 207, 91, 209, 208, 91, 209, '2022-11-28', '2022-11-29', 'Atención a similar 4.1.04-813', '5.4.2.132/2022', 'Se informa que para darle seguimiento y con el objetivo de darle celeridad al proceso se presente a las oficinas de la UTIC .', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_614840932.pdf'),
(124, 2, 207, 91, 209, 208, 91, 209, '2022-12-05', '0022-02-05', 'Pago de factura de octubre', '58.4.2.133/2022', 'Se solicita se realicen las gestiones administrativas necesarias para el pago  correspondiente por los servicio del mes de octubre de acuerdo al contrato 713-UTIC-LPN-001-2022.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_883231165.pdf'),
(125, 2, 207, 91, 209, 208, 91, 209, '2022-12-06', '2022-12-07', 'Atención a similar 3.3.1616/2022', '5.2.4.134/2022', 'Se solicita se complemente la información de la Ficha de Registro de Sistema.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_557888927.pdf'),
(126, 2, 207, 91, 209, 208, 91, 209, '2022-12-06', '2022-12-07', 'Sistema Integral de Aseguramiento de la Calidad', '5.4.2.135/2022', 'Se solicita se manden los documentos pendientes para la realización del análisis y determinar la factibilidad de registro de sistema como parte del inventario UTIC.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_990051115.pdf'),
(127, 2, 207, 91, 209, 208, 91, 209, '2022-12-07', '2022-12-07', 'Atención  a similar SICT/2022/037', '5.4.2.136/2022', 'Se da atención  a similar SICT/2022/037 y se reitera que se den cumplir con los requisitos ya antes dichos para  dar acceso a los equipos de computo del consorcio', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_28734321.pdf'),
(128, 2, 207, 91, 209, 208, 91, 209, '2022-12-08', '2022-12-08', 'Actualización de Firma en sistemas', '5.4.2.138/2022', 'Se informa que realiza la actualización y que esta es validada por el personal del área.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_388854275.pdf'),
(129, 2, 207, 91, 209, 208, 91, 209, '2022-12-08', '2022-12-08', 'Atención a similar SICT/2022/042', '5.4.2.138/2022', 'Atención a similar SICT/2022/042, se informa que DCIDT se da por enterada del cambio de horario y se menciona que el horario de atención de los tickets queda inamovible de acuerdo a contrato.', '2022-12-14 00:00:00', 1, ',resources/oficios/2/2022/dic/14-12-22_231389537.pdf'),
(130, 2, 207, 91, 209, 208, 91, 209, '2022-01-07', '2022-01-07', 'Solicitud de programa de Garantías', '5.4.2.1.002/2022', 'Se solicita se presente un cronograma donde de reflejen los tiempos de atención de las siguientes garantías, con el fin de garantizar la realización todas las actividades.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_851770195.pdf'),
(131, 2, 207, 91, 209, 208, 91, 209, '0000-00-00', '2022-01-13', 'Relación de elementos a  garantías', '5.4.2.1.004/2022', 'De acuerdo al anexo técnico se solicita que sean solventadas  la incidencias presentadas en el anexo  \"Relación de elementos a Garantías\".', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_668005170.pdf'),
(132, 2, 207, 91, 209, 208, 91, 209, '2022-01-17', '2022-01-18', 'Informe de Incumplimiento  713-UTIC-LPN-002-21', '5.4.2.1.006/2022', 'Se informa que People Media S.A de C.V. no entregó la póliza de Seguro de Responsabilidad Civil, lo cual se deberá  rescindir el contrato bajo en lo casual señalado en el numeral III.f.6 de la Convocatoria a la Licitación Pública Nacional Electrónica', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_246226745.pdf'),
(133, 2, 207, 91, 209, 208, 91, 209, '2022-01-25', '2022-01-25', 'Alcance Solicitud de Programa de Garantías', '5.4.2.1.007/2022', 'Se solicita se aplique la garantía correspondiente establecida en el anexo técnico, y así como se precisa la información relativa a las garantías solicitadas.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_508718023.pdf'),
(134, 2, 207, 91, 209, 208, 91, 209, '2022-01-14', '2022-01-17', 'Dictamen Final de servicios y revisión documental ', '5.4.2.1.00/2022', 'Dictamen Final de servicios y revisión documental del contrato 713-UTIC-LPN-002-21', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_131902330.pdf'),
(135, 2, 207, 91, 209, 208, 91, 209, '2022-01-07', '2022-01-07', 'Notificación de hallazgos en carpeta de Cierre de ', '5.4.2.001/2022', 'Se solicita se solventen las observaciones  señaladas en el la carpeta ', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_364874618.pdf'),
(136, 2, 207, 91, 209, 208, 91, 209, '2022-01-17', '2022-01-17', 'Reinstalación de Micrositio', '5.4.2.008/2022', 'Se informa que se atiende la solicitud de reinstalación de la información del Micrositio. De acuerdo a oficio 4.1.0.2.0059/2022', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_955311505.pdf'),
(137, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.009/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.\r\n', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_322982789.pdf'),
(138, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.010/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_585505346.pdf'),
(139, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.011/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_440749941.pdf'),
(140, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.012/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_821258061.pdf'),
(141, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', 'Solicitud de Cotización ', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_678886428.pdf');
INSERT INTO `oficios` (`ofi_id`, `ofi_subidoPor`, `ofi_destinatario`, `ofi_cargoDest`, `ofi_unidadDest`, `ofi_remitente`, `ofi_cargoRem`, `ofi_unidadRem`, `ofi_fechaE`, `ofi_fechaRecep`, `ofi_asunto`, `ofi_numero`, `ofi_observacion`, `ofi_fechaSOFI`, `ofi_activo`, `ofi_url`) VALUES
(142, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.014/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_128510982.pdf'),
(143, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.015/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_611798371.pdf'),
(144, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.016/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_646637879.pdf'),
(145, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.017/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_650000403.pdf'),
(146, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud  de Cotización', '5.4.2.018/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_5161885.pdf'),
(147, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.019/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_125771554.pdf'),
(148, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.020/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.\r\n', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_113015412.pdf'),
(149, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.021/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.\r\n', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_230129722.pdf'),
(150, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.022/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.\r\n', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_23407128.pdf'),
(151, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.023/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.\r\n', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_218258350.pdf'),
(152, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.024/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.\r\n', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_969087522.pdf'),
(153, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.025/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.\r\n', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_673426486.pdf'),
(154, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.026/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.\r\n', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_877544476.pdf'),
(155, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.027/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.\r\n', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_87315082.pdf'),
(156, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.028/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_725378855.pdf'),
(157, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.029/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_38689322.pdf'),
(158, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.030/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-15 00:00:00', 1, ',resources/oficios/2/2022/dic/15-12-22_656581199.pdf'),
(159, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.031/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_719325293.pdf'),
(160, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Solicitud de Cotización', '5.4.2.1.032/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_330386843.pdf'),
(161, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Actualización de Fast Pay Total PostNet', '5.4.2.1.033/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_805784021.pdf'),
(162, 2, 207, 91, 209, 208, 91, 209, '2022-02-18', '2022-02-18', 'Seguimiento a Solicitud de programa de garantías', '5.4.2.1.034/2022', 'En alcance a oficio 5.4.1.007 donde se solicita sean atendidas las garantías en relación al contrato 713-UTIC-LPN-001-21', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_491541663.pdf'),
(163, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.035/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_16627125.pdf'),
(164, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.036/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_956603119.pdf'),
(165, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.037/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_170557128.pdf'),
(166, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.038/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_320315414.pdf'),
(167, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.039/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_214960838.pdf'),
(168, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.040/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_239963600.pdf'),
(169, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.041/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_3056322.pdf'),
(170, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.041/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_967016582.pdf'),
(171, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.043/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_965294574.pdf'),
(172, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.044/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_752612175.pdf'),
(173, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.045/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_993856112.pdf'),
(174, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.056/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_388271502.pdf'),
(175, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.047/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_252933283.pdf'),
(176, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.048/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_118751780.pdf'),
(177, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotzación', '5.4.2.1.049/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_53288366.pdf'),
(178, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de  Cotización', '5.4.2.1.050/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_479345352.pdf'),
(179, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.1.2.051/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_304295002.pdf'),
(180, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud Cotización', '5.4.2.1.052/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_797830136.pdf'),
(181, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.053/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_590827653.pdf'),
(182, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.054/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-16 00:00:00', 1, ',resources/oficios/2/2022/dic/16-12-22_248996050.pdf'),
(183, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud e Cotización', '5.4.2.1.055/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_739421261.pdf'),
(184, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.056/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_211002578.pdf'),
(185, 2, 207, 91, 209, 208, 91, 209, '2022-02-28', '2022-02-28', 'Solicitud de Cotización', '5.4.2.1.057/2022', 'Solicitud de Cotización para el servicio de Soporte Técnico y mantenimiento \r\na las aplicaciones registradas en el inventario de la UTIC, así  como servicios especializados.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_229998295.pdf'),
(186, 2, 207, 91, 209, 208, 91, 209, '2022-03-14', '2022-03-14', 'Creación de  de cuentas para SEDENA ', '5.4.2.1.058/2022', 'Se da atención a solicitud según oficio   4.1.0.4.063/2022', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_944469175.pdf'),
(187, 2, 207, 91, 209, 208, 91, 209, '2022-03-14', '0022-02-15', 'Solicitud de garantía proyecto Ru', '5.4.2.1.059/2022', 'Se informa que tras la revisión de los  hallazgos se concluyó  están parcialmente atendidos y otros siguen sin atención, se solicita que éstas observaciones sean atendidas debidamente.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_627781385.pdf'),
(188, 2, 207, 91, 209, 208, 91, 209, '2022-03-28', '2022-03-29', 'Solicitud de concentración de datos técnicos de lo', '5.4.2.1.060/2022', 'Se atiende solicitud de datos técnicos de los sistemas de acuerdo a oficio 5.4.2.030/2022', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_15808736.pdf'),
(189, 2, 207, 91, 209, 208, 91, 209, '2022-04-13', '2022-04-13', 'Solicitud de estatus de garantías de Proyectos RU', '5.4.2.1.061/2022', 'En alcance al similar 5.4.2.1.059/2022 se solicita estatus y se reitera la atención de las garantías.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_587560144.pdf'),
(190, 2, 207, 91, 209, 208, 91, 209, '2022-05-18', '2022-05-24', 'Comunicación de desistimiento de gastos no recuper', '5.4.2.1.062/2022', 'Se informa que la empresa Sinergía mediante sus representantes legales, presentaron mediante oficio recibido , el desistimiento de la acción y el derecho del procedimiento a la solicitud de Cobro de gastos no recuperables del contrato abierto de Pres', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_656478645.pdf'),
(191, 2, 207, 91, 209, 208, 91, 209, '2022-05-24', '2022-05-25', 'Solicitud de baja de cuentas de EXTRERNOS  de SEDE', '5.4.2.1.063/2022', 'En atención a oficio 4.0.1.4.129/2022 se dan de baja las cuentas indicadas del sistema E- Licencias', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_1816253.pdf'),
(192, 2, 207, 91, 209, 208, 91, 209, '2022-06-22', '2022-06-22', 'Licencia Federal Digital', '5.4.2.1.064/2022', 'En atención al oficio4.2.0.1.1.339/2022 de entrega la relación de 60  números de licencias, para que puedan continuar con la corrección manual de los registros que están duplicados.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_822280838.pdf'),
(193, 2, 207, 91, 209, 208, 91, 209, '2022-08-19', '2022-08-19', 'Acceso a Base de Datos BI-', '5.4.2.1.065/2022', 'Se solicita autorización para el acceso a la base de datos  BI_SCT que se encuentra en el ambiente de desarrollo con la dirección IP 10.33.141.253 .', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_146520051.pdf'),
(194, 2, 207, 91, 209, 208, 91, 209, '2022-08-20', '2022-08-26', 'Atención a Oficio No. SICT/2022/017', '5.4.2.1.06/2022', 'Se detalla las actividades que se han realizado para la generación de los accesos a los sistemas y aplicaciones.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_255455990.pdf'),
(195, 2, 207, 91, 209, 208, 91, 209, '2022-09-01', '2022-09-02', 'Atención a Oficio SICT/2022/019', '5.4.2.1.067/2022', 'Se reitera que para dar solución a los incidentes se requieren el llenado de la tabla de incidentes, con información puntual para pronta atención.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_725539176.pdf'),
(196, 2, 207, 91, 209, 208, 91, 209, '2022-09-02', '2022-09-05', 'Reporte Mensual de ticket atendidos', '5.4.2.1.068/2022', 'Se informa que el análisis de los tickets recibidos en el mes de agosto, deberán registrase de forma manual, por lo que se solicita la revisión de éstos tomando cómo base las bitácora de la plataforma en comento.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_596246968.pdf'),
(197, 2, 207, 91, 209, 208, 91, 209, '2022-09-07', '2022-09-07', 'Cambio de horario de Liliana TorresTorres', '5.4.2.1.069/2022', 'Se informa el cambio de horario de la Lic. Liliana Torres.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_200039053.pdf'),
(198, 2, 207, 91, 209, 208, 91, 209, '2022-08-19', '2022-09-19', 'Se reitera solicitud de garantías', '5.4.2.1.070/2022', 'Se solicita se atiendan los pendientes y se solicita sea entregado un programa de tiempos para dar conclusión a los pendientes.', '2022-12-19 00:00:00', 1, ',resources/oficios/2/2022/dic/19-12-22_254795448.pdf'),
(199, 2, 207, 91, 209, 208, 91, 209, '2022-10-12', '2022-10-12', 'Administración (SIA 2023)', '5.4.2.1.071/2022', 'Se atiende solicitud de oficio No. 5.1.103/1243/2022  Se informa que se atiende a la solicitud y se realizan todas las actividades pertinentes.', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_125289388.pdf'),
(200, 2, 207, 91, 209, 208, 91, 209, '2022-10-12', '2022-10-12', 'Notificación de hallazgos en el servicio de septie', '5.4.2.1.072/2022', 'Se solicita sean solventadas la observaciones hechas en el entregable del servicio del mes de septiembre.', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_182274937.pdf'),
(201, 2, 207, 91, 209, 208, 91, 209, '2022-11-14', '2022-11-14', 'Notificación de hallazgos en el servicio de octubr', '5.4.2.1.073/2022', 'Se solicita sean solventadas los observaciones hechas a los entregables correspondientes  al mes de octubre ', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_547030379.pdf'),
(202, 2, 207, 91, 209, 208, 91, 209, '2022-11-22', '2022-11-22', 'Acceso a equipos de cómputo del consorcio.', '5.4.2.1.074/2022', 'Se notifican los requisitos necesarios para así poder dar acceso al la red constitucional a los equipos por parte del consorcio ', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_704001090.pdf'),
(203, 2, 207, 91, 209, 208, 91, 209, '2022-12-08', '2022-12-08', 'Metodología COSMIC', '5.4.2.1.075/2022', 'Se solicita que se lleven a cabo las actividades correspondientes en conjunto con el proveedor para la implementación  CSOMIC y cumplir en tiempo y forma con las fechas requeridas.', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_697904213.pdf'),
(204, 2, 207, 91, 209, 208, 91, 209, '2021-01-28', '2021-01-28', 'Habilitar cuenta de acceso al SIAF', '5.4.2.001/2021', 'Se informa que para solicitar cuentas, se debe de hacer por medio del SIGTIC', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_669254840.pdf'),
(205, 2, 207, 91, 209, 208, 91, 209, '2021-03-25', '2021-03-25', 'Presupuesto julio- septiembre 2021', '5.4.2.1.002/2021', 'Se solicita la suficiencia presupuestal para julio-septiembre de 2021', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_555747404.pdf'),
(206, 2, 207, 91, 209, 208, 91, 209, '2021-05-03', '2021-05-04', 'Actualización de inventario de aplicaciones inform', '5.4.2.004/2021', 'Se solicita el apoyo de cada unidad indicar  los sistemas a los que requieren continuar con el servicio de soporte y mantenimiento, esto con la finalidad de mantener un inventario actualizado.', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_350604340.pdf'),
(207, 2, 207, 91, 209, 208, 91, 209, '2021-03-20', '2021-04-20', 'Habilitar cuenta de acceso al SIPyMM para el CNI', '5.4.2.005/2021', 'Se informa que la cuenta se ha habilitado de acuerdo a oficio 7.0.161/2021 ', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_12525620.pdf'),
(208, 2, 207, 91, 209, 208, 91, 209, '2021-04-20', '2021-04-20', 'Clave Presupuestal y Plan de Trabajo del Proyecto ', '5.4.2.006/2021', 'Se envía clave presupuestal y plan de cabeceras Municipales', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_416297620.pdf'),
(209, 2, 207, 91, 209, 208, 91, 209, '2021-04-28', '2021-04-29', 'Proyecto de cabeceras municipales', '5.4.2.007/2021', 'Se envía clave presupuestal, atendiendo a la solicitud de oficio 3.1.2.1.4.065/2021', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_69932007.pdf'),
(210, 2, 207, 91, 209, 208, 91, 209, '2021-05-17', '2021-05-17', 'Atención a OF. 4.1.0.47/2021 de la AFAC, solicitud', '5.4.2.012/2021', 'Se informa que al no encontrar ningún proyecto registrado por parte de la AFC, no se puede  dar una opinión técnica ', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_739273453.pdf'),
(211, 2, 207, 91, 209, 208, 91, 209, '2021-05-31', '2021-06-01', 'Cierre de los sistemas SIPyMM y E-Licencias', '5.4.2.014/2021', 'Se informa que la Coordinación de Puertos y Marina Mercante deberá coordinarse con el área correspondientes de la SEMAR, el inicio de las operaciones del SIPyM y E-Licencias, ya que esta DCIDT empezara con los trabajos para desactivar los sistemas en', '2022-12-21 00:00:00', 1, ',resources/oficios/2/2022/dic/21-12-22_236825164.pdf'),
(212, 2, 207, 91, 209, 208, 91, 209, '2021-05-31', '2021-06-01', 'Cierre de los Sistema Institucional de  Puertos y ', '5.4.2.015/2022', 'Se informa que derivado al cierre de los sistemas SIPyMM Y E-Licencias, se coordine con la unidad correspondiente de SEMAR para dar inicio a las operaciones de SIPyMM y E-Licencias', '2022-12-22 00:00:00', 1, ',resources/oficios/2/2022/dic/22-12-22_144117153.pdf'),
(213, 2, 207, 91, 209, 208, 91, 209, '2021-06-07', '2021-06-07', 'Presupuesto julio- diciembre 202', '5.4.2.017/2022', 'Solicitud de suficiencia presupuestal de julio-diciembre 2021', '2022-12-22 00:00:00', 1, ',resources/oficios/2/2022/dic/22-12-22_457845502.pdf'),
(214, 2, 207, 91, 209, 208, 91, 209, '2021-06-29', '2021-07-09', 'Baja de aplicativo SUAJ', '5.4.2.018/2022', 'Se informa que se da de baja el sistema SUAJ  y de continuidad con soporte y mantenimiento', '2022-12-22 00:00:00', 1, ',oficios/2/2022/dic/22-12-22_440053079.pdf'),
(215, 2, 207, 91, 209, 208, 91, 209, '2021-07-27', '2021-08-02', 'Expedientes 2021/SCT/DE331', '5.4.2.020.2021', 'En referencia al oficio 09/200/1829/2021 , al respecto se envían evidencias extraídas de los aplicativos de SARUA, SIGTIC y E-Licencias', '2022-12-22 00:00:00', 1, ',resources/oficios/2/2022/dic/22-12-22_338397129.pdf'),
(216, 2, 207, 91, 209, 208, 91, 209, '2021-08-17', '2021-08-17', 'Atención al oficio N. SCT-TU-410-2021 relativo al ', '5.4.2.022/2021', 'se explican los antecedentes del desarrollo de portal con base al compromiso adquirido por la AGAMX; así como también la actualización del mismo y su contenido', '2022-12-22 00:00:00', 1, ',resources/oficios/2/2022/dic/22-12-22_43927987.pdf'),
(217, 2, 207, 91, 209, 208, 91, 209, '2021-08-17', '2021-08-18', 'Cumplimiento al Contrato 713-UTIC-LPN-001-21', '5.4.2.023/2021', 'Se solicita se de cumplimiento a los acuerdos tomados en consecuencia del contrato 713-UTIC-LPN-001-21', '2022-12-22 00:00:00', 1, ',resources/oficios/2/2022/dic/22-12-22_234362457.pdf'),
(218, 2, 207, 91, 209, 208, 91, 209, '2021-08-27', '2021-08-30', 'Entregables de Contrato de 713-utic-lpn-001-2021 m', '5.4.2.025/2021', 'Se informa la manera en deberán ser presentados los Entregables', '2022-12-22 00:00:00', 1, ',resources/oficios/2/2022/dic/22-12-22_412383501.pdf'),
(219, 2, 207, 91, 209, 208, 91, 209, '2021-09-02', '2021-09-07', 'Acceso de Informarción', '5.4.2.026/2021', 'Se informa que se dan los acceso solicitados  mediante oficio 4.2.1.1.128/2021', '2022-12-22 00:00:00', 1, ',resources/oficios/2/2022/dic/22-12-22_695679299.pdf'),
(220, 2, 207, 91, 209, 208, 91, 209, '2021-09-06', '2021-09-07', 'Alta y baja de clave de cómputo de trámites de la ', '5.4.2.027/2021', 'Se realiza Alta y baja de clave de cómputo de trámites de la ARTF', '2022-12-26 00:00:00', 1, ',resources/oficios/2/2022/dic/26-12-22_395618278.pdf'),
(221, 2, 207, 91, 209, 208, 91, 209, '2021-09-06', '2021-09-07', 'Adecuaciones  al Sistema de Citas CIS y METRA', '5.4.2.028/2021', 'Se solicita que el Product Owner registre los requerimientos de los sistemas mediante el sistema de JIRA', '2022-12-26 00:00:00', 1, ',resources/oficios/2/2022/dic/26-12-22_17862795.pdf'),
(222, 2, 207, 91, 209, 208, 91, 209, '2021-09-14', '2021-09-17', 'Notificación de hallazgos en el servicio de Agosto', '5.4.2.029/2021', 'Se solicita sean solventadas las observaciones encontradas en los entregables del servicio del mes de agosto', '2022-12-26 00:00:00', 1, ',resources/oficios/2/2022/dic/26-12-22_952627508.pdf'),
(223, 2, 207, 91, 209, 208, 91, 209, '2021-09-21', '2021-09-21', 'Designación de Lider del Servicio del Contrato 713', '5.4.2.030/2021', 'Se designa al Mtro. José Antonio Rulfo Zaragoza como Líder del servicio del contrato 713-UTIC-LPN-001-21', '2022-12-26 00:00:00', 1, ',resources/oficios/2/2022/dic/26-12-22_407644510.pdf'),
(224, 2, 207, 91, 209, 208, 91, 209, '2021-09-21', '2021-09-21', 'Solicitud de Código fuente y estructura de la base', '5.4.2.031/2021', 'Se envía código fuente y estructura de la BD  del Sistema de Ingresos responsabilidad de DGPOP', '2022-12-26 00:00:00', 1, ',resources/oficios/2/2022/dic/26-12-22_103677496.pdf'),
(225, 2, 207, 91, 209, 208, 91, 209, '2021-09-21', '2021-09-21', 'Solicitud de Codigo fuente y estructura de la BD d', '5.4.2.032/2021', 'Se informa que mediante oficio 5.4.2.031/2021 d acuerdo a su solicitud, fue entregado código fuente y estructura de la de la base de datos del sistema de Ingresos', '2022-12-26 00:00:00', 1, ',resources/oficios/2/2022/dic/26-12-22_741035235.pdf'),
(226, 2, 207, 91, 209, 208, 91, 209, '2021-10-25', '2021-10-26', 'Entrega de Sistema y documentación de \"Viaja Segur', '5.4.2.033/2021', 'Entrega de Sistema y documentación de \"Viaja Seguro\" ', '2022-12-26 00:00:00', 1, ',resources/oficios/2/2022/dic/26-12-22_344041145.pdf'),
(227, 2, 207, 91, 209, 208, 91, 209, '2021-10-29', '2021-11-01', 'Información para formalización de Hosteo', '5.4.2.034/2021', 'Se informa que para poder atender la solicitud de hosteo del sistema denominado \" Viaja Seguro\" se registre la información relativa a la herramienta a implementar', '2022-12-26 00:00:00', 1, ',resources/oficios/2/2022/dic/26-12-22_80117615.pdf'),
(228, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización de inventario del inventario de apli', '5.4.2.035/2021', 'Se solicita la actualización de inventario del inventario de aplicaciones, así como de responsables y ratificación y/o designación de PO', '2023-01-25 00:00:00', 1, ',resources/oficios/2/2023/ene/25-01-23_22936514.pdf'),
(229, 2, 207, 91, 209, 208, 91, 209, '2022-01-08', '2022-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.036-2022', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.\r\n', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_46794152.pdf'),
(230, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.037-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.\r\n', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_340956005.pdf'),
(231, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.038-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_601637211.pdf'),
(232, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.039-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_601424693.pdf'),
(233, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.040-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.\r\n', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_364105942.pdf'),
(234, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'ctualización del inventario de aplicativos, así co', '5.4.2.041-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.\r\n', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_257054405.pdf'),
(235, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'ctualización del inventario de aplicativos, así co', '5.4.2.041-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_514202693.pdf'),
(236, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.043-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_567417037.pdf'),
(237, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.041-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.\r\n', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_568267597.pdf'),
(238, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2045/2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.\r\n', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_284788995.pdf'),
(239, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.2.1.046-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.\r\n', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_669325459.pdf'),
(240, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.047-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.\r\n', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_69736542.pdf'),
(241, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.048-2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_72506480.pdf'),
(242, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.049/2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_458845851.pdf'),
(243, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.050/2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_474221636.pdf'),
(244, 2, 207, 91, 209, 208, 91, 209, '2021-11-08', '2021-11-08', 'Actualización del inventario de aplicativos, así c', '5.4.2.051/2021', 'Se solicita un actualización de datos de los aplicativos en el inventario y se solicita se ratifique o se \r\nnotifique del servidor público que será enlace con ésta área, y fungirá como Product Owner.', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_537248930.pdf'),
(245, 2, 207, 91, 209, 208, 91, 209, '2021-11-30', '2021-11-30', 'Entrega de reporte DGRM-20', '5.4.2.052/2021', 'En respuesta a la solicitud de acuerdo a oficio 5.3-485/2021 se hace entrega del formato editable el reporte de DGRM-20 de la Unidad E00 Agencia Federal de Aviación Civil', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_484315362.pdf'),
(246, 2, 207, 91, 209, 208, 91, 209, '2021-12-10', '2021-12-10', 'Atención a similar SCT-UT-522-2021', '5.4.2.054/2021', 'Se hace de conocimiento que es necesario trabajar de forma conjunta con la UTIC, unidad de Transparencia y Unidades Centrales para actualizar el documento de activos de información y estar en posibilidad de integrarse al MSGI que permita atender y as', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_677462372.pdf'),
(247, 2, 207, 91, 209, 208, 91, 209, '2021-12-09', '2021-12-10', 'Respuesta a oficio 3.1.1.2-610/2021', '5.4.2.055/2021', 'En respuesta la oficio 3.1.1.2.-610/2021. Se informa que respecto al sistema SIGESPO, se debe depurar la información contenida en la NAS del sistema, que permitan volver a poner en línea a dicho sistema', '2023-01-26 00:00:00', 1, ',resources/oficios/2/2023/ene/26-01-23_231330197.pdf'),
(249, 4, 75, 73, 166, 3, 1, 166, '2023-05-16', '2023-05-16', 'oficio de prueba', '123456789', 'oficio de prueba', '2023-05-16 00:00:00', 1, ',resources/oficios/4/2023/may/16-05-23_677845843.docx'),
(250, 4, 210, 92, 211, 212, 92, 211, '2023-05-22', '2023-05-22', 'oficiotest', '123abc', 'esto es un oficio de prueba', '2023-05-22 00:00:00', 1, ',resources/oficios/4/2023/may/22-05-23_781314703.xlsx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE `participantes` (
  `participante_id` int(11) NOT NULL,
  `participante_nom` varchar(250) NOT NULL,
  `participante_titulo` int(11) NOT NULL,
  `participante_cargo` int(11) NOT NULL,
  `participante_mail` varchar(250) NOT NULL,
  `participante_tipo` int(11) NOT NULL COMMENT '0-Externo, 1-Interno',
  `participante_estado` int(11) NOT NULL DEFAULT 1 COMMENT '0-Inactivo, 1-Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`participante_id`, `participante_nom`, `participante_titulo`, `participante_cargo`, `participante_mail`, `participante_tipo`, `participante_estado`) VALUES
(1, 'David De León Muñoz', 1, 12, 'david.leon@sct.gob.mx', 1, 1),
(2, 'Mario Cesar Herrera González', 1, 1, 'mario.herrera@sct.gob.mx', 1, 1),
(3, 'Ledenika Mackensie Mendez González', 4, 1, 'ledenika.mendez@sct.gob.mx', 0, 1),
(4, 'Todos Los Participantes', 1, 1, 'todoslosparticipantes@gmail.com', 1, 1),
(5, 'Bianey Monserrat Tapia López', 2, 15, 'bianey.tapia@sct.gob.mx', 1, 1),
(9, 'Felix Benjamin Saavedra Lira ', 1, 28, 'benjamin.saavedra@sct.mx.com', 1, 1),
(10, 'Ismael Cárdenas Mondragón', 5, 23, 'ismael.cardenas@sct.gob.mx', 1, 1),
(11, 'Manuel Antonio García Ortiz', 5, 25, 'manuel.garcia@sct.gob.mx', 1, 1),
(12, 'Eduardo Gutiérrez Remigio', 3, 19, 'eduardo.gremigio@sct.gob.mx', 1, 1),
(13, 'Ignacio Domingo Jiménez Canseco', 1, 18, 'ijmene@sct.gob.mx', 1, 1),
(14, 'Ricardo Arvizu Barbosa', 1, 29, 'rarvizu@sct.gob.ms', 1, 1),
(15, 'Juan Pablo Sánchez Gómez', 1, 24, 'jupasang@sct.gob.mx', 1, 1),
(16, 'Bertha Navarrete Ventura', 2, 13, 'bertha.ventura@sct.gob.mx', 1, 1),
(17, 'Migdalia Rivera Fuentes', 2, 7, 'migdalia.fuentes@sct.gob.mx', 1, 1),
(18, 'Graciela Piñón Sánchez', 4, 20, 'graciela.sanchez@sct.gob.mx', 1, 1),
(19, 'José Adán Lumbreras Mancilla', 1, 14, 'adan.lumbreras@sct.gob.mx', 1, 1),
(20, 'Juan Ramón Barcena Molina', 1, 30, 'juan.barcena@sct.gob.mx', 1, 1),
(21, 'Efraín Martínez Sobrevals', 1, 31, 'emsobrev@sct.gob.mx', 1, 1),
(22, 'José Antonio Rulfo Zaragoza', 5, 2, 'antonio.rulfo@sct.gob.mx', 1, 1),
(23, 'Edna Patricia Santiago Vargas', 6, 4, 'edna.santiago@sct.gob.mx', 1, 1),
(24, 'Ricardo Manuel Serrano Anaya', 1, 16, 'ricardo.serrano@sct.gob.mx', 1, 1),
(25, 'Betzabel Betanzos Laiseca', 3, 5, 'bbetanzo@sct.gob.mx', 1, 1),
(26, 'Rafael Casasola Toledano', 1, 8, 'rafael.casasola@sct.gob.mx', 1, 1),
(27, 'Iracema Mirón Ramírez', 2, 9, 'iracema.miron@sct.gob.mx', 1, 1),
(28, 'Enrique Carrillo García', 1, 22, 'enrique.carrillo@sct.gob.mx', 1, 1),
(29, 'Ricardo Piña Álvarez', 1, 10, 'rpinaalv@sct.gob.mx', 1, 1),
(30, 'María Eugenia Cruz Fernández', 4, 3, 'mariaeugenia.cruz@sct.gob.mx', 1, 1),
(31, 'Dora Hilda Herrera González', 4, 6, 'dherrer@sct.gob.mx', 1, 1),
(51, 'Monserrat Tapia', 2, 2, 'monserrattapia@gmail.com', 0, 1),
(52, 'Tapia Lopez', 3, 13, 'tapialopez@sct.gob.mx', 1, 1),
(53, 'Participantetest', 2, 16, 'participantetest@gmail.com', 1, 1),
(54, 'Participantetestdos', 5, 16, 'participantetestdos@gmail.com', 0, 1),
(55, 'Nuevotest2', 2, 16, 'test@gmail.com', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `permiso_id` int(11) NOT NULL,
  `permiso_rol` int(11) NOT NULL,
  `permiso_mod` int(11) NOT NULL,
  `permiso_leer` int(2) NOT NULL DEFAULT 0,
  `permiso_crear` int(2) NOT NULL DEFAULT 0,
  `permiso_modif` int(2) NOT NULL DEFAULT 0,
  `permiso_borrar` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptores`
--

CREATE TABLE `receptores` (
  `receptor_id` int(11) NOT NULL,
  `receptor_nom` varchar(250) NOT NULL,
  `receptor_tipo` int(11) NOT NULL COMMENT '0-Externo, 1-Interno',
  `receptor_estado` int(11) NOT NULL DEFAULT 1 COMMENT '0-Inactivo, 1-Activo',
  `receptor_MadeBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `reporte_id` int(11) NOT NULL,
  `reporte_titulo` varchar(255) NOT NULL,
  `reporte_fecha_incidente` date NOT NULL,
  `reporte_incidente` varchar(100) NOT NULL,
  `reporte_caso` varchar(100) NOT NULL,
  `reporte_consentimiento` int(11) NOT NULL,
  `reporte_etiqueta` varchar(100) NOT NULL,
  `reporte_modelo` varchar(100) NOT NULL,
  `reporte_fabricante` varchar(100) NOT NULL,
  `reporte_num_serie` varchar(100) NOT NULL,
  `reporte_descripcion` longtext NOT NULL,
  `reporte_persona` int(11) NOT NULL,
  `reporte_disp_final` varchar(255) NOT NULL,
  `reporte_fecha_final` date NOT NULL,
  `reporte_fecha_sis` datetime NOT NULL DEFAULT current_timestamp(),
  `reporte_madeBy` int(11) NOT NULL,
  `reporte_estado` int(11) NOT NULL DEFAULT 1 COMMENT '0-Inactivo, 1-Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL,
  `rol_nombre` varchar(20) NOT NULL,
  `rol_estado` int(2) NOT NULL DEFAULT 1 COMMENT '0=Inactivo 1=Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rol_id`, `rol_nombre`, `rol_estado`) VALUES
(1, 'Administrador', 1),
(2, 'UTIC', 1),
(3, 'Fábrica', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos`
--

CREATE TABLE `titulos` (
  `titulo_id` int(11) NOT NULL,
  `titulo_abr` varchar(15) DEFAULT NULL,
  `titulo_nom` varchar(255) DEFAULT NULL,
  `titulo_estado` int(11) NOT NULL DEFAULT 1 COMMENT '0=Inactivo 1=Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `titulos`
--

INSERT INTO `titulos` (`titulo_id`, `titulo_abr`, `titulo_nom`, `titulo_estado`) VALUES
(1, 'Ing.', 'Ingeniero', 1),
(2, 'Ing.', 'Ingeniera', 1),
(3, 'Lic.', 'Licenciado', 1),
(4, 'Lic.', 'Licenciada', 1),
(5, 'Mtro.', 'Maestro', 1),
(6, 'Mtra.', 'Maestra', 1),
(7, 'Cr.', 'Contador', 1),
(8, 'Cra.', 'Contadora', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `unidad_id` int(11) NOT NULL,
  `unidad_num` int(11) NOT NULL,
  `unidad_nom` varchar(100) NOT NULL,
  `unidad_tipo` int(2) NOT NULL DEFAULT 1 COMMENT '0=Externo 1=Interno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`unidad_id`, `unidad_num`, `unidad_nom`, `unidad_tipo`) VALUES
(1, 100, 'SECRETARIO DEL RAMO ', 1),
(2, 102, 'DIRECCION GENERAL DE VINCULACION', 1),
(3, 110, 'UNIDAD DE ASUNTOS JURIDICOS', 1),
(4, 111, 'DIRIRECCION GENERAL DE COMUNICACION SOCIAL', 1),
(5, 112, 'ORGANO INTERNO DE CONTROL', 1),
(6, 114, 'DIRECCION GENERAL DE PLANEACION', 1),
(7, 200, 'SUBSECRETARIO DE INFRAESTRUCTURA', 1),
(8, 205, 'U. INFRAESTRUCTURA CARRETERA PARA EL DESARROLLO REG', 1),
(9, 210, 'DIR. GRAL. DE CARRETERAS', 1),
(10, 211, 'DIR. GRAL. DE CONSERVACION DE CARRETERAS', 1),
(11, 212, 'DIR. GRAL. DE SERVICIOS TECNICOS', 1),
(12, 214, 'DIR. GRAL. DE DESARROLLO CARRETERO', 1),
(13, 300, 'SUBSECRETARIA DEL TRANSPORTE', 1),
(14, 310, 'DIR. GRAL. DE AERONAUTICA CIVIL', 1),
(15, 311, 'DIRECCION GENERAL DE DESARROLLO FERROVIARIO Y MULTIMODAL', 1),
(16, 312, 'DIR. GRAL. DE AUTOTRANSPORTE FEDERAL', 1),
(17, 313, 'DIR. GRAL. DE PROTECT. Y MED. PREV. EN EL TRANSP', 1),
(18, 400, 'SUBSECRETARIA DE COMUNICACIONES', 1),
(19, 410, 'DIR. GRAL. DE SISTEMAS DE RADIO Y TELEVISION', 1),
(20, 411, 'DIR. GRAL. DE POLITICA DE TELECOMUNICACIONES Y RADIODIFUSION', 1),
(21, 414, 'UNIDAD DE LA RED FEDERAL', 1),
(22, 415, 'COORDINACION DE LA SOCIEDAD DE LA INFORMACION Y EL CONOCIMIENTO', 1),
(23, 500, 'COORD. GENERAL DE PUERTOS Y MARINA MERCANTE', 1),
(24, 510, 'DIR. GRAL. DE PUERTOS', 1),
(25, 511, 'DIR. GRAL. DE MARINA MERCANTE', 1),
(26, 512, 'DIR. GRAL. DE FOMENTO Y ADMINISTRACION PORTUARIA', 1),
(27, 600, 'COORDINACION GENERAL DE CENTRO S.C.T', 1),
(28, 611, 'DIR. GRAL. DE EVALUACION', 1),
(29, 621, 'CENTRO S.C.T AGUASCALIENTES', 1),
(30, 622, 'CENTRO S.C.T BAJA CALIFORNIA', 1),
(31, 623, 'CENTRO S.C.T BAJA CALIFORNIA SUR', 1),
(32, 624, 'CENTRO S.C.T CAMPECHE', 1),
(33, 625, 'CENTRO S.C.T COAHUILA', 1),
(34, 626, 'CENTRO S.C.T COLIMA', 1),
(35, 627, 'CENTRO S.C.T CHIAPAS', 1),
(36, 628, 'CENTRO S.C.T CHIHUAHUA', 1),
(37, 630, 'CENTRO S.C.T DURANGO', 1),
(38, 631, 'CENTRO S.C.T GUANAJUATO', 1),
(39, 632, 'CENTRO S.C.T GUERRERO', 1),
(40, 633, 'CENTRO S.C.T HIDALGO', 1),
(41, 634, 'CENTRO S.C.T JALISCO', 1),
(42, 635, 'CENTRO S.C.T MEXICO', 1),
(43, 636, 'CENTRO S.C.T MICHOACAN', 1),
(44, 637, 'CENTRO S.C.T MORELOS', 1),
(45, 638, 'CENTRO S.C.T NAYARIT', 1),
(46, 639, 'CENTRO S.C.T NUEVO LEON', 1),
(47, 640, 'CENTRO S.C.T OAXACA', 1),
(48, 641, 'CENTRO S.C.T PUEBLA', 1),
(49, 642, 'CENTRO S.C.T QUERETARO', 1),
(50, 643, 'CENTRO S.C.T QUINTANA ROO', 1),
(51, 644, 'CENTRO S.C.T SAN LUIS POTOSI', 1),
(52, 645, 'CENTRO S.C.T SINALOA', 1),
(53, 646, 'CENTRO S.C.T SONORA', 1),
(54, 647, 'CENTRO S.C.T TABASCO', 1),
(55, 648, 'CENTRO S.C.T TAMAULIPAS', 1),
(56, 649, 'CENTRO S.C.T TLAXCALA', 1),
(57, 650, 'CENTRO S.C.T VERACRUZ', 1),
(58, 651, 'CENTRO S.C.T YUCATAN', 1),
(59, 652, 'CENTRO S.C.T ZACATECAS', 1),
(60, 700, 'UNIDAD DE ADMINISTRACION Y FINANZAS', 1),
(61, 710, 'DIR. GRAL. DE PROG. ORGANIZACION Y PRESUP.', 1),
(62, 711, 'DIR. GRAL. DE RECURSOS HUMANOS', 1),
(63, 712, 'DIR. GRAL. DE RECURSOS MATERIALES', 1),
(64, 713, 'UNIDAD DE TECNOLOGIA DE INFORMACION Y COMUNICACIONES', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `user_id` int(11) NOT NULL,
  `user_titulo` int(11) DEFAULT NULL,
  `user_nom` varchar(30) NOT NULL,
  `user_ap` varchar(30) NOT NULL,
  `user_am` varchar(30) NOT NULL,
  `user_unidad` int(5) NOT NULL,
  `user_cargo` int(5) NOT NULL,
  `user_rol` int(5) NOT NULL,
  `user_mail` varchar(50) NOT NULL,
  `user_pass` varchar(250) NOT NULL,
  `user_estado` int(3) NOT NULL DEFAULT 1,
  `user_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `user_madeBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`accion_id`);

--
-- Indices de la tabla `acuerdos`
--
ALTER TABLE `acuerdos`
  ADD PRIMARY KEY (`acuerdo_id`),
  ADD KEY `acuerdo_minuta` (`acuerdo_minuta`),
  ADD KEY `acuerdo_responsable` (`acuerdo_responsable`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`cargo_id`),
  ADD KEY `cargo_madeBy` (`cargo_madeBy`),
  ADD KEY `cargo_madeBy_2` (`cargo_madeBy`),
  ADD KEY `cargo_madeBy_3` (`cargo_madeBy`),
  ADD KEY `cargo_madeBy_4` (`cargo_madeBy`);

--
-- Indices de la tabla `entes`
--
ALTER TABLE `entes`
  ADD PRIMARY KEY (`ente_id`),
  ADD KEY `ente_madeBy` (`ente_madeBy`);

--
-- Indices de la tabla `evidencias`
--
ALTER TABLE `evidencias`
  ADD PRIMARY KEY (`evidencia_id`),
  ADD KEY `evidencia_reporte` (`evidencia_reporte`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`hist_id`),
  ADD KEY `hist_user` (`hist_user`),
  ADD KEY `hist_accion` (`hist_accion`);

--
-- Indices de la tabla `logos`
--
ALTER TABLE `logos`
  ADD PRIMARY KEY (`logo_id`);

--
-- Indices de la tabla `minutas`
--
ALTER TABLE `minutas`
  ADD PRIMARY KEY (`minuta_id`),
  ADD KEY `minuta_madeBy` (`minuta_madeBy`),
  ADD KEY `minuta_unidad_admin` (`minuta_unidad_admin`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`mod_id`);

--
-- Indices de la tabla `oficios`
--
ALTER TABLE `oficios`
  ADD PRIMARY KEY (`ofi_id`),
  ADD KEY `ofi_subidoPor` (`ofi_subidoPor`),
  ADD KEY `ofi_destinatario` (`ofi_destinatario`),
  ADD KEY `ofi_cargoDest` (`ofi_cargoDest`),
  ADD KEY `ofi_unidadDest` (`ofi_unidadDest`),
  ADD KEY `ofi_remitente` (`ofi_remitente`),
  ADD KEY `ofi_cargoRem` (`ofi_cargoRem`),
  ADD KEY `ofi_unidadRem` (`ofi_unidadRem`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`participante_id`),
  ADD KEY `participante_titulo` (`participante_titulo`),
  ADD KEY `participante_cargo` (`participante_cargo`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`permiso_id`),
  ADD KEY `permiso_rol` (`permiso_rol`),
  ADD KEY `permiso_mod` (`permiso_mod`);

--
-- Indices de la tabla `receptores`
--
ALTER TABLE `receptores`
  ADD PRIMARY KEY (`receptor_id`),
  ADD KEY `receptor_MadeBy` (`receptor_MadeBy`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`reporte_id`),
  ADD KEY `reporte_persona` (`reporte_persona`),
  ADD KEY `reporte_madeBy` (`reporte_madeBy`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `titulos`
--
ALTER TABLE `titulos`
  ADD PRIMARY KEY (`titulo_id`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`unidad_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_titulo` (`user_titulo`),
  ADD KEY `user_unidad` (`user_unidad`),
  ADD KEY `user_cargo` (`user_cargo`),
  ADD KEY `user_rol` (`user_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `accion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `acuerdos`
--
ALTER TABLE `acuerdos`
  MODIFY `acuerdo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `cargo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `entes`
--
ALTER TABLE `entes`
  MODIFY `ente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT de la tabla `evidencias`
--
ALTER TABLE `evidencias`
  MODIFY `evidencia_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `hist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logos`
--
ALTER TABLE `logos`
  MODIFY `logo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `minutas`
--
ALTER TABLE `minutas`
  MODIFY `minuta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `mod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `oficios`
--
ALTER TABLE `oficios`
  MODIFY `ofi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `participante_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `permiso_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `receptores`
--
ALTER TABLE `receptores`
  MODIFY `receptor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `reporte_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `titulos`
--
ALTER TABLE `titulos`
  MODIFY `titulo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `unidad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acuerdos`
--
ALTER TABLE `acuerdos`
  ADD CONSTRAINT `acuerdos_ibfk_1` FOREIGN KEY (`acuerdo_minuta`) REFERENCES `minutas` (`minuta_id`),
  ADD CONSTRAINT `acuerdos_ibfk_2` FOREIGN KEY (`acuerdo_responsable`) REFERENCES `participantes` (`participante_id`);

--
-- Filtros para la tabla `entes`
--
ALTER TABLE `entes`
  ADD CONSTRAINT `entes_ibfk_1` FOREIGN KEY (`ente_madeBy`) REFERENCES `usuarios` (`user_id`);

--
-- Filtros para la tabla `evidencias`
--
ALTER TABLE `evidencias`
  ADD CONSTRAINT `evidencias_ibfk_1` FOREIGN KEY (`evidencia_reporte`) REFERENCES `reportes` (`reporte_id`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`hist_user`) REFERENCES `usuarios` (`user_id`),
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`hist_accion`) REFERENCES `acciones` (`accion_id`);

--
-- Filtros para la tabla `minutas`
--
ALTER TABLE `minutas`
  ADD CONSTRAINT `minutas_ibfk_1` FOREIGN KEY (`minuta_madeBy`) REFERENCES `usuarios` (`user_id`),
  ADD CONSTRAINT `minutas_ibfk_2` FOREIGN KEY (`minuta_unidad_admin`) REFERENCES `cargos` (`cargo_id`);

--
-- Filtros para la tabla `oficios`
--
ALTER TABLE `oficios`
  ADD CONSTRAINT `oficios_ibfk_1` FOREIGN KEY (`ofi_subidoPor`) REFERENCES `usuarios` (`user_id`),
  ADD CONSTRAINT `oficios_ibfk_2` FOREIGN KEY (`ofi_destinatario`) REFERENCES `entes` (`ente_id`),
  ADD CONSTRAINT `oficios_ibfk_3` FOREIGN KEY (`ofi_cargoDest`) REFERENCES `cargos` (`cargo_id`),
  ADD CONSTRAINT `oficios_ibfk_4` FOREIGN KEY (`ofi_unidadDest`) REFERENCES `entes` (`ente_id`),
  ADD CONSTRAINT `oficios_ibfk_5` FOREIGN KEY (`ofi_remitente`) REFERENCES `entes` (`ente_id`),
  ADD CONSTRAINT `oficios_ibfk_6` FOREIGN KEY (`ofi_cargoRem`) REFERENCES `cargos` (`cargo_id`),
  ADD CONSTRAINT `oficios_ibfk_7` FOREIGN KEY (`ofi_unidadRem`) REFERENCES `entes` (`ente_id`);

--
-- Filtros para la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD CONSTRAINT `participantes_ibfk_1` FOREIGN KEY (`participante_titulo`) REFERENCES `titulos` (`titulo_id`),
  ADD CONSTRAINT `participantes_ibfk_2` FOREIGN KEY (`participante_cargo`) REFERENCES `cargos` (`cargo_id`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`permiso_rol`) REFERENCES `roles` (`rol_id`),
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`permiso_mod`) REFERENCES `modulos` (`mod_id`);

--
-- Filtros para la tabla `receptores`
--
ALTER TABLE `receptores`
  ADD CONSTRAINT `receptores_ibfk_1` FOREIGN KEY (`receptor_MadeBy`) REFERENCES `usuarios` (`user_id`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`reporte_persona`) REFERENCES `receptores` (`receptor_id`),
  ADD CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`reporte_madeBy`) REFERENCES `usuarios` (`user_id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`user_titulo`) REFERENCES `titulos` (`titulo_id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`user_unidad`) REFERENCES `unidades` (`unidad_id`),
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`user_cargo`) REFERENCES `cargos` (`cargo_id`),
  ADD CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`user_rol`) REFERENCES `roles` (`rol_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

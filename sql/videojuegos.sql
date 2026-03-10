-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-03-2026 a las 18:48:08
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
-- Base de datos: `videojuegos2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `otorga`
--

CREATE TABLE `otorga` (
  `id_rol` int(11) NOT NULL,
  `id_privilegio` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `otorga`
--

INSERT INTO `otorga` (`id_rol`, `id_privilegio`, `created_at`) VALUES
(1, 1, '2026-03-10 15:47:05'),
(1, 2, '2026-03-10 15:47:05'),
(1, 3, '2026-03-10 16:30:05'),
(2, 1, '2026-03-10 15:47:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `id` int(11) NOT NULL,
  `privilegio` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`id`, `privilegio`, `created_at`) VALUES
(1, 'ver_videojuegos', '2026-03-10 15:45:56'),
(2, 'crear_videojuegos', '2026-03-10 15:45:56'),
(3, 'actualizar_videojuegos', '2026-03-10 16:29:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`, `created_at`) VALUES
(1, 'administrador', '2026-03-10 15:45:23'),
(2, 'usuario', '2026-03-10 15:45:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene`
--

CREATE TABLE `tiene` (
  `id_usuario` varchar(50) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tiene`
--

INSERT INTO `tiene` (`id_usuario`, `id_rol`, `created_at`) VALUES
('Paco14', 1, '2026-03-10 15:46:32'),
('CH14', 2, '2026-03-10 15:46:32'),
('HormigaOtaku', 2, '2026-03-10 16:30:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `nombre`, `created_at`) VALUES
(1, 'shooter', '2026-03-10 16:25:12'),
(2, 'sandbox', '2026-03-10 16:25:12'),
(3, 'acción', '2026-03-10 16:25:56'),
(4, 'plataformas', '2026-03-10 16:25:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`username`, `password`, `nombre`, `created_at`) VALUES
('CH14', '$2b$12$H.GTxppWbI2wxaKf5kf/6ebeYJlWtRlvxCxrOeGpAClh5ov8Ea31y', 'Javier Hernandez', '2026-03-10 17:24:46'),
('HormigaOtaku', '$2b$12$8whMB/ILAnt8dMWx0uZ5vOm3dE7E5o/EY8Kz67r689Rpk1NyNofqm', 'Armando Gonzalez', '2026-03-10 17:25:41'),
('Paco14', '$2b$12$EMpudwJVdCdHgcBVhaz0aOFWUQwTnH9HNi/6bz6YA/YpI48WmIP6u', 'Francisco Arreola', '2026-03-10 17:22:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuegos`
--

CREATE TABLE `videojuegos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `imagen` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `videojuegos`
--

INSERT INTO `videojuegos` (`id`, `nombre`, `id_tipo`, `imagen`, `created_at`) VALUES
(1, 'Minecraft', 2, 'https://store-images.s-microsoft.com/image/apps.58378.13850085746326678.826cc014-d610-46af-bdb3-c5c96be4d22c.64287a91-c69e-4723-bb61-03fecd348c2a?q=90&w=480&h=270', '2026-03-05 16:01:52'),
(2, 'Gears of war', 1, 'https://upload.wikimedia.org/wikipedia/en/thumb/8/82/Gears_of_war_cover_art.jpg/250px-Gears_of_war_cover_art.jpg', '2026-03-05 16:01:52'),
(3, 'Assassin´s Creed', 4, 'https://upload.wikimedia.org/wikipedia/en/5/52/Assassin%27s_Creed.jpg', '2026-03-05 16:27:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `otorga`
--
ALTER TABLE `otorga`
  ADD PRIMARY KEY (`id_rol`,`id_privilegio`),
  ADD KEY `id_privilegio` (`id_privilegio`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiene`
--
ALTER TABLE `tiene`
  ADD PRIMARY KEY (`id_rol`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `otorga`
--
ALTER TABLE `otorga`
  ADD CONSTRAINT `otorga_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `otorga_ibfk_2` FOREIGN KEY (`id_privilegio`) REFERENCES `privilegios` (`id`);

--
-- Filtros para la tabla `tiene`
--
ALTER TABLE `tiene`
  ADD CONSTRAINT `tiene_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `tiene_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD CONSTRAINT `videojuegos_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
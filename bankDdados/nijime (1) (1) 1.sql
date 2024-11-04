-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Out-2024 às 01:13
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nijime`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_usuario`
--

CREATE TABLE `avaliacao_usuario` (
  `id` int(11) NOT NULL,
  `usuario_plano_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `data_status` date NOT NULL,
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

CREATE TABLE `plano` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `plano`
--

INSERT INTO `plano` (`id`, `nome`, `descricao`, `criado_em`) VALUES
(1, 'DANÇA DO VENTRE', 'TESTE', '2024-10-24 21:52:08'),
(2, 'DANÇA CIGANA', 'TESTE CIGANA', '2024-10-24 21:52:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `presenca`
--

CREATE TABLE `presenca` (
  `id` int(11) NOT NULL,
  `usuario_plano_id` int(11) NOT NULL,
  `data_presenca` date NOT NULL,
  `presente` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `nv_user` enum('Aluno','Administrador') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `criado_em`, `nv_user`) VALUES
(1, 'diego afonso silva', 'teste@teste.com', '$2y$10$MaE3kuIFHusgpS5ktMO4iOw0fQOMVKukO47yGbZM/SYJF2yd8LFy2', '2024-10-20 21:44:40', 'Administrador'),
(2, 'teste2', 'teste2@teste.com', '$2y$10$YWd40sKByDQbLwX/FJsuZeiRU1sPZKJsAzn4TCrirQydjHQWg48xW', '2024-10-23 00:36:46', 'Administrador'),
(4, 'roberto', 'roberto@teste.com', '$2y$10$WdRf1.91pVfsFjZNT5NOm.hYvFaeZcqfl1ZfF7fK8/L/TCNrwCub.', '2024-10-24 21:08:08', 'Aluno'),
(6, 'PIPOCA2', 'pipoca@teste.com', '$2y$10$lCaWpNLrj1w9Q7XDRs3jH.ZT5esQkZZFQg4gUnp5Sl6dywMnRVl7O', '2024-10-24 21:44:49', 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_plano`
--

CREATE TABLE `usuario_plano` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `plano_id` int(11) NOT NULL,
  `associado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `avaliado` tinyint(4) NOT NULL DEFAULT 0,
  `presenca` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario_plano`
--

INSERT INTO `usuario_plano` (`id`, `usuario_id`, `plano_id`, `associado_em`, `avaliado`, `presenca`) VALUES
(1, 6, 1, '2024-10-24 21:52:32', 2, '2024-10-24'),
(3, 6, 2, '2024-10-24 22:35:52', 3, '2024-10-25'),
(4, 4, 1, '2024-10-24 22:36:14', 0, NULL),
(7, 4, 2, '2024-10-24 22:40:06', 0, NULL),
(10, 2, 1, '2024-10-24 22:46:49', 0, NULL),
(11, 2, 2, '2024-10-24 22:46:52', 0, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacao_usuario`
--
ALTER TABLE `avaliacao_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_plano_id` (`usuario_plano_id`,`data_status`);

--
-- Índices para tabela `plano`
--
ALTER TABLE `plano`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `presenca`
--
ALTER TABLE `presenca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_plano_id` (`usuario_plano_id`,`data_presenca`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `usuario_plano`
--
ALTER TABLE `usuario_plano`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`,`plano_id`),
  ADD KEY `plano_id` (`plano_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao_usuario`
--
ALTER TABLE `avaliacao_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `plano`
--
ALTER TABLE `plano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `presenca`
--
ALTER TABLE `presenca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario_plano`
--
ALTER TABLE `usuario_plano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacao_usuario`
--
ALTER TABLE `avaliacao_usuario`
  ADD CONSTRAINT `avaliacao_usuario_ibfk_1` FOREIGN KEY (`usuario_plano_id`) REFERENCES `usuario_plano` (`id`);

--
-- Limitadores para a tabela `presenca`
--
ALTER TABLE `presenca`
  ADD CONSTRAINT `presenca_ibfk_1` FOREIGN KEY (`usuario_plano_id`) REFERENCES `usuario_plano` (`id`);

--
-- Limitadores para a tabela `usuario_plano`
--
ALTER TABLE `usuario_plano`
  ADD CONSTRAINT `usuario_plano_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `usuario_plano_ibfk_2` FOREIGN KEY (`plano_id`) REFERENCES `plano` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/09/2024 às 16:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbsevenplus`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `id_categoria` int(11) NOT NULL,
  `desc_categoria` varchar(45) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_diretor`
--

CREATE TABLE `tb_diretor` (
  `id_diretor` int(11) NOT NULL,
  `nome_diretor` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_diretor_filme`
--

CREATE TABLE `tb_diretor_filme` (
  `id_diretor_filme` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL,
  `id_diretor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_dublagem`
--

CREATE TABLE `tb_dublagem` (
  `id_dublagem` int(11) NOT NULL,
  `desc_dublagem` varchar(3) NOT NULL,
  `arquivo_dublagem` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_dublagem_filme`
--

CREATE TABLE `tb_dublagem_filme` (
  `id_dublagem_filme` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL,
  `id_dublagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_filme`
--

CREATE TABLE `tb_filme` (
  `id_filme` int(11) NOT NULL,
  `titulo_filme` varchar(200) NOT NULL,
  `ano_lancamento` int(4) NOT NULL,
  `duracao` time NOT NULL,
  `arquivo_filme` varchar(200) NOT NULL,
  `id_produtora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_filme_categoria`
--

CREATE TABLE `tb_filme_categoria` (
  `id_filme_categoria` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_legenda`
--

CREATE TABLE `tb_legenda` (
  `id_legenda` int(11) NOT NULL,
  `desc_legenda` varchar(3) NOT NULL,
  `arquivo_legenda` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_legenda_filme`
--

CREATE TABLE `tb_legenda_filme` (
  `id_legenda_filme` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL,
  `id_legenda` int(11) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produtora`
--

CREATE TABLE `tb_produtora` (
  `id_produtora` int(11) NOT NULL,
  `nome_produtora` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_status`
--

CREATE TABLE `tb_status` (
  `id_status` int(11) NOT NULL,
  `desc_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `fk_id_status` (`id_status`);

--
-- Índices de tabela `tb_diretor`
--
ALTER TABLE `tb_diretor`
  ADD PRIMARY KEY (`id_diretor`);

--
-- Índices de tabela `tb_diretor_filme`
--
ALTER TABLE `tb_diretor_filme`
  ADD PRIMARY KEY (`id_diretor_filme`),
  ADD UNIQUE KEY `unique_filme_diretor` (`id_filme`,`id_diretor`),
  ADD KEY `fk_diretor_filme_id_diretor` (`id_diretor`);

--
-- Índices de tabela `tb_dublagem`
--
ALTER TABLE `tb_dublagem`
  ADD PRIMARY KEY (`id_dublagem`);

--
-- Índices de tabela `tb_dublagem_filme`
--
ALTER TABLE `tb_dublagem_filme`
  ADD PRIMARY KEY (`id_dublagem_filme`),
  ADD KEY `fk_dublagem_filme_id_filme` (`id_filme`),
  ADD KEY `fk_dublagem_filme_id_dublagem` (`id_dublagem`);

--
-- Índices de tabela `tb_filme`
--
ALTER TABLE `tb_filme`
  ADD PRIMARY KEY (`id_filme`),
  ADD KEY `fk_id_produtora` (`id_produtora`);

--
-- Índices de tabela `tb_filme_categoria`
--
ALTER TABLE `tb_filme_categoria`
  ADD PRIMARY KEY (`id_filme_categoria`),
  ADD KEY `fk_id_filme` (`id_filme`),
  ADD KEY `fk_id_categoria` (`id_categoria`);

--
-- Índices de tabela `tb_legenda`
--
ALTER TABLE `tb_legenda`
  ADD PRIMARY KEY (`id_legenda`);

--
-- Índices de tabela `tb_legenda_filme`
--
ALTER TABLE `tb_legenda_filme`
  ADD PRIMARY KEY (`id_legenda_filme`),
  ADD UNIQUE KEY `unique_legenda_filme` (`id_legenda`,`id_filme`),
  ADD KEY `fk_legenda_filme_id_filme` (`id_filme`),
  ADD KEY `fk_legenda_filme_id_status` (`id_status`);

--
-- Índices de tabela `tb_produtora`
--
ALTER TABLE `tb_produtora`
  ADD PRIMARY KEY (`id_produtora`);

--
-- Índices de tabela `tb_status`
--
ALTER TABLE `tb_status`
  ADD PRIMARY KEY (`id_status`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_diretor`
--
ALTER TABLE `tb_diretor`
  MODIFY `id_diretor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_diretor_filme`
--
ALTER TABLE `tb_diretor_filme`
  MODIFY `id_diretor_filme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_dublagem_filme`
--
ALTER TABLE `tb_dublagem_filme`
  MODIFY `id_dublagem_filme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_filme`
--
ALTER TABLE `tb_filme`
  MODIFY `id_filme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_filme_categoria`
--
ALTER TABLE `tb_filme_categoria`
  MODIFY `id_filme_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_legenda`
--
ALTER TABLE `tb_legenda`
  MODIFY `id_legenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_legenda_filme`
--
ALTER TABLE `tb_legenda_filme`
  MODIFY `id_legenda_filme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produtora`
--
ALTER TABLE `tb_produtora`
  MODIFY `id_produtora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_status`
--
ALTER TABLE `tb_status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD CONSTRAINT `fk_id_status` FOREIGN KEY (`id_status`) REFERENCES `tb_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_diretor_filme`
--
ALTER TABLE `tb_diretor_filme`
  ADD CONSTRAINT `fk_diretor_filme_id_diretor` FOREIGN KEY (`id_diretor`) REFERENCES `tb_diretor` (`id_diretor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_diretor_filme_id_filme` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_dublagem_filme`
--
ALTER TABLE `tb_dublagem_filme`
  ADD CONSTRAINT `fk_dublagem_filme_id_dublagem` FOREIGN KEY (`id_dublagem`) REFERENCES `tb_dublagem` (`id_dublagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dublagem_filme_id_filme` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_filme`
--
ALTER TABLE `tb_filme`
  ADD CONSTRAINT `fk_id_produtora` FOREIGN KEY (`id_produtora`) REFERENCES `tb_produtora` (`id_produtora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_filme_categoria`
--
ALTER TABLE `tb_filme_categoria`
  ADD CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_filme` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_legenda_filme`
--
ALTER TABLE `tb_legenda_filme`
  ADD CONSTRAINT `fk_legenda_filme_id_filme` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_legenda_filme_id_legenda` FOREIGN KEY (`id_legenda`) REFERENCES `tb_legenda` (`id_legenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_legenda_filme_id_status` FOREIGN KEY (`id_status`) REFERENCES `tb_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

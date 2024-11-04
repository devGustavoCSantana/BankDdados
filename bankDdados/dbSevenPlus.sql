-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/09/2024 às 15:55
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
-- Banco de dados: `dbsevenplus_tii07`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbacl`
--

CREATE TABLE `tbacl` (
  `idAcl` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` varchar(20) NOT NULL,
  `idprofile` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbaudio`
--

CREATE TABLE `tbaudio` (
  `idAudio` int(11) NOT NULL,
  `idioma` varchar(255) NOT NULL,
  `idAudioVisual` int(11) NOT NULL,
  `linkAudio` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbaudiovisual`
--

CREATE TABLE `tbaudiovisual` (
  `idAudioVisual` int(11) NOT NULL,
  `tituloOriginal` varchar(255) NOT NULL,
  `subtituloOriginal` varchar(255) NOT NULL,
  `sinopse` varchar(500) NOT NULL,
  `duracao` varchar(10) NOT NULL,
  `ranking` int(11) NOT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbdiretor`
--

CREATE TABLE `tbdiretor` (
  `idDiretor` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `idAudioVisual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbelenco`
--

CREATE TABLE `tbelenco` (
  `idElenco` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `idAudioVisual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbepisodio`
--

CREATE TABLE `tbepisodio` (
  `idEpisodio` int(11) NOT NULL,
  `episodio` int(11) NOT NULL,
  `idAudioVisual` int(11) NOT NULL,
  `idTemporada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbfilme`
--

CREATE TABLE `tbfilme` (
  `idFilme` int(11) NOT NULL,
  `idAudioVisual` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbgenero`
--

CREATE TABLE `tbgenero` (
  `idGenero` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idAudioVisual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tblegenda`
--

CREATE TABLE `tblegenda` (
  `idLegenda` int(11) NOT NULL,
  `idioma` varchar(255) NOT NULL,
  `idAudioVisual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbmultimidia`
--

CREATE TABLE `tbmultimidia` (
  `idMultimidia` int(11) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `url` varchar(500) NOT NULL,
  `idAudioVisual` int(11) NOT NULL,
  `idSerie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbprodutor`
--

CREATE TABLE `tbprodutor` (
  `idProdutor` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `idAudioVisual` int(11) NOT NULL,
  `idSerie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbprofile`
--

CREATE TABLE `tbprofile` (
  `idprofile` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `tbprofile`
--

INSERT INTO `tbprofile` (`idprofile`, `type`, `description`) VALUES
(1, 1, 'MASTER');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbserie`
--

CREATE TABLE `tbserie` (
  `idSerie` int(11) NOT NULL,
  `tituloOriginal` varchar(255) NOT NULL,
  `subtituloOriginal` varchar(255) NOT NULL,
  `sinopse` varchar(500) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbstatus`
--

CREATE TABLE `tbstatus` (
  `idstatus` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `tbstatus`
--

INSERT INTO `tbstatus` (`idstatus`, `type`, `description`) VALUES
(1, 0, 'INATIVO'),
(2, 1, 'ATIVO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbtemporada`
--

CREATE TABLE `tbtemporada` (
  `idTemporada` int(11) NOT NULL,
  `temporada` int(11) NOT NULL,
  `idSerie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbtitulo`
--

CREATE TABLE `tbtitulo` (
  `idTitulo` int(11) NOT NULL,
  `idioma` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `subtitulo` varchar(100) NOT NULL,
  `idAudioVisual` int(11) NOT NULL,
  `idSerie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbuser`
--

CREATE TABLE `tbuser` (
  `idUser` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(60) NOT NULL,
  `hash` varchar(60) NOT NULL,
  `idprofile` int(11) NOT NULL,
  `idstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `tbuser`
--

INSERT INTO `tbuser` (`idUser`, `email`, `password`, `hash`, `idprofile`, `idstatus`) VALUES
(55, 'TESTE@TESTE.COM', '$2b$09$5256dabd82f2958abebe6usXEmQpcwnk8JFANKi0pF2CWDw/2byJi', '$2b$08$51c1a47aeefd36532a82fuW3fE6eaNTw4DP/IhZYSfHO8cJGVtOqG', 1, 2),
(56, 'TESTER@TESTE.COM', '$2b$09$da5b25b863df7a59c8a14ewqSQ6mex/1yIeAYsCoSxEg6uMYwAvgu', '$2b$08$1677f691e10318a7b865fuOD1qiae8F2f/iJkkzrkUU0JbGl3u37K', 1, 2),
(57, 'JULIOZ@GMAIL.COM', '$2b$09$26c38867a236f02a487aduF6FpxP.fjZi/kYKSt2drQtM2A6WVfFi', '$2b$08$009755af0dc24987c4f72Oacj3M/wmbsPv6xri0MPzbJDPgxSEN0K', 1, 2),
(58, 'juliooakamine@gmail.com', '$2b$09$7dbcb9f45f9a0b1da9df0O.mcRuZNdmLWfE0Y/MjfWaDIWT9h/5k.', '$2b$08$2295be9c86dfd8c36dd90erepjscbUN40g.28Wv4hdxybNEo.OYym', 1, 2),
(59, 'juliooakamineee@gmail.com', '$2b$09$35303d05c08c8f8a1cff7u5dfBeDUmOAZR0eF3.2HY8lP5W65E2Fy', '$2b$08$c1d544afaf0938c324745uceLf4NMjpmWaVE5kdCK6V.0FXczy.Oa', 1, 2),
(60, 'juliooakamineEE@gmail.com', '$2b$09$2b149b6cf4b6a9598f4e8O5nQtOpXEDL7/c6RpNeZRjt0ARUs3JLK', '$2b$08$30b61ee8967cacb05fb27uS0XPmmBO6.k6jw7NpzCMsHRcQAcB2gO', 1, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbacl`
--
ALTER TABLE `tbacl`
  ADD PRIMARY KEY (`idAcl`),
  ADD UNIQUE KEY `UQ_tipo` (`type`),
  ADD KEY `FK_idprofile` (`idprofile`);

--
-- Índices de tabela `tbaudio`
--
ALTER TABLE `tbaudio`
  ADD PRIMARY KEY (`idAudio`),
  ADD KEY `FK_idAudioVisual` (`idAudioVisual`);

--
-- Índices de tabela `tbaudiovisual`
--
ALTER TABLE `tbaudiovisual`
  ADD PRIMARY KEY (`idAudioVisual`);

--
-- Índices de tabela `tbdiretor`
--
ALTER TABLE `tbdiretor`
  ADD PRIMARY KEY (`idDiretor`);

--
-- Índices de tabela `tbelenco`
--
ALTER TABLE `tbelenco`
  ADD PRIMARY KEY (`idElenco`,`nome`),
  ADD KEY `idAudioVisual_idx` (`idAudioVisual`);

--
-- Índices de tabela `tbepisodio`
--
ALTER TABLE `tbepisodio`
  ADD PRIMARY KEY (`idEpisodio`),
  ADD KEY `fk_tbepisodio_tbaudiovisual1_idx` (`idAudioVisual`),
  ADD KEY `fk_tbepisodio_tbtemporada1_idx` (`idTemporada`);

--
-- Índices de tabela `tbfilme`
--
ALTER TABLE `tbfilme`
  ADD PRIMARY KEY (`idFilme`),
  ADD KEY `fk_iDaudiovisual1_idx` (`idAudioVisual`),
  ADD KEY `fk_tbfilme_tbuser1_idx` (`idUser`);

--
-- Índices de tabela `tbgenero`
--
ALTER TABLE `tbgenero`
  ADD PRIMARY KEY (`idGenero`,`idUser`),
  ADD KEY `idx_idAudioVisual` (`idAudioVisual`);

--
-- Índices de tabela `tblegenda`
--
ALTER TABLE `tblegenda`
  ADD PRIMARY KEY (`idLegenda`,`idioma`),
  ADD KEY `idx_idAudioVisual` (`idAudioVisual`);

--
-- Índices de tabela `tbmultimidia`
--
ALTER TABLE `tbmultimidia`
  ADD PRIMARY KEY (`idMultimidia`),
  ADD KEY `FK_idAudioVisual_idx` (`idAudioVisual`);

--
-- Índices de tabela `tbprodutor`
--
ALTER TABLE `tbprodutor`
  ADD PRIMARY KEY (`idProdutor`),
  ADD KEY `fk_tbprodutor_tbaudiovisual1_idx` (`idAudioVisual`),
  ADD KEY `fk_tbprodutor_tbserie1_idx` (`idSerie`);

--
-- Índices de tabela `tbprofile`
--
ALTER TABLE `tbprofile`
  ADD PRIMARY KEY (`idprofile`),
  ADD UNIQUE KEY `UQ_tipo` (`type`);

--
-- Índices de tabela `tbserie`
--
ALTER TABLE `tbserie`
  ADD PRIMARY KEY (`idSerie`),
  ADD KEY `fk_iduser1_idx` (`idUser`);

--
-- Índices de tabela `tbstatus`
--
ALTER TABLE `tbstatus`
  ADD PRIMARY KEY (`idstatus`),
  ADD UNIQUE KEY `UQ_tipo` (`type`);

--
-- Índices de tabela `tbtemporada`
--
ALTER TABLE `tbtemporada`
  ADD PRIMARY KEY (`idTemporada`),
  ADD KEY `fk_tbtemporada_tbserie1_idx` (`idSerie`);

--
-- Índices de tabela `tbtitulo`
--
ALTER TABLE `tbtitulo`
  ADD PRIMARY KEY (`idTitulo`),
  ADD KEY `fk_tbtitulo_tbaudiovisual1_idx` (`idAudioVisual`),
  ADD KEY `fk_tbtitulo_tbserie1_idx` (`idSerie`);

--
-- Índices de tabela `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `UQ_email` (`email`),
  ADD KEY `FK_idStatus` (`idstatus`),
  ADD KEY `FK_idProfile` (`idprofile`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbacl`
--
ALTER TABLE `tbacl`
  MODIFY `idAcl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbaudio`
--
ALTER TABLE `tbaudio`
  MODIFY `idAudio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbaudiovisual`
--
ALTER TABLE `tbaudiovisual`
  MODIFY `idAudioVisual` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbdiretor`
--
ALTER TABLE `tbdiretor`
  MODIFY `idDiretor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbelenco`
--
ALTER TABLE `tbelenco`
  MODIFY `idElenco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbfilme`
--
ALTER TABLE `tbfilme`
  MODIFY `idFilme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbgenero`
--
ALTER TABLE `tbgenero`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tblegenda`
--
ALTER TABLE `tblegenda`
  MODIFY `idLegenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbmultimidia`
--
ALTER TABLE `tbmultimidia`
  MODIFY `idMultimidia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbprodutor`
--
ALTER TABLE `tbprodutor`
  MODIFY `idProdutor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbprofile`
--
ALTER TABLE `tbprofile`
  MODIFY `idprofile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbserie`
--
ALTER TABLE `tbserie`
  MODIFY `idSerie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbstatus`
--
ALTER TABLE `tbstatus`
  MODIFY `idstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbtemporada`
--
ALTER TABLE `tbtemporada`
  MODIFY `idTemporada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbtitulo`
--
ALTER TABLE `tbtitulo`
  MODIFY `idTitulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbuser`
--
ALTER TABLE `tbuser`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbacl`
--
ALTER TABLE `tbacl`
  ADD CONSTRAINT `tbacl_ibfk_1` FOREIGN KEY (`idprofile`) REFERENCES `tbprofile` (`idprofile`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbelenco`
--
ALTER TABLE `tbelenco`
  ADD CONSTRAINT `FK_idAudioVisual` FOREIGN KEY (`idAudioVisual`) REFERENCES `tbaudiovisual` (`idAudioVisual`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbepisodio`
--
ALTER TABLE `tbepisodio`
  ADD CONSTRAINT `fk_tbepisodio_tbaudiovisual1` FOREIGN KEY (`idAudioVisual`) REFERENCES `tbaudiovisual` (`idAudioVisual`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbepisodio_tbtemporada1` FOREIGN KEY (`idTemporada`) REFERENCES `tbtemporada` (`idTemporada`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbfilme`
--
ALTER TABLE `tbfilme`
  ADD CONSTRAINT `fk_tbaudiovisual1` FOREIGN KEY (`idAudioVisual`) REFERENCES `tbaudiovisual` (`idAudioVisual`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbfilme_tbuser1` FOREIGN KEY (`idUser`) REFERENCES `tbuser` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbgenero`
--
ALTER TABLE `tbgenero`
  ADD CONSTRAINT `fk_tbgenero_idAudioVisual` FOREIGN KEY (`idAudioVisual`) REFERENCES `tbaudiovisual` (`idAudioVisual`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tblegenda`
--
ALTER TABLE `tblegenda`
  ADD CONSTRAINT `fk_tblegenda_idAudioVisual` FOREIGN KEY (`idAudioVisual`) REFERENCES `tbaudiovisual` (`idAudioVisual`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbprodutor`
--
ALTER TABLE `tbprodutor`
  ADD CONSTRAINT `fk_tbprodutor_tbaudiovisual1` FOREIGN KEY (`idAudioVisual`) REFERENCES `tbaudiovisual` (`idAudioVisual`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbprodutor_tbserie1` FOREIGN KEY (`idSerie`) REFERENCES `tbserie` (`idSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbserie`
--
ALTER TABLE `tbserie`
  ADD CONSTRAINT `fk_iduser1` FOREIGN KEY (`idUser`) REFERENCES `tbuser` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbtemporada`
--
ALTER TABLE `tbtemporada`
  ADD CONSTRAINT `fk_tbtemporada_tbserie1` FOREIGN KEY (`idSerie`) REFERENCES `tbserie` (`idSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbtitulo`
--
ALTER TABLE `tbtitulo`
  ADD CONSTRAINT `fk_tbtitulo_tbaudiovisual1` FOREIGN KEY (`idAudioVisual`) REFERENCES `tbaudiovisual` (`idAudioVisual`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbtitulo_tbserie1` FOREIGN KEY (`idSerie`) REFERENCES `tbserie` (`idSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbuser`
--
ALTER TABLE `tbuser`
  ADD CONSTRAINT `tbuser_ibfk_1` FOREIGN KEY (`idprofile`) REFERENCES `tbprofile` (`idprofile`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbuser_ibfk_2` FOREIGN KEY (`idstatus`) REFERENCES `tbstatus` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

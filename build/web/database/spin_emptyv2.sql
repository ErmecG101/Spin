-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Nov-2024 às 05:02
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `spin`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `codigo_compra` int(11) NOT NULL,
  `cod_pagamento` int(11) DEFAULT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra_carrinho`
--

CREATE TABLE `compra_carrinho` (
  `codigo_compra_carrinho` int(11) NOT NULL,
  `cod_jogo` int(11) DEFAULT NULL,
  `cod_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogos`
--

CREATE TABLE `jogos` (
  `codigo_jogo` int(11) NOT NULL,
  `nome` varchar(64) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `publicadopor` varchar(128) DEFAULT NULL,
  `desenvolvedora` varchar(128) DEFAULT NULL,
  `data_de_lancamento` date DEFAULT NULL,
  `capa` mediumblob DEFAULT NULL,
  `dt_atualizacao` datetime DEFAULT NULL,
  `dt_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogos_adquiridos`
--

CREATE TABLE `jogos_adquiridos` (
  `codigo_jogos_adiquiridos` int(11) NOT NULL,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_jogo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lig_carrinho_compra`
--

CREATE TABLE `lig_carrinho_compra` (
  `codigo_lig_carrinho_compra` int(11) NOT NULL,
  `cod_jogo` int(11) DEFAULT NULL,
  `cod_compra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `codigo_pagamento` int(11) NOT NULL,
  `cod_pagamento_metodo` int(11) DEFAULT NULL,
  `cod_pagamento_dados` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos_dados`
--

CREATE TABLE `pagamentos_dados` (
  `codigo_pagamento_dados` int(11) NOT NULL,
  `cod_usuario` int(11) DEFAULT NULL,
  `dados_compra` mediumblob DEFAULT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos_metodos`
--

CREATE TABLE `pagamentos_metodos` (
  `cod_metodo_pagamento` int(11) NOT NULL,
  `descricao` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `codigo_usuario` int(11) NOT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `senha` varchar(1024) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `dt_nasc` date DEFAULT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`codigo_compra`),
  ADD KEY `fk_com_pag_01` (`cod_pagamento`);

--
-- Índices para tabela `compra_carrinho`
--
ALTER TABLE `compra_carrinho`
  ADD PRIMARY KEY (`codigo_compra_carrinho`),
  ADD KEY `fk_comcar_jog_01` (`cod_jogo`),
  ADD KEY `fk_comcar_usu_01` (`cod_usuario`);

--
-- Índices para tabela `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`codigo_jogo`);

--
-- Índices para tabela `jogos_adquiridos`
--
ALTER TABLE `jogos_adquiridos`
  ADD PRIMARY KEY (`codigo_jogos_adiquiridos`),
  ADD KEY `fk_jogadq_usu_01` (`cod_usuario`),
  ADD KEY `fk_jogadq_jog_01` (`cod_jogo`);

--
-- Índices para tabela `lig_carrinho_compra`
--
ALTER TABLE `lig_carrinho_compra`
  ADD PRIMARY KEY (`codigo_lig_carrinho_compra`),
  ADD KEY `fk_ligcarr_comcar_01` (`cod_jogo`),
  ADD KEY `fk_ligcarr_com_01` (`cod_compra`);

--
-- Índices para tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`codigo_pagamento`),
  ADD KEY `fk_pag_pagmet_01` (`cod_pagamento_metodo`),
  ADD KEY `fk_pag_pagdad_01` (`cod_pagamento_dados`);

--
-- Índices para tabela `pagamentos_dados`
--
ALTER TABLE `pagamentos_dados`
  ADD PRIMARY KEY (`codigo_pagamento_dados`),
  ADD KEY `fk_pagdados_usu_01` (`cod_usuario`);

--
-- Índices para tabela `pagamentos_metodos`
--
ALTER TABLE `pagamentos_metodos`
  ADD PRIMARY KEY (`cod_metodo_pagamento`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `codigo_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compra_carrinho`
--
ALTER TABLE `compra_carrinho`
  MODIFY `codigo_compra_carrinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jogos`
--
ALTER TABLE `jogos`
  MODIFY `codigo_jogo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jogos_adquiridos`
--
ALTER TABLE `jogos_adquiridos`
  MODIFY `codigo_jogos_adiquiridos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lig_carrinho_compra`
--
ALTER TABLE `lig_carrinho_compra`
  MODIFY `codigo_lig_carrinho_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `codigo_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos_dados`
--
ALTER TABLE `pagamentos_dados`
  MODIFY `codigo_pagamento_dados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos_metodos`
--
ALTER TABLE `pagamentos_metodos`
  MODIFY `cod_metodo_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigo_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_com_pag_01` FOREIGN KEY (`cod_pagamento`) REFERENCES `pagamentos` (`codigo_pagamento`);

--
-- Limitadores para a tabela `compra_carrinho`
--
ALTER TABLE `compra_carrinho`
  ADD CONSTRAINT `fk_comcar_jog_01` FOREIGN KEY (`cod_jogo`) REFERENCES `jogos` (`codigo_jogo`),
  ADD CONSTRAINT `fk_comcar_usu_01` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo_usuario`);

--
-- Limitadores para a tabela `jogos_adquiridos`
--
ALTER TABLE `jogos_adquiridos`
  ADD CONSTRAINT `fk_jogadq_jog_01` FOREIGN KEY (`cod_jogo`) REFERENCES `jogos` (`codigo_jogo`),
  ADD CONSTRAINT `fk_jogadq_usu_01` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo_usuario`);

--
-- Limitadores para a tabela `lig_carrinho_compra`
--
ALTER TABLE `lig_carrinho_compra`
  ADD CONSTRAINT `fk_ligcarr_com_01` FOREIGN KEY (`cod_compra`) REFERENCES `compras` (`codigo_compra`),
  ADD CONSTRAINT `fk_ligcom_jog_01` FOREIGN KEY (`cod_jogo`) REFERENCES `jogos` (`codigo_jogo`);

--
-- Limitadores para a tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `fk_pag_pagdad_01` FOREIGN KEY (`cod_pagamento_dados`) REFERENCES `pagamentos_dados` (`codigo_pagamento_dados`),
  ADD CONSTRAINT `fk_pag_pagmet_01` FOREIGN KEY (`cod_pagamento_metodo`) REFERENCES `pagamentos_metodos` (`cod_metodo_pagamento`);

--
-- Limitadores para a tabela `pagamentos_dados`
--
ALTER TABLE `pagamentos_dados`
  ADD CONSTRAINT `fk_pagdados_usu_01` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

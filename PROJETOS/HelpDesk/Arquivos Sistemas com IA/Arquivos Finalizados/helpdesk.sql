-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/02/2026 às 14:48
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
-- Banco de dados: `helpdesk`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nome_sistema` varchar(100) DEFAULT NULL,
  `telefone_sistema` varchar(20) DEFAULT NULL,
  `email_sistema` varchar(75) DEFAULT NULL,
  `cor_primaria` varchar(25) DEFAULT NULL,
  `cor_secundaria` varchar(25) DEFAULT NULL,
  `smtp_host` varchar(120) DEFAULT NULL,
  `smtp_senha` varchar(255) DEFAULT NULL,
  `smtp_porta` int(5) DEFAULT NULL,
  `smtp_seguranca` varchar(10) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `config`
--

INSERT INTO `config` (`id`, `nome_sistema`, `telefone_sistema`, `email_sistema`, `cor_primaria`, `cor_secundaria`, `smtp_host`, `smtp_senha`, `smtp_porta`, `smtp_seguranca`, `empresa`) VALUES
(1, 'Sistema HelpDesk', '(31) 97527-5084', 'contato@hugocursos.com.br', '#667eea', '#764ba2', 'mail.hugocursos.com.br', '', 587, 'tls', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `recuperacao_senha`
--

CREATE TABLE `recuperacao_senha` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `token_hash` varchar(255) NOT NULL,
  `expira_em` datetime NOT NULL,
  `usado_em` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `recuperacao_senha`
--

INSERT INTO `recuperacao_senha` (`id`, `usuario_id`, `token_hash`, `expira_em`, `usado_em`, `ip`, `user_agent`, `criado_em`) VALUES
(10, 1, '$2y$10$HOr7K8GCQrbX/BmXBmF4DugQ7BUSFnzDFPkcU7hh8iUguEU0.T56i', '2026-02-02 21:25:00', '2026-02-02 20:58:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '2026-02-02 20:55:00'),
(11, 1, '$2y$10$x92v7..dcq9pepl7QZoIreVeunRDr5mxpK3j6Ef2K224SB5AgoVLK', '2026-02-02 21:28:02', '2026-02-02 21:20:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '2026-02-02 20:58:02'),
(12, 1, '$2y$10$4jVPD1VwYFQBwhdTXr/Ct.B.G8lirB565SXG6PnSJxnN/Zn124dXO', '2026-02-02 21:50:42', '2026-02-02 21:21:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '2026-02-02 21:20:42'),
(13, 1, '$2y$10$Augblv0W.RTbS4ZbAdnXJejv4/oyS/UDvLBfSkeZ90HQR6h7AsFga', '2026-02-02 21:51:39', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '2026-02-02 21:21:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nivel` varchar(50) DEFAULT 'comum',
  `ativo` varchar(5) DEFAULT NULL,
  `empresa` int(11) DEFAULT 0,
  `data_cadastro` datetime DEFAULT current_timestamp(),
  `data_atualizacao` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `telefone`, `email`, `senha`, `cpf`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`, `foto`, `nivel`, `ativo`, `empresa`, `data_cadastro`, `data_atualizacao`) VALUES
(1, 'Administrador', NULL, 'contato@hugocursos.com.br', '$2y$10$XzbcV9v.nBlY4ff0Nk.LXOsd3uAQzLhKGQHw9wbR.hDgTnY/7PMby', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Administrador', 'Sim', 0, '2026-02-02 20:43:25', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `recuperacao_senha`
--
ALTER TABLE `recuperacao_senha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_expira` (`expira_em`),
  ADD KEY `idx_usado` (`usado_em`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `recuperacao_senha`
--
ALTER TABLE `recuperacao_senha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `recuperacao_senha`
--
ALTER TABLE `recuperacao_senha`
  ADD CONSTRAINT `fk_recuperacao_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

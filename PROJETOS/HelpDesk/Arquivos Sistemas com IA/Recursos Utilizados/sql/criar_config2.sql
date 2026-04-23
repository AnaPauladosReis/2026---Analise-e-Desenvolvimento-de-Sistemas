-- Tabela config2 (mesma estrutura da tabela config)
-- Banco: helpdesk

CREATE TABLE `config2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_sistema` varchar(100) DEFAULT NULL,
  `telefone_sistema` varchar(20) DEFAULT NULL,
  `email_sistema` varchar(75) DEFAULT NULL,
  `cor_primaria` varchar(25) DEFAULT NULL,
  `cor_secundaria` varchar(25) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

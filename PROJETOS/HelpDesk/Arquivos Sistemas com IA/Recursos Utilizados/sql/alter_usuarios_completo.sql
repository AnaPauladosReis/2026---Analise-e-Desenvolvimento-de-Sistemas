-- Adicionar campos adicionais à tabela usuarios
-- Banco: helpdesk

ALTER TABLE `usuarios` 
ADD COLUMN `cpf` varchar(14) DEFAULT NULL AFTER `email`,
ADD COLUMN `endereco` varchar(200) DEFAULT NULL AFTER `cpf`,
ADD COLUMN `numero` varchar(10) DEFAULT NULL AFTER `endereco`,
ADD COLUMN `complemento` varchar(100) DEFAULT NULL AFTER `numero`,
ADD COLUMN `bairro` varchar(100) DEFAULT NULL AFTER `complemento`,
ADD COLUMN `cidade` varchar(100) DEFAULT NULL AFTER `bairro`,
ADD COLUMN `estado` char(2) DEFAULT NULL AFTER `cidade`,
ADD COLUMN `cep` varchar(10) DEFAULT NULL AFTER `estado`,
ADD COLUMN `foto` varchar(255) DEFAULT NULL AFTER `cep`,
ADD COLUMN `perfil` varchar(50) DEFAULT 'usuario' AFTER `foto`,
ADD COLUMN `ativo` tinyint(1) DEFAULT 1 AFTER `perfil`,
ADD COLUMN `empresa` int(11) DEFAULT 0 AFTER `ativo`,
ADD COLUMN `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP AFTER `empresa`,
ADD COLUMN `data_atualizacao` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP AFTER `data_cadastro`;

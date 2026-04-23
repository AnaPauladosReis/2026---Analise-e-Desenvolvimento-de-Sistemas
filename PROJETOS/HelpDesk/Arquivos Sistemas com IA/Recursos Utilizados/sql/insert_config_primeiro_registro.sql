-- Inserir primeiro registro na tabela config
-- Banco: helpdesk | empresa = 0 (reservado para uso futuro multi-empresas)

INSERT INTO `config` (
  `nome_sistema`,
  `telefone_sistema`,
  `email_sistema`,
  `cor_primaria`,
  `cor_secundaria`,
  `empresa`
) VALUES (
  'Sistema HelpDesk',
  '(31) 97527-5084',
  'contato@hugocursos.com.br',
  '#667eea',
  '#764ba2',
  0
);

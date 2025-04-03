-- Criação dos usuários
CREATE USER 'easytrainer_admin'@'%' IDENTIFIED BY 'senhaSegura1!';
CREATE USER 'easytrainer_instructor'@'%' IDENTIFIED BY 'senhaSegura2!';
CREATE USER 'easytrainer_user'@'%' IDENTIFIED BY 'senhaSegura3!';

-- Permissões para o admin
GRANT ALL PRIVILEGES ON db_easytrainer.* TO 'easytrainer_admin'@'%';

-- Permissões para o instrutor (somente DML)
GRANT SELECT, INSERT, UPDATE ON db_easytrainer.* TO 'easytrainer_instructor'@'%';

-- Permissões para o usuário (somente leitura)
GRANT SELECT ON db_easytrainer.* TO 'easytrainer_user'@'%';

-- Aplicar as permissões
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'easytrainer_admin'@'%';
SHOW GRANTS FOR 'easytrainer_instructor'@'%';
SHOW GRANTS FOR 'easytrainer_user'@'%';

-- Revogar todas as permissões do admin
REVOKE ALL PRIVILEGES ON db_easytrainer.* FROM 'easytrainer_admin'@'%';

-- Revogar DML do instrutor
REVOKE SELECT, INSERT, UPDATE ON db_easytrainer.* FROM 'easytrainer_instructor'@'%';

-- Revogar leitura do usuário
REVOKE SELECT ON db_easytrainer.* FROM 'easytrainer_user'@'%';

-- Aplicar as mudanças
FLUSH PRIVILEGES;
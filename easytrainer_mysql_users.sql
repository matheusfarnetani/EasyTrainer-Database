-- Revogar todos os privilégios (caso existam)
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_admin'@'%';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_instructor'@'%';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_user'@'%';
FLUSH PRIVILEGES;

-- Excluir os usuários se já existirem (opcional, cuidado!)
-- DROP USER IF EXISTS 'easytrainer_admin'@'%';
-- DROP USER IF EXISTS 'easytrainer_instructor'@'%';
-- DROP USER IF EXISTS 'easytrainer_user'@'%';

-- Criar os usuários
CREATE USER 'easytrainer_admin'@'%' IDENTIFIED BY 'senhaSegura1!';
CREATE USER 'easytrainer_instructor'@'%' IDENTIFIED BY 'senhaSegura2!';
CREATE USER 'easytrainer_user'@'%' IDENTIFIED BY 'senhaSegura3!';

-- Conceder privilégios para o administrador
GRANT ALL PRIVILEGES ON easytrainer.* TO 'easytrainer_admin'@'%';

-- Conceder privilégios ao instrutor (acesso completo a dados, mas sem alterar estrutura)
GRANT SELECT, INSERT, UPDATE ON easytrainer.* TO 'easytrainer_instructor'@'%';

-- Conceder privilégios ao usuário final:
GRANT SELECT ON easytrainer.* TO 'easytrainer_user'@'%';
GRANT UPDATE(name, mobile_number, weight, height, password)
  ON easytrainer.user TO 'easytrainer_user'@'%';

-- Aplicar todas as permissões
FLUSH PRIVILEGES;

-- Mostrar permissões (opcional)
SHOW GRANTS FOR 'easytrainer_admin'@'%';
SHOW GRANTS FOR 'easytrainer_instructor'@'%';
SHOW GRANTS FOR 'easytrainer_user'@'%';

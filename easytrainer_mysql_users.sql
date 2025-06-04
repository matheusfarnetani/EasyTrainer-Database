-- Revogar todos os privilégios (caso existam)
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_admin'@'%';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_instructor'@'%';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_user'@'%';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_system'@'%';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_admin'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_instructor'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_user'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'easytrainer_system'@'localhost';

FLUSH PRIVILEGES;

-- Excluir os usuários se já existirem (opcional, cuidado!)
DROP USER IF EXISTS 'easytrainer_admin'@'%';
DROP USER IF EXISTS 'easytrainer_instructor'@'%';
DROP USER IF EXISTS 'easytrainer_user'@'%';
DROP USER IF EXISTS 'easytrainer_system'@'%';

DROP USER IF EXISTS 'easytrainer_admin'@'localhost';
DROP USER IF EXISTS 'easytrainer_instructor'@'localhost';
DROP USER IF EXISTS 'easytrainer_user'@'localhost';
DROP USER IF EXISTS 'easytrainer_system'@'localhost';

-- Criar os usuários
CREATE USER 'easytrainer_admin'@'%' IDENTIFIED WITH mysql_native_password BY 'senhaSegura1!';
CREATE USER 'easytrainer_instructor'@'%' IDENTIFIED WITH mysql_native_password BY 'senhaSegura2!';
CREATE USER 'easytrainer_user'@'%' IDENTIFIED WITH mysql_native_password BY 'senhaSegura3!';
CREATE USER 'easytrainer_system'@'%' IDENTIFIED BY 'senhaSegura4!';

CREATE USER 'easytrainer_admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'senhaSegura1!';
CREATE USER 'easytrainer_instructor'@'localhost' IDENTIFIED WITH mysql_native_password BY 'senhaSegura2!';
CREATE USER 'easytrainer_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'senhaSegura3!';
CREATE USER 'easytrainer_system'@'localhost' IDENTIFIED BY 'senhaSegura4!';

-- Conceder privilégios para o administrador
GRANT ALL PRIVILEGES ON easytrainer.* TO 'easytrainer_admin'@'%';
GRANT SELECT ON easytrainer_log.* TO 'easytrainer_admin'@'%';
GRANT ALL PRIVILEGES ON easytrainer.* TO 'easytrainer_admin'@'localhost';
GRANT SELECT ON easytrainer_log.* TO 'easytrainer_admin'@'localhost';

-- Conceder privilégios ao instrutor (acesso completo a dados, mas sem alterar estrutura)
GRANT SELECT, INSERT, UPDATE, DELETE ON easytrainer.* TO 'easytrainer_instructor'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON easytrainer.* TO 'easytrainer_instructor'@'localhost';

-- Conceder privilégios ao usuário final:
GRANT SELECT ON easytrainer.* TO 'easytrainer_user'@'%';
GRANT UPDATE, DELETE ON easytrainer.user TO 'easytrainer_user'@'%';
GRANT UPDATE, DELETE ON easytrainer.user_has_goal TO 'easytrainer_user'@'%';
GRANT UPDATE, DELETE ON easytrainer.user_has_instructor TO 'easytrainer_user'@'%';
GRANT UPDATE, DELETE ON easytrainer.workout_has_user TO 'easytrainer_user'@'%';
GRANT SELECT, INSERT, UPDATE ON easytrainer.user_videos TO 'easytrainer_user'@'%';

GRANT SELECT ON easytrainer.* TO 'easytrainer_user'@'localhost';
GRANT UPDATE, DELETE ON easytrainer.user TO 'easytrainer_user'@'localhost';
GRANT UPDATE, DELETE ON easytrainer.user_has_goal TO 'easytrainer_user'@'localhost';
GRANT UPDATE, DELETE ON easytrainer.user_has_instructor TO 'easytrainer_user'@'localhost';
GRANT UPDATE, DELETE ON easytrainer.workout_has_user TO 'easytrainer_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON easytrainer.user_videos TO 'easytrainer_user'@'localhost';

-- Conceder privilégios ao usuário do sistema
GRANT UPDATE, SELECT ON easytrainer.* TO 'easytrainer_system'@'%';
GRANT UPDATE, SELECT ON easytrainer.* TO 'easytrainer_system'@'localhost';


-- Aplicar todas as permissões
FLUSH PRIVILEGES;

-- Mostrar permissões (opcional)
SHOW GRANTS FOR 'easytrainer_admin'@'%';
SHOW GRANTS FOR 'easytrainer_instructor'@'%';
SHOW GRANTS FOR 'easytrainer_user'@'%';
SHOW GRANTS FOR 'easytrainer_system'@'%';

SHOW GRANTS FOR 'easytrainer_admin'@'localhost';
SHOW GRANTS FOR 'easytrainer_instructor'@'localhost';
SHOW GRANTS FOR 'easytrainer_user'@'localhost';
SHOW GRANTS FOR 'easytrainer_system'@'%';


SELECT user, host, plugin FROM mysql.user WHERE user = 'easytrainer_admin';

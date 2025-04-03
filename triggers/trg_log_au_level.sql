CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_level`
AFTER UPDATE ON `level` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_level_main` 
        WHERE `level_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_level_main`
    SET `current_revision` = new_revision
    WHERE `level_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_level_content` (
        `log_level_main_level_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;

CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_type`
AFTER UPDATE ON `type` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_type_main` 
        WHERE `type_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_type_main`
    SET `current_revision` = new_revision
    WHERE `type_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_type_content` (
        `log_type_main_type_id`,
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

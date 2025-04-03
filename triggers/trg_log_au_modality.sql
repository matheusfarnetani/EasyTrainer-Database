CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_modality`
AFTER UPDATE ON `modality` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_modality_main` 
        WHERE `modality_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_modality_main`
    SET `current_revision` = new_revision
    WHERE `modality_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_modality_content` (
        `log_modality_main_modality_id`,
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

CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_level`
AFTER INSERT ON `level` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_level_main` (
        `level_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

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
        1,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;

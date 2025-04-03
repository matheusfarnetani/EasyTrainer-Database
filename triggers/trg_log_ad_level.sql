CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_level`
AFTER DELETE ON `level` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_level_content` (
        `log_level_main_level_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_level_main` WHERE `level_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        @user_id,
        NOW()
    );
END;

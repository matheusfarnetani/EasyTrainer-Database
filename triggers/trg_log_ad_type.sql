CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_type`
AFTER DELETE ON `type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_type_content` (
        `log_type_main_type_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_type_main` WHERE `type_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        @user_id,
        NOW()
    );
END;

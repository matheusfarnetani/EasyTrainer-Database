CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_modality`
AFTER DELETE ON `modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_modality_content` (
        `log_modality_main_modality_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_modality_main` WHERE `modality_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        @user_id,
        NOW()
    );
END;

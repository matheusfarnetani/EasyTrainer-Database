CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_modality`
AFTER DELETE ON `routine_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_modality_content` (
        `log_routine_has_modality_routine_id`,
        `log_routine_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.routine_id,
        OLD.modality_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_modality_main`
         WHERE `routine_id` = OLD.routine_id AND `modality_id` = OLD.modality_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

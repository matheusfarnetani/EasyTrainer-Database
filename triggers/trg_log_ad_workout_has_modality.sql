CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_modality`
AFTER DELETE ON `workout_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_modality_content` (
        `log_workout_has_modality_workout_id`,
        `log_workout_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.modality_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_modality_main`
         WHERE `workout_id` = OLD.workout_id AND `modality_id` = OLD.modality_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

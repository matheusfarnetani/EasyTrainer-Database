CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_modality`
AFTER DELETE ON `exercise_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_modality_content` (
        `log_exercise_has_modality_exercise_id`,
        `log_exercise_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.modality_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_modality_main`
         WHERE exercise_id = OLD.exercise_id AND modality_id = OLD.modality_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

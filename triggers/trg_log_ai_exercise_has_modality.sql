CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_modality`
AFTER INSERT ON `exercise_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_modality_main` (
        `exercise_id`,
        `modality_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.modality_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_modality_content` (
        `log_exercise_has_modality_exercise_id`,
        `log_exercise_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.modality_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine_has_modality`
AFTER INSERT ON `routine_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_modality_main` (
        `routine_id`,
        `modality_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.routine_id,
        NEW.modality_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_routine_has_modality_content` (
        `log_routine_has_modality_routine_id`,
        `log_routine_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.routine_id,
        NEW.modality_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

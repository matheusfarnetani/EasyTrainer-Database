CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_type`
AFTER INSERT ON `workout_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_type_main` (
        `workout_id`,
        `type_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.type_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_type_content` (
        `log_workout_has_type_main_workout_id`,
        `log_workout_has_type_main_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.type_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_routine`
AFTER INSERT ON `workout_has_routine` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_routine_main` (
        `workout_id`,
        `routine_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.routine_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_routine_content` (
        `log_workout_has_routine_workout_id`,
        `log_workout_has_routine_routine_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.routine_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

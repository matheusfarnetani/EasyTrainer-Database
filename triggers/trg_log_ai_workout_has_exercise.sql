CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_exercise`
AFTER INSERT ON `workout_has_exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_exercise_main` (
        `workout_id`,
        `exercise_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.exercise_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_exercise_content` (
        `log_workout_has_exercise_workout_id`,
        `log_workout_has_exercise_exercise_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.exercise_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

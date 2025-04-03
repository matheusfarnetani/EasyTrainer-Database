CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine_has_exercise`
AFTER INSERT ON `routine_has_exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_exercise_main` (
        `routine_id`,
        `exercise_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.routine_id,
        NEW.exercise_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_routine_has_exercise_content` (
        `log_routine_has_exercise_routine_id`,
        `log_routine_has_exercise_exercise_id`,
        `revision`,
        `status`,
        `order`,
        `sets`,
        `reps`,
        `rest_time`,
        `note`,
        `day`,
        `week`,
        `is_optional`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.routine_id,
        NEW.exercise_id,
        1,
        1,
        NEW.order,
        NEW.sets,
        NEW.reps,
        NEW.rest_time,
        NEW.note,
        NEW.day,
        NEW.week,
        NEW.is_optional,
        @user_id,
        NOW()
    );
END;

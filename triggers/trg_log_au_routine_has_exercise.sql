CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_routine_has_exercise`
AFTER UPDATE ON `routine_has_exercise` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;
    SET new_revision = (
        SELECT current_revision FROM `easytrainer_log`.`log_routine_has_exercise_main`
        WHERE routine_id = OLD.routine_id AND exercise_id = OLD.exercise_id
    ) + 1;

    UPDATE `easytrainer_log`.`log_routine_has_exercise_main`
    SET current_revision = new_revision
    WHERE routine_id = OLD.routine_id AND exercise_id = OLD.exercise_id;

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
        new_revision,
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

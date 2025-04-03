CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_exercise`
AFTER DELETE ON `routine_has_exercise` FOR EACH ROW
BEGIN
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
        OLD.routine_id,
        OLD.exercise_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_exercise_main`
         WHERE routine_id = OLD.routine_id AND exercise_id = OLD.exercise_id) + 1,
        0,
        OLD.order,
        OLD.sets,
        OLD.reps,
        OLD.rest_time,
        OLD.note,
        OLD.day,
        OLD.week,
        OLD.is_optional,
        @user_id,
        NOW()
    );
END;

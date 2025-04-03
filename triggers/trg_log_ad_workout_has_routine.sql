CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_routine`
AFTER DELETE ON `workout_has_routine` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_routine_content` (
        `log_workout_has_routine_workout_id`,
        `log_workout_has_routine_routine_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.routine_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_routine_main`
         WHERE `workout_id` = OLD.workout_id AND `routine_id` = OLD.routine_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

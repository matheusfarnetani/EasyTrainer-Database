CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_exercise`
AFTER DELETE ON `workout_has_exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_exercise_content` (
        `log_workout_has_exercise_workout_id`,
        `log_workout_has_exercise_exercise_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.exercise_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_exercise_main`
         WHERE `workout_id` = OLD.workout_id AND `exercise_id` = OLD.exercise_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

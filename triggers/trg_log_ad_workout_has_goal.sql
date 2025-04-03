CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_goal`
AFTER DELETE ON `workout_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_goal_content` (
        `log_workout_has_goal_workout_id`,
        `log_workout_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.goal_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_goal_main`
         WHERE `workout_id` = OLD.workout_id AND `goal_id` = OLD.goal_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

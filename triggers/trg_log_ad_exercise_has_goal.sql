CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_goal`
AFTER DELETE ON `exercise_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_goal_content` (
        `log_exercise_has_goal_exercise_id`,
        `log_exercise_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.goal_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_goal_main`
         WHERE exercise_id = OLD.exercise_id AND goal_id = OLD.goal_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

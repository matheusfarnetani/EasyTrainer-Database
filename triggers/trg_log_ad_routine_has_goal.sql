CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_goal`
AFTER DELETE ON `routine_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_goal_content` (
        `log_routine_has_goal_routine_id`,
        `log_routine_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.routine_id,
        OLD.goal_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_goal_main`
         WHERE `routine_id` = OLD.routine_id AND `goal_id` = OLD.goal_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

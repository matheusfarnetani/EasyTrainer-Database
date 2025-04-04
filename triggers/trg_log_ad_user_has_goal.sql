CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_user_has_goal`
AFTER DELETE ON `user_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_has_goal_content` (
        `log_user_has_goal_main_user_id`,
        `log_user_has_goal_main_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.user_id,
        OLD.goal_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_user_has_goal_main`
         WHERE `user_id` = OLD.user_id AND `goal_id` = OLD.goal_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;
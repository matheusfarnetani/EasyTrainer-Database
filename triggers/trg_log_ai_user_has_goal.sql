CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_user_has_goal`
AFTER INSERT ON `user_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_has_goal_main` (
        `user_id`,
        `goal_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.user_id,
        NEW.goal_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_user_has_goal_content` (
        `log_user_has_goal_main_user_id`,
        `log_user_has_goal_main_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.user_id,
        NEW.goal_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;
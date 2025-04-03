CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_goal`
AFTER INSERT ON `goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_goal_main` (
        `goal_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_goal_content` (
        `log_goal_main_goal_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;

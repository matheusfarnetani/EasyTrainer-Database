CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_goal`
AFTER DELETE ON `goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_goal_content` (
        `log_goal_main_goal_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_goal_main` WHERE `goal_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        @user_id,
        NOW()
    );
END;

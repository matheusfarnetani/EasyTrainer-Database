CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_goal`
AFTER UPDATE ON `goal` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_goal_main` 
        WHERE `goal_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_goal_main`
    SET `current_revision` = new_revision
    WHERE `goal_id` = OLD.id;

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
        new_revision,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;

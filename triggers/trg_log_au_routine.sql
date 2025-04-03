CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_routine`
AFTER UPDATE ON `routine` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_routine_main` 
        WHERE `routine_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_routine_main`
    SET `current_revision` = new_revision
    WHERE `routine_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_routine_content` (
        `log_routine_main_routine_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `duration`,
        `image_url`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.description,
        NEW.duration,
        NEW.image_url,
        NEW.instructor_id,
        NEW.level_id,
        @user_id,
        NOW()
    );
END;

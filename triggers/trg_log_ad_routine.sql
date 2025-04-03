CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine`
AFTER DELETE ON `routine` FOR EACH ROW
BEGIN
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
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_main` WHERE `routine_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        OLD.duration,
        OLD.image_url,
        OLD.instructor_id,
        OLD.level_id,
        @user_id,
        NOW()
    );
END;

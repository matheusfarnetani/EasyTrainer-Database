CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine`
AFTER INSERT ON `routine` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_main` (
        `routine_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

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
        1,
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

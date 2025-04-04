CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_instructor`
AFTER INSERT ON `instructor` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_instructor_main` (
        `instructor_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_instructor_content` (
        `log_instructor_main_instructor_id`,
        `revision`,
        `status`,
        `name`,
        `email`,
        `mobile_number`,
        `birthday`,
        `gender`,
        `password`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.email,
        NEW.mobile_number,
        NEW.birthday,
        NEW.gender,
        NEW.password,
        @user_id,
        NOW()
    );
END;
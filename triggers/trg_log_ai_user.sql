CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_user`
AFTER INSERT ON `user` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_main` (
        `user_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_user_content` (
        `log_user_main_user_id`,
        `revision`,
        `status`,
        `name`,
        `email`,
        `mobile_number`,
        `birthday`,
        `weight`,
        `height`,
        `gender`,
        `password`,
        `level_id`,
        `instructor_id`,
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
        NEW.weight,
        NEW.height,
        NEW.gender,
        NEW.password,
        NEW.level_id,
        NEW.instructor_id,
        @user_id,
        NOW()
    );
END;
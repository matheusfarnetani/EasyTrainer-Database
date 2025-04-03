CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_user`
AFTER UPDATE ON `user` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_user_main` 
        WHERE `user_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_user_main`
    SET `current_revision` = new_revision
    WHERE `user_id` = OLD.id;

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
        `age`,
        `gender`,
        `password`,
        `level_id`,
        `instructor_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.email,
        NEW.mobile_number,
        NEW.birthday,
        NEW.weight,
        NEW.height,
        NEW.age,
        NEW.gender,
        NEW.password,
        NEW.level_id,
        NEW.instructor_id,
        @user_id,
        NOW()
    );
END;

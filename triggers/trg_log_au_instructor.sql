CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_instructor`
AFTER UPDATE ON `instructor` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_instructor_main` 
        WHERE `instructor_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_instructor_main`
    SET `current_revision` = new_revision
    WHERE `instructor_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_instructor_content` (
        `log_instructor_main_instructor_id`,
        `revision`,
        `status`,
        `name`,
        `email`,
        `mobile_number`,
        `birthday`,
        `age`,
        `gender`,
        `password`,
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
        NEW.age,
        NEW.gender,
        NEW.password,
        @user_id,
        NOW()
    );
END;

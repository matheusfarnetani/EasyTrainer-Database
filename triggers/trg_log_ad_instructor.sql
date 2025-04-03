CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_instructor`
AFTER DELETE ON `instructor` FOR EACH ROW
BEGIN
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
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_instructor_main` WHERE `instructor_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.email,
        OLD.mobile_number,
        OLD.birthday,
        OLD.age,
        OLD.gender,
        OLD.password,
        @user_id,
        NOW()
    );
END;

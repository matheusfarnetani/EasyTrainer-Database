CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_user`
AFTER DELETE ON `user` FOR EACH ROW
BEGIN
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
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_user_main` WHERE `user_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.email,
        OLD.mobile_number,
        OLD.birthday,
        OLD.weight,
        OLD.height,
        OLD.age,
        OLD.gender,
        OLD.password,
        OLD.level_id,
        OLD.instructor_id,
        @user_id,
        NOW()
    );
END;

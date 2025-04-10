CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_user_has_instructor`
AFTER DELETE ON `user_has_instructor` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_has_instructor_content` (
        `log_user_has_instructor_main_user_id`,
        `log_user_has_instructor_main_instructor_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.user_id,
        OLD.instructor_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_user_has_instructor_main`
         WHERE user_id = OLD.user_id AND instructor_id = OLD.instructor_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;
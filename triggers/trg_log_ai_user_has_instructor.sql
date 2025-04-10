CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_user_has_instructor`
AFTER INSERT ON `user_has_instructor` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_has_instructor_main` (
        `user_id`,
        `instructor_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.user_id,
        NEW.instructor_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_user_has_instructor_content` (
        `log_user_has_instructor_main_user_id`,
        `log_user_has_instructor_main_instructor_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.user_id,
        NEW.instructor_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;
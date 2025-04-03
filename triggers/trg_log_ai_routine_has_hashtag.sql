CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine_has_hashtag`
AFTER INSERT ON `routine_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_hashtag_main` (
        `routine_id`,
        `hashtag_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.routine_id,
        NEW.hashtag_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_routine_has_hashtag_content` (
        `log_routine_has_hashtag_routine_id`,
        `log_routine_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.routine_id,
        NEW.hashtag_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

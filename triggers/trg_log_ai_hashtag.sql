CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_hashtag`
AFTER INSERT ON `hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_hashtag_main` (
        `hashtag_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_hashtag_content` (
        `log_hashtag_main_hashtag_id`,
        `revision`,
        `status`,
        `name`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        @user_id,
        NOW()
    );
END;

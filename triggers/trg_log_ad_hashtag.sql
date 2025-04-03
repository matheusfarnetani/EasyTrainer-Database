CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_hashtag`
AFTER DELETE ON `hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_hashtag_content` (
        `log_hashtag_main_hashtag_id`,
        `revision`,
        `status`,
        `name`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_hashtag_main` WHERE `hashtag_id` = OLD.id) + 1,
        0,
        OLD.name,
        @user_id,
        NOW()
    );
END;

CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_hashtag`
AFTER DELETE ON `routine_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_hashtag_content` (
        `log_routine_has_hashtag_routine_id`,
        `log_routine_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.routine_id,
        OLD.hashtag_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_hashtag_main`
         WHERE routine_id = OLD.routine_id AND hashtag_id = OLD.hashtag_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

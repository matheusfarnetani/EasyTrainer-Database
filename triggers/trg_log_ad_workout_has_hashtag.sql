CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_hashtag`
AFTER DELETE ON `workout_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_hashtag_content` (
        `log_workout_has_hashtag_workout_id`,
        `log_workout_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.hashtag_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_hashtag_main`
         WHERE `workout_id` = OLD.workout_id AND `hashtag_id` = OLD.hashtag_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_hashtag`
AFTER DELETE ON `exercise_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_hashtag_content` (
        `log_exercise_has_hashtag_exercise_id`,
        `log_exercise_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.hashtag_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_hashtag_main`
         WHERE exercise_id = OLD.exercise_id AND hashtag_id = OLD.hashtag_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

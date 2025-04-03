CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_hashtag`
AFTER INSERT ON `exercise_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_hashtag_main` (
        `exercise_id`,
        `hashtag_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.hashtag_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_hashtag_content` (
        `log_exercise_has_hashtag_exercise_id`,
        `log_exercise_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.hashtag_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

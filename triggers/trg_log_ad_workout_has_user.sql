CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_user`
AFTER DELETE ON `workout_has_user` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_user_content` (
        `log_workout_has_user_workout_id`,
        `log_workout_has_user_user_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.user_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_user_main`
         WHERE `workout_id` = OLD.workout_id AND `user_id` = OLD.user_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

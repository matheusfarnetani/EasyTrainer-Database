CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_user`
AFTER INSERT ON `workout_has_user` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_user_main` (
        `workout_id`,
        `user_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.user_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_user_content` (
        `log_workout_has_user_workout_id`,
        `log_workout_has_user_user_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.user_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

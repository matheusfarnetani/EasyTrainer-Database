CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_type`
AFTER DELETE ON `workout_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_type_content` (
        `log_workout_has_type_workout_id`,
        `log_workout_has_type_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.type_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_type_main`
         WHERE `workout_id` = OLD.workout_id AND `type_id` = OLD.type_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

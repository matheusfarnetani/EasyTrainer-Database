CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_type`
AFTER DELETE ON `exercise_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_type_content` (
        `log_exercise_has_type_exercise_id`,
        `log_exercise_has_type_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.type_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_type_main`
         WHERE exercise_id = OLD.exercise_id AND type_id = OLD.type_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

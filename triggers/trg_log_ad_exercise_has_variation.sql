CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_variation`
AFTER DELETE ON `exercise_has_variation` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_variation_content` (
        `log_exercise_has_variation_exercise_id`,
        `log_exercise_has_variation_variation_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.variation_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_variation_main`
         WHERE exercise_id = OLD.exercise_id AND variation_id = OLD.variation_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

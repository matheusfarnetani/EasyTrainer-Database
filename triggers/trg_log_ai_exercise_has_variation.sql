CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_variation`
AFTER INSERT ON `exercise_has_variation` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_variation_main` (
        `exercise_id`,
        `variation_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.variation_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_variation_content` (
        `log_exercise_has_variation_exercise_id`,
        `log_exercise_has_variation_variation_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.variation_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

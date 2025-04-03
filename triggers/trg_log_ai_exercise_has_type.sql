CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_type`
AFTER INSERT ON `exercise_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_type_main` (
        `exercise_id`,
        `type_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.type_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_type_content` (
        `log_exercise_has_type_exercise_id`,
        `log_exercise_has_type_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.type_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_goal`
AFTER INSERT ON `exercise_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_goal_main` (
        `exercise_id`,
        `goal_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.goal_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_goal_content` (
        `log_exercise_has_goal_exercise_id`,
        `log_exercise_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.goal_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

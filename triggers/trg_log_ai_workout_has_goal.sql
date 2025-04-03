CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_goal`
AFTER INSERT ON `workout_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_goal_main` (
        `workout_id`,
        `goal_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.goal_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_goal_content` (
        `log_workout_has_goal_workout_id`,
        `log_workout_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.goal_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;

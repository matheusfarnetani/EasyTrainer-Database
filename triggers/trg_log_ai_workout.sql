CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout`
AFTER INSERT ON `workout` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_main` (
        `workout_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_content` (
        `log_workout_main_workout_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `number_of_days`,
        `image_url`,
        `duration`,
        `indoor`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.description,
        NEW.number_of_days,
        NEW.image_url,
        NEW.duration,
        NEW.indoor,
        NEW.instructor_id,
        NEW.level_id,
        @user_id,
        NOW()
    );
END;

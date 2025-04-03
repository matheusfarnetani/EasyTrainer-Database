CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout`
AFTER DELETE ON `workout` FOR EACH ROW
BEGIN
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
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_main` WHERE `workout_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        OLD.number_of_days,
        OLD.image_url,
        OLD.duration,
        OLD.indoor,
        OLD.instructor_id,
        OLD.level_id,
        @user_id,
        NOW()
    );
END;

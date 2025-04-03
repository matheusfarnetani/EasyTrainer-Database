CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_workout`
AFTER UPDATE ON `workout` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_workout_main` 
        WHERE `workout_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_workout_main`
    SET `current_revision` = new_revision
    WHERE `workout_id` = OLD.id;

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
        new_revision,
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

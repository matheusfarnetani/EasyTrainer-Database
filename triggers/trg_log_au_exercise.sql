CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_exercise`
AFTER UPDATE ON `exercise` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_exercise_main` 
        WHERE `exercise_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_exercise_main`
    SET `current_revision` = new_revision
    WHERE `exercise_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_exercise_content` (
        `log_exercise_main_exercise_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `equipment`,
        `duration`,
        `repetition`,
        `sets`,
        `rest_time`,
        `body_part`,
        `video_url`,
        `image_url`,
        `steps`,
        `contraindications`,
        `safety_tips`,
        `common_mistakes`,
        `indicated_for`,
        `calories_burned_estimate`,
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
        NEW.equipment,
        NEW.duration,
        NEW.repetition,
        NEW.sets,
        NEW.rest_time,
        NEW.body_part,
        NEW.video_url,
        NEW.image_url,
        NEW.steps,
        NEW.contraindications,
        NEW.safety_tips,
        NEW.common_mistakes,
        NEW.indicated_for,
        NEW.calories_burned_estimate,
        NEW.instructor_id,
        NEW.level_id,
        @user_id,
        NOW()
    );
END;

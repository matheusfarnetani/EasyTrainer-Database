CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise`
AFTER INSERT ON `exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_main` (
        `exercise_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

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
        1,
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

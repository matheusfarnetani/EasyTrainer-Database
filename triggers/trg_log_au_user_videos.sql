CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_user_videos`
AFTER UPDATE ON `user_videos` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_user_videos_main` 
        WHERE `user_videos_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_user_videos_main`
    SET `current_revision` = new_revision
    WHERE `user_videos_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_user_videos_content` (
        `log_user_videos_main_user_videos_id`,
        `revision`,
        `status`,
        `filename`,
        `file_url`,
        `status_video`,
        `uploaded_at`,
        `processed_at`,
        `error_message`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.filename,
        NEW.file_url,
        NEW.status,
        NEW.uploaded_at,
        NEW.processed_at,
        NEW.error_message,
        @user_id,
        NOW()
    );
END;

CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_user_videos`
AFTER INSERT ON `user_videos` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_videos_main` (
        `user_videos_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

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
        1,
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

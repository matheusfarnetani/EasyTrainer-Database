CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_user_videos`
AFTER DELETE ON `user_videos` FOR EACH ROW
BEGIN
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
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_user_videos_main` WHERE `user_videos_id` = OLD.id) + 1,
        0,
        OLD.filename,
        OLD.file_url,
        OLD.status,
        OLD.uploaded_at,
        OLD.processed_at,
        OLD.error_message,
        @user_id,
        NOW()
    );
END;

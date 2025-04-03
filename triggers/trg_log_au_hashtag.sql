CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_hashtag`
AFTER UPDATE ON `hashtag` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_hashtag_main` 
        WHERE `hashtag_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_hashtag_main`
    SET `current_revision` = new_revision
    WHERE `hashtag_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_hashtag_content` (
        `log_hashtag_main_hashtag_id`,
        `revision`,
        `status`,
        `name`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        @user_id,
        NOW()
    );
END;

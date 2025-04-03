CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_type`
AFTER DELETE ON `routine_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_type_content` (
        `log_routine_has_type_routine_id`,
        `log_routine_has_type_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.routine_id,
        OLD.type_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_type_main`
         WHERE `routine_id` = OLD.routine_id AND `type_id` = OLD.type_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;

CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_videos_main` (
  `user_videos_id` INT NOT NULL AUTO_INCREMENT,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_videos_id`))
ENGINE = InnoDB
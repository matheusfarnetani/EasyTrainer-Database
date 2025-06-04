CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_videos_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_user_videos_main_user_videos_id` INT NOT NULL,
  `revision` VARCHAR(45) NOT NULL,
  `status` TINYINT(1) NOT NULL COMMENT '0 = Deleted, 1 = Active',
  `filename` VARCHAR(255) NOT NULL,
  `file_url` VARCHAR(512) NOT NULL,
  `status_video` INT NOT NULL DEFAULT 0,
  `uploaded_at` DATETIME NOT NULL,
  `processed_at` DATETIME NULL,
  `error_message` TEXT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_user_videos_content_log_user_videos_main1_idx` (`log_user_videos_main_user_videos_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_user_videos_content_log_user_videos_main1`
    FOREIGN KEY (`log_user_videos_main_user_videos_id`)
    REFERENCES `easytrainer_log`.`log_user_videos_main` (`user_videos_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
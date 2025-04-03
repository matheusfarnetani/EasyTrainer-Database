CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_hashtag_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_hashtag_main_hashtag_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_hashtags_content_log_hashtags_main1_idx` (`log_hashtag_main_hashtag_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_hashtags_content_log_hashtags_main1`
    FOREIGN KEY (`log_hashtag_main_hashtag_id`)
    REFERENCES `easytrainer_log`.`log_hashtag_main` (`hashtag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
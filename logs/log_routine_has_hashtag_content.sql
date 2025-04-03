CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_hashtag_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_routine_has_hashtag_routine_id` INT NOT NULL,
  `log_routine_has_hashtag_hashtag_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_routine_has_hashtag_routine_id` ASC, `log_routine_has_hashtag_hashtag_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10004`
    FOREIGN KEY (`log_routine_has_hashtag_routine_id` , `log_routine_has_hashtag_hashtag_id`)
    REFERENCES `easytrainer_log`.`log_routine_has_hashtag_main` (`routine_id` , `hashtag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_main_workout_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `number_of_days` TINYINT NULL,
  `image_url` VARCHAR(255) NULL,
  `duration` TIME NULL,
  `indoor` TINYINT(1) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_content_log_workout_main1_idx` (`log_workout_main_workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_content_log_workout_main1`
    FOREIGN KEY (`log_workout_main_workout_id`)
    REFERENCES `easytrainer_log`.`log_workout_main` (`workout_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
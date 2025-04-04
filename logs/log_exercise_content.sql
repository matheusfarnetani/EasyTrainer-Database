CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_exercise_main_exercise_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `equipment` VARCHAR(100) NULL,
  `duration` TIME NULL,
  `repetition` TINYINT NULL,
  `sets` TINYINT NULL,
  `rest_time` TIME NULL,
  `body_part` VARCHAR(100) NULL,
  `video_url` VARCHAR(255) NULL,
  `image_url` VARCHAR(255) NULL,
  `steps` TEXT NULL,
  `contraindications` TEXT NULL,
  `safety_tips` TEXT NULL,
  `common_mistakes` TEXT NULL,
  `indicated_for` TEXT NULL,
  `calories_burned_estimate` DECIMAL(6,2) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_exercise_content_log_exercise_main1_idx` (`log_exercise_main_exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_exercise_content_log_exercise_main1`
    FOREIGN KEY (`log_exercise_main_exercise_id`)
    REFERENCES `easytrainer_log`.`log_exercise_main` (`exercise_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
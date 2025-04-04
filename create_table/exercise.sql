CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  INDEX `fk_exercise_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_exercise_level1_idx` (`level_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_level1`
    FOREIGN KEY (`level_id`)
    REFERENCES `easytrainer`.`level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
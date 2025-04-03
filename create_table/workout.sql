CREATE TABLE IF NOT EXISTS `easytrainer`.`workout` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `number_of_days` TINYINT NULL,
  `image_url` VARCHAR(255) NULL,
  `duration` TIME NULL,
  `indoor` TINYINT(1) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workout_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_workout_level1_idx` (`level_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_level1`
    FOREIGN KEY (`level_id`)
    REFERENCES `easytrainer`.`level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
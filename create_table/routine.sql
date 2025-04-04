CREATE TABLE IF NOT EXISTS `easytrainer`.`routine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `duration` TIME NULL,
  `image_url` VARCHAR(255) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_routine_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_routine_level1_idx` (`level_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_level1`
    FOREIGN KEY (`level_id`)
    REFERENCES `easytrainer`.`level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
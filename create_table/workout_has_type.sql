CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_type` (
  `workout_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `type_id`),
  INDEX `fk_workout_has_type_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_workout_has_type_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_type_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_type_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `easytrainer`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
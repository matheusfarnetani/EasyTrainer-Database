CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_routine` (
  `workout_id` INT NOT NULL,
  `routine_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `routine_id`),
  INDEX `fk_workout_has_routine_routine1_idx` (`routine_id` ASC) VISIBLE,
  INDEX `fk_workout_has_routine_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_routine_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_routine_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
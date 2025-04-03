CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_exercise` (
  `workout_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `exercise_id`),
  INDEX `fk_workout_has_exercise_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  INDEX `fk_workout_has_exercise_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_exercise_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_exercise_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
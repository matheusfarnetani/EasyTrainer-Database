CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_goal` (
  `workout_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `goal_id`),
  INDEX `fk_workout_has_goal_goal1_idx` (`goal_id` ASC) VISIBLE,
  INDEX `fk_workout_has_goal_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_goal_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_goal_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `easytrainer`.`goal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise_has_goal` (
  `exercise_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  PRIMARY KEY (`exercise_id`, `goal_id`),
  INDEX `fk_exercise_has_goal_goal1_idx` (`goal_id` ASC) VISIBLE,
  INDEX `fk_exercise_has_goal_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_goal_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_has_goal_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `easytrainer`.`goal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
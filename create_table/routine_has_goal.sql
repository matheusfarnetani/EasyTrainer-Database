CREATE TABLE IF NOT EXISTS `easytrainer`.`routine_has_goal` (
  `routine_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  PRIMARY KEY (`routine_id`, `goal_id`),
  INDEX `fk_routine_has_goal_goal1_idx` (`goal_id` ASC) VISIBLE,
  INDEX `fk_routine_has_goal_routine1_idx` (`routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_has_goal_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_has_goal_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `easytrainer`.`goal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
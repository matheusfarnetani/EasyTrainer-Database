CREATE TABLE IF NOT EXISTS `easytrainer`.`user_has_goal` (
  `user_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `goal_id`),
  INDEX `fk_user_has_goal_goal1_idx` (`goal_id` ASC) VISIBLE,
  INDEX `fk_user_has_goal_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_goal_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `easytrainer`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_goal_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `easytrainer`.`goal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
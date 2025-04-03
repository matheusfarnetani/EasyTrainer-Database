CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise_has_type` (
  `exercise_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`exercise_id`, `type_id`),
  INDEX `fk_exercise_has_type_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_exercise_has_type_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_type_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_has_type_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `easytrainer`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
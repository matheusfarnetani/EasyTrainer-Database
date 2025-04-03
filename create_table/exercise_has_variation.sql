CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise_has_variation` (
  `exercise_id` INT NOT NULL,
  `variation_id` INT NOT NULL,
  PRIMARY KEY (`exercise_id`, `variation_id`),
  INDEX `fk_exercise_has_variation_exercise2_idx` (`variation_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_variation_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_has_variation_variation1`
    FOREIGN KEY (`variation_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
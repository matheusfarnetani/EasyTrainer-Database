CREATE TABLE IF NOT EXISTS `easytrainer`.`routine_has_exercise` (
  `routine_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  `order` TINYINT NOT NULL,
  `sets` TINYINT NOT NULL,
  `reps` TINYINT NOT NULL,
  `rest_time` TIME NULL,
  `note` VARCHAR(50) NULL,
  `day` TINYINT NOT NULL,
  `week` TINYINT NOT NULL,
  `is_optional` TINYINT(1) NOT NULL,
  PRIMARY KEY (`routine_id`, `exercise_id`),
  INDEX `fk_routine_has_exercise_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  INDEX `fk_routine_has_exercise_routine1_idx` (`routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_has_exercise_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_has_exercise_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
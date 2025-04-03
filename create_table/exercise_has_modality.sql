CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise_has_modality` (
  `exercise_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  PRIMARY KEY (`exercise_id`, `modality_id`),
  INDEX `fk_exercise_has_modality_modality1_idx` (`modality_id` ASC) VISIBLE,
  INDEX `fk_exercise_has_modality_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_modality_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_has_modality_modality1`
    FOREIGN KEY (`modality_id`)
    REFERENCES `easytrainer`.`modality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
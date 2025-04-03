CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_modality` (
  `workout_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `modality_id`),
  INDEX `fk_workout_has_modality_modality1_idx` (`modality_id` ASC) VISIBLE,
  INDEX `fk_workout_has_modality_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_modality_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_modality_modality1`
    FOREIGN KEY (`modality_id`)
    REFERENCES `easytrainer`.`modality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
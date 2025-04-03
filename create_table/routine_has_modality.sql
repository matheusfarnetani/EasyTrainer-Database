CREATE TABLE IF NOT EXISTS `easytrainer`.`routine_has_modality` (
  `routine_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  PRIMARY KEY (`routine_id`, `modality_id`),
  INDEX `fk_routine_has_modality_modality1_idx` (`modality_id` ASC) VISIBLE,
  INDEX `fk_routine_has_modality_routine1_idx` (`routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_has_modality_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_has_modality_modality1`
    FOREIGN KEY (`modality_id`)
    REFERENCES `easytrainer`.`modality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
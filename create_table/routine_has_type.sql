CREATE TABLE IF NOT EXISTS `easytrainer`.`routine_has_type` (
  `routine_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`routine_id`, `type_id`),
  INDEX `fk_routine_has_type_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_routine_has_type_routine1_idx` (`routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_has_type_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_has_type_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `easytrainer`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
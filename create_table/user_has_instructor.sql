CREATE TABLE IF NOT EXISTS `easytrainer`.`user_has_instructor` (
  `user_id` INT NOT NULL,
  `instructor_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `instructor_id`),
  INDEX `fk_user_has_instructor_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_user_has_instructor_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_instructor_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `easytrainer`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_instructor_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
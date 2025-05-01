CREATE TABLE IF NOT EXISTS `easytrainer`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mobile_number` VARCHAR(20) NULL,
  `birthday` DATE NULL,
  `weight` DECIMAL(5,2) NULL,
  `height` DECIMAL(4,2) NULL,
  `gender` ENUM("M", "F", "O") NULL,
  `password` VARCHAR(255) NOT NULL,
  `level_id` INT NULL,
  `instructor_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_user_level1_idx` (`level_id` ASC) VISIBLE,
  INDEX `fk_user_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_level1`
    FOREIGN KEY (`level_id`)
    REFERENCES `easytrainer`.`level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
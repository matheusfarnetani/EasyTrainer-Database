CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_instructor_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_instructor_main_instructor_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mobile_number` VARCHAR(20) NULL,
  `birthday` DATE NULL,
  `age` TINYINT NULL,
  `gender` ENUM("M", "F", "O") NULL,
  `password` BINARY(32) NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_instructors_content_log_instructors_main1_idx` (`log_instructor_main_instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_instructors_content_log_instructors_main1`
    FOREIGN KEY (`log_instructor_main_instructor_id`)
    REFERENCES `easytrainer_log`.`log_instructor_main` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
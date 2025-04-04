CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_user_main_user_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 = Deleted, 1 = Active',
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
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_user_content_log_user_main_idx` (`log_user_main_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_user_content_log_user_main`
    FOREIGN KEY (`log_user_main_user_id`)
    REFERENCES `easytrainer_log`.`log_user_main` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
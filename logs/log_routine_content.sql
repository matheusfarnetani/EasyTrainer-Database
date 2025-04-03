CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_routine_main_routine_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `duration` TIME NULL,
  `image_url` VARCHAR(255) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_routine_content_log_routine_main1_idx` (`log_routine_main_routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_routine_content_log_routine_main1`
    FOREIGN KEY (`log_routine_main_routine_id`)
    REFERENCES `easytrainer_log`.`log_routine_main` (`routine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
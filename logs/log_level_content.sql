CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_level_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_level_main_level_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_level_content_log_level_main1_idx` (`log_level_main_level_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_level_content_log_level_main1`
    FOREIGN KEY (`log_level_main_level_id`)
    REFERENCES `easytrainer_log`.`log_level_main` (`level_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_type_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_type_main_modality_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_type_content_log_type_main1_idx` (`log_type_main_modality_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_type_content_log_type_main1`
    FOREIGN KEY (`log_type_main_modality_id`)
    REFERENCES `easytrainer_log`.`log_type_main` (`modality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
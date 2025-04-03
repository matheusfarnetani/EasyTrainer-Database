CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_modality_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_has_modality_workout_id` INT NOT NULL,
  `log_workout_has_modality_modality_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_workout_has_modality_workout_id` ASC, `log_workout_has_modality_modality_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10`
    FOREIGN KEY (`log_workout_has_modality_workout_id` , `log_workout_has_modality_modality_id`)
    REFERENCES `easytrainer_log`.`log_workout_has_modality_main` (`workout_id` , `modality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
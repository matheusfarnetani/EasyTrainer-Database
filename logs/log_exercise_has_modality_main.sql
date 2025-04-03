CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_modality_main` (
  `exercise_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exercise_id`, `modality_id`))
ENGINE = InnoDB
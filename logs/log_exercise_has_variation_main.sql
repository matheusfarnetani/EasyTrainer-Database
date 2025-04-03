CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_variation_main` (
  `exercise_id` INT NOT NULL,
  `variation_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exercise_id`, `variation_id`))
ENGINE = InnoDB
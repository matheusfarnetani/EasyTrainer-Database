CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_routine_main` (
  `workout_id` INT NOT NULL,
  `routine_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `routine_id`))
ENGINE = InnoDB
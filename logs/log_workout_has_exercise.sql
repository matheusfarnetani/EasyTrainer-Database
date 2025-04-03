CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_exercise_main` (
  `workout_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `exercise_id`))
ENGINE = InnoDB
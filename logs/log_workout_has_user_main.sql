CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_user_main` (
  `workout_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `user_id`))
ENGINE = InnoDB
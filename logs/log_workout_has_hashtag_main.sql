CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_hashtag_main` (
  `workout_id` INT NOT NULL,
  `hashtag_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `hashtag_id`))
ENGINE = InnoDB
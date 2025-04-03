CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_has_goal_main` (
  `user_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `goal_id`))
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_goal_main` (
  `goal_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goal_id`))
ENGINE = InnoDB
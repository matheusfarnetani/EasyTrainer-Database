CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_instructor_main` (
  `instructor_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`instructor_id`))
ENGINE = InnoDB
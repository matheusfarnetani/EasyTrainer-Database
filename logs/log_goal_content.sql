CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_goal_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_goal_main_goal_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_table1_log_goal_main1_idx` (`log_goal_main_goal_id` ASC) VISIBLE,
  CONSTRAINT `fk_table1_log_goal_main1`
    FOREIGN KEY (`log_goal_main_goal_id`)
    REFERENCES `easytrainer_log`.`log_goal_main` (`goal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
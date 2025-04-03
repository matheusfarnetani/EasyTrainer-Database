CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_has_goal_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_user_has_goal_main_user_id` INT NOT NULL,
  `log_user_has_goal_main_goal_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_user_has_goal_content_log_user_has_goal_main1_idx` (`log_user_has_goal_main_user_id` ASC, `log_user_has_goal_main_goal_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_user_has_goal_content_log_user_has_goal_main1`
    FOREIGN KEY (`log_user_has_goal_main_user_id` , `log_user_has_goal_main_goal_id`)
    REFERENCES `easytrainer_log`.`log_user_has_goal_main` (`user_id` , `goal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
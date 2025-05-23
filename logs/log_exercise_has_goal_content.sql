CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_goal_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_exercise_has_goal_exercise_id` INT NOT NULL,
  `log_exercise_has_goal_goal_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_exercise_has_goal_exercise_id` ASC, `log_exercise_has_goal_goal_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main100050`
    FOREIGN KEY (`log_exercise_has_goal_exercise_id` , `log_exercise_has_goal_goal_id`)
    REFERENCES `easytrainer_log`.`log_exercise_has_goal_main` (`exercise_id` , `goal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
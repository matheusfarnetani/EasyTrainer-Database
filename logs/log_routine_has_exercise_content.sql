CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_exercise_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_routine_has_exercise_routine_id` INT NOT NULL,
  `log_routine_has_exercise_exercise_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `order` TINYINT NOT NULL,
  `sets` TINYINT NOT NULL,
  `reps` TINYINT NOT NULL,
  `rest_time` TIME NULL,
  `note` VARCHAR(50) NULL,
  `day` TINYINT NOT NULL,
  `week` TINYINT NOT NULL,
  `is_optional` TINYINT(1) NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_routine_has_exercise_routine_id` ASC, `log_routine_has_exercise_exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10003`
    FOREIGN KEY (`log_routine_has_exercise_routine_id` , `log_routine_has_exercise_exercise_id`)
    REFERENCES `easytrainer_log`.`log_routine_has_exercise_main` (`routine_id` , `exercise_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_hashtag` (
  `workout_id` INT NOT NULL,
  `hashtag_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `hashtag_id`),
  INDEX `fk_workout_has_hashtags_hashtags1_idx` (`hashtag_id` ASC) VISIBLE,
  INDEX `fk_workout_has_hashtags_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_hashtags_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_hashtags_hashtags1`
    FOREIGN KEY (`hashtag_id`)
    REFERENCES `easytrainer`.`hashtag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
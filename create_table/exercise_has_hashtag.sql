CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise_has_hashtag` (
  `exercise_id` INT NOT NULL,
  `hashtag_id` INT NOT NULL,
  PRIMARY KEY (`exercise_id`, `hashtag_id`),
  INDEX `fk_exercise_has_hashtags_hashtags1_idx` (`hashtag_id` ASC) VISIBLE,
  INDEX `fk_exercise_has_hashtags_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_hashtags_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_has_hashtags_hashtags1`
    FOREIGN KEY (`hashtag_id`)
    REFERENCES `easytrainer`.`hashtag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
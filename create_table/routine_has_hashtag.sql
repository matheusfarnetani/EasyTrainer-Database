CREATE TABLE IF NOT EXISTS `easytrainer`.`routine_has_hashtag` (
  `routine_id` INT NOT NULL,
  `hashtag_id` INT NOT NULL,
  PRIMARY KEY (`routine_id`, `hashtag_id`),
  INDEX `fk_routine_has_hashtags_hashtags1_idx` (`hashtag_id` ASC) VISIBLE,
  INDEX `fk_routine_has_hashtags_routine1_idx` (`routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_has_hashtags_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_has_hashtags_hashtags1`
    FOREIGN KEY (`hashtag_id`)
    REFERENCES `easytrainer`.`hashtag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
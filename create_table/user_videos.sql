CREATE TABLE IF NOT EXISTS `easytrainer`.`user_videos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `filename` VARCHAR(255) NOT NULL,
  `file_url` VARCHAR(512) NOT NULL,
  `status` INT NOT NULL DEFAULT 0 COMMENT '0 = pendente, 1 = processando, 2 = processado, 3 = erro',
  `uploaded_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `processed_at` DATETIME NULL,
  `error_message` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_videos_user1_idx` (`user_id` ASC) INVISIBLE,
  INDEX `idx_status` (`status` ASC) VISIBLE,
  CONSTRAINT `fk_user_videos_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `easytrainer`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `easytrainer`.`instructor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mobile_number` VARCHAR(20) NULL,
  `birthday` DATE NULL,
  `age` TINYINT NULL,
  `gender` ENUM("M", "F", "O") NULL,
  `password` BINARY(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
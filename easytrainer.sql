-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema easytrainer
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema easytrainer
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `easytrainer` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema easytrainer_log
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema easytrainer_log
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `easytrainer_log` DEFAULT CHARACTER SET utf8mb4 ;
USE `easytrainer` ;

-- -----------------------------------------------------
-- Table `easytrainer`.`level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`instructor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mobile_number` VARCHAR(20) NULL,
  `birthday` DATE NULL,
  `gender` ENUM("M", "F", "O") NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mobile_number` VARCHAR(20) NULL,
  `birthday` DATE NULL,
  `weight` DECIMAL(5,2) NULL,
  `height` DECIMAL(4,2) NULL,
  `gender` ENUM("M", "F", "O") NULL,
  `password` VARCHAR(255) NOT NULL,
  `level_id` INT NOT NULL,
  `instructor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_user_level1_idx` (`level_id` ASC) VISIBLE,
  INDEX `fk_user_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_level1`
    FOREIGN KEY (`level_id`)
    REFERENCES `easytrainer`.`level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`goal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`goal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`user_has_goal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`user_has_goal` (
  `user_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `goal_id`),
  INDEX `fk_user_has_goal_goal1_idx` (`goal_id` ASC) VISIBLE,
  INDEX `fk_user_has_goal_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_goal_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `easytrainer`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_goal_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `easytrainer`.`goal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`modality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`modality` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`hashtag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`hashtag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`exercise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `equipment` VARCHAR(100) NULL,
  `duration` TIME NULL,
  `repetition` TINYINT NULL,
  `sets` TINYINT NULL,
  `rest_time` TIME NULL,
  `body_part` VARCHAR(100) NULL,
  `video_url` VARCHAR(255) NULL,
  `image_url` VARCHAR(255) NULL,
  `steps` TEXT NULL,
  `contraindications` TEXT NULL,
  `safety_tips` TEXT NULL,
  `common_mistakes` TEXT NULL,
  `indicated_for` TEXT NULL,
  `calories_burned_estimate` DECIMAL(6,2) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exercise_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_exercise_level1_idx` (`level_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_level1`
    FOREIGN KEY (`level_id`)
    REFERENCES `easytrainer`.`level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`exercise_has_goal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise_has_goal` (
  `exercise_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  PRIMARY KEY (`exercise_id`, `goal_id`),
  INDEX `fk_exercise_has_goal_goal1_idx` (`goal_id` ASC) VISIBLE,
  INDEX `fk_exercise_has_goal_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_goal_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_has_goal_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `easytrainer`.`goal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`exercise_has_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise_has_type` (
  `exercise_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`exercise_id`, `type_id`),
  INDEX `fk_exercise_has_type_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_exercise_has_type_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_type_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_has_type_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `easytrainer`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`exercise_has_modality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise_has_modality` (
  `exercise_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  PRIMARY KEY (`exercise_id`, `modality_id`),
  INDEX `fk_exercise_has_modality_modality1_idx` (`modality_id` ASC) VISIBLE,
  INDEX `fk_exercise_has_modality_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_modality_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_has_modality_modality1`
    FOREIGN KEY (`modality_id`)
    REFERENCES `easytrainer`.`modality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`exercise_has_hashtag`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`exercise_has_variation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`exercise_has_variation` (
  `exercise_id` INT NOT NULL,
  `variation_id` INT NOT NULL,
  PRIMARY KEY (`exercise_id`, `variation_id`),
  INDEX `fk_exercise_has_variation_exercise2_idx` (`variation_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_variation_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_has_variation_variation1`
    FOREIGN KEY (`variation_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`routine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`routine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `duration` TIME NULL,
  `image_url` VARCHAR(255) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_routine_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_routine_level1_idx` (`level_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_level1`
    FOREIGN KEY (`level_id`)
    REFERENCES `easytrainer`.`level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`routine_has_goal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`routine_has_goal` (
  `routine_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  PRIMARY KEY (`routine_id`, `goal_id`),
  INDEX `fk_routine_has_goal_goal1_idx` (`goal_id` ASC) VISIBLE,
  INDEX `fk_routine_has_goal_routine1_idx` (`routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_has_goal_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_has_goal_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `easytrainer`.`goal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`routine_has_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`routine_has_type` (
  `routine_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`routine_id`, `type_id`),
  INDEX `fk_routine_has_type_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_routine_has_type_routine1_idx` (`routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_has_type_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_has_type_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `easytrainer`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`routine_has_modality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`routine_has_modality` (
  `routine_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  PRIMARY KEY (`routine_id`, `modality_id`),
  INDEX `fk_routine_has_modality_modality1_idx` (`modality_id` ASC) VISIBLE,
  INDEX `fk_routine_has_modality_routine1_idx` (`routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_has_modality_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_has_modality_modality1`
    FOREIGN KEY (`modality_id`)
    REFERENCES `easytrainer`.`modality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`routine_has_hashtag`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`routine_has_exercise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`routine_has_exercise` (
  `routine_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  `order` TINYINT NOT NULL,
  `sets` TINYINT NOT NULL,
  `reps` TINYINT NOT NULL,
  `rest_time` TIME NULL,
  `note` VARCHAR(50) NULL,
  `day` TINYINT NOT NULL,
  `week` TINYINT NOT NULL,
  `is_optional` TINYINT(1) NOT NULL,
  PRIMARY KEY (`routine_id`, `exercise_id`),
  INDEX `fk_routine_has_exercise_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  INDEX `fk_routine_has_exercise_routine1_idx` (`routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_has_exercise_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_routine_has_exercise_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`workout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`workout` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `number_of_days` TINYINT NULL,
  `image_url` VARCHAR(255) NULL,
  `duration` TIME NULL,
  `indoor` TINYINT(1) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workout_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_workout_level1_idx` (`level_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_level1`
    FOREIGN KEY (`level_id`)
    REFERENCES `easytrainer`.`level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`workout_has_goal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_goal` (
  `workout_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `goal_id`),
  INDEX `fk_workout_has_goal_goal1_idx` (`goal_id` ASC) VISIBLE,
  INDEX `fk_workout_has_goal_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_goal_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_goal_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `easytrainer`.`goal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`workout_has_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_type` (
  `workout_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `type_id`),
  INDEX `fk_workout_has_type_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_workout_has_type_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_type_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_type_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `easytrainer`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`workout_has_modality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_modality` (
  `workout_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `modality_id`),
  INDEX `fk_workout_has_modality_modality1_idx` (`modality_id` ASC) VISIBLE,
  INDEX `fk_workout_has_modality_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_modality_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_modality_modality1`
    FOREIGN KEY (`modality_id`)
    REFERENCES `easytrainer`.`modality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`workout_has_hashtag`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`workout_has_routine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_routine` (
  `workout_id` INT NOT NULL,
  `routine_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `routine_id`),
  INDEX `fk_workout_has_routine_routine1_idx` (`routine_id` ASC) VISIBLE,
  INDEX `fk_workout_has_routine_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_routine_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_routine_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `easytrainer`.`routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`workout_has_exercise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_exercise` (
  `workout_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `exercise_id`),
  INDEX `fk_workout_has_exercise_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  INDEX `fk_workout_has_exercise_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_exercise_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_exercise_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `easytrainer`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`workout_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`workout_has_user` (
  `workout_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`workout_id`, `user_id`),
  INDEX `fk_workout_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_workout_has_user_workout1_idx` (`workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_has_user_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `easytrainer`.`workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `easytrainer`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer`.`user_has_instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`user_has_instructor` (
  `user_id` INT NOT NULL,
  `instructor_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `instructor_id`),
  INDEX `fk_user_has_instructor_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_user_has_instructor_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_instructor_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `easytrainer`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_instructor_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `easytrainer`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `easytrainer_log` ;

-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_user_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_main` (
  `user_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_user_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_user_main_user_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 = Deleted, 1 = Active',
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mobile_number` VARCHAR(20) NULL,
  `birthday` DATE NULL,
  `weight` DECIMAL(5,2) NULL,
  `height` DECIMAL(4,2) NULL,
  `gender` ENUM("M", "F", "O") NULL,
  `password` VARCHAR(255) NOT NULL,
  `level_id` INT NULL,
  `instructor_id` INT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_user_content_log_user_main_idx` (`log_user_main_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_user_content_log_user_main`
    FOREIGN KEY (`log_user_main_user_id`)
    REFERENCES `easytrainer_log`.`log_user_main` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_instructor_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_instructor_main` (
  `instructor_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`instructor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_instructor_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_instructor_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_instructor_main_instructor_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mobile_number` VARCHAR(20) NULL,
  `birthday` DATE NULL,
  `gender` ENUM("M", "F", "O") NULL,
  `password` VARCHAR(255) NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_instructors_content_log_instructors_main1_idx` (`log_instructor_main_instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_instructors_content_log_instructors_main1`
    FOREIGN KEY (`log_instructor_main_instructor_id`)
    REFERENCES `easytrainer_log`.`log_instructor_main` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_goal_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_goal_main` (
  `goal_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goal_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_goal_content`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_level_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_level_main` (
  `level_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`level_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_level_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_level_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_level_main_level_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_level_content_log_level_main1_idx` (`log_level_main_level_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_level_content_log_level_main1`
    FOREIGN KEY (`log_level_main_level_id`)
    REFERENCES `easytrainer_log`.`log_level_main` (`level_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_user_has_goal_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_has_goal_main` (
  `user_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `goal_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_user_has_goal_content`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_type_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_type_main` (
  `type_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_type_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_type_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_type_main_type_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_type_content_log_type_main1_idx` (`log_type_main_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_type_content_log_type_main1`
    FOREIGN KEY (`log_type_main_type_id`)
    REFERENCES `easytrainer_log`.`log_type_main` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_modality_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_modality_main` (
  `modality_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`modality_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_modality_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_modality_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_modality_main_modality_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_type_content_copy1_log_modality_main1_idx` (`log_modality_main_modality_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_type_content_copy1_log_modality_main1`
    FOREIGN KEY (`log_modality_main_modality_id`)
    REFERENCES `easytrainer_log`.`log_modality_main` (`modality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_hashtag_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_hashtag_main` (
  `hashtag_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hashtag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_hashtag_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_hashtag_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_hashtag_main_hashtag_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_hashtags_content_log_hashtags_main1_idx` (`log_hashtag_main_hashtag_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_hashtags_content_log_hashtags_main1`
    FOREIGN KEY (`log_hashtag_main_hashtag_id`)
    REFERENCES `easytrainer_log`.`log_hashtag_main` (`hashtag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_main` (
  `exercise_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exercise_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_exercise_main_exercise_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `equipment` VARCHAR(100) NULL,
  `duration` TIME NULL,
  `repetition` TINYINT NULL,
  `sets` TINYINT NULL,
  `rest_time` TIME NULL,
  `body_part` VARCHAR(100) NULL,
  `video_url` VARCHAR(255) NULL,
  `image_url` VARCHAR(255) NULL,
  `steps` TEXT NULL,
  `contraindications` TEXT NULL,
  `safety_tips` TEXT NULL,
  `common_mistakes` TEXT NULL,
  `indicated_for` TEXT NULL,
  `calories_burned_estimate` DECIMAL(6,2) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_exercise_content_log_exercise_main1_idx` (`log_exercise_main_exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_exercise_content_log_exercise_main1`
    FOREIGN KEY (`log_exercise_main_exercise_id`)
    REFERENCES `easytrainer_log`.`log_exercise_main` (`exercise_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_main` (
  `workout_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_main_workout_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  `number_of_days` TINYINT NULL,
  `image_url` VARCHAR(255) NULL,
  `duration` TIME NULL,
  `indoor` TINYINT(1) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_content_log_workout_main1_idx` (`log_workout_main_workout_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_content_log_workout_main1`
    FOREIGN KEY (`log_workout_main_workout_id`)
    REFERENCES `easytrainer_log`.`log_workout_main` (`workout_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_main` (
  `routine_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`routine_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_routine_main_routine_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `duration` TIME NULL,
  `image_url` VARCHAR(255) NULL,
  `instructor_id` INT NOT NULL,
  `level_id` INT NOT NULL,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_routine_content_log_routine_main1_idx` (`log_routine_main_routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_routine_content_log_routine_main1`
    FOREIGN KEY (`log_routine_main_routine_id`)
    REFERENCES `easytrainer_log`.`log_routine_main` (`routine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_type_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_type_main` (
  `workout_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_type_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_type_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_has_type_main_workout_id` INT NOT NULL,
  `log_workout_has_type_main_type_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_workout_has_type_main_workout_id` ASC, `log_workout_has_type_main_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main1`
    FOREIGN KEY (`log_workout_has_type_main_workout_id` , `log_workout_has_type_main_type_id`)
    REFERENCES `easytrainer_log`.`log_workout_has_type_main` (`workout_id` , `type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_modality_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_modality_main` (
  `workout_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `modality_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_modality_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_modality_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_has_modality_workout_id` INT NOT NULL,
  `log_workout_has_modality_modality_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_workout_has_modality_workout_id` ASC, `log_workout_has_modality_modality_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10`
    FOREIGN KEY (`log_workout_has_modality_workout_id` , `log_workout_has_modality_modality_id`)
    REFERENCES `easytrainer_log`.`log_workout_has_modality_main` (`workout_id` , `modality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_goal_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_goal_main` (
  `workout_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `goal_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_goal_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_goal_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_has_goal_workout_id` INT NOT NULL,
  `log_workout_has_goal_goal_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_workout_has_goal_workout_id` ASC, `log_workout_has_goal_goal_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main100`
    FOREIGN KEY (`log_workout_has_goal_workout_id` , `log_workout_has_goal_goal_id`)
    REFERENCES `easytrainer_log`.`log_workout_has_goal_main` (`workout_id` , `goal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_hashtag_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_hashtag_main` (
  `workout_id` INT NOT NULL,
  `hashtag_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `hashtag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_hashtag_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_hashtag_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_has_hashtag_workout_id` INT NOT NULL,
  `log_workout_has_hashtag_hashtag_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_workout_has_hashtag_workout_id` ASC, `log_workout_has_hashtag_hashtag_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main1000`
    FOREIGN KEY (`log_workout_has_hashtag_workout_id` , `log_workout_has_hashtag_hashtag_id`)
    REFERENCES `easytrainer_log`.`log_workout_has_hashtag_main` (`workout_id` , `hashtag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_user_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_user_main` (
  `workout_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_user_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_user_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_has_user_workout_id` INT NOT NULL,
  `log_workout_has_user_user_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_workout_has_user_workout_id` ASC, `log_workout_has_user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10000`
    FOREIGN KEY (`log_workout_has_user_workout_id` , `log_workout_has_user_user_id`)
    REFERENCES `easytrainer_log`.`log_workout_has_user_main` (`workout_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_routine_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_routine_main` (
  `workout_id` INT NOT NULL,
  `routine_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `routine_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_routine_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_routine_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_has_routine_workout_id` INT NOT NULL,
  `log_workout_has_routine_routine_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_workout_has_routine_workout_id` ASC, `log_workout_has_routine_routine_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main100000`
    FOREIGN KEY (`log_workout_has_routine_workout_id` , `log_workout_has_routine_routine_id`)
    REFERENCES `easytrainer_log`.`log_workout_has_routine_main` (`workout_id` , `routine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_exercise_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_exercise_main` (
  `workout_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workout_id`, `exercise_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_workout_has_exercise_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_workout_has_exercise_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_workout_has_exercise_workout_id` INT NOT NULL,
  `log_workout_has_exercise_exercise_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_workout_has_exercise_workout_id` ASC, `log_workout_has_exercise_exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10001`
    FOREIGN KEY (`log_workout_has_exercise_workout_id` , `log_workout_has_exercise_exercise_id`)
    REFERENCES `easytrainer_log`.`log_workout_has_exercise_main` (`workout_id` , `exercise_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_type_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_type_main` (
  `routine_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`routine_id`, `type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_type_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_type_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_routine_has_type_routine_id` INT NOT NULL,
  `log_routine_has_type_type_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_routine_has_type_routine_id` ASC, `log_routine_has_type_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main100010`
    FOREIGN KEY (`log_routine_has_type_routine_id` , `log_routine_has_type_type_id`)
    REFERENCES `easytrainer_log`.`log_routine_has_type_main` (`routine_id` , `type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_modality_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_modality_main` (
  `routine_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`routine_id`, `modality_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_modality_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_modality_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_routine_has_modality_routine_id` INT NOT NULL,
  `log_routine_has_modality_modality_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_routine_has_modality_routine_id` ASC, `log_routine_has_modality_modality_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10002`
    FOREIGN KEY (`log_routine_has_modality_routine_id` , `log_routine_has_modality_modality_id`)
    REFERENCES `easytrainer_log`.`log_routine_has_modality_main` (`routine_id` , `modality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_goal_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_goal_main` (
  `routine_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`routine_id`, `goal_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_goal_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_goal_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_routine_has_goal_routine_id` INT NOT NULL,
  `log_routine_has_goal_goal_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_routine_has_goal_routine_id` ASC, `log_routine_has_goal_goal_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main100020`
    FOREIGN KEY (`log_routine_has_goal_routine_id` , `log_routine_has_goal_goal_id`)
    REFERENCES `easytrainer_log`.`log_routine_has_goal_main` (`routine_id` , `goal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_exercise_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_exercise_main` (
  `routine_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`routine_id`, `exercise_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_exercise_content`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_hashtag_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_hashtag_main` (
  `routine_id` INT NOT NULL,
  `hashtag_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`routine_id`, `hashtag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_routine_has_hashtag_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_routine_has_hashtag_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_routine_has_hashtag_routine_id` INT NOT NULL,
  `log_routine_has_hashtag_hashtag_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_routine_has_hashtag_routine_id` ASC, `log_routine_has_hashtag_hashtag_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10004`
    FOREIGN KEY (`log_routine_has_hashtag_routine_id` , `log_routine_has_hashtag_hashtag_id`)
    REFERENCES `easytrainer_log`.`log_routine_has_hashtag_main` (`routine_id` , `hashtag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_type_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_type_main` (
  `exercise_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exercise_id`, `type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_type_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_type_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_exercise_has_type_exercise_id` INT NOT NULL,
  `log_exercise_has_type_type_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_exercise_has_type_exercise_id` ASC, `log_exercise_has_type_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main100040`
    FOREIGN KEY (`log_exercise_has_type_exercise_id` , `log_exercise_has_type_type_id`)
    REFERENCES `easytrainer_log`.`log_exercise_has_type_main` (`exercise_id` , `type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_modality_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_modality_main` (
  `exercise_id` INT NOT NULL,
  `modality_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exercise_id`, `modality_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_modality_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_modality_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_exercise_has_modality_exercise_id` INT NOT NULL,
  `log_exercise_has_modality_modality_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_exercise_has_modality_exercise_id` ASC, `log_exercise_has_modality_modality_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10005`
    FOREIGN KEY (`log_exercise_has_modality_exercise_id` , `log_exercise_has_modality_modality_id`)
    REFERENCES `easytrainer_log`.`log_exercise_has_modality_main` (`exercise_id` , `modality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_goal_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_goal_main` (
  `exercise_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exercise_id`, `goal_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_goal_content`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_hashtag_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_hashtag_main` (
  `exercise_id` INT NOT NULL,
  `hashtag_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exercise_id`, `hashtag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_hashtag_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_hashtag_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_exercise_has_hashtag_exercise_id` INT NOT NULL,
  `log_exercise_has_hashtag_hashtag_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_exercise_has_hashtag_exercise_id` ASC, `log_exercise_has_hashtag_hashtag_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main10006`
    FOREIGN KEY (`log_exercise_has_hashtag_exercise_id` , `log_exercise_has_hashtag_hashtag_id`)
    REFERENCES `easytrainer_log`.`log_exercise_has_hashtag_main` (`exercise_id` , `hashtag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_variation_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_variation_main` (
  `exercise_id` INT NOT NULL,
  `variation_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exercise_id`, `variation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_exercise_has_variation_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_exercise_has_variation_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_exercise_has_variation_exercise_id` INT NOT NULL,
  `log_exercise_has_variation_variation_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_workout_has_type_content_log_workout_has_type_main1_idx` (`log_exercise_has_variation_exercise_id` ASC, `log_exercise_has_variation_variation_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_workout_has_type_content_log_workout_has_type_main100060`
    FOREIGN KEY (`log_exercise_has_variation_exercise_id` , `log_exercise_has_variation_variation_id`)
    REFERENCES `easytrainer_log`.`log_exercise_has_variation_main` (`exercise_id` , `variation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_user_has_instructor_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_has_instructor_main` (
  `user_id` INT NOT NULL,
  `instructor_id` INT NOT NULL,
  `current_revision` INT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `instructor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easytrainer_log`.`log_user_has_instructor_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer_log`.`log_user_has_instructor_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log_user_has_instructor_main_user_id` INT NOT NULL,
  `log_user_has_instructor_main_instructor_id` INT NOT NULL,
  `revision` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL,
  `modified_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_log_user_has_instructor_content_log_user_has_instructor__idx` (`log_user_has_instructor_main_user_id` ASC, `log_user_has_instructor_main_instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_user_has_instructor_content_log_user_has_instructor_ma1`
    FOREIGN KEY (`log_user_has_instructor_main_user_id` , `log_user_has_instructor_main_instructor_id`)
    REFERENCES `easytrainer_log`.`log_user_has_instructor_main` (`user_id` , `instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `easytrainer` ;

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_exercise_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_exercise_details` (`exercise_id` INT, `exercise_name` INT, `description` INT, `equipment` INT, `duration` INT, `repetition` INT, `sets` INT, `rest_time` INT, `body_part` INT, `video_url` INT, `image_url` INT, `steps` INT, `contraindications` INT, `safety_tips` INT, `common_mistakes` INT, `indicated_for` INT, `calories_burned_estimate` INT, `level` INT, `instructor` INT, `types` INT, `modalities` INT, `goals` INT);

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_routine_structure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_routine_structure` (`routine_id` INT, `routine_name` INT, `description` INT, `exercise_id` INT, `exercise_name` INT, `order` INT, `sets` INT, `reps` INT, `rest_time` INT, `note` INT, `day` INT, `week` INT, `is_optional` INT);

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_workout_metadata`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_workout_metadata` (`workout_id` INT, `workout_name` INT, `description` INT, `number_of_days` INT, `image_url` INT, `duration` INT, `indoor` INT, `level` INT, `types` INT, `modalities` INT, `goals` INT);

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_user_workout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_user_workout` (`user_id` INT, `user_name` INT, `workout_id` INT, `workout_name` INT, `level` INT, `goals` INT);

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_exercise_instruction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_exercise_instruction` (`exercise_id` INT, `name` INT, `steps` INT, `contraindications` INT, `safety_tips` INT, `common_mistakes` INT, `indicated_for` INT, `video_url` INT, `image_url` INT);

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_routine_weekly_schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_routine_weekly_schedule` (`routine_id` INT, `routine_name` INT, `day` INT, `week` INT, `exercise_id` INT, `exercise_name` INT, `order` INT, `sets` INT, `reps` INT, `rest_time` INT, `is_optional` INT);

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_instructor_workout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_instructor_workout` (`instructor_id` INT, `instructor_name` INT, `workout_id` INT, `workout_name` INT, `description` INT, `number_of_days` INT, `duration` INT);

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_training_type_statistics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_training_type_statistics` (`type_name` INT, `exercise_count` INT, `routine_count` INT, `workout_count` INT);

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_exercise_by_goals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_exercise_by_goals` (`goal_id` INT, `goal_name` INT, `exercise_id` INT, `exercise_name` INT, `description` INT, `body_part` INT, `duration` INT, `repetition` INT, `sets` INT);

-- -----------------------------------------------------
-- Placeholder table for view `easytrainer`.`view_exercise_by_modality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easytrainer`.`view_exercise_by_modality` (`modality_id` INT, `modality_name` INT, `level_name` INT, `exercise_id` INT, `exercise_name` INT, `body_part` INT, `repetition` INT, `sets` INT, `duration` INT);

-- -----------------------------------------------------
-- View `easytrainer`.`view_exercise_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_exercise_details`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_exercise_details AS
SELECT 
    e.id AS exercise_id,
    e.name AS exercise_name,
    e.description,
    e.equipment,
    e.duration,
    e.repetition,
    e.sets,
    e.rest_time,
    e.body_part,
    e.video_url,
    e.image_url,
    e.steps,
    e.contraindications,
    e.safety_tips,
    e.common_mistakes,
    e.indicated_for,
    e.calories_burned_estimate,
    l.name AS level,
    i.name AS instructor,
    GROUP_CONCAT(DISTINCT t.name) AS types,
    GROUP_CONCAT(DISTINCT m.name) AS modalities,
    GROUP_CONCAT(DISTINCT g.name) AS goals
FROM exercise e
LEFT JOIN level l ON e.level_id = l.id
LEFT JOIN instructor i ON e.instructor_id = i.id
LEFT JOIN exercise_has_type eht ON e.id = eht.exercise_id
LEFT JOIN type t ON eht.type_id = t.id
LEFT JOIN exercise_has_modality ehm ON e.id = ehm.exercise_id
LEFT JOIN modality m ON ehm.modality_id = m.id
LEFT JOIN exercise_has_goal ehg ON e.id = ehg.exercise_id
LEFT JOIN goal g ON ehg.goal_id = g.id
GROUP BY e.id;

-- -----------------------------------------------------
-- View `easytrainer`.`view_routine_structure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_routine_structure`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_routine_structure AS
SELECT 
    r.id AS routine_id,
    r.name AS routine_name,
    r.description,
    rhe.exercise_id,
    e.name AS exercise_name,
    rhe.order,
    rhe.sets,
    rhe.reps,
    rhe.rest_time,
    rhe.note,
    rhe.day,
    rhe.week,
    rhe.is_optional
FROM routine r
JOIN routine_has_exercise rhe ON r.id = rhe.routine_id
JOIN exercise e ON rhe.exercise_id = e.id
ORDER BY r.id, rhe.week, rhe.day, rhe.order;

-- -----------------------------------------------------
-- View `easytrainer`.`view_workout_metadata`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_workout_metadata`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_workout_metadata AS
SELECT 
    w.id AS workout_id,
    w.name AS workout_name,
    w.description,
    w.number_of_days,
    w.image_url,
    w.duration,
    w.indoor,
    l.name AS level,
    GROUP_CONCAT(DISTINCT t.name) AS types,
    GROUP_CONCAT(DISTINCT m.name) AS modalities,
    GROUP_CONCAT(DISTINCT g.name) AS goals
FROM workout w
LEFT JOIN level l ON w.level_id = l.id
LEFT JOIN workout_has_type wht ON w.id = wht.workout_id
LEFT JOIN type t ON wht.type_id = t.id
LEFT JOIN workout_has_modality whm ON w.id = whm.workout_id
LEFT JOIN modality m ON whm.modality_id = m.id
LEFT JOIN workout_has_goal whg ON w.id = whg.workout_id
LEFT JOIN goal g ON whg.goal_id = g.id
GROUP BY w.id;

-- -----------------------------------------------------
-- View `easytrainer`.`view_user_workout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_user_workout`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_user_workout AS
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    w.id AS workout_id,
    w.name AS workout_name,
    l.name AS level,
    GROUP_CONCAT(DISTINCT g.name) AS goals
FROM user u
JOIN workout_has_user whu ON u.id = whu.user_id
JOIN workout w ON whu.workout_id = w.id
LEFT JOIN level l ON u.level_id = l.id
LEFT JOIN workout_has_goal whg ON w.id = whg.workout_id
LEFT JOIN goal g ON whg.goal_id = g.id
GROUP BY u.id, w.id;

-- -----------------------------------------------------
-- View `easytrainer`.`view_exercise_instruction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_exercise_instruction`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_exercise_instruction AS
SELECT 
    id AS exercise_id,
    name,
    steps,
    contraindications,
    safety_tips,
    common_mistakes,
    indicated_for,
    video_url,
    image_url
FROM exercise;

-- -----------------------------------------------------
-- View `easytrainer`.`view_routine_weekly_schedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_routine_weekly_schedule`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_routine_weekly_schedule AS
SELECT 
    r.id AS routine_id,
    r.name AS routine_name,
    rhe.day,
    rhe.week,
    e.id AS exercise_id,
    e.name AS exercise_name,
    rhe.order,
    rhe.sets,
    rhe.reps,
    rhe.rest_time,
    rhe.is_optional
FROM routine r
JOIN routine_has_exercise rhe ON r.id = rhe.routine_id
JOIN exercise e ON rhe.exercise_id = e.id
ORDER BY r.id, rhe.week, rhe.day, rhe.order;

-- -----------------------------------------------------
-- View `easytrainer`.`view_instructor_workout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_instructor_workout`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_instructor_workout AS
SELECT 
    i.id AS instructor_id,
    i.name AS instructor_name,
    w.id AS workout_id,
    w.name AS workout_name,
    w.description,
    w.number_of_days,
    w.duration
FROM instructor i
JOIN workout w ON i.id = w.instructor_id
ORDER BY i.id, w.id;

-- -----------------------------------------------------
-- View `easytrainer`.`view_training_type_statistics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_training_type_statistics`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_training_type_statistics AS
SELECT 
    t.name AS type_name,
    COUNT(DISTINCT eht.exercise_id) AS exercise_count,
    COUNT(DISTINCT rht.routine_id) AS routine_count,
    COUNT(DISTINCT wht.workout_id) AS workout_count
FROM type t
LEFT JOIN exercise_has_type eht ON t.id = eht.type_id
LEFT JOIN routine_has_type rht ON t.id = rht.type_id
LEFT JOIN workout_has_type wht ON t.id = wht.type_id
GROUP BY t.id;

-- -----------------------------------------------------
-- View `easytrainer`.`view_exercise_by_goals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_exercise_by_goals`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_exercise_by_goals AS
SELECT 
    g.id AS goal_id,
    g.name AS goal_name,
    e.id AS exercise_id,
    e.name AS exercise_name,
    e.description,
    e.body_part,
    e.duration,
    e.repetition,
    e.sets
FROM goal g
JOIN exercise_has_goal ehg ON g.id = ehg.goal_id
JOIN exercise e ON ehg.exercise_id = e.id
ORDER BY g.name, e.name;

-- -----------------------------------------------------
-- View `easytrainer`.`view_exercise_by_modality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easytrainer`.`view_exercise_by_modality`;
USE `easytrainer`;
CREATE OR REPLACE VIEW view_exercise_by_modality AS
SELECT 
    m.id AS modality_id,
    m.name AS modality_name,
    l.name AS level_name,
    e.id AS exercise_id,
    e.name AS exercise_name,
    e.body_part,
    e.repetition,
    e.sets,
    e.duration
FROM modality m
JOIN exercise_has_modality ehm ON m.id = ehm.modality_id
JOIN exercise e ON ehm.exercise_id = e.id
LEFT JOIN level l ON e.level_id = l.id
ORDER BY m.name, level_name, e.name;
USE `easytrainer`;

DELIMITER $$
USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_level`
AFTER INSERT ON `level` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_level_main` (
        `level_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_level_content` (
        `log_level_main_level_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_level`
AFTER UPDATE ON `level` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_level_main` 
        WHERE `level_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_level_main`
    SET `current_revision` = new_revision
    WHERE `level_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_level_content` (
        `log_level_main_level_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_level`
AFTER DELETE ON `level` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_level_content` (
        `log_level_main_level_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_level_main` WHERE `level_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_instructor`
AFTER INSERT ON `instructor` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_instructor_main` (
        `instructor_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_instructor_content` (
        `log_instructor_main_instructor_id`,
        `revision`,
        `status`,
        `name`,
        `email`,
        `mobile_number`,
        `birthday`,
        `gender`,
        `password`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.email,
        NEW.mobile_number,
        NEW.birthday,
        NEW.gender,
        NEW.password,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_instructor`
AFTER UPDATE ON `instructor` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_instructor_main` 
        WHERE `instructor_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_instructor_main`
    SET `current_revision` = new_revision
    WHERE `instructor_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_instructor_content` (
        `log_instructor_main_instructor_id`,
        `revision`,
        `status`,
        `name`,
        `email`,
        `mobile_number`,
        `birthday`,
        `gender`,
        `password`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.email,
        NEW.mobile_number,
        NEW.birthday,
        NEW.gender,
        NEW.password,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_instructor`
AFTER DELETE ON `instructor` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_instructor_content` (
        `log_instructor_main_instructor_id`,
        `revision`,
        `status`,
        `name`,
        `email`,
        `mobile_number`,
        `birthday`,
        `gender`,
        `password`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_instructor_main` WHERE `instructor_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.email,
        OLD.mobile_number,
        OLD.birthday,
        OLD.gender,
        OLD.password,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_user`
AFTER INSERT ON `user` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_main` (
        `user_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_user_content` (
        `log_user_main_user_id`,
        `revision`,
        `status`,
        `name`,
        `email`,
        `mobile_number`,
        `birthday`,
        `weight`,
        `height`,
        `gender`,
        `password`,
        `level_id`,
        `instructor_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.email,
        NEW.mobile_number,
        NEW.birthday,
        NEW.weight,
        NEW.height,
        NEW.gender,
        NEW.password,
        NEW.level_id,
        NEW.instructor_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_user`
AFTER UPDATE ON `user` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_user_main` 
        WHERE `user_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_user_main`
    SET `current_revision` = new_revision
    WHERE `user_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_user_content` (
        `log_user_main_user_id`,
        `revision`,
        `status`,
        `name`,
        `email`,
        `mobile_number`,
        `birthday`,
        `weight`,
        `height`,
        `gender`,
        `password`,
        `level_id`,
        `instructor_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.email,
        NEW.mobile_number,
        NEW.birthday,
        NEW.weight,
        NEW.height,
        NEW.gender,
        NEW.password,
        NEW.level_id,
        NEW.instructor_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_user`
AFTER DELETE ON `user` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_content` (
        `log_user_main_user_id`,
        `revision`,
        `status`,
        `name`,
        `email`,
        `mobile_number`,
        `birthday`,
        `weight`,
        `height`,
        `gender`,
        `password`,
        `level_id`,
        `instructor_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_user_main` WHERE `user_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.email,
        OLD.mobile_number,
        OLD.birthday,
        OLD.weight,
        OLD.height,
        OLD.gender,
        OLD.password,
        OLD.level_id,
        OLD.instructor_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_goal`
AFTER INSERT ON `goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_goal_main` (
        `goal_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_goal_content` (
        `log_goal_main_goal_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_goal`
AFTER UPDATE ON `goal` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_goal_main` 
        WHERE `goal_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_goal_main`
    SET `current_revision` = new_revision
    WHERE `goal_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_goal_content` (
        `log_goal_main_goal_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_goal`
AFTER DELETE ON `goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_goal_content` (
        `log_goal_main_goal_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_goal_main` WHERE `goal_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_user_has_goal`
AFTER INSERT ON `user_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_has_goal_main` (
        `user_id`,
        `goal_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.user_id,
        NEW.goal_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_user_has_goal_content` (
        `log_user_has_goal_main_user_id`,
        `log_user_has_goal_main_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.user_id,
        NEW.goal_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_user_has_goal`
AFTER DELETE ON `user_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_has_goal_content` (
        `log_user_has_goal_main_user_id`,
        `log_user_has_goal_main_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.user_id,
        OLD.goal_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_user_has_goal_main`
         WHERE `user_id` = OLD.user_id AND `goal_id` = OLD.goal_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_type`
AFTER INSERT ON `type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_type_main` (
        `type_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_type_content` (
        `log_type_main_type_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_type`
AFTER UPDATE ON `type` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_type_main` 
        WHERE `type_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_type_main`
    SET `current_revision` = new_revision
    WHERE `type_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_type_content` (
        `log_type_main_type_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_type`
AFTER DELETE ON `type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_type_content` (
        `log_type_main_type_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_type_main` WHERE `type_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_modality`
AFTER INSERT ON `modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_modality_main` (
        `modality_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_modality_content` (
        `log_modality_main_modality_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_modality`
AFTER UPDATE ON `modality` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_modality_main` 
        WHERE `modality_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_modality_main`
    SET `current_revision` = new_revision
    WHERE `modality_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_modality_content` (
        `log_modality_main_modality_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_modality`
AFTER DELETE ON `modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_modality_content` (
        `log_modality_main_modality_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_modality_main` WHERE `modality_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_hashtag`
AFTER INSERT ON `hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_hashtag_main` (
        `hashtag_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_hashtag_content` (
        `log_hashtag_main_hashtag_id`,
        `revision`,
        `status`,
        `name`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_hashtag`
AFTER UPDATE ON `hashtag` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_hashtag_main` 
        WHERE `hashtag_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_hashtag_main`
    SET `current_revision` = new_revision
    WHERE `hashtag_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_hashtag_content` (
        `log_hashtag_main_hashtag_id`,
        `revision`,
        `status`,
        `name`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_hashtag`
AFTER DELETE ON `hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_hashtag_content` (
        `log_hashtag_main_hashtag_id`,
        `revision`,
        `status`,
        `name`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_hashtag_main` WHERE `hashtag_id` = OLD.id) + 1,
        0,
        OLD.name,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise`
AFTER INSERT ON `exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_main` (
        `exercise_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_content` (
        `log_exercise_main_exercise_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `equipment`,
        `duration`,
        `repetition`,
        `sets`,
        `rest_time`,
        `body_part`,
        `video_url`,
        `image_url`,
        `steps`,
        `contraindications`,
        `safety_tips`,
        `common_mistakes`,
        `indicated_for`,
        `calories_burned_estimate`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.description,
        NEW.equipment,
        NEW.duration,
        NEW.repetition,
        NEW.sets,
        NEW.rest_time,
        NEW.body_part,
        NEW.video_url,
        NEW.image_url,
        NEW.steps,
        NEW.contraindications,
        NEW.safety_tips,
        NEW.common_mistakes,
        NEW.indicated_for,
        NEW.calories_burned_estimate,
        NEW.instructor_id,
        NEW.level_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_exercise`
AFTER UPDATE ON `exercise` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_exercise_main` 
        WHERE `exercise_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_exercise_main`
    SET `current_revision` = new_revision
    WHERE `exercise_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_exercise_content` (
        `log_exercise_main_exercise_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `equipment`,
        `duration`,
        `repetition`,
        `sets`,
        `rest_time`,
        `body_part`,
        `video_url`,
        `image_url`,
        `steps`,
        `contraindications`,
        `safety_tips`,
        `common_mistakes`,
        `indicated_for`,
        `calories_burned_estimate`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.description,
        NEW.equipment,
        NEW.duration,
        NEW.repetition,
        NEW.sets,
        NEW.rest_time,
        NEW.body_part,
        NEW.video_url,
        NEW.image_url,
        NEW.steps,
        NEW.contraindications,
        NEW.safety_tips,
        NEW.common_mistakes,
        NEW.indicated_for,
        NEW.calories_burned_estimate,
        NEW.instructor_id,
        NEW.level_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise`
AFTER DELETE ON `exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_content` (
        `log_exercise_main_exercise_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `equipment`,
        `duration`,
        `repetition`,
        `sets`,
        `rest_time`,
        `body_part`,
        `video_url`,
        `image_url`,
        `steps`,
        `contraindications`,
        `safety_tips`,
        `common_mistakes`,
        `indicated_for`,
        `calories_burned_estimate`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_main` WHERE `exercise_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        OLD.equipment,
        OLD.duration,
        OLD.repetition,
        OLD.sets,
        OLD.rest_time,
        OLD.body_part,
        OLD.video_url,
        OLD.image_url,
        OLD.steps,
        OLD.contraindications,
        OLD.safety_tips,
        OLD.common_mistakes,
        OLD.indicated_for,
        OLD.calories_burned_estimate,
        OLD.instructor_id,
        OLD.level_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_goal`
AFTER INSERT ON `exercise_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_goal_main` (
        `exercise_id`,
        `goal_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.goal_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_goal_content` (
        `log_exercise_has_goal_exercise_id`,
        `log_exercise_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.goal_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_goal`
AFTER DELETE ON `exercise_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_goal_content` (
        `log_exercise_has_goal_exercise_id`,
        `log_exercise_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.goal_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_goal_main`
         WHERE exercise_id = OLD.exercise_id AND goal_id = OLD.goal_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_type`
AFTER INSERT ON `exercise_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_type_main` (
        `exercise_id`,
        `type_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.type_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_type_content` (
        `log_exercise_has_type_exercise_id`,
        `log_exercise_has_type_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.type_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_type`
AFTER DELETE ON `exercise_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_type_content` (
        `log_exercise_has_type_exercise_id`,
        `log_exercise_has_type_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.type_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_type_main`
         WHERE exercise_id = OLD.exercise_id AND type_id = OLD.type_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_modality`
AFTER INSERT ON `exercise_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_modality_main` (
        `exercise_id`,
        `modality_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.modality_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_modality_content` (
        `log_exercise_has_modality_exercise_id`,
        `log_exercise_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.modality_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_modality`
AFTER DELETE ON `exercise_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_modality_content` (
        `log_exercise_has_modality_exercise_id`,
        `log_exercise_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.modality_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_modality_main`
         WHERE exercise_id = OLD.exercise_id AND modality_id = OLD.modality_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_hashtag`
AFTER INSERT ON `exercise_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_hashtag_main` (
        `exercise_id`,
        `hashtag_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.hashtag_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_hashtag_content` (
        `log_exercise_has_hashtag_exercise_id`,
        `log_exercise_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.hashtag_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_hashtag`
AFTER DELETE ON `exercise_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_hashtag_content` (
        `log_exercise_has_hashtag_exercise_id`,
        `log_exercise_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.hashtag_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_hashtag_main`
         WHERE exercise_id = OLD.exercise_id AND hashtag_id = OLD.hashtag_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_exercise_has_variation`
AFTER INSERT ON `exercise_has_variation` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_variation_main` (
        `exercise_id`,
        `variation_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.variation_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_exercise_has_variation_content` (
        `log_exercise_has_variation_exercise_id`,
        `log_exercise_has_variation_variation_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.exercise_id,
        NEW.variation_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_exercise_has_variation`
AFTER DELETE ON `exercise_has_variation` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_exercise_has_variation_content` (
        `log_exercise_has_variation_exercise_id`,
        `log_exercise_has_variation_variation_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.exercise_id,
        OLD.variation_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_exercise_has_variation_main`
         WHERE exercise_id = OLD.exercise_id AND variation_id = OLD.variation_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine`
AFTER INSERT ON `routine` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_main` (
        `routine_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_routine_content` (
        `log_routine_main_routine_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `duration`,
        `image_url`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.description,
        NEW.duration,
        NEW.image_url,
        NEW.instructor_id,
        NEW.level_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_routine`
AFTER UPDATE ON `routine` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_routine_main` 
        WHERE `routine_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_routine_main`
    SET `current_revision` = new_revision
    WHERE `routine_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_routine_content` (
        `log_routine_main_routine_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `duration`,
        `image_url`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.description,
        NEW.duration,
        NEW.image_url,
        NEW.instructor_id,
        NEW.level_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine`
AFTER DELETE ON `routine` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_content` (
        `log_routine_main_routine_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `duration`,
        `image_url`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_main` WHERE `routine_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        OLD.duration,
        OLD.image_url,
        OLD.instructor_id,
        OLD.level_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine_has_goal`
AFTER INSERT ON `routine_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_goal_main` (
        `routine_id`,
        `goal_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.routine_id,
        NEW.goal_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_routine_has_goal_content` (
        `log_routine_has_goal_routine_id`,
        `log_routine_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.routine_id,
        NEW.goal_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_goal`
AFTER DELETE ON `routine_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_goal_content` (
        `log_routine_has_goal_routine_id`,
        `log_routine_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.routine_id,
        OLD.goal_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_goal_main`
         WHERE `routine_id` = OLD.routine_id AND `goal_id` = OLD.goal_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine_has_type`
AFTER INSERT ON `routine_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_type_main` (
        `routine_id`,
        `type_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.routine_id,
        NEW.type_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_routine_has_type_content` (
        `log_routine_has_type_routine_id`,
        `log_routine_has_type_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.routine_id,
        NEW.type_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_type`
AFTER DELETE ON `routine_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_type_content` (
        `log_routine_has_type_routine_id`,
        `log_routine_has_type_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.routine_id,
        OLD.type_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_type_main`
         WHERE `routine_id` = OLD.routine_id AND `type_id` = OLD.type_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine_has_modality`
AFTER INSERT ON `routine_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_modality_main` (
        `routine_id`,
        `modality_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.routine_id,
        NEW.modality_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_routine_has_modality_content` (
        `log_routine_has_modality_routine_id`,
        `log_routine_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.routine_id,
        NEW.modality_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_modality`
AFTER DELETE ON `routine_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_modality_content` (
        `log_routine_has_modality_routine_id`,
        `log_routine_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.routine_id,
        OLD.modality_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_modality_main`
         WHERE `routine_id` = OLD.routine_id AND `modality_id` = OLD.modality_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine_has_hashtag`
AFTER INSERT ON `routine_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_hashtag_main` (
        `routine_id`,
        `hashtag_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.routine_id,
        NEW.hashtag_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_routine_has_hashtag_content` (
        `log_routine_has_hashtag_routine_id`,
        `log_routine_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.routine_id,
        NEW.hashtag_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_hashtag`
AFTER DELETE ON `routine_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_hashtag_content` (
        `log_routine_has_hashtag_routine_id`,
        `log_routine_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.routine_id,
        OLD.hashtag_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_hashtag_main`
         WHERE routine_id = OLD.routine_id AND hashtag_id = OLD.hashtag_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_routine_has_exercise`
AFTER INSERT ON `routine_has_exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_exercise_main` (
        `routine_id`,
        `exercise_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.routine_id,
        NEW.exercise_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_routine_has_exercise_content` (
        `log_routine_has_exercise_routine_id`,
        `log_routine_has_exercise_exercise_id`,
        `revision`,
        `status`,
        `order`,
        `sets`,
        `reps`,
        `rest_time`,
        `note`,
        `day`,
        `week`,
        `is_optional`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.routine_id,
        NEW.exercise_id,
        1,
        1,
        NEW.order,
        NEW.sets,
        NEW.reps,
        NEW.rest_time,
        NEW.note,
        NEW.day,
        NEW.week,
        NEW.is_optional,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_routine_has_exercise`
AFTER UPDATE ON `routine_has_exercise` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;
    SET new_revision = (
        SELECT current_revision FROM `easytrainer_log`.`log_routine_has_exercise_main`
        WHERE routine_id = OLD.routine_id AND exercise_id = OLD.exercise_id
    ) + 1;

    UPDATE `easytrainer_log`.`log_routine_has_exercise_main`
    SET current_revision = new_revision
    WHERE routine_id = OLD.routine_id AND exercise_id = OLD.exercise_id;

    INSERT INTO `easytrainer_log`.`log_routine_has_exercise_content` (
        `log_routine_has_exercise_routine_id`,
        `log_routine_has_exercise_exercise_id`,
        `revision`,
        `status`,
        `order`,
        `sets`,
        `reps`,
        `rest_time`,
        `note`,
        `day`,
        `week`,
        `is_optional`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.routine_id,
        NEW.exercise_id,
        new_revision,
        1,
        NEW.order,
        NEW.sets,
        NEW.reps,
        NEW.rest_time,
        NEW.note,
        NEW.day,
        NEW.week,
        NEW.is_optional,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_routine_has_exercise`
AFTER DELETE ON `routine_has_exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_routine_has_exercise_content` (
        `log_routine_has_exercise_routine_id`,
        `log_routine_has_exercise_exercise_id`,
        `revision`,
        `status`,
        `order`,
        `sets`,
        `reps`,
        `rest_time`,
        `note`,
        `day`,
        `week`,
        `is_optional`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.routine_id,
        OLD.exercise_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_routine_has_exercise_main`
         WHERE routine_id = OLD.routine_id AND exercise_id = OLD.exercise_id) + 1,
        0,
        OLD.order,
        OLD.sets,
        OLD.reps,
        OLD.rest_time,
        OLD.note,
        OLD.day,
        OLD.week,
        OLD.is_optional,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout`
AFTER INSERT ON `workout` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_main` (
        `workout_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_content` (
        `log_workout_main_workout_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `number_of_days`,
        `image_url`,
        `duration`,
        `indoor`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        1,
        1,
        NEW.name,
        NEW.description,
        NEW.number_of_days,
        NEW.image_url,
        NEW.duration,
        NEW.indoor,
        NEW.instructor_id,
        NEW.level_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_au_workout`
AFTER UPDATE ON `workout` FOR EACH ROW
BEGIN
    DECLARE new_revision INT;

    SET new_revision = (
        SELECT current_revision 
        FROM `easytrainer_log`.`log_workout_main` 
        WHERE `workout_id` = OLD.id
    ) + 1;

    UPDATE `easytrainer_log`.`log_workout_main`
    SET `current_revision` = new_revision
    WHERE `workout_id` = OLD.id;

    INSERT INTO `easytrainer_log`.`log_workout_content` (
        `log_workout_main_workout_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `number_of_days`,
        `image_url`,
        `duration`,
        `indoor`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.id,
        new_revision,
        1,
        NEW.name,
        NEW.description,
        NEW.number_of_days,
        NEW.image_url,
        NEW.duration,
        NEW.indoor,
        NEW.instructor_id,
        NEW.level_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout`
AFTER DELETE ON `workout` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_content` (
        `log_workout_main_workout_id`,
        `revision`,
        `status`,
        `name`,
        `description`,
        `number_of_days`,
        `image_url`,
        `duration`,
        `indoor`,
        `instructor_id`,
        `level_id`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_main` WHERE `workout_id` = OLD.id) + 1,
        0,
        OLD.name,
        OLD.description,
        OLD.number_of_days,
        OLD.image_url,
        OLD.duration,
        OLD.indoor,
        OLD.instructor_id,
        OLD.level_id,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_goal`
AFTER INSERT ON `workout_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_goal_main` (
        `workout_id`,
        `goal_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.goal_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_goal_content` (
        `log_workout_has_goal_workout_id`,
        `log_workout_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.goal_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_goal`
AFTER DELETE ON `workout_has_goal` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_goal_content` (
        `log_workout_has_goal_workout_id`,
        `log_workout_has_goal_goal_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.goal_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_goal_main`
         WHERE `workout_id` = OLD.workout_id AND `goal_id` = OLD.goal_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_type`
AFTER INSERT ON `workout_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_type_main` (
        `workout_id`,
        `type_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.type_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_type_content` (
        `log_workout_has_type_main_workout_id`,
        `log_workout_has_type_main_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.type_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_type`
AFTER DELETE ON `workout_has_type` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_type_content` (
        `log_workout_has_type_main_workout_id`,
        `log_workout_has_type_main_type_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.type_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_type_main`
         WHERE `workout_id` = OLD.workout_id AND `type_id` = OLD.type_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_modality`
AFTER INSERT ON `workout_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_modality_main` (
        `workout_id`,
        `modality_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.modality_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_modality_content` (
        `log_workout_has_modality_workout_id`,
        `log_workout_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.modality_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_modality`
AFTER DELETE ON `workout_has_modality` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_modality_content` (
        `log_workout_has_modality_workout_id`,
        `log_workout_has_modality_modality_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.modality_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_modality_main`
         WHERE `workout_id` = OLD.workout_id AND `modality_id` = OLD.modality_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_hashtag`
AFTER INSERT ON `workout_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_hashtag_main` (
        `workout_id`,
        `hashtag_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.hashtag_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_hashtag_content` (
        `log_workout_has_hashtag_workout_id`,
        `log_workout_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.hashtag_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_hashtag`
AFTER DELETE ON `workout_has_hashtag` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_hashtag_content` (
        `log_workout_has_hashtag_workout_id`,
        `log_workout_has_hashtag_hashtag_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.hashtag_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_hashtag_main`
         WHERE `workout_id` = OLD.workout_id AND `hashtag_id` = OLD.hashtag_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_routine`
AFTER INSERT ON `workout_has_routine` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_routine_main` (
        `workout_id`,
        `routine_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.routine_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_routine_content` (
        `log_workout_has_routine_workout_id`,
        `log_workout_has_routine_routine_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.routine_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_routine`
AFTER DELETE ON `workout_has_routine` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_routine_content` (
        `log_workout_has_routine_workout_id`,
        `log_workout_has_routine_routine_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.routine_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_routine_main`
         WHERE `workout_id` = OLD.workout_id AND `routine_id` = OLD.routine_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_exercise`
AFTER INSERT ON `workout_has_exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_exercise_main` (
        `workout_id`,
        `exercise_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.exercise_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_exercise_content` (
        `log_workout_has_exercise_workout_id`,
        `log_workout_has_exercise_exercise_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.exercise_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_exercise`
AFTER DELETE ON `workout_has_exercise` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_exercise_content` (
        `log_workout_has_exercise_workout_id`,
        `log_workout_has_exercise_exercise_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.exercise_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_exercise_main`
         WHERE `workout_id` = OLD.workout_id AND `exercise_id` = OLD.exercise_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_workout_has_user`
AFTER INSERT ON `workout_has_user` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_user_main` (
        `workout_id`,
        `user_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.workout_id,
        NEW.user_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_workout_has_user_content` (
        `log_workout_has_user_workout_id`,
        `log_workout_has_user_user_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.workout_id,
        NEW.user_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_workout_has_user`
AFTER DELETE ON `workout_has_user` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_workout_has_user_content` (
        `log_workout_has_user_workout_id`,
        `log_workout_has_user_user_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.workout_id,
        OLD.user_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_workout_has_user_main`
         WHERE `workout_id` = OLD.workout_id AND `user_id` = OLD.user_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ai_user_has_instructor`
AFTER INSERT ON `user_has_instructor` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_has_instructor_main` (
        `user_id`,
        `instructor_id`,
        `current_revision`,
        `created_by`,
        `created_at`
    ) VALUES (
        NEW.user_id,
        NEW.instructor_id,
        1,
        @user_id,
        NOW()
    );

    INSERT INTO `easytrainer_log`.`log_user_has_instructor_content` (
        `log_user_has_instructor_main_user_id`,
        `log_user_has_instructor_main_instructor_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        NEW.user_id,
        NEW.instructor_id,
        1,
        1,
        @user_id,
        NOW()
    );
END;$$

USE `easytrainer`$$
CREATE DEFINER = CURRENT_USER TRIGGER `easytrainer`.`trg_log_ad_user_has_instructor`
AFTER DELETE ON `user_has_instructor` FOR EACH ROW
BEGIN
    INSERT INTO `easytrainer_log`.`log_user_has_instructor_content` (
        `log_user_has_instructor_main_user_id`,
        `log_user_has_instructor_main_instructor_id`,
        `revision`,
        `status`,
        `modified_by`,
        `modified_at`
    ) VALUES (
        OLD.user_id,
        OLD.instructor_id,
        (SELECT current_revision FROM `easytrainer_log`.`log_user_has_instructor_main`
         WHERE user_id = OLD.user_id AND instructor_id = OLD.instructor_id) + 1,
        0,
        @user_id,
        NOW()
    );
END;$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

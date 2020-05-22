-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema caninesandkooziesdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `caninesandkooziesdb` ;

-- -----------------------------------------------------
-- Schema caninesandkooziesdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `caninesandkooziesdb` DEFAULT CHARACTER SET utf8 ;
USE `caninesandkooziesdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(1000) NOT NULL,
  `city` VARCHAR(1000) NOT NULL,
  `state` VARCHAR(60) NOT NULL,
  `zip_code` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birth_date` DATE NOT NULL,
  `relationship_status` VARCHAR(45) NULL,
  `email` VARCHAR(1000) NOT NULL,
  `alcohol_preference` VARCHAR(1000) NULL,
  `picture_url` VARCHAR(8000) NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dog` ;

CREATE TABLE IF NOT EXISTS `dog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `breed` VARCHAR(1000) NOT NULL,
  `size` VARCHAR(1000) NOT NULL,
  `picture_url` VARCHAR(8000) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dog_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_dog_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venue` ;

CREATE TABLE IF NOT EXISTS `venue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(1000) NOT NULL,
  `alcohol_provided` TINYINT NOT NULL,
  `picture_url` VARCHAR(8000) NULL,
  `venue_link` VARCHAR(8000) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venue_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_venue_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(1000) NOT NULL,
  `event_date` DATE NOT NULL,
  `event_time` TIME NOT NULL,
  `dog_size_preference` VARCHAR(1000) NOT NULL,
  `single_only_preference` TINYINT NOT NULL DEFAULT 1,
  `picture_url` VARCHAR(8000) NULL,
  `description` VARCHAR(10000) NOT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL,
  `venue_id` INT NOT NULL,
  `creator_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_venue1_idx` (`venue_id` ASC),
  INDEX `fk_event_user1_idx` (`creator_id` ASC),
  CONSTRAINT `fk_event_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NOT NULL,
  `description` TEXT NOT NULL,
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_event1_idx` (`event_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_event` ;

CREATE TABLE IF NOT EXISTS `user_event` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `rating` INT NULL,
  INDEX `fk_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS caninekoozieuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'caninekoozieuser'@'localhost' IDENTIFIED BY 'caninekoozie';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'caninekoozieuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (1, '123 Main Street', 'Englewood', 'CO', 80110);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (2, '678 Venue Lane', 'Denver', 'CO', 80104);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (1, 'admin', 'admin', 1, NULL, 'admin', 'admin', '2020-01-01', NULL, 'admin@admin.com', NULL, NULL, '2020-01-01 10:10:10', '2020-01-01 10:10:10', 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (2, 'tabathaf', 'tabathaf', 1, NULL, 'Tabatha', 'Flores', '1991-03-18', 'married', 'tabatha.flores18@gmail.com', 'whiskey', NULL, '2020-05-22 11:23:00', NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dog`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (1, 'Baxter', 'Shihtzu', 'small', NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `venue` (`id`, `name`, `alcohol_provided`, `picture_url`, `venue_link`, `address_id`) VALUES (1, 'Sample Venue', 1, NULL, NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `event` (`id`, `name`, `event_date`, `event_time`, `dog_size_preference`, `single_only_preference`, `picture_url`, `description`, `create_date`, `update_date`, `venue_id`, `creator_id`) VALUES (1, 'Wine and Pup', '2020-06-01', '16:00:00 ', 'small', 1, NULL, 'Drink wine and bring pups', '2020-05-22', NULL, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `comment` (`id`, `create_date`, `description`, `event_id`, `user_id`) VALUES (1, '2020-05-22', 'can\'t wait!', 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (1, 1, 3);

COMMIT;


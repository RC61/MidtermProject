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
  `address_id` INT NULL,
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
  `event_date_time` DATETIME NOT NULL,
  `dog_size_preference` VARCHAR(1000) NOT NULL DEFAULT 'none',
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
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (3, '78 North Littleton Avenue', 'Littleton', 'CO', 80113);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (4, '98 Leper Way', 'Denver', 'CO', 80112);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (5, '767 Skill Distillery Road', 'Greenwood Village', 'CO', 80112);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (6, '1695 Platte Street', 'Denver', 'CO', 80202);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (7, '3563 Wazee Street\n', 'Denver', 'CO', 80216);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (8, '201 West Colfax Avenue', 'Denver', 'CO', 80202);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (9, '78 Maritime Way', 'Denver', 'CO', 80111);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (10, '119th Street', 'Chicago', 'IL', 60655);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (11, '128 Ocean Avenue', 'Lakewood', 'CO', 80108);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (12, '97 Spring Road', 'Colorado Springs', 'CO', 80101);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (13, '583 Green Road', 'Greenwood Village', 'CO', 80112);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (14, '78 Park Meadows Way', 'Lone Tree', 'CO', 80112);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (15, '63 Littleton Drive', 'Littleton', 'CO', 80109);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (16, '89 Colorado Boulevard', 'Denver', 'CO', 80108);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (17, '244 S Broadway', 'Denver', 'CO', 80209);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (1, 'admin', 'admin', 1, NULL, 'admin', 'admin', '2020-01-01', NULL, 'admin@admin.com', NULL, NULL, '2020-01-01 10:10:10', '2020-01-01 10:10:10', 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (2, 'tabathaf', 'tabathaf', 1, NULL, 'Tabatha', 'Flores', '1991-03-18', 'married', 'tabatha.flores18@gmail.com', 'wine', 'https://i.imgur.com/DF1CGhb.jpg?1', '2020-05-22 11:23:00', NULL, 2);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (3, 'aflo13', 'agathaf', 1, NULL, 'Agatha', 'Flores', '1988-12-13', 'in a relationship', 'aaf1213@gmail.com', 'wine', 'https://i.imgur.com/k1tJ5NY.jpg?1', '2020-05-22 11:56:00', NULL, 3);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (4, 'chadmichaelmurray', 'chadmurray', 1, NULL, 'Chad', 'Murray', '1981-08-24', 'married', 'chadmurry@gmail.com', 'beer', 'https://i.imgur.com/dzbpUJ1.jpg', '2020-05-22 13:14:00', NULL, 4);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (5, 'tpapp', 'tpapp', 1, NULL, 'Toni', 'Papp', '1991-07-14', 'single', 'tpapp@gmail.com', 'spirits', 'https://i.imgur.com/VxVV0kC.jpg', '2020-05-22 13:18:00', NULL, 5);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (6, 'docbrule', 'dbrule', 1, NULL, 'Steve', 'Brule', '1965-05-24', 'married', 'askdocbrule@yahoo.com', 'beer', 'https://i.imgur.com/qgvSWy7.png', '2020-05-27 09:52:00', NULL, 9);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (7, 'JonesBBQAndFootMassage', 'JonesBBQAndFootMassage', 1, NULL, 'Robert', 'Hines', '1970-01-17', 'married', 'jonesbbqandfoot@gmail.com', 'spirits', 'https://i.imgur.com/XmMd8v7.png', '2020-05-27 09:58:00', NULL, 10);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (8, 'rwasek', 'rwasek', 1, NULL, 'Rich', 'Wasek', '1990-01-29', 'single', 'rwasek@yahoo.com', 'beer', 'https://i.imgur.com/IathyS5.jpg', '2020-05-27 09:59:00', NULL, 11);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (9, 'javastevie', 'stevie', 1, NULL, 'Steve', 'Sharpe', '1985-03-04', 'single', 'ssharpe@gmail.com', 'beer', 'https://i.imgur.com/qk2eEyI.png?1', '2020-05-27 10:03:00', NULL, 12);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (10, 'javabeaniryna', 'javabean', 1, NULL, 'Iryna', 'Tretynk', '1990-09-03', 'single', 'itretynk@live.com', 'beer', 'https://i.imgur.com/Pt5tdgn.png?1', '2020-05-27 10:04:00', NULL, 13);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (11, 'ljops', 'ljopson', 1, NULL, 'Lauren', 'Jopson', '1992-02-01', 'single', 'ljopson@yahoo.com', 'beer', 'https://i.imgur.com/GcCIssl.png?1', '2020-05-27 10:16:00', NULL, 14);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (12, 'csanders', 'cawtney', 1, NULL, 'Courtney', 'Sanders', '1995-08-10', 'single', 'cawtney@gmail.com', 'spirits', 'https://i.imgur.com/aIk30qi.jpg', '2020-05-27 10:22:00', NULL, 15);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `birth_date`, `relationship_status`, `email`, `alcohol_preference`, `picture_url`, `create_date`, `update_date`, `address_id`) VALUES (13, 'arios', 'aldo', 1, NULL, 'Aldo', 'Rios', '1990-03-20', 'single', 'arios@yahoo.com', 'spirits', 'https://i.imgur.com/2d2lHp1.png?1', '2020-05-27 10:27:00', NULL, 16);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dog`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (1, 'Baxter', 'Shih Tzu', 'small', 'https://i.imgur.com/B4eo1gU.jpg', 2);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (2, 'Max', 'Bichon Frise', 'medium', 'https://i.imgur.com/fLZSNCU.jpg', 3);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (3, 'Jasper', 'Golder Retriever', 'large', 'https://i.imgur.com/h9lsQaz.jpg', 4);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (4, 'Luca', 'Bichon Frise', 'small', 'https://i.imgur.com/iuD7ZRb.jpg', 5);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (5, 'Ziki', 'Pekingese', 'small', 'https://i.imgur.com/xee9XFG.jpg', 5);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (6, 'Bubba', 'Welsh Corgi', 'small', 'https://i.imgur.com/4gDOEab.jpg', 6);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (7, 'Scrappy', 'Shih Tzu', 'small', 'https://i1.wp.com/shihtzutime.com/wp-content/uploads/23409-41b7ca.jpeg?resize=1239%2C640&ssl=1', 7);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (8, 'Chloe', 'Labrador Retriever', 'large', 'https://i.imgur.com/xjIkbfL.jpg', 8);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (9, 'Scout', 'Beagle', 'medium', NULL, 9);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (10, 'Princess', 'Pug', 'small', 'https://i.imgur.com/9YJt9p4.jpg', 10);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (11, 'Zink', 'Australian Shepherd', 'medium', 'https://i.imgur.com/H9Qn8BS.jpg', 11);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (12, 'Gizmo', 'Labrador Retriever', 'large', 'https://i.imgur.com/Bq2doof.jpg', 12);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (13, 'Taz', 'Chihuahua', 'small', 'https://i.imgur.com/qgevhLy.png?1', 13);
INSERT INTO `dog` (`id`, `name`, `breed`, `size`, `picture_url`, `user_id`) VALUES (14, 'Athena', 'Mix', 'large', 'https://i.imgur.com/XOZKXU0.png?1', 13);

COMMIT;


-- -----------------------------------------------------
-- Data for table `venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `venue` (`id`, `name`, `alcohol_provided`, `picture_url`, `venue_link`, `address_id`) VALUES (1, 'Sample Venue', 1, NULL, NULL, 2);
INSERT INTO `venue` (`id`, `name`, `alcohol_provided`, `picture_url`, `venue_link`, `address_id`) VALUES (2, 'Denver Beer Co', 1, 'https://i.imgur.com/OhmqRiF.png', 'https://denverbeerco.com/', 6);
INSERT INTO `venue` (`id`, `name`, `alcohol_provided`, `picture_url`, `venue_link`, `address_id`) VALUES (3, 'Bigsby\'s Folly', 1, 'https://i.imgur.com/Cya5ijB.png', 'https://www.bigsbysfolly.com/', 7);
INSERT INTO `venue` (`id`, `name`, `alcohol_provided`, `picture_url`, `venue_link`, `address_id`) VALUES (4, 'Wellshire Golf Course', 0, 'https://i.imgur.com/lKV4Zv0.jpg', 'https://www.cityofdenvergolf.com/wellshire', 8);
INSERT INTO `venue` (`id`, `name`, `alcohol_provided`, `picture_url`, `venue_link`, `address_id`) VALUES (5, 'Denver Distillery', 1, 'https://i.imgur.com/Pt4HVeK.jpg', 'https://www.denverdistillery.com/', 17);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `event` (`id`, `name`, `event_date_time`, `dog_size_preference`, `single_only_preference`, `picture_url`, `description`, `create_date`, `update_date`, `venue_id`, `creator_id`) VALUES (1, 'Wine and Pup', '2020-06-01 16:00:00', 'small', 1, 'https://i.imgur.com/dw0ZYa3.jpg', 'Drink wine and bring pups', '2020-05-22 12:00:00', NULL, 1, 2);
INSERT INTO `event` (`id`, `name`, `event_date_time`, `dog_size_preference`, `single_only_preference`, `picture_url`, `description`, `create_date`, `update_date`, `venue_id`, `creator_id`) VALUES (2, 'iPupAs', '2020-07-01 17:00:00', 'none', 0, 'https://i.imgur.com/vTI4oDl.jpg', 'Bring your pups (all welcome) and join us in an ipa socialization event! Bring a friend to join in on the fun. There will be small snacks provided in the venue. All riverblend IPAs and well drinks will be 50% off.', '2020-05-22 14:00:00', NULL, 2, 3);
INSERT INTO `event` (`id`, `name`, `event_date_time`, `dog_size_preference`, `single_only_preference`, `picture_url`, `description`, `create_date`, `update_date`, `venue_id`, `creator_id`) VALUES (3, 'Doggy Labor Day', '2020-09-07 14:00:00', 'none', 0, 'https://i.imgur.com/LzMS8Mu.jpg', 'Labor Day is around the corner and we have a special event for you. Spend some time golfing and sunbathing in the beautiful Wellshire Golf Course. Bring Your Own Drinks and Bring Your Own Dogs and we will bring the snacks.', '2020-05-22 14:06:00', NULL, 4, 4);
INSERT INTO `event` (`id`, `name`, `event_date_time`, `dog_size_preference`, `single_only_preference`, `picture_url`, `description`, `create_date`, `update_date`, `venue_id`, `creator_id`) VALUES (4, 'Memorial Day And Dogs', '2020-05-25 13:00:00', 'none', 0, 'https://i.imgur.com/9fQcQrZ.jpg', 'Honor those who have served our country in our annual barbeque at the wonderful Wellshire Golf Course. This will be BYOB only and the barbeque food and snacks will keep coming all afternoon. We will pause food services at 18:00 as we will have a special firework show starting at approximately 20:30. During this break of time, we ask that you bring your doggos back home so they are not around the fire works as we do not want to scare them.  ', '2020-04-01 12:00:00', NULL, 4, 3);
INSERT INTO `event` (`id`, `name`, `event_date_time`, `dog_size_preference`, `single_only_preference`, `picture_url`, `description`, `create_date`, `update_date`, `venue_id`, `creator_id`) VALUES (5, 'Barktoberfest', '2020-10-05 14:00:00', 'none', 0, 'https://i.imgur.com/DoiKmAd.png', 'You know what time it is - it\'s our annual Barktoberfest! Please be aware that the whole strip will hosting Oktoberfest but our sponsored bar for Oktoberfest, Denver Beer CO, is the only bar on the strip that allows your pups! We will host our annual pup dress up contest as well at approximately 17:00. See you there!', '2020-05-27 11:23:00', NULL, 2, 4);
INSERT INTO `event` (`id`, `name`, `event_date_time`, `dog_size_preference`, `single_only_preference`, `picture_url`, `description`, `create_date`, `update_date`, `venue_id`, `creator_id`) VALUES (6, 'Belated Cinco De Mayo and Tab Birthday!', '2020-07-11 12:00:00', 'small', 0, 'https://i.imgur.com/O6eAiEK.jpg?1', 'So my birthday could not happen this year due to quarantine - but I am rescheduling it to July 11th and will also include Cinco De Mayo as this was cancelled too! I will be hosting at the Denver Distillery where margaritas will be on the house! If you\'re coming I ask to bring your small pups only - as Baxter is currently wearing a cone and he tends to only want to play with big dogs. See you guys there!', '2020-05-27 11:35:00', NULL, 5, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `comment` (`id`, `create_date`, `description`, `event_id`, `user_id`) VALUES (1, '2020-05-22 12:00:00', 'can\'t wait!', 1, 2);
INSERT INTO `comment` (`id`, `create_date`, `description`, `event_id`, `user_id`) VALUES (2, '2020-05-22 14:30:00', 'So excited to bring Baxter. Max is coming too!', 2, 2);
INSERT INTO `comment` (`id`, `create_date`, `description`, `event_id`, `user_id`) VALUES (3, '2020-05-22 14:30:00', 'I\'m not going Chad your dog ripped my pants last time', 3, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `caninesandkooziesdb`;
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (1, 1, 3);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (2, 2, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (3, 2, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (4, 3, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (5, 3, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (2, 3, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (3, 6, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (2, 4, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (2, 2, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (3, 1, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (3, 6, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (3, 5, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (6, 4, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (6, 5, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (7, 4, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (7, 5, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (8, 6, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (9, 6, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (10, 6, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (11, 4, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (12, 4, NULL);
INSERT INTO `user_event` (`user_id`, `event_id`, `rating`) VALUES (13, 3, NULL);

COMMIT;


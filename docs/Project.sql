-- MySQL Script generated by MySQL Workbench
-- Friday 28 September 2018 07:56:32 PM IST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema AM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AM` DEFAULT CHARACTER SET utf8 ;
USE `AM` ;

-- -----------------------------------------------------
-- Table `AM`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AM`.`User` (
  `id` CHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `phone` CHAR(11) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AM`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AM`.`Student` (
  `id` CHAR(16) NOT NULL,
  `interests` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `AM`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AM`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AM`.`Event` (
  `eventId` VARCHAR(45) NOT NULL,
  `eventName` VARCHAR(255) NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `introduction` VARCHAR(255) NULL,
  PRIMARY KEY (`eventId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AM`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AM`.`Admin` (
  `id` CHAR(16) NOT NULL,
  `eventId` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `AM`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `eventID`
    FOREIGN KEY (`eventId`)
    REFERENCES `AM`.`Event` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AM`.`SuperAdmin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AM`.`SuperAdmin` (
  `id` CHAR(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `AM`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AM`.`Interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AM`.`Interest` (
  `idInterest` VARCHAR(45) NOT NULL,
  `interestsName` VARCHAR(45) NULL,
  PRIMARY KEY (`idInterest`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AM`.`Event_has_Interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AM`.`Event_has_Interest` (
  `Event_eventId` VARCHAR(45) NOT NULL,
  `Interest_idInterest` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Event_eventId`, `Interest_idInterest`),
  CONSTRAINT `fk_Event_has_Interest_Event1`
    FOREIGN KEY (`Event_eventId`)
    REFERENCES `AM`.`Event` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_has_Interest_Interest1`
    FOREIGN KEY (`Interest_idInterest`)
    REFERENCES `AM`.`Interest` (`idInterest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AM`.`Student_has_Event_has_Interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AM`.`Student_has_Event_has_Interest` (
  `Student_id` CHAR(16) NOT NULL,
  `Event_has_Interest_Event_eventId` VARCHAR(45) NOT NULL,
  `Event_has_Interest_Interest_idInterest` VARCHAR(45) NOT NULL,
  `managed/participate` BIT(1) NULL,
  `reqaccept/decline` BIT(1) NULL,
  PRIMARY KEY (`Student_id`, `Event_has_Interest_Event_eventId`, `Event_has_Interest_Interest_idInterest`),
  CONSTRAINT `fk_Student_has_Event_has_Interest_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `AM`.`Student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Event_has_Interest_Event_has_Interest1`
    FOREIGN KEY (`Event_has_Interest_Event_eventId` , `Event_has_Interest_Interest_idInterest`)
    REFERENCES `AM`.`Event_has_Interest` (`Event_eventId` , `Interest_idInterest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AM`.`Student_has_Interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AM`.`Student_has_Interest` (
  `Student_id` CHAR(16) NOT NULL,
  `Interest_idInterest` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Student_id`, `Interest_idInterest`),
  CONSTRAINT `fk_Student_has_Interest1_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `AM`.`Student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Interest1_Interest1`
    FOREIGN KEY (`Interest_idInterest`)
    REFERENCES `AM`.`Interest` (`idInterest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `AM`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `AM`;
INSERT INTO `AM`.`User` (`id`, `email`, `password`, `firstName`, `lastName`, `phone`) VALUES ('I2K16102145', 'amol@gmail.com', '123456', 'Amol', 'Patil', '7979797979');
INSERT INTO `AM`.`User` (`id`, `email`, `password`, `firstName`, `lastName`, `phone`) VALUES ('I2K16102146', 'anuj@gmail.com', '123456', 'Anuj', 'Pande', '8989898989');
INSERT INTO `AM`.`User` (`id`, `email`, `password`, `firstName`, `lastName`, `phone`) VALUES ('I2K16102147', 'parth@gmail.com', '123456', 'Parth', 'Kulkarni', '9898989898');
INSERT INTO `AM`.`User` (`id`, `email`, `password`, `firstName`, `lastName`, `phone`) VALUES ('I2K16102148', 'adarsh@gmail.com', '123456', 'Adarsh', 'Patel', '8787878787');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AM`.`Student`
-- -----------------------------------------------------
START TRANSACTION;
USE `AM`;
INSERT INTO `AM`.`Student` (`id`, `interests`) VALUES ('I2K16102145', 'football');
INSERT INTO `AM`.`Student` (`id`, `interests`) VALUES ('I2K16102146', 'football');
INSERT INTO `AM`.`Student` (`id`, `interests`) VALUES ('I2K16102147', 'cricket');
INSERT INTO `AM`.`Student` (`id`, `interests`) VALUES ('I2K16102148', 'carrom');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AM`.`Event`
-- -----------------------------------------------------
START TRANSACTION;
USE `AM`;
INSERT INTO `AM`.`Event` (`eventId`, `eventName`, `startDate`, `endDate`, `introduction`) VALUES ('spor', 'sports', '2019-02-20', '2019-02-24', 'Take part');
INSERT INTO `AM`.`Event` (`eventId`, `eventName`, `startDate`, `endDate`, `introduction`) VALUES ('addi', 'addiction', '2019-01-20', '2019-01-24', 'enjoy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AM`.`Admin`
-- -----------------------------------------------------
START TRANSACTION;
USE `AM`;
INSERT INTO `AM`.`Admin` (`id`, `eventId`) VALUES ('I2K16102145', 'Spor');
INSERT INTO `AM`.`Admin` (`id`, `eventId`) VALUES ('I2K16102146', 'addi');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AM`.`SuperAdmin`
-- -----------------------------------------------------
START TRANSACTION;
USE `AM`;
INSERT INTO `AM`.`SuperAdmin` (`id`) VALUES ('I2K16102145');
INSERT INTO `AM`.`SuperAdmin` (`id`) VALUES ('I2K16102146');
INSERT INTO `AM`.`SuperAdmin` (`id`) VALUES ('I2K16102147');
INSERT INTO `AM`.`SuperAdmin` (`id`) VALUES ('I2K16102148');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AM`.`Interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `AM`;
INSERT INTO `AM`.`Interest` (`idInterest`, `interestsName`) VALUES ('sfoo', 'football');
INSERT INTO `AM`.`Interest` (`idInterest`, `interestsName`) VALUES ('scri', 'cricket');
INSERT INTO `AM`.`Interest` (`idInterest`, `interestsName`) VALUES ('scar', 'carrom');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AM`.`Event_has_Interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `AM`;
INSERT INTO `AM`.`Event_has_Interest` (`Event_eventId`, `Interest_idInterest`) VALUES ('spor', 'sfoo');
INSERT INTO `AM`.`Event_has_Interest` (`Event_eventId`, `Interest_idInterest`) VALUES ('spor', 'scar');
INSERT INTO `AM`.`Event_has_Interest` (`Event_eventId`, `Interest_idInterest`) VALUES ('spor', 'scri');
INSERT INTO `AM`.`Event_has_Interest` (`Event_eventId`, `Interest_idInterest`) VALUES ('addi', 'adan');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AM`.`Student_has_Event_has_Interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `AM`;
INSERT INTO `AM`.`Student_has_Event_has_Interest` (`Student_id`, `Event_has_Interest_Event_eventId`, `Event_has_Interest_Interest_idInterest`, `managed/participate`, `reqaccept/decline`) VALUES ('I2K16102145', 'spor', 'sfoo', 1, 1);
INSERT INTO `AM`.`Student_has_Event_has_Interest` (`Student_id`, `Event_has_Interest_Event_eventId`, `Event_has_Interest_Interest_idInterest`, `managed/participate`, `reqaccept/decline`) VALUES ('I2K16102146', 'spor', 'sfoo', 0, 1);
INSERT INTO `AM`.`Student_has_Event_has_Interest` (`Student_id`, `Event_has_Interest_Event_eventId`, `Event_has_Interest_Interest_idInterest`, `managed/participate`, `reqaccept/decline`) VALUES ('I2K16102147', 'spor', 'scri', 1, 0);
INSERT INTO `AM`.`Student_has_Event_has_Interest` (`Student_id`, `Event_has_Interest_Event_eventId`, `Event_has_Interest_Interest_idInterest`, `managed/participate`, `reqaccept/decline`) VALUES ('I2K16102148', 'spor', 'scar', 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `AM`.`Student_has_Interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `AM`;
INSERT INTO `AM`.`Student_has_Interest` (`Student_id`, `Interest_idInterest`) VALUES ('I2K16102145', 'sfoo');
INSERT INTO `AM`.`Student_has_Interest` (`Student_id`, `Interest_idInterest`) VALUES ('I2K16102146', 'sfoo');
INSERT INTO `AM`.`Student_has_Interest` (`Student_id`, `Interest_idInterest`) VALUES ('I2K16102147', 'scri');
INSERT INTO `AM`.`Student_has_Interest` (`Student_id`, `Interest_idInterest`) VALUES ('I2K16102148', 'scar');

COMMIT;


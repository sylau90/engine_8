SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `engine_number_8` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `engine_number_8` ;

-- -----------------------------------------------------
-- Table `engine_number_8`.`image`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `engine_number_8`.`image` (
  `image_ID` INT NOT NULL AUTO_INCREMENT ,
  `image` VARCHAR(45) NULL ,
  `image_url` VARCHAR(45) NULL ,
  `image_description` VARCHAR(45) NULL ,
  `created_date` VARCHAR(45) NULL ,
  `uploaded_date` VARCHAR(45) NULL ,
  PRIMARY KEY (`image_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engine_number_8`.`records`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `engine_number_8`.`records` (
  `QR_code` INT NOT NULL ,
  `Record_name` VARCHAR(45) NOT NULL ,
  `record_description` VARCHAR(45) NOT NULL ,
  `record_date` DATETIME NULL ,
  `latest_update_date` VARCHAR(45) NULL ,
  PRIMARY KEY (`QR_code`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engine_number_8`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `engine_number_8`.`user` (
  `user_id` INT NOT NULL ,
  `user_name` VARCHAR(45) NULL ,
  `user_password` VARCHAR(45) NULL ,
  `user_email` VARCHAR(45) NULL ,
  `create_date` DATETIME NULL ,
  `updated_date` DATETIME NULL ,
  PRIMARY KEY (`user_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engine_number_8`.`user_library`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `engine_number_8`.`user_library` (
  `user_user_id` INT NOT NULL ,
  `QR_code` INT NOT NULL ,
  PRIMARY KEY (`user_user_id`, `QR_code`) ,
  INDEX `fk_user_library_records1_idx` (`QR_code` ASC) ,
  CONSTRAINT `fk_user_library_user1`
    FOREIGN KEY (`user_user_id` )
    REFERENCES `engine_number_8`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_library_records1`
    FOREIGN KEY (`QR_code` )
    REFERENCES `engine_number_8`.`records` (`QR_code` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engine_number_8`.`image_record`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `engine_number_8`.`image_record` (
  `records_QR_code` INT NOT NULL ,
  `image_image_ID` INT NOT NULL ,
  PRIMARY KEY (`records_QR_code`, `image_image_ID`) ,
  INDEX `fk_image_record_image1_idx` (`image_image_ID` ASC) ,
  CONSTRAINT `fk_image_record_records1`
    FOREIGN KEY (`records_QR_code` )
    REFERENCES `engine_number_8`.`records` (`QR_code` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_record_image1`
    FOREIGN KEY (`image_image_ID` )
    REFERENCES `engine_number_8`.`image` (`image_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `engine_number_8` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

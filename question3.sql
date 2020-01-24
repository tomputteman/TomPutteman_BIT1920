-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `idpatient` INT NOT NULL,
  `patient_gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `idsyndrome` INT NOT NULL,
  `syndrome_name` VARCHAR(45) NULL,
  `syndrome_description` VARCHAR(45) NULL,
  PRIMARY KEY (`idsyndrome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diagnosis` (
  `iddiagnosis` INT NOT NULL,
  `diagnosis_patient` INT NOT NULL,
  `diagnosis_syndrome` INT NULL,
  `diagnosis_age` INT NOT NULL,
  PRIMARY KEY (`iddiagnosis`),
  INDEX `fk_diagnosis_1_idx` (`diagnosis_patient` ASC) VISIBLE,
  INDEX `fk_diagnosis_2_idx` (`diagnosis_syndrome` ASC) VISIBLE,
  CONSTRAINT `fk_diagnosis_1`
    FOREIGN KEY (`diagnosis_patient`)
    REFERENCES `mydb`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnosis_2`
    FOREIGN KEY (`diagnosis_syndrome`)
    REFERENCES `mydb`.`syndrome` (`idsyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Chromosome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Chromosome` (
  `Chromosome_id` INT NOT NULL,
  `start` INT NOT NULL,
  `end` INT NOT NULL,
  PRIMARY KEY (`Chromosome_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `idgene` INT NOT NULL,
  `gene_name` VARCHAR(45) NOT NULL,
  `gene_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mutation` (
  `idmutation` INT NOT NULL,
  `syndrome_mutation` INT NULL,
  `mutation_chromosome` INT NULL,
  `mutation_gene` INT NULL,
  PRIMARY KEY (`idmutation`),
  INDEX `fk_mutation_1_idx` (`syndrome_mutation` ASC) VISIBLE,
  INDEX `fk_mutation_2_idx` (`mutation_chromosome` ASC) VISIBLE,
  INDEX `fk_mutation_3_idx` (`mutation_gene` ASC) VISIBLE,
  CONSTRAINT `fk_mutation_1`
    FOREIGN KEY (`syndrome_mutation`)
    REFERENCES `mydb`.`syndrome` (`idsyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mutation_2`
    FOREIGN KEY (`mutation_chromosome`)
    REFERENCES `mydb`.`Chromosome` (`Chromosome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mutation_3`
    FOREIGN KEY (`mutation_gene`)
    REFERENCES `mydb`.`Gene` (`idgene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

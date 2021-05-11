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
-- Table `mydb`.`TipoUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoUsuario` (
  `idTipoUsuario` INT NOT NULL,
  `nombreTipoUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`),
  UNIQUE INDEX `idTipoUsuario_UNIQUE` (`idTipoUsuario` ASC) VISIBLE,
  UNIQUE INDEX `nombreTipoUsuario_UNIQUE` (`nombreTipoUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `TipoUsuario_idTipoUsuario` INT NOT NULL,
  INDEX `fk_table1_TipoUsuario_idx` (`TipoUsuario_idTipoUsuario` ASC) VISIBLE,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_table1_TipoUsuario`
    FOREIGN KEY (`TipoUsuario_idTipoUsuario`)
    REFERENCES `mydb`.`TipoUsuario` (`idTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Materia` (
  `idMateria` INT NOT NULL,
  `materia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMateria`),
  UNIQUE INDEX `materia_UNIQUE` (`materia` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario_Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_Materia` (
  `Usuario_idUsuario` INT NOT NULL,
  `Materia_idMateria` INT NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Materia_idMateria`),
  INDEX `fk_Usuario_has_Materia_Materia1_idx` (`Materia_idMateria` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Materia_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Materia_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Materia_Materia1`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `mydb`.`Materia` (`idMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carrera` (
  `idCarrera` INT NOT NULL,
  `carrera` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCarrera`),
  UNIQUE INDEX `idCarrera_UNIQUE` (`idCarrera` ASC) VISIBLE,
  UNIQUE INDEX `carrera_UNIQUE` (`carrera` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Universidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Universidad` (
  `idUniversidad` INT NOT NULL,
  `nombreUniversidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUniversidad`),
  UNIQUE INDEX `idUniversidad_UNIQUE` (`idUniversidad` ASC) VISIBLE,
  UNIQUE INDEX `nombreUniversidad_UNIQUE` (`nombreUniversidad` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Universidad_has_Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Universidad_has_Carrera` (
  `Universidad_idUniversidad` INT NOT NULL,
  `Carrera_idCarrera` INT NOT NULL,
  PRIMARY KEY (`Universidad_idUniversidad`, `Carrera_idCarrera`),
  INDEX `fk_Universidad_has_Carrera_Carrera1_idx` (`Carrera_idCarrera` ASC) VISIBLE,
  INDEX `fk_Universidad_has_Carrera_Universidad1_idx` (`Universidad_idUniversidad` ASC) VISIBLE,
  CONSTRAINT `fk_Universidad_has_Carrera_Universidad1`
    FOREIGN KEY (`Universidad_idUniversidad`)
    REFERENCES `mydb`.`Universidad` (`idUniversidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Universidad_has_Carrera_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `mydb`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carrera_has_Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carrera_has_Materia` (
  `Carrera_idCarrera` INT NOT NULL,
  `Materia_idMateria` INT NOT NULL,
  PRIMARY KEY (`Carrera_idCarrera`, `Materia_idMateria`),
  INDEX `fk_Carrera_has_Materia_Materia1_idx` (`Materia_idMateria` ASC) VISIBLE,
  INDEX `fk_Carrera_has_Materia_Carrera1_idx` (`Carrera_idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_Carrera_has_Materia_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `mydb`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carrera_has_Materia_Materia1`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `mydb`.`Materia` (`idMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Idioma` (
  `idIdioma` INT NOT NULL,
  `idioma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idIdioma`),
  UNIQUE INDEX `idIdioma_UNIQUE` (`idIdioma` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MateriaEstudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MateriaEstudio` (
  `idMateriaEstudio` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `Idioma_idIdioma` INT NOT NULL,
  `Materia_idMateria` INT NOT NULL,
  UNIQUE INDEX `idMateriaEstudio_UNIQUE` (`idMateriaEstudio` ASC) VISIBLE,
  PRIMARY KEY (`idMateriaEstudio`),
  INDEX `fk_MateriaEstudio_Idioma1_idx` (`Idioma_idIdioma` ASC) VISIBLE,
  INDEX `fk_MateriaEstudio_Materia1_idx` (`Materia_idMateria` ASC) VISIBLE,
  CONSTRAINT `fk_MateriaEstudio_Idioma1`
    FOREIGN KEY (`Idioma_idIdioma`)
    REFERENCES `mydb`.`Idioma` (`idIdioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MateriaEstudio_Materia1`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `mydb`.`Materia` (`idMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema optimum_stock_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optimum_stock_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optimum_stock_management` DEFAULT CHARACTER SET utf8 ;
USE `optimum_stock_management` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `address` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` VARCHAR(31) NULL DEFAULT NULL,
  `LINE1` VARCHAR(255) NULL DEFAULT NULL,
  `LINE2` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `business_entity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business_entity` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` VARCHAR(31) NULL DEFAULT NULL,
  `CREATION_DATE` DATETIME NOT NULL,
  `CREATOR` VARCHAR(255) NULL DEFAULT NULL,
  `LAST_UPDATE_DATE` DATETIME NOT NULL,
  `UPDATER` VARCHAR(255) NULL DEFAULT NULL,
  `VERSION` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 106
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `business_entity_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business_entity_address` (
  `ADDRESS_ID` BIGINT(20) NOT NULL,
  `ADDRESS_TYPE` VARCHAR(255) NOT NULL,
  `BUSINESS_ENTITY_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  UNIQUE INDEX `UNQ_BUSINESS_ENTITY_ADDRESS_0` (`BUSINESS_ENTITY_ID` ASC, `ADDRESS_TYPE` ASC),
  CONSTRAINT `FK_BUSINESS_ENTITY_ADDRESS_ADDRESS_ID`
    FOREIGN KEY (`ADDRESS_ID`)
    REFERENCES `address` (`ID`),
  CONSTRAINT `FK_BUSINESS_ENTITY_ADDRESS_BUSINESS_ENTITY_ID`
    FOREIGN KEY (`BUSINESS_ENTITY_ID`)
    REFERENCES `business_entity` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `email` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` VARCHAR(31) NULL DEFAULT NULL,
  `LINE` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `business_entity_email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business_entity_email` (
  `EMAIL_ID` BIGINT(20) NOT NULL,
  `EMAIL_TYPE` VARCHAR(255) NOT NULL,
  `BUSINESS_ENTITY_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`EMAIL_ID`),
  UNIQUE INDEX `UNQ_BUSINESS_ENTITY_EMAIL_0` (`BUSINESS_ENTITY_ID` ASC, `EMAIL_TYPE` ASC),
  CONSTRAINT `FK_BUSINESS_ENTITY_EMAIL_BUSINESS_ENTITY_ID`
    FOREIGN KEY (`BUSINESS_ENTITY_ID`)
    REFERENCES `business_entity` (`ID`),
  CONSTRAINT `FK_BUSINESS_ENTITY_EMAIL_EMAIL_ID`
    FOREIGN KEY (`EMAIL_ID`)
    REFERENCES `email` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fax`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fax` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` VARCHAR(31) NULL DEFAULT NULL,
  `LINE` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `business_entity_fax`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business_entity_fax` (
  `FAX_ID` BIGINT(20) NOT NULL,
  `FAX_TYPE` VARCHAR(255) NOT NULL,
  `BUSINESS_ENTITY_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`FAX_ID`),
  UNIQUE INDEX `UNQ_BUSINESS_ENTITY_FAX_0` (`BUSINESS_ENTITY_ID` ASC, `FAX_TYPE` ASC),
  CONSTRAINT `FK_BUSINESS_ENTITY_FAX_BUSINESS_ENTITY_ID`
    FOREIGN KEY (`BUSINESS_ENTITY_ID`)
    REFERENCES `business_entity` (`ID`),
  CONSTRAINT `FK_BUSINESS_ENTITY_FAX_FAX_ID`
    FOREIGN KEY (`FAX_ID`)
    REFERENCES `fax` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phone` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` VARCHAR(31) NULL DEFAULT NULL,
  `LINE` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `business_entity_phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business_entity_phone` (
  `PHONE_ID` BIGINT(20) NOT NULL,
  `PHONE_TYPE` VARCHAR(255) NOT NULL,
  `BUSINESS_ENTITY_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`PHONE_ID`),
  UNIQUE INDEX `UNQ_BUSINESS_ENTITY_PHONE_0` (`BUSINESS_ENTITY_ID` ASC, `PHONE_TYPE` ASC),
  CONSTRAINT `FK_BUSINESS_ENTITY_PHONE_BUSINESS_ENTITY_ID`
    FOREIGN KEY (`BUSINESS_ENTITY_ID`)
    REFERENCES `business_entity` (`ID`),
  CONSTRAINT `FK_BUSINESS_ENTITY_PHONE_PHONE_ID`
    FOREIGN KEY (`PHONE_ID`)
    REFERENCES `phone` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact` (
  `ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_CONTACT_ID`
    FOREIGN KEY (`ID`)
    REFERENCES `business_entity` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `document` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` VARCHAR(31) NULL DEFAULT NULL,
  `CREATION_DATE` DATETIME NOT NULL,
  `CREATOR` VARCHAR(255) NULL DEFAULT NULL,
  `LAST_UPDATE_DATE` DATETIME NOT NULL,
  `REFERENCE_NUMBER` VARCHAR(255) NOT NULL,
  `UPDATER` VARCHAR(255) NULL DEFAULT NULL,
  `VERSION` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 119
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `CREATION_DATE` DATETIME NOT NULL,
  `CREATOR` VARCHAR(255) NULL DEFAULT NULL,
  `DESCRIPTION` VARCHAR(255) NULL DEFAULT NULL,
  `LAST_UPDATE_DATE` DATETIME NOT NULL,
  `NAME` VARCHAR(255) NOT NULL,
  `UPDATER` VARCHAR(255) NULL DEFAULT NULL,
  `VERSION` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `UNQ_LOCATION_0` (`NAME` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 113
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `person` (
  `ID` BIGINT(20) NOT NULL,
  `BIRTH_DATE` DATE NULL DEFAULT NULL,
  `FIRST_NAME` VARCHAR(255) NULL DEFAULT NULL,
  `GENDER` VARCHAR(255) NOT NULL,
  `LAST_NAME` VARCHAR(255) NOT NULL,
  `MIDDLE_NAME` VARCHAR(255) NULL DEFAULT NULL,
  `NAME_STYLE` TINYINT(1) NOT NULL DEFAULT '0',
  `SUFFIX` VARCHAR(255) NULL DEFAULT NULL,
  `TITLE` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_PERSON_ID`
    FOREIGN KEY (`ID`)
    REFERENCES `business_entity` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `CREATION_DATE` DATETIME NOT NULL,
  `CREATOR` VARCHAR(255) NULL DEFAULT NULL,
  `CRITICAL_STOCK_DATE` DATE NULL DEFAULT NULL,
  `DESCRIPTION` VARCHAR(255) NULL DEFAULT NULL,
  `LAST_UPDATE_DATE` DATETIME NOT NULL,
  `NAME` VARCHAR(255) NOT NULL,
  `NUMBER` VARCHAR(255) NOT NULL,
  `REORDER_POINT` SMALLINT(6) NOT NULL,
  `SAFETY_STOCK_LEVEL` SMALLINT(6) NOT NULL,
  `STOCK_COVER` SMALLINT(6) NOT NULL,
  `UPDATER` VARCHAR(255) NULL DEFAULT NULL,
  `VERSION` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `UNQ_PRODUCT_0` (`NUMBER` ASC),
  UNIQUE INDEX `UNQ_PRODUCT_1` (`NAME` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 104
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `product_inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_inventory` (
  `CREATION_DATE` DATETIME NOT NULL,
  `CREATOR` VARCHAR(255) NULL DEFAULT NULL,
  `LAST_UPDATE_DATE` DATETIME NOT NULL,
  `QUANTITY` SMALLINT(6) NOT NULL,
  `UPDATER` VARCHAR(255) NULL DEFAULT NULL,
  `VERSION` BIGINT(20) NULL DEFAULT NULL,
  `PRODUCT_ID` BIGINT(20) NOT NULL,
  `LOCATION_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`, `LOCATION_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `product_issue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_issue` (
  `ID` BIGINT(20) NOT NULL,
  `LOCATION_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_PRODUCT_ISSUE_LOCATION_ID` (`LOCATION_ID` ASC),
  CONSTRAINT `FK_PRODUCT_ISSUE_ID`
    FOREIGN KEY (`ID`)
    REFERENCES `document` (`ID`),
  CONSTRAINT `FK_PRODUCT_ISSUE_LOCATION_ID`
    FOREIGN KEY (`LOCATION_ID`)
    REFERENCES `location` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `product_issue_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_issue_detail` (
  `DETAIL_ID` INT(11) NOT NULL,
  `QUANTITY` SMALLINT(6) NOT NULL,
  `PRODUCT_ID` BIGINT(20) NOT NULL,
  `PRODUCT_ISSUE_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`DETAIL_ID`, `PRODUCT_ISSUE_ID`),
  INDEX `FK_PRODUCT_ISSUE_DETAIL_PRODUCT_ID` (`PRODUCT_ID` ASC),
  INDEX `FK_PRODUCT_ISSUE_DETAIL_PRODUCT_ISSUE_ID` (`PRODUCT_ISSUE_ID` ASC),
  CONSTRAINT `FK_PRODUCT_ISSUE_DETAIL_PRODUCT_ID`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `product` (`ID`),
  CONSTRAINT `FK_PRODUCT_ISSUE_DETAIL_PRODUCT_ISSUE_ID`
    FOREIGN KEY (`PRODUCT_ISSUE_ID`)
    REFERENCES `document` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `product_receipt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_receipt` (
  `ID` BIGINT(20) NOT NULL,
  `LOCATION_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_PRODUCT_RECEIPT_LOCATION_ID` (`LOCATION_ID` ASC),
  CONSTRAINT `FK_PRODUCT_RECEIPT_ID`
    FOREIGN KEY (`ID`)
    REFERENCES `document` (`ID`),
  CONSTRAINT `FK_PRODUCT_RECEIPT_LOCATION_ID`
    FOREIGN KEY (`LOCATION_ID`)
    REFERENCES `location` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `product_receipt_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_receipt_detail` (
  `DETAIL_ID` INT(11) NOT NULL,
  `QUANTITY` SMALLINT(6) NOT NULL,
  `PRODUCT_ID` BIGINT(20) NOT NULL,
  `PRODUCT_RECEIPT_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`DETAIL_ID`, `PRODUCT_RECEIPT_ID`),
  INDEX `FK_PRODUCT_RECEIPT_DETAIL_PRODUCT_ID` (`PRODUCT_ID` ASC),
  INDEX `FK_PRODUCT_RECEIPT_DETAIL_PRODUCT_RECEIPT_ID` (`PRODUCT_RECEIPT_ID` ASC),
  CONSTRAINT `FK_PRODUCT_RECEIPT_DETAIL_PRODUCT_ID`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `product` (`ID`),
  CONSTRAINT `FK_PRODUCT_RECEIPT_DETAIL_PRODUCT_RECEIPT_ID`
    FOREIGN KEY (`PRODUCT_RECEIPT_ID`)
    REFERENCES `document` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ship_method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ship_method` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `CREATION_DATE` DATETIME NOT NULL,
  `CREATOR` VARCHAR(255) NULL DEFAULT NULL,
  `DESCRIPTION` VARCHAR(255) NULL DEFAULT NULL,
  `LAST_UPDATE_DATE` DATETIME NOT NULL,
  `NAME` VARCHAR(255) NOT NULL,
  `UPDATER` VARCHAR(255) NULL DEFAULT NULL,
  `VERSION` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `UNQ_SHIP_METHOD_0` (`NAME` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 106
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `purchase_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `purchase_order` (
  `ID` BIGINT(20) NOT NULL,
  `FREIGHT` DOUBLE NOT NULL,
  `REVISION_NUMBER` TINYINT(4) NULL DEFAULT NULL,
  `SHIP_DATE` DATE NULL DEFAULT NULL,
  `STATUS` VARCHAR(255) NOT NULL,
  `TAX_AMOUNT` DOUBLE NOT NULL,
  `LOCATION_ID` BIGINT(20) NULL DEFAULT NULL,
  `SHIP_METHOD_ID` BIGINT(20) NULL DEFAULT NULL,
  `VENDOR_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_PURCHASE_ORDER_SHIP_METHOD_ID` (`SHIP_METHOD_ID` ASC),
  INDEX `FK_PURCHASE_ORDER_LOCATION_ID` (`LOCATION_ID` ASC),
  INDEX `FK_PURCHASE_ORDER_VENDOR_ID` (`VENDOR_ID` ASC),
  CONSTRAINT `FK_PURCHASE_ORDER_ID`
    FOREIGN KEY (`ID`)
    REFERENCES `document` (`ID`),
  CONSTRAINT `FK_PURCHASE_ORDER_LOCATION_ID`
    FOREIGN KEY (`LOCATION_ID`)
    REFERENCES `location` (`ID`),
  CONSTRAINT `FK_PURCHASE_ORDER_SHIP_METHOD_ID`
    FOREIGN KEY (`SHIP_METHOD_ID`)
    REFERENCES `ship_method` (`ID`),
  CONSTRAINT `FK_PURCHASE_ORDER_VENDOR_ID`
    FOREIGN KEY (`VENDOR_ID`)
    REFERENCES `business_entity` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `purchase_order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `purchase_order_detail` (
  `DETAIL_ID` INT(11) NOT NULL,
  `DUE_DATE` DATE NOT NULL,
  `ORDERED_QUANTITY` SMALLINT(6) NOT NULL,
  `RECEIVED_QUANTITY` SMALLINT(6) NOT NULL,
  `REJECTED_QUANTITY` SMALLINT(6) NOT NULL,
  `UNIT_PRICE` DOUBLE NOT NULL,
  `PRODUCT_ID` BIGINT(20) NOT NULL,
  `PURCHASE_ORDER_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`DETAIL_ID`, `PURCHASE_ORDER_ID`),
  INDEX `FK_PURCHASE_ORDER_DETAIL_PRODUCT_ID` (`PRODUCT_ID` ASC),
  INDEX `FK_PURCHASE_ORDER_DETAIL_PURCHASE_ORDER_ID` (`PURCHASE_ORDER_ID` ASC),
  CONSTRAINT `FK_PURCHASE_ORDER_DETAIL_PRODUCT_ID`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `product` (`ID`),
  CONSTRAINT `FK_PURCHASE_ORDER_DETAIL_PURCHASE_ORDER_ID`
    FOREIGN KEY (`PURCHASE_ORDER_ID`)
    REFERENCES `document` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shipping_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shipping_order` (
  `ID` BIGINT(20) NOT NULL,
  `DELIVERY_DATE` DATE NULL DEFAULT NULL,
  `SHIP_DATE` DATE NULL DEFAULT NULL,
  `STATUS` VARCHAR(255) NOT NULL,
  `SHIP_METHOD_ID` BIGINT(20) NOT NULL,
  `SOURCE_LOCATION_ID` BIGINT(20) NOT NULL,
  `TARGET_LOCATION_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_SHIPPING_ORDER_SHIP_METHOD_ID` (`SHIP_METHOD_ID` ASC),
  INDEX `FK_SHIPPING_ORDER_SOURCE_LOCATION_ID` (`SOURCE_LOCATION_ID` ASC),
  INDEX `FK_SHIPPING_ORDER_TARGET_LOCATION_ID` (`TARGET_LOCATION_ID` ASC),
  CONSTRAINT `FK_SHIPPING_ORDER_ID`
    FOREIGN KEY (`ID`)
    REFERENCES `document` (`ID`),
  CONSTRAINT `FK_SHIPPING_ORDER_SHIP_METHOD_ID`
    FOREIGN KEY (`SHIP_METHOD_ID`)
    REFERENCES `ship_method` (`ID`),
  CONSTRAINT `FK_SHIPPING_ORDER_SOURCE_LOCATION_ID`
    FOREIGN KEY (`SOURCE_LOCATION_ID`)
    REFERENCES `location` (`ID`),
  CONSTRAINT `FK_SHIPPING_ORDER_TARGET_LOCATION_ID`
    FOREIGN KEY (`TARGET_LOCATION_ID`)
    REFERENCES `location` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shipping_order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shipping_order_detail` (
  `DETAIL_ID` INT(11) NOT NULL,
  `RECEIVED_QUANTITY` SMALLINT(6) NOT NULL,
  `REJECTED_QUANTITY` SMALLINT(6) NOT NULL,
  `SHIPPED_QUANTITY` SMALLINT(6) NOT NULL,
  `PRODUCT_ID` BIGINT(20) NOT NULL,
  `SHIPPING_ORDER_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`DETAIL_ID`, `SHIPPING_ORDER_ID`),
  INDEX `FK_SHIPPING_ORDER_DETAIL_SHIPPING_ORDER_ID` (`SHIPPING_ORDER_ID` ASC),
  INDEX `FK_SHIPPING_ORDER_DETAIL_PRODUCT_ID` (`PRODUCT_ID` ASC),
  CONSTRAINT `FK_SHIPPING_ORDER_DETAIL_PRODUCT_ID`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `product` (`ID`),
  CONSTRAINT `FK_SHIPPING_ORDER_DETAIL_SHIPPING_ORDER_ID`
    FOREIGN KEY (`SHIPPING_ORDER_ID`)
    REFERENCES `document` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendor` (
  `ID` BIGINT(20) NOT NULL,
  `ACCOUNT_NUMBER` VARCHAR(255) NOT NULL,
  `IS_ACTIVE` TINYINT(1) NOT NULL DEFAULT '0',
  `NAME` VARCHAR(255) NOT NULL,
  `PURCHASING_URL` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `UNQ_VENDOR_0` (`ACCOUNT_NUMBER` ASC),
  CONSTRAINT `FK_VENDOR_ID`
    FOREIGN KEY (`ID`)
    REFERENCES `business_entity` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

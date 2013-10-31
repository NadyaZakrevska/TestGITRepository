SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

SHOW WARNINGS;

DROP SCHEMA IF EXISTS `moysport`;
CREATE SCHEMA IF NOT EXISTS `mysport` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mysport` ;

-- -----------------------------------------------------
-- Table `USERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `USERS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `USERS` (
  `IDUSER` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID ������������, ���������� ����, ������������� ������������.\n����������� ���������� �������� ��� �������� �����������, ������� ��� ����������� �� ����������� \nTable Description: � ������� USER ����������� �� ������ ������ ������������. �� ������� ����������� ����������� ������ ������� ������. ',
  `ISBOT` INT(11) NULL DEFAULT NULL COMMENT '������������� ��������� ������ ��������� ������ �� ���� ��� \n����������� �������������� �������� � ������� ��������� �������� ������������ ������ �����������. ������� ��� �����������, ������������ �� ���������. ',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID �����������, ���� ���� �������� ������ �����������\n����������� �������������� �������� � ������� ��������� �������� ������������ ������ �����������. ������� ��� ����������� �� �����������.',
  `NICKNAME` VARCHAR(60) NULL COMMENT '��������. �������� ��� ��� ������� ��� ���������� ��� ��������� ��� ���������� ����� ������� \n�������� ��� �����������. ������� ���� ��������� �� ���������� ���������� ������������, ����� � �� ���� ���� ������',
  `FIRSTNAME` VARCHAR(60) NULL DEFAULT NULL COMMENT '���\n�������� ��� �����������. ',
  `LASTNAME` VARCHAR(60) NULL DEFAULT NULL COMMENT '�������\n�������� ��� �����������. ',
  `MIDDLENAME` VARCHAR(60) NULL DEFAULT NULL COMMENT '��-�������\n�������� ��� �����������.',
  `MPHONE` VARCHAR(15) NULL DEFAULT NULL COMMENT '����� ����������� ��������\n�������� ��� �����������.',
  `EMAIL` VARCHAR(100) NULL COMMENT 'e-mail\n�������� ��� �����������. ������� ���� ���������� ���������� ������������',
  `ISEMAILVERIFIED` INT(11) NULL DEFAULT NULL COMMENT '������ �� e-mail � �������\n����������� �������������� �������� ��� ����������� ������� ������',
  `SOCIALNETWORKLOGIN` VARCHAR(100) NULL DEFAULT NULL COMMENT '���� � �������� ��� ��������� �����\n�������� ��� �����������. ',
  `SOCIALNETWORKTYPE` VARCHAR(45) NULL DEFAULT NULL COMMENT '��� ��������� ����� (��������� �������� ������� � ���������)\n�������� ��� �����������. ',
  `BIRTHDATE` DATETIME NULL DEFAULT NULL COMMENT '���� ����������\n�������� ��� �����������. ',
  `PERFMARK` DECIMAL(8,2) NULL DEFAULT NULL COMMENT '������ ��������\n����������� ���������� ��������. ������� ��� �����������. ³����������� �� ���������',
  `REPMARK` DECIMAL(8,2) NULL DEFAULT NULL COMMENT '������ ���������\n����������� ���������� ��������. ������� ��� �����������. ³����������� �� ���������',
  `POSITIVEREP` INT(11) NULL DEFAULT NULL COMMENT '���� ��������� ���������\n����������� ���������� ��������. ������� ��� ����������� �� �����������',
  `NEGATIVEREP` INT(11) NULL DEFAULT NULL COMMENT '���� ��������� ���������\n����������� ���������� ��������. ������� ��� ����������� �� �����������',
  `STATUS` VARCHAR(45) NULL DEFAULT NULL COMMENT '������ ������� ������\n�������������� ����������� ��� �������� ��� ��������� �����������. ������� ��� �����������.',
  `LOCALE` VARCHAR(45) NULL DEFAULT NULL COMMENT '���� ����������\n�������� ��� �����������. ',
  `GMT` VARCHAR(8) NULL DEFAULT NULL COMMENT '������� ���� � ������ (-n�n)\n�������� ��� �����������. ',
  `PWD` VARCHAR(64) NULL DEFAULT NULL COMMENT '������ �����������\n�������� ��� ����������� ����� ������ ����� ���� ������. �� ��������� �� ������������. ����������� ������� �����������.',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT '���� ��������� ��������� ������',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '������� ���� ���� ��������� ������',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'ID ����������� ���� ����� ��� �����������\n����������� �������������� ��������\n',
  PRIMARY KEY (`IDUSER`))
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;
SHOW WARNINGS;
CREATE UNIQUE INDEX `NICKNAME_UNIQUE` ON `USERS` (`NICKNAME` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `EMAIL_UNIQUE` ON `USERS` (`EMAIL` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `LOCATIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LOCATIONS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `LOCATIONS` (
  `IDLOCATION` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID �������, ���������� ������������� �������\nTable Description: ������� LOCATIONS �������� ������ ��� �������: �����, �������������� ����������, ���-�� ���������, ��������. ���������� ��� �������� ������ �����������.',
  `NAME` VARCHAR(60) NULL COMMENT '��� �������',
  `COUNTRY` VARCHAR(60) NULL DEFAULT NULL COMMENT '������ �������',
  `REGION` VARCHAR(60) NULL DEFAULT NULL COMMENT '������� �������',
  `CITY` VARCHAR(60) NULL DEFAULT NULL COMMENT '����� �������',
  `DISTRICT` VARCHAR(60) NULL DEFAULT NULL COMMENT '����� ������ �������',
  `STREET` VARCHAR(60) NULL DEFAULT NULL COMMENT '����� �������',
  `BUILDING` VARCHAR(60) NULL DEFAULT NULL COMMENT '����� ����',
  `ZIP` VARCHAR(60) NULL DEFAULT NULL COMMENT '�������� ������ �������',
  `DESCRIPTION` VARCHAR(1000) NULL DEFAULT NULL COMMENT '��������� �������� �������',
  `CONTACTS` VARCHAR(60) NULL DEFAULT NULL COMMENT '���, ����� �������� ��������� �������',
  `HTTPLINK` VARCHAR(512) NULL DEFAULT NULL COMMENT '������ �� ���� �������',
  `STATUS` VARCHAR(45) NULL DEFAULT NULL COMMENT '������ ������� (�����, �����)',
  `CHECKIN` INT(11) NULL DEFAULT NULL COMMENT '���������� ����������� ����������� �� ������ �������',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID ��������� �������',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT '���� � ����� �������� �������',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����� ���������� ���������� �������',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'ID ������������, ������� �������� ��������� ��������� �������',
  `TAG` VARCHAR(100) NULL DEFAULT NULL COMMENT '��� � �������: ���� ������ � ��.',
  `LATITUDE` VARCHAR(20) NULL DEFAULT NULL COMMENT '�������������� ������',
  `LONGTITUDE` VARCHAR(20) NULL DEFAULT NULL COMMENT '�������������� �������',
  `PIC` VARCHAR(60) NULL DEFAULT NULL COMMENT '������ �� ����',
  PRIMARY KEY (`IDLOCATION`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;
CREATE INDEX `IDCREATEDBY_idx` ON `LOCATIONS` (`IDCREATEDBY` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `NAME_UNIQUE` ON `LOCATIONS` (`NAME` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `SPORTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SPORTS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `SPORTS` (
  `IDSPORT` INT(11) NOT NULL AUTO_INCREMENT COMMENT '��������� ����.\n����������� ���������� �������� ��� �������� ������ ������, ������� ��� ����������� �� �����������\nTable Description: �������  SPORTS ���������� ��� ��������� �������� ���� ������ (������� ���� ������).',
  `NAME` VARCHAR(100) NULL COMMENT '����� ���� ������\n�� �������� ��� �����������, �������� ��� �����������',
  `RULES` VARCHAR(2000) NULL DEFAULT NULL COMMENT '�������\n�� �������� ��� �����������, �������� ��� �����������',
  `HTTPLINK` VARCHAR(512) NULL DEFAULT NULL COMMENT '��������� �� ������� � �����������\n�� �������� ��� �����������, �������� ��� �����������',
  PRIMARY KEY (`IDSPORT`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `EVENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EVENTS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `EVENTS` (
  `IDEVENT` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID �����������\nTable Description: ������� Events �������� �������� ��� �������� �����������. �� ������� ����������� � EventGames ��������: idevent,idlocation,name,idsport\n��������: ��� ����������� mark,markcnt - ��� ������� ���� ��� ������?!',
  `NAME` VARCHAR(255) NULL COMMENT '�������� �������',
  `IDLOCATION` INT(11) NULL DEFAULT NULL COMMENT 'ID �������',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID ��������� �����������',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'ID ������������ ����������� �����������\n',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����� ���������� ���������� �����������',
  `MARK` INT(11) NULL DEFAULT NULL COMMENT '������ ����������',
  `MARKCNT` INT(11) NULL DEFAULT NULL COMMENT '���������� ������',
  `IDSPORT` INT(11) NULL DEFAULT NULL COMMENT 'ID ���� ������',
  PRIMARY KEY (`IDEVENT`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;
CREATE UNIQUE INDEX `NAME_UNIQUE` ON `EVENTS` (`NAME` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `EVENTGAMES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EVENTGAMES` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `EVENTGAMES` (
  `IDGAME` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID �������/����\nTable Description: ������� EVENTGAMES �������� ����������� �������� � ������� EVENTS. ���������� ��� ���������� ������ ��� �� ����� ������� ',
  `IDEVENT` INT(11) NULL COMMENT 'ID �������(������� ���� � EVENTS)',
  `STARTTIME` DATETIME NULL COMMENT '����� ������ �������',
  `ENDTIME` DATETIME NULL COMMENT '����� ��������� �������',
  `COMMENTS` VARCHAR(500) NULL DEFAULT NULL COMMENT '����������� � �������',
  PRIMARY KEY (`IDGAME`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `GAMEPARTIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GAMEPARTIES` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `GAMEPARTIES` (
  `IDGP` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID GameParty.\nTable Description: ������� � ������� �������� ��������� ����, ������������� ������� ���� ��� �� ������������ �� ����',
  `IDGAME` INT(11) NULL COMMENT 'ID ����/�����������\n',
  `IDUSER` INT(11) NULL COMMENT 'ID ��������� ����',
  `VISITED` INT(11) NULL COMMENT '���� ���������',
  `MARK` INT(11) NULL DEFAULT NULL COMMENT '������',
  `IDTEAM` INT(11) NULL DEFAULT NULL COMMENT '����� ������� �� �����������',
  PRIMARY KEY (`IDGP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `GAMERATINGS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GAMERATINGS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `GAMERATINGS` (
  `IDGR` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID (primary key)\nTable Description: ������� GAMERATINGS �������� ������ ��������� �������� ���� �����, �� ������������ ����. ������� � EventGames �� IDGAME.',
  `IDGAME` INT(11) NULL COMMENT 'ID ����/�������',
  `IDRANKEDPLAYER` INT(11) NULL DEFAULT NULL COMMENT 'Id ������������ ������',
  `IDESTIMATEPLAYER` INT(11) NULL DEFAULT NULL COMMENT 'Id ������ ������� ���������',
  `ESTIMATEDATE` DATETIME NULL DEFAULT NULL COMMENT '���� ������',
  `ESTIMATECOMMENT` VARCHAR(500) NULL COMMENT '����������� ������ ������� ���������',
  PRIMARY KEY (`IDGR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TRAININGPLAN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TRAININGPLAN` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `TRAININGPLAN` (
  `IDTP` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID ��������� ����, �������� ������������� ����� ���������.\n����������� ���������� ��������\nTable Description:  ���� ���������. ����������� ������������ �� ������ ��� ������.',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID ����������� ���� ������� ���� ���������\n����������� �������������� ��������\n',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT '���� ��������� ����� ���������\n����������� �������������� ��������\n',
  `NAMETP` VARCHAR(60) NULL DEFAULT NULL COMMENT '����� ����� ���������\n�������������� ������������\n',
  `DESCRIPTION` VARCHAR(1000) NULL DEFAULT NULL COMMENT '���� (��������� ����������)\n�������������� ������������\n',
  `IDSPORT` INT(11) NULL DEFAULT NULL COMMENT 'ID ���� ������\n�������������� ������������\n',
  `TARGET` INT(11) NULL DEFAULT NULL COMMENT 'ֳ��, ������� ������������ ���������\n�������������� ������������\n',
  `IDLOCATION` INT(11) NULL DEFAULT NULL COMMENT 'ID �������. ̳��� ���������� ���������(Locations)\n�������������� ������������\n',
  `DOW1` INT(11) NULL DEFAULT NULL COMMENT '���� ����� ��, � ������� ��������� ��������� ���������� (true/false) �� ����������� false\n�������������� ������������',
  `DOW2` INT(11) NULL DEFAULT NULL COMMENT '���� ����� ��, � ������� ��������� ��������� ���������� (true/false) �� ����������� false\n�������������� ������������',
  `DOW3` INT(11) NULL DEFAULT NULL COMMENT '���� ����� ��, � ������� ��������� ��������� ���������� (true/false) �� ����������� false\n�������������� ������������\n',
  `DOW4` INT(11) NULL DEFAULT NULL COMMENT '���� ����� ��, � ������� ��������� ��������� ���������� (true/false) �� ����������� false\n�������������� ������������',
  `DOW5` INT(11) NULL DEFAULT NULL COMMENT '���� ����� ��, � ������� ��������� ��������� ���������� (true/false) �� ����������� false\n�������������� ������������',
  `DOW6` INT(11) NULL DEFAULT NULL COMMENT '���� ����� ��, � ������� ��������� ��������� ���������� (true/false) �� ����������� false\n�������������� ������������\n',
  `DOW7` INT(11) NULL DEFAULT NULL COMMENT '���� ����� ��, � ������� ��������� ��������� ���������� (true/false) �� ����������� false. �������������� ������������\n',
  `ISPAUSE` INT(11) NULL DEFAULT NULL COMMENT '���� ����� ���������(true/false) �� ����������� false\n�������������� ������������',
  `IMPORTEVENTS` INT(11) NULL DEFAULT NULL COMMENT '�� ��������� ����������� ���������� ���������� �� ����� ���� ���� �������� �� ������ (true/false) �� ����������� false\n�������������� ������������',
  `COPYDATA` INT(11) NULL DEFAULT NULL COMMENT '�� ��������� �������� ��� ��� �������� ������ ����� ���������(true/false) �� ����������� true\n�������������� ������������',
  `RATING` INT(11) NULL DEFAULT NULL COMMENT '������������ ���� � ��������, ����� �������� ������� �������� �� ��� ������ ���������\n����������� �������������� ��������',
  `RATINGDATE` DATETIME NULL DEFAULT NULL COMMENT '���� ��������� ��������\n����������� �������������� ��������',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'ID ����������� ���� ����� ���� ���������\n����������� �������������� ��������\n',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '������� ���� ���� ����� ���������\n����������� �������������� ��������\n',
  PRIMARY KEY (`IDTP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TRAININGWEEK`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TRAININGWEEK` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `TRAININGWEEK` (
  `IDTW` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID ��������� ����, �������� ������������� ����� ���������.\n����������� �������������� ��������.\nTable Description: ������� ���� ���������. ����������� �������� �����������, �� ����� ����� ������,  �� ����� ����� � ������ ����������, � ��������� ������ ����������� ����� ������������.',
  `IDTP` INT(11) NULL DEFAULT NULL COMMENT '���� ����� ��������� (TrainingPlan) \n����������� �������������� ��������',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT '���� ����������� ���� ������� ������� ���������\n����������� �������������� ��������',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT '���� ��������� ����� ���������\n����������� �������������� ��������',
  `WEEKNUM` INT(11) NULL DEFAULT NULL COMMENT '����� ����� � ����\n����������� �������������� ��������',
  `WEEKDBEGIN` DATETIME NULL DEFAULT NULL COMMENT '���� ������� ����� (��)\n����������� �������������� ��������',
  `WEEKDEND` DATETIME NULL DEFAULT NULL COMMENT '���� ��������� �����(��)\n����������� �������������� ��������',
  `TARGET` INT(11) NULL DEFAULT NULL COMMENT 'ֳ��, ������� ������������ ��������� �� ����\n����������� ��������� � ����� ��������� ��� ��������, � ��������� ����������� ',
  `IDLOCATION` INT(11) NULL DEFAULT NULL COMMENT '̳��� ���������� ���������(Locations)\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������\n',
  `DOW1` INT(11) NULL DEFAULT NULL COMMENT '�������� true/false � �������� �� ��������� ���������� �  ��� ����\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������',
  `DOW2` INT(11) NULL DEFAULT NULL COMMENT '�������� true/false � �������� �� ��������� ���������� �  ��� ����\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������',
  `DOW3` INT(11) NULL DEFAULT NULL COMMENT '�������� true/false � �������� �� ��������� ���������� �  ��� ����\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������\n',
  `DOW4` INT(11) NULL DEFAULT NULL COMMENT '�������� true/false � �������� �� ��������� ���������� �  ��� ����\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������',
  `DOW5` INT(11) NULL DEFAULT NULL COMMENT '�������� true/false � �������� �� ��������� ���������� �  ��� ����\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������',
  `DOW6` INT(11) NULL DEFAULT NULL COMMENT '�������� true/false � �������� �� ��������� ���������� �  ��� ����\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������',
  `DOW7` INT(11) NULL DEFAULT NULL COMMENT '�������� true/false � �������� �� ��������� ���������� �  ��� ����\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������',
  `ISPAUSE` INT(11) NULL DEFAULT NULL COMMENT '�������� true/false � ����� ��������� ��� ���������� ��������\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT '���� �����������, ������ ������� ������� ��� \n����������� �������������� ��������',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '���� �����������\n����������� �������������� ��������',
  PRIMARY KEY (`IDTW`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TRAININGS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TRAININGS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `TRAININGS` (
  `IDT` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID ������������� ���������\nTable Description: ������� ����������. ����������� ������������ ��� ����������� �������� (���� ������� ��䳿 ���� ������� � ������ ����������� � ���� ��������� � ����������� ������ ��� ������� ������������� ��������� ��������� �� ����� ����). �� ���� ���� ������� ������� ���������. ',
  `DESCRIPTION` VARCHAR(1000) NULL COMMENT '�������� �����������\n�������������� ������������',
  `IDTW` INT(11) NULL DEFAULT NULL COMMENT 'ID ����� ��������� (TrainingWeek)\n����������� �������������� ��������',
  `IDTP` INT(11) NULL DEFAULT NULL COMMENT 'ID ����� ��������� (TrainingPlan)\n����������� �������������� ��������\n',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID ����������� ���� ������� ����������\n����������� �������������� ��������',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT '���� ��������� ����������\n����������� �������������� ��������',
  `TRAINSDATE` DATETIME NULL DEFAULT NULL COMMENT '���� ���������� ����������',
  `TRAINSNUM` VARCHAR(45) NULL DEFAULT NULL COMMENT 'ʳ������ ���������� ���������',
  `IDLOCATION` VARCHAR(45) NULL DEFAULT NULL COMMENT '̳��� ���������� ���������(Locations)\n����������� ��������� � ����� ��������� ��� ��������, � ��������� �����������',
  `IDPARTY` INT(11) NULL DEFAULT NULL COMMENT '���� ��䳿 (EventParty)\n����������� �������������� �������� ���� ���������� �������� �������� ���  ���������� ������� ���. ���� �� � �����������.',
  `ADDITIONALINFO` INT(11) NULL DEFAULT NULL COMMENT '���� �� �������� ���, �������� ��� �����\n',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT '���� �����������, ������ ������� ������� ��� \n����������� �������������� ��������',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '���� �����������\n����������� �������������� ��������',
  PRIMARY KEY (`IDT`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `USERSKILL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `USERSKILL` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `USERSKILL` (
  `ID` INT NOT NULL AUTO_INCREMENT COMMENT '��������� ����\n����������� ���������� �������� ��� �������� ������ ������, ������� ��� ����������� �� �����������\nTable Description: �������  USERSKILL ������� ������ �� ��������� USER �� USRSPORTS. � ��� ������� ����������� ���������� ����������� �� �������� ���� ������.  ',
  `IDUSER` INT(11) NULL COMMENT '���� ��� ������ � �������� USER\n����������� ���������� �������� ��� �������� ������ ������, ������� ��� ����������� �� �����������',
  `IDSPORT` INT(11) NULL COMMENT '���� ��� ������ � �������� SPORTS\n����������� �������������� �������� ��� ����� ������������ �������� �� ����������� ������ � ������ ������. �������� ��� ����������� ���� ��� �������� ���� ������. �������� ��� �����������',
  `ACTCNT` INT(11) NULL DEFAULT NULL COMMENT '³������� ������ ���� ���������� ������� ������ � ������ ��� ������\n����������� ���������� ��������. �������� ��� �����������',
  `LASTACTDATE` DATETIME NULL DEFAULT NULL COMMENT '���� �������� ��䳿\n����������� ���������� ��������. �������� ��� �����������',
  `ACTRATING` DECIMAL(8,2) NULL DEFAULT NULL COMMENT '������ �����������\n',
  `ACTRATINGCNT` INT(11) NULL DEFAULT NULL COMMENT 'ʳ������ ���������\n����������� ���������� �������� �� ���������� ��������� ��䳿. ��������� ��������=1. �� �������� ��� �����������.',
  `PERFMARK` DECIMAL(8,2) NULL DEFAULT NULL COMMENT '������ ��������\n����������� ���������� ��������. �������� ��� �����������.',
  `SELFRATING` INT(11) NULL DEFAULT NULL COMMENT '�������� ������ �����������\n�������� ��� ����������� �� �����������.',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '������� ���� ����',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT '���� ����������� ���� ����� ��� �����������\n����������� �������������� ��������\n',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

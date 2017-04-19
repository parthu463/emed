USE mysql;

DROP DATABASE IF EXISTS emed;

CREATE DATABASE IF NOT EXISTS emed;

GRANT ALL PRIVILEGES ON emed.* TO 'eventmgt'@'%';

USE emed;

DROP TABLE IF EXISTS eventsApp;

CREATE TABLE `eventsApp` (
	`AppName` VARCHAR(64) NOT NULL,
	`EventName` VARCHAR(128) NOT NULL,
	`AlertMessage` VARCHAR(128) NOT NULL DEFAULT '',
	`ThresholdValue` DECIMAL(13,3) UNSIGNED NOT NULL DEFAULT '95.000',
	`ThresholdUnit` VARCHAR(25) NULL DEFAULT NULL,
	`EventSeverity` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`EventId` INT(10) UNSIGNED NOT NULL,
	`EventMessage` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`AlertName` VARCHAR(128) NOT NULL,
	`ThresholdName` VARCHAR(64) NOT NULL,
	`EventGUID` CHAR(32) NULL DEFAULT NULL,
	`AppGUID` CHAR(32) NULL DEFAULT NULL,
	`AlertGUID` CHAR(32) NULL DEFAULT NULL,
	`ThresholdGUID` CHAR(32) NULL DEFAULT NULL
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS eventsTrap;

CREATE TABLE `eventsTrap` (
	`EventName` VARCHAR(128) NOT NULL,
	`EventSeverity` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`EventMessage` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`EventGUID` CHAR(32) NULL DEFAULT NULL,
	`PowerpackGUID` CHAR(32) NOT NULL
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS sheets;

CREATE TABLE `sheets` (
    `SheetGUID` bigint(20) NOT NULL AUTO_INCREMENT,
    `displayOrder` bigint(20) NOT NULL DEFAULT 4294967295,
    `active` boolean DEFAULT TRUE,
	`SheetName` VARCHAR(32) NOT NULL,
	`SheetDesc` VARCHAR(64) NOT NULL,
	PRIMARY KEY (SheetGUID)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `sheetMapping`;

CREATE TABLE `sheetMapping` (
    `SheetGUID` bigint(20) NOT NULL
	,`DataType` bigint(20) NOT NULL 
	,`DataIdentifier` CHAR(64) NULL DEFAULT NULL
	,CONSTRAINT sheets_SheetGUID FOREIGN KEY (SheetGUID) REFERENCES sheets (SheetGUID)
	-- ,CONSTRAINT events_AppGUID FOREIGN KEY (AppGUID) REFERENCES events (AppGUID)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `sheetappmapping`;

CREATE TABLE `sheetappmapping` (
    `SheetGUID` bigint(20) NOT NULL,
	`AppGUID` CHAR(32) NULL DEFAULT NULL
	-- CONSTRAINT sheets_SheetGUID FOREIGN KEY (SheetGUID) REFERENCES sheets (SheetGUID),
	-- CONSTRAINT events_AppGUID FOREIGN KEY (AppGUID) REFERENCES events (AppGUID)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `sheettrapmapping`;

CREATE TABLE `sheettrapmapping` (
    `SheetGUID` bigint(20) NOT NULL,
	`PowerpackGUID` CHAR(32) NULL DEFAULT NULL
	-- CONSTRAINT sheets_SheetGUID FOREIGN KEY (SheetGUID) REFERENCES sheets (SheetGUID),
	-- CONSTRAINT events_AppGUID FOREIGN KEY (AppGUID) REFERENCES events (AppGUID)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `trapDataXMS`;

CREATE TABLE `trapDataXMS` (
    `trapIndex` bigint(20) NOT NULL AUTO_INCREMENT,
	`trapName` CHAR(128) NULL DEFAULT NULL,
    `trapCode` bigint(20) NOT NULL DEFAULT 4294967295,
	`trapMessage` VARCHAR(128) NOT NULL DEFAULT '',
	`trapFieldValues` VARCHAR(128) NOT NULL DEFAULT '',
	`trapSeverity` CHAR(32) NULL DEFAULT NULL,
	PRIMARY KEY (trapIndex)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `control`;

CREATE TABLE `control` (
	`wbtype` VARCHAR(64) NOT NULL DEFAULT 'baseline',
	`wbformat` VARCHAR(64) NOT NULL DEFAULT 'xlsx',
	`wbname` VARCHAR(64) NOT NULL DEFAULT 'VSBTH',
	`wbversion` VARCHAR(16) NOT NULL DEFAULT '0.91'
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

INSERT INTO `control` 
(`wbtype`, `wbformat`, `wbname`, `wbversion`)
VALUES
('baseline', 'xlsx', 'vsblth', '0.91');

INSERT INTO `control` 
(`wbtype`, `wbformat`, `wbname`, `wbversion`)
VALUES
('procedure', 'xlsx', 'vssop', '0.91');


DROP TABLE IF EXISTS `sevmapping`;

CREATE TABLE `sevmapping` (
	`EventSeverity` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`EventDisplay` VARCHAR(32) NOT NULL
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

INSERT INTO `sevmapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(0, 'Healthy');	
INSERT INTO `sevmapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(1, 'Informational');	
INSERT INTO `sevmapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(2, 'Warning');	
INSERT INTO `sevmapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(3, 'Minor');	
INSERT INTO `sevmapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(4, 'Major');	
INSERT INTO `sevmapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(5, 'Critical');	


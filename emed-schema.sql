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

DROP TABLE IF EXISTS eventsInternal;

CREATE TABLE `eventsInternal` (
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
	`SheetType` VARCHAR(32) NOT NULL DEFAULT 'standard',
	PRIMARY KEY (SheetGUID)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `sheetMapping`;

CREATE TABLE `sheetMapping` (
    `SheetGUID` bigint(20) NOT NULL
	,`DataType` bigint(20) NOT NULL 
	,`DataIdentifier` VARCHAR(64) NULL DEFAULT NULL
	,CONSTRAINT sheets_SheetGUID FOREIGN KEY (SheetGUID) REFERENCES sheets (SheetGUID)
	-- ,CONSTRAINT events_AppGUID FOREIGN KEY (AppGUID) REFERENCES events (AppGUID)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `procText`;

CREATE TABLE `procText` (
    `procTextID` bigint(20) NOT NULL AUTO_INCREMENT,
	`procText` TEXT NOT NULL,
	PRIMARY KEY (procTextID)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `eventProcMapping`;

CREATE TABLE `eventProcMapping` (
	`EventGUID` CHAR(32) NULL DEFAULT NULL,
    `procTextID` bigint(20) NOT NULL AUTO_INCREMENT,
	`incidentPriority` VARCHAR(20) NOT NULL
	,CONSTRAINT procText_procTextID FOREIGN KEY (procTextID) REFERENCES procText (procTextID)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `trapDataXMS`;

CREATE TABLE `trapDataXMS` (
    `trapIndex` bigint(20) NOT NULL AUTO_INCREMENT,
	`trapName` VARCHAR(64) NULL DEFAULT NULL,
    `trapCode` VARCHAR(64) NOT NULL DEFAULT '',
	`trapMessage` VARCHAR(128) NOT NULL DEFAULT '',
	`trapFieldValues` VARCHAR(128) NOT NULL DEFAULT '',
	`trapSeverity` CHAR(32) NULL DEFAULT NULL,
	PRIMARY KEY (trapIndex)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `docControl`;

CREATE TABLE `docControl` (
	`docType` VARCHAR(64) NOT NULL DEFAULT 'baseline',
	`docFormat` VARCHAR(64) NOT NULL DEFAULT 'xlsx',
	`docBaseName` VARCHAR(64) NOT NULL DEFAULT 'VSBTH',
	`docVersion` VARCHAR(16) NOT NULL DEFAULT '0.91',
	`docDescTitle` VARCHAR(128) NOT NULL DEFAULT 'Title',
	`docPalette` VARCHAR(32) NOT NULL DEFAULT 'soft',
	`docFormatted` BOOLEAN DEFAULT FALSE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

INSERT INTO `docControl` 
(`docType`, `docFormat`, `docBaseName`, `docVersion`, `docDescTitle`, `docPalette`, `docFormatted`)
VALUES
('baseline', 'xlsx', 'vsblth', '0.91', 'Monitored Objects and Thresholds for Vblock Systems', 'soft', TRUE);

INSERT INTO `docControl` 
(`docType`, `docFormat`, `docBaseName`, `docVersion`, `docDescTitle`, `docPalette`, `docFormatted`)
VALUES
('procedure', 'xlsx', 'vssop', '0.91', 'Procedures for Identified Events for Vblock Systems', 'soft', FALSE);


DROP TABLE IF EXISTS `severityMapping`;

CREATE TABLE `severityMapping` (
	`EventSeverity` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`EventDisplay` VARCHAR(32) NOT NULL
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

INSERT INTO `severityMapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(0, 'Healthy');	
INSERT INTO `severityMapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(1, 'Informational');	
INSERT INTO `severityMapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(2, 'Warning');	
INSERT INTO `severityMapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(3, 'Minor');	
INSERT INTO `severityMapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(4, 'Major');	
INSERT INTO `severityMapping`
(`EventSeverity`, `EventDisplay`)
VALUES
(5, 'Critical');	


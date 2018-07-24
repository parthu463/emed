USE mysql;

DROP DATABASE IF EXISTS emed;

CREATE DATABASE IF NOT EXISTS emed;

GRANT ALL PRIVILEGES ON emed.* TO 'eventmgt'@'%';

USE emed;

DROP TABLE IF EXISTS eventsDynamic;

CREATE TABLE `eventsDynamic` (
	`AppName` VARCHAR(64) NOT NULL,
	`EventName` VARCHAR(128) NOT NULL,
	`AlertMessage` VARCHAR(128) NOT NULL DEFAULT '',
	`ThresholdValue` DECIMAL(13,3) UNSIGNED NULL DEFAULT '0.000',
	`ThresholdUnit` VARCHAR(25) NULL DEFAULT NULL,
	`EventSeverity` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`EventId` INT(10) UNSIGNED NOT NULL,
	`EventMessage` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`AlertName` VARCHAR(128) NOT NULL,
	`ThresholdName` VARCHAR(64) NULL,
	`EventGUID` CHAR(32) NULL DEFAULT NULL,
	`AppGUID` CHAR(32) NULL DEFAULT NULL,
	`AlertGUID` CHAR(32) NULL DEFAULT NULL,
	`ThresholdGUID` CHAR(32) NULL DEFAULT NULL,
	`ThresholdLocalID` CHAR(32) NULL DEFAULT NULL,
	`Formula` BLOB(1024) NULL DEFAULT NULL
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

-- sheetMapping is used to control the inclusion of an event or events
-- on a particular sheet in the generated document
-- The datatype is as follows:
--   DataType = 0 : The events come from a dynamic app, DataIdentifier is the DynamicAPP GUID
--   DataType = 1 : The events come from SNMP Traps defined from a power pack where each Trap maps to a single event policy
--                : DataIdentifier is the PowerPack GUID defining the events
--   DataType = 2 : The events come from SNMP Traps with overloaded VarBinds.
--                : An EMED table must be created to map the varbinds to required fields for EM7
--                : DataIdentifier is the name of the EMED table containing the datatype
--   DataType = 3 : A single Event without threshold information to be included on the sheet
--                : DataIdentifier is the Event GUID to be included

-- Modifying sheetMapping to closer align to the internal structure of EM7 as found in master.definitions_event_sources
-- 1, "Syslog"
-- 2, "Internal"
-- 3, "Trap"
-- 4, "Dynamic"
-- 6, "API"
-- 7, "Email"
-- 10, "ScienceLogic Agent"
-- Locally defined types (trap by varbind, etc) will use values starting at 64 and have to be moved if there is any conflict
-- with future ScienceLogic assignments

DROP TABLE IF EXISTS `definitions_event_sources`;

CREATE TABLE `definitions_event_sources` (
	`esource` TINYINT(4) NOT NULL,
	`descr` VARCHAR(24) NOT NULL,
    `eventTypeActive` boolean DEFAULT TRUE,
	PRIMARY KEY (`esource`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (1, "Syslog", FALSE);
INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (2, "Internal", TRUE);
INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (3, "Trap", TRUE);
INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (4, "Dynamic", TRUE);
INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (6, "API", FALSE);
INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (7, "Email", FALSE);
INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (10, "ScienceLogic Agent", FALSE);
INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (11, "Rules Engine", FALSE);
INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (64, "TrapByVarbind", TRUE);
INSERT INTO `definitions_event_sources` (esource, descr, eventTypeActive) VALUES (65, "SingleEvents", TRUE);

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
    `eventActive` boolean DEFAULT TRUE,
	PRIMARY KEY (trapIndex)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `trapDataDPA`;

CREATE TABLE `trapDataDPA` (
    `trapIndex` bigint(20) NOT NULL AUTO_INCREMENT,
	`trapName` VARCHAR(64) NULL DEFAULT NULL,
    `trapCode` VARCHAR(64) NOT NULL DEFAULT '',
	`trapMessage` VARCHAR(128) NOT NULL DEFAULT '',
	`trapFieldValues` VARCHAR(128) NOT NULL DEFAULT '',
	`trapSeverity` CHAR(32) NULL DEFAULT NULL,
    `eventActive` boolean DEFAULT TRUE,
	PRIMARY KEY (trapIndex)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;	

DROP TABLE IF EXISTS `trapDataRecoverpoint`;

CREATE TABLE `trapDataRecoverpoint` (
    `trapIndex` bigint(20) NOT NULL AUTO_INCREMENT,
	`trapName` VARCHAR(64) NULL DEFAULT NULL,
    `trapCode` VARCHAR(64) NOT NULL DEFAULT '',
	`trapMessage` VARCHAR(128) NOT NULL DEFAULT '',
	`trapFieldValues` VARCHAR(128) NOT NULL DEFAULT '',
	`trapSeverity` CHAR(32) NULL DEFAULT NULL,
    `eventActive` boolean DEFAULT TRUE,
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
('baseline', 'xlsx', 'sdsblth', '0.92', 'Monitored Objects and Thresholds for Vblock Systems', 'dell', TRUE);

INSERT INTO `docControl` 
(`docType`, `docFormat`, `docBaseName`, `docVersion`, `docDescTitle`, `docPalette`, `docFormatted`)
VALUES
('procedure', 'xlsx', 'sdssop', '0.92', 'Procedures for Identified Events for Vblock Systems', 'dell', FALSE);

INSERT INTO `docControl` 
(`docType`, `docFormat`, `docBaseName`, `docVersion`, `docDescTitle`, `docPalette`, `docFormatted`)
VALUES
('itsmpriority', 'xml', 'sdsitsmpriority', '0.92', 'Incident Priority Mapping for Identified Events for Vblock Systems', 'dell', FALSE);


DROP TABLE IF EXISTS `severityMapping`;

CREATE TABLE `severityMapping` (
	`EventSeverity` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`EventDisplay` VARCHAR(32) NOT NULL
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

INSERT INTO `severityMapping` (`EventSeverity`, `EventDisplay`)
VALUES (0, 'Healthy');	
INSERT INTO `severityMapping` (`EventSeverity`, `EventDisplay`)
VALUES (1, 'Informational');	
INSERT INTO `severityMapping` (`EventSeverity`, `EventDisplay`)
VALUES (2, 'Minor');	
INSERT INTO `severityMapping` (`EventSeverity`, `EventDisplay`)
VALUES (3, 'Major');	
INSERT INTO `severityMapping` (`EventSeverity`, `EventDisplay`)
VALUES (4, 'Critical');	

--  Create a temporary working table  (dropped at end of script)
DROP TABLE IF EXISTS working;
CREATE TABLE `working` (
	`displayOrder` TINYINT UNSIGNED NOT NULL DEFAULT '2'
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;	
INSERT INTO working (displayOrder) VALUES (5);
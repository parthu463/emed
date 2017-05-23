use emed;

-- Notes:
--   The sheetMapping.DataType value corresponds to where the event data is coming from
--     see additional nots in emed-schema.sql for value meanings

--  Create a temporary working table  (dropped at end of script)
DROP TABLE IF EXISTS working;
CREATE TABLE `working` (
	`displayOrder` TINYINT UNSIGNED NOT NULL DEFAULT '2'
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;	
INSERT INTO working (displayOrder) VALUES (2);


-- UCS Sheet
SET @SHEETNAME = 'UCS';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'Cisco UCS Chassis and Rack Mount Systems');

-- SELECT @SHEETGUID := `SheetGUID` FROM sheets WHERE SheetName = @SHEETNAME;
SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '06A45DD39CAC5C6BDA6F4B5495570B00');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '1DA48E190E1D68AE9F314034810EA63C');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '5BFBC389F408A2E6860CF0313F2298E3');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '5D831A010EB1C9EC8D8C520E798C797E');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'C8636D1C380B7F723399F55938536997');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E05B961DA8FE349C3949B60A1D98BC05');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'F6396BEF21230ABC132A03BAB04C78AD');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E1CADD030364B5BBDA98BD86ABB2CC37');

-- EMC VMAX Sheet
SET @SHEETNAME = 'VMAX';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'EMC VMAX');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'DF7DE29E9880F27AB791CC4F2D8085D4');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'A810D5905D7323E613E0BD853B18F5B2');

-- EMC VNX Sheet
SET @SHEETNAME = 'VNX';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'EMC VNX');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'DCF964F36ABD74A1ECE10839FA52F81B');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '0BBF291DA430AA8ADD34DF9B08F5791A');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E85F202597056B9DDD63A6CE30DFB837');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'C1F40683777331FCB5A82BB600C0F41F');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '48A5B882EC03D6D0D65B8A6BF62B2296');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'AFA041B66625E8909F7461AEF8CB0B59');

--
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'DCF964F36ABD74A1ECE10839FA52F81B');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '24CE64DE060C2DC86135D0F71463A713');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'C618C4FD890F6F1F78B09930BFFCED0D');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '536B981634ECD67D0E3FE3E198353556');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'C1F40683777331FCB5A82BB600C0F41F');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '14619851D36CE71EEE11F17A1113F9F6');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'A360134A68FA79E9E9BFCDC1B49392D2');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '2E8D9ACBC116234D97E09E0DB75818B3');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '5219707080C4452DCF00443E6E041FB2');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '01930C3C88DB45674A638E72642F1486');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '3F1BCAA1313609A3EFC4C38D8B7F1CD3');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '84CF3A9020171C9785F595D93D7A07E8');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '69776B470846A1AB0A2C18BC8C9487D1');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'D454D82F25DF461C0AC86A1FEA54544B');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '6637978F5B1CA96822822A2BD38062AA');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '0775AF3263ACD6C75E195406D67C20BC');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '17989AD6F45C4C05B42CA92D32932036');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '3F0AF7DA8B255948E80F79E1932ECEA2');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'AB83E979F968D817512ABB52A884EAAF');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'AFA041B66625E8909F7461AEF8CB0B59');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '1A6698328A485E60707903971AACFDFA');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'FFFE95BC78E496B059CF81D50B530232');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '164E8FC44046306FF9B5D2190717B7CF');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '0BBF291DA430AA8ADD34DF9B08F5791A');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '6C5BFF5AD43C2638CB22DD9707FAF749');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '26F9E5D8A9411268E93DFCD278E3E446');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '48A5B882EC03D6D0D65B8A6BF62B2296');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '4BE1545B422A08D1F0B1B8735C2F5201');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '8508300460B1E5E204FB7D7A145E4082');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'BD1F16AB78FD19746CDBB48F7AF9C416');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '3C86C6F8E9A6E703D460B418EB0031B8');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '301FCADCB2E454F9D16CFCB08A6D32A9');


-- EMC VNXe Sheet
SET @SHEETNAME = 'VNXe';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'EMC VNXe');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '05D6C2082EF641A396D7E3A3BCBCDB24');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '63CE15CFF5772CF47B0696A43650EF45');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'DDB27A65F22F05B87D716974119B77FB');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '78524AC5E64F08571B5A079EEA827780');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '77FF4E61707D1F346EB59387CC0D67D5');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '1912E3288AA80B091024DBA002D4CE21');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '118A6B23B9ABA66241362A48ED6F7913');


-- EMC Isilon Sheet
SET @SHEETNAME = 'Isilon';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'EMC Isilon');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '603736D666A4A105D34AC00AE53D08E1');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 1, '5479472A416E160702305726EB03F8F7');

-- EMC XtremIO Sheet

SET @SHEETNAME = 'XMS';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc, SheetType)
VALUES (@SHEETNAME, @DISPLAYORDER, 'EMC XtremIO', 'XMS');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '091C42E681C6DC0CCEBAEFFA8F9006C3');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '7F22A38C78DBB8AE30CEB433C701FA54');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '762A2B2C84EA66941D08A6F6EAC1D0D8');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '8F4801FE9DB45A78855135E7F79FFFEE');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '2E57B0F6E731DD13C7FF54705F2E9694');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '67E9EB6C63BA4905B28E3831AB106853');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'C860410C0D6E88917ABAB5537EDA2168');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'D81B566EBFEF174F7EF2A42115D96670');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'DF9A40EC4AD405AF5D3BD51713A73F78');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E0CB7B6E28729033A2347D8D2F71FBB0');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E45A6A3C669796392F104BFD4FE9BC9B');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'F22791C37800860FB5F7EED5AEB7B3DC');
insert into sheetMapping (SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'F93D9E675AC3B03AB02823EDBB6CB689');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 2, 'trapDataXMS');

-- EMC Unity 
SET @SHEETNAME = 'Unity';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'EMC Unity');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

--insert into sheetMapping
--(SheetGUID, DataType, DataIdentifier) VALUES
--(@SHEETGUID, 0, '603736D666A4A105D34AC00AE53D08E1');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 1, '210B40A74036E39216C12D2E49A6C864');


-- Cisco Switch Sheet
SET @SHEETNAME = 'Cisco Switch';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'Cisco Switch Chassis, PSU, Fan and Temperature');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '645A45434787F06A9625D86C68CF59E1');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '6E511AD041262B6437BBE3B8C2D7B4D8');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '2B2DE3560233FD6F773A350A215D1916');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'FA9707E3F4F286D3B267C6DAF3CC4000');

-- Network Interfaces Sheet

SET @SHEETNAME = 'Switch iFace';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'Interface Monitoring');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 3, '621866FB006A52B5C64B118A70B08C73');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 3, 'E42F4DD36B4E262C71F43D3184A1712F');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 3, '74D46E7D94ED435B6E612993D9FC6AB3');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 3, '884F05B7B9D85C6A692AE2D7D6A480D1');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 3, '7A0091464FB1DFBDEF76B6472A99E18B');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 3, 'E4BD027863036C0A85FC962E1967F320');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 3, '466DC0BB1E7CC9888856D0E8DEBF3000');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 3, '4E0E8861F8E43207FC0C744D30A482E5');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 3, '31941A48398DE7245BAACD21A5B70716');

-- vSphere Host Sheet
SET @SHEETNAME = 'vSphere Hosts';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'vSphere Host');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'F524618A59A440BA56E4B6C529B907B5');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'ADA1AD08362D983A8F3FA94F335F6048');

-- vSphere Datastore
SET @SHEETNAME = 'vSphere Datastores';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'vSphere Datastore');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'DD16CF364267AE0AFEB56C4D2BC53C79');

-- vSphere Guest VM (Tenant) Sheet
SET @SHEETNAME = 'vSphere Guest VM (Tenant)';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'vSphere Guest VM for Tenant Stack (GRM)');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E28ED8DD41A89F3607DF8A204FF0475E');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E0326A53EFDCDD3BF395904B0F640D1B');

-- vSphere CMOS VM App Sheet
SET @SHEETNAME = 'CMOS (Tenant)';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'Tenant VM Full Stack');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E28ED8DD41A89F3607DF8A204FF0475E');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E0326A53EFDCDD3BF395904B0F640D1B');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '232296730F74319D6765D79118603276');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '2E6DA0C29015D69F1F8D91529555C32C');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '46561F78FE7ABD6D43321ECC54FB6DAC');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '8A980A54AA30B3A3201B42691048D63E');

-- vSphere AMP VM App Sheet
SET @SHEETNAME = 'AMP VM';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'Amp VM Full Stack');

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E28ED8DD41A89F3607DF8A204FF0475E');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, 'E0326A53EFDCDD3BF395904B0F640D1B');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '232296730F74319D6765D79118603276');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '2E6DA0C29015D69F1F8D91529555C32C');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '46561F78FE7ABD6D43321ECC54FB6DAC');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, 0, '8A980A54AA30B3A3201B42691048D63E');


--  Done with the temporary table
DROP TABLE IF EXISTS working;

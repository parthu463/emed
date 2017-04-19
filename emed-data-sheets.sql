
use emed;

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('UCS', '2', 'Cisco UCS Chassis and Rack Mount Systems');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('VMAX', '3', 'EMC VMAX');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('VNX', '4', 'EMC VNX');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('VNXe', '5', 'EMC VNXe');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('Isilon', '6', 'EMC Isilon');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('XIO', '7', 'EMC XtremIO');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('Cisco Switch', '8', 'Cisco Switch Chassis, PSU, Fan and Temperature');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('Switch iFace', '9', 'Interface Monitoring');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('vSphere Hosts', '10', 'vSphere Host');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('vSphere Datastores', '11', 'vSphere Datastore');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('vSphere Guest VM (Tenant)', '12', 'vSphere Guest VM for Tenant Stack (GRM)');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('CMOS (Tenant)', '13', 'Tenant VM Full Stack');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('AMP VM', '14', 'Amp VM Full Stack');


-- Note:  The SheetGUID is one less than the displayOrder as long as the insert statements
--        (above) remain in the display order.

-- UCS Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(1, '06A45DD39CAC5C6BDA6F4B5495570B00');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(1, '1DA48E190E1D68AE9F314034810EA63C');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(1, '5BFBC389F408A2E6860CF0313F2298E3');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(1, '5D831A010EB1C9EC8D8C520E798C797E');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(1, 'C8636D1C380B7F723399F55938536997');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(1, 'E05B961DA8FE349C3949B60A1D98BC05');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(1, 'F6396BEF21230ABC132A03BAB04C78AD');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(1, 'E1CADD030364B5BBDA98BD86ABB2CC37');

-- EMC VMAX Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(2, 'DF7DE29E9880F27AB791CC4F2D8085D4');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(2, 'A810D5905D7323E613E0BD853B18F5B2');

-- EMC VNX Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'DCF964F36ABD74A1ECE10839FA52F81B');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '0BBF291DA430AA8ADD34DF9B08F5791A');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'E85F202597056B9DDD63A6CE30DFB837');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'C1F40683777331FCB5A82BB600C0F41F');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '48A5B882EC03D6D0D65B8A6BF62B2296');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'AFA041B66625E8909F7461AEF8CB0B59');

--
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'DCF964F36ABD74A1ECE10839FA52F81B');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '24CE64DE060C2DC86135D0F71463A713');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'C618C4FD890F6F1F78B09930BFFCED0D');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '536B981634ECD67D0E3FE3E198353556');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'C1F40683777331FCB5A82BB600C0F41F');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '14619851D36CE71EEE11F17A1113F9F6');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'A360134A68FA79E9E9BFCDC1B49392D2');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '2E8D9ACBC116234D97E09E0DB75818B3');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '5219707080C4452DCF00443E6E041FB2');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '01930C3C88DB45674A638E72642F1486');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '3F1BCAA1313609A3EFC4C38D8B7F1CD3');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '84CF3A9020171C9785F595D93D7A07E8');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '69776B470846A1AB0A2C18BC8C9487D1');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'D454D82F25DF461C0AC86A1FEA54544B');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '6637978F5B1CA96822822A2BD38062AA');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '0775AF3263ACD6C75E195406D67C20BC');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '17989AD6F45C4C05B42CA92D32932036');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '3F0AF7DA8B255948E80F79E1932ECEA2');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'AB83E979F968D817512ABB52A884EAAF');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'AFA041B66625E8909F7461AEF8CB0B59');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '1A6698328A485E60707903971AACFDFA');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'FFFE95BC78E496B059CF81D50B530232');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '164E8FC44046306FF9B5D2190717B7CF');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '0BBF291DA430AA8ADD34DF9B08F5791A');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '6C5BFF5AD43C2638CB22DD9707FAF749');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '26F9E5D8A9411268E93DFCD278E3E446');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '48A5B882EC03D6D0D65B8A6BF62B2296');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '4BE1545B422A08D1F0B1B8735C2F5201');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '8508300460B1E5E204FB7D7A145E4082');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, 'BD1F16AB78FD19746CDBB48F7AF9C416');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '3C86C6F8E9A6E703D460B418EB0031B8');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(3, '301FCADCB2E454F9D16CFCB08A6D32A9');


-- EMC VNXe Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(4, '05D6C2082EF641A396D7E3A3BCBCDB24');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(4, '63CE15CFF5772CF47B0696A43650EF45');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(4, 'DDB27A65F22F05B87D716974119B77FB');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(4, '78524AC5E64F08571B5A079EEA827780');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(4, '77FF4E61707D1F346EB59387CC0D67D5');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(4, '1912E3288AA80B091024DBA002D4CE21');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(4, '118A6B23B9ABA66241362A48ED6F7913');


-- EMC Isilon Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(5, '603736D666A4A105D34AC00AE53D08E1');

insert into sheettrapmapping
(SheetGUID, PowerpackGUID) VALUES
(5, '5479472A416E160702305726EB03F8F7');

-- EMC XtremIO Sheet

-- insert into sheettrapmapping
-- (SheetGUID, PowerpackGUID) VALUES
-- (6, '2997BED40C4C7660A040BED374E872A0');

-- insert into sheettrapmapping
-- (SheetGUID, PowerpackGUID) VALUES
-- (6, 'B7B8D6E4990A88F9EC99886D3D8D6C99');

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(6, 3, 'emed-data-traps-xms.sql');

-- Cisco Switch Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(7, '645A45434787F06A9625D86C68CF59E1');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(7, '6E511AD041262B6437BBE3B8C2D7B4D8');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(7, '2B2DE3560233FD6F773A350A215D1916');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(7, 'FA9707E3F4F286D3B267C6DAF3CC4000');

-- Network Interfaces Sheet


-- vSphere Host Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(9, 'F524618A59A440BA56E4B6C529B907B5');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(9, 'ADA1AD08362D983A8F3FA94F335F6048');

-- vSphere Datastore
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(10, 'DD16CF364267AE0AFEB56C4D2BC53C79');

-- vSphere Guest VM (Tenant) Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(11, 'E28ED8DD41A89F3607DF8A204FF0475E');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(11, 'E0326A53EFDCDD3BF395904B0F640D1B');

-- vSphere CMOS VM App Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(12, 'E28ED8DD41A89F3607DF8A204FF0475E');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(12, 'E0326A53EFDCDD3BF395904B0F640D1B');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(12, '232296730F74319D6765D79118603276');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(12, '2E6DA0C29015D69F1F8D91529555C32C');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(12, '46561F78FE7ABD6D43321ECC54FB6DAC');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(12, '8A980A54AA30B3A3201B42691048D63E');

-- vSphere AMP VM App Sheet
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(13, 'E28ED8DD41A89F3607DF8A204FF0475E');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(13, 'E0326A53EFDCDD3BF395904B0F640D1B');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(13, '232296730F74319D6765D79118603276');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(13, '2E6DA0C29015D69F1F8D91529555C32C');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(13, '46561F78FE7ABD6D43321ECC54FB6DAC');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(13, '8A980A54AA30B3A3201B42691048D63E');

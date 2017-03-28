
-- set @ELEM_NAME = 'elem_PhysComputeChassis_UCSequipmentChassis_operability';
-- set @CMP = '!=';
-- set @THR = '0';
-- select svcElement_id from svcElements where name = @ELEM_NAME INTO @ELEM_ID;
-- insert into alarmThresholds (svcElement_id, alarmLevel_id, comparison, threshold) VALUES (@ELEM_ID, 1, @CMP, @THR);
-- set @ELEM_ID = NULL;

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
(SheetName, displayOrder, SheetDesc) VALUES ('Cisco Switch', '6', 'Cisco Switch Chassis, PSU, Fan and Temperature');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('Switch iFace', '7', 'Ethernet Interfaces');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('vSphere Hosts', '8', 'vSphere Host');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('vSphere Datastores', '9', 'vSphere Datastore');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('vSphere Guest VM (Tenant)', '10', 'vSphere Guest VM for Tenant Stack (GRM)');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('CMOS (Tenant)', '11', 'Tenant VM Full Stack');

insert into sheets
(SheetName, displayOrder, SheetDesc) VALUES ('AMP VM', '12', 'Amp VM Full Stack');

-- UCS Sheet App GUID's
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

-- EMC VMAX Sheet App GUID's
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(2, 'DF7DE29E9880F27AB791CC4F2D8085D4');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(2, 'A810D5905D7323E613E0BD853B18F5B2');

-- EMC VNX Sheet App GUID's
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


-- Cisco Switch Sheet App GUID's
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(5, '645A45434787F06A9625D86C68CF59E1');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(5, '6E511AD041262B6437BBE3B8C2D7B4D8');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(5, '2B2DE3560233FD6F773A350A215D1916');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(5, 'FA9707E3F4F286D3B267C6DAF3CC4000');

-- vSphere Host Sheet App GUID's
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(7, 'F524618A59A440BA56E4B6C529B907B5');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(7, 'ADA1AD08362D983A8F3FA94F335F6048');

-- vSphere Datastore Sheet App GUID's
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(8, 'DD16CF364267AE0AFEB56C4D2BC53C79');

-- vSphere Guest VM (Tenant) App GUID's
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(9, 'E28ED8DD41A89F3607DF8A204FF0475E');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(9, 'E0326A53EFDCDD3BF395904B0F640D1B');

-- vSphere CMOS VM App GUID's
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(10, 'E28ED8DD41A89F3607DF8A204FF0475E');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(10, 'E0326A53EFDCDD3BF395904B0F640D1B');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(10, '232296730F74319D6765D79118603276');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(10, '2E6DA0C29015D69F1F8D91529555C32C');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(10, '46561F78FE7ABD6D43321ECC54FB6DAC');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(10, '8A980A54AA30B3A3201B42691048D63E');

-- vSphere AMP VM App GUID's
insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(11, 'E28ED8DD41A89F3607DF8A204FF0475E');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(11, 'E0326A53EFDCDD3BF395904B0F640D1B');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(11, '232296730F74319D6765D79118603276');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(11, '2E6DA0C29015D69F1F8D91529555C32C');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(11, '46561F78FE7ABD6D43321ECC54FB6DAC');

insert into sheetappmapping
(SheetGUID, AppGUID) VALUES
(11, '8A980A54AA30B3A3201B42691048D63E');


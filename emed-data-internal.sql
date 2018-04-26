use emed;

-- Notes:
--   The sheetMapping.DataType value corresponds to where the event data is coming from
--     see additional nots in emed-schema.sql for value meanings

-- EM7 Sheet
SET @SHEETNAME = 'EM7';
SELECT displayOrder INTO @DISPLAYORDER from working;
UPDATE working SET displayOrder = @DISPLAYORDER + 10;
insert into sheets (SheetName, displayOrder, SheetDesc)
VALUES (@SHEETNAME, @DISPLAYORDER, 'EM7 Internal Events');

UPDATE sheets set active = FALSE where SheetName = @SHEETNAME;

SELECT `SheetGUID` INTO @SHEETGUID FROM sheets WHERE SheetName = @SHEETNAME;

set @ETYPE = 'Internal';
SELECT esource into @ESOURCE from `definitions_event_sources` where `descr` = @ETYPE;

insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '2FFA8CFA18DD13074E23EEF06F6D0ACD');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'DDAF5546BB89F4808F08141E107AB347');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '33B142CD81D76005BF795A664B41A4AF');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'BCACAA2CC7E428AB518BCB305AE06286');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'FBFB1A5DEE422F8486C704BAF36DB085');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'BB29F390BAC00DA22A2D34594C270931');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'DF78BF12593666D9E7BD0992F79BC7F1');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F2F95D0EC2FFEE36722B509E291509D8');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '7B75C359A1958B4EE2B00B4E9F88429C');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'BAA92B2FB873D8018B5D820A7655EB48');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'B74FC08F501D77B927A1E76AF3E46FE1');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '809F05DDEA87C6CE504E9406622D66EA');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '9BA4D1DD6BBDD0FB7B54BDE5BAF1F362');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '0E4F44F3E6B273951E37C5059E859FFB');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '749E20E5B7ED1147198E99B2BBCC5042');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '9925B7AB5D39531C1A8E0F5F0629AE37');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '90E1DC09BDEBF96E74B721B6167BDFCE');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '33D83C0C3FD6E3FBE02A69125702BD27');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '6C03654328FF7F29E285C51C321D4514');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '862A22C1462FD77F9C96D690B203642E');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'ECDC171153CA25176825523C90DEC9E5');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '915FCE370188CEFA0030124125D64C5A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'C154BC1F98224C02A3F1A972EDABD283');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'DD1E21BF0A34A07C3B16FE1F1CAD236E');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F69C29996F78180289DA36929FC9D7C8');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'D0E42FA8A6A1247A6A9AE84080455458');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'CF4A90F8F709071BF9356A39C640D09B');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F38324F6032B9EA771A155B8123B5AAC');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '077B269B0EF31BE3A8ECCAB48285E095');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '1356988F8FDDA5E816888D66C56CAB57');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '8EA28CA85A2AC42FB274FCD0AF6A7F97');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'D0FAC99BDC340F6C0AFBC990B1FA8FFE');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '06121A4E55123BE7C5FE982C485B5F79');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '2AE680CCB0C1FE1BA7EE20908A08D90B');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'A7BC62B0856AFE387BE6761750F79578');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'BE47D7086F087E7AFC4F9DB2C0041C5B');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'D67E58C4A88518F4F288C3C8D8BF684A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F6376A28D54729846A091EF9E047E31C');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'E2D7A9B9E0B7254067692FC1B0B2ECDD');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '699B02A39D9B634D786312D50517EE46');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '892053D6005E8712E21C0114DD0EF23C');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '6101C20A54B7E662C9C95D9BB5F4C19F');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '174A3E2F4F5171BAFD7E454ADBF4BB36');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '5A7DA0612D805EEECF4627FA938C0A56');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'A507F25BDD2965664ADBED7B23D2E447');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F0A5DFB7BA5925E9EA85179D1D7DACC2');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '50557EFC64FCB53927AED230C9F178AA');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '5C333C7F518F21E78FCE0D328CFFE91E');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '8DF7D21B054006EE9167C2E310CBE736');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '73C0AD3BF1E939603D9E22D40EAE4EEB');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '82B6D7B9B021DF980FD66090CBD27698');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F6BE05A26FE4CCBABA14C6026467934B');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'C808CAACFF5F0B7F5F4955CD7E773AD1');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '653A37AF658EC6F8551C9DFE8BB2EE59');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '0D2CE5EAAFE04F163890609A4077656D');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'CBDBB9B539DA46019054776C1B30C21C');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '117EFC69BA932C9C933B1C49A6BC9105');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'A82334EB4FE1C069F9B8CB9C6F147207');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'B850B46D7FD8D2D292D0725B8A682079');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'C79D45A1744C9894A6F3F67009644F16');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '0A84C4673107F06CED4AE4777E399460');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'A43DF24F5EFD60397B4E8FA73D16046A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '43B99C5746B73BB8E93885F2D7F4584A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '674A8A72A60257C17F2667905E0B3962');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'D4C07D010609157456501740FA84FA91');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '2456519AE54DA4E82136573C4C7F5EA6');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '229BD27E504AD28276BD21B581BC1787');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '69A5AD5BA334969BDBDC259137D368D9');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '6676B4784E1C8F4C944E6CBFAADF2066');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'D6B2ED823184DD88B8C8CE747AC98C02');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '736331CD6D596FF692683D82E714CD64');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '43F3B228DF40A9FCC70D198A7AE9DB18');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '7146FD99B48F9CBD89AEE35145F32046');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '7D01FE36F317F03092A3D9AEF3A5F9F1');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F86A2151E383C05702A4F98F080E65FB');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '2FB3F00D9043AFBD95F90F94AA2B71E3');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '577C20EE73D5E20A6AC07AD023321D4B');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '4FC231EEE0EF61BD8D17A44F3D7153FE');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F8BF3E74EEA7E977FF5933DD92222CF9');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '2AED62586BACE36A69239B96465CBF43');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'D72C01043315D851B94E35B41EBCD61B');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '5048501DAA6A99DCED4409E302A56776');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'EEC0B9CE35C8C493335CCA10FCA71D23');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '401209EB98AAB1632DEA5D332D65FACE');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'AE573A084A3D2FDC93ADF5EB68D918C6');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '59984E9207B87D8087B55701BB6405D1');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '08515037978F900E0CD9739E66343176');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'EADA2AAE6569FC08B18A49FCFD3F6D65');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'C51837454C631A34669A17900E47A84E');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'A39CEBB9C6928DCC2C5E705E9E7DA8FA');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '0D7D275323146868DA7E85147CB4C2C7');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '783EB8C5AD40F77C4562FD709C63C372');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'AF0A84B0BB091BBA05460A39A85E0D0C');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '5BA92A12B69329D0551C772D92DFCAD6');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '0EA20AE406DA09992915C84F82DBE98A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '067B4029062A205FF5BE9D1045B43D37');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'C44C7F552D5660ED3EE1B1F0373A4C6B');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'DFBC72C286E45FC6AB657F96FD6A9107');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '6CF398BE51ED6EEC453FE1EB661574FF');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '10BA3AFE2C1A52A56D85E014B3C77F54');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '560C7FA862F35984B094CD285890DFFB');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'EFCF168B0F3BB49B0A114CC39F3C2A0A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F7391EE6ED4D57FD3C56D5823C41B7EC');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '454D3468B3E9D199700D75EC17A0F2BF');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '62C72F571E387C827EF2A09BC86E9A33');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '798BFF91552FD409B668661C35CF544E');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'D3B63301ED59D77A329FDC0D6C66EE30');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '38C265EF388043467CA6994D746E536D');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '5A5FBAFBC7C3B9295305F9BADCD0941A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '64F772F8D80515A3AB7CCEA794CFD43E');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'F9AE1AB652F1A8E80B63504E8D81D671');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '9A287DD1AB0DB0C6777BA08160DD749A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '441906961D1EDD331EBA0D3BE90EDD6A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '7811F140DD6F567DAF8283E708758220');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'A58BF7C4354712B129914F702D633B56');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'A7F8B29E15B3FC4DA365EA1BCEFAE0CF');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '3F09C92CC88B4DD5511B299780683CA7');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '8E3BBDCBF95BA452070AD8B1FE15BFE3');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '885803D28DC6FB50BB1E0BCC801BCFB6');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '26ADAC0BEA361A525CC3A409CB0B5FEB');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '449528BD03F34C121C84CB0441E43702');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '5D02FE43DBC977C9DDE5DD8D5361ED7C');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'A2D6BCBFF77A66FCF767FBBA4777705B');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'B05846153F1B9A89DCFA6C3FC42FC08A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'DF5D3E0F78DE3ED5BA2273DC489C70A1');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'CA99387FB1B2F2FC5210E9566E903925');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'CAE5E7D3C0782878A6D0B7D43013D1AD');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '8B858BF26ECAFDCC85077C328894E7E4');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '4F7F6063646C8530E0E1FB3F374B8248');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '115D4F0BDAD4E4E373B41D5321B46A93');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'BACCB0EE99EF1A77322938A1815E8BA2');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '43766D311FCA09BBCB95E46CB2A65E1A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'E4338D93C518466E90C99E22471D9930');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'A786DC6F10D26F957756B9D0911CC621');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'C5CE149397F700DB6AE12AFB77AE9CAE');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'EE298D67EA8021678F5101219504C6AC');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '309F383F250897FC52A3746F8B5309B2');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'D685277B9BA96F3A0C4B3F79BAF9C68F');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, '1F7317D69CB81D6A1768A597207B9A1A');
insert into sheetMapping
(SheetGUID, DataType, DataIdentifier) VALUES
(@SHEETGUID, @ESOURCE, 'CEDD3265EA203049EA957E2FB4ED70D2');

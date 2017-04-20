INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_ud_ssd_space_very_limited','0200303','Clusters free physical capacity is critically low. Threshold: more than 90 percent is used.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_ud_ssd_space_no_free','0200304','The cluster has no free physical capacity.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_stopping','0200505','Cluster service is stopping: Stop reason is <field1>.','Field1:stopped_reason ','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_stopped','0200506','Cluster service has stopped:<field1>-<field2>.','Field1:sys_stop_type, Field2:stopped_reason','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('def_sys_in_failed_state','0200508','Cluster initialization has failed.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_state_unknown','0200509','Cluster state cannot be determined. XMS is unable to obtain the cluster state.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_state_down','0200511','Cluster state is down.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_stop_failed','0200512','Cluster service has failed to stop.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_failed_stop','0200604','Cluster stop failure','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_unorderly_stopping','0200606','Cluster service stop',' with fast journal flushing, is in progress.,','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_orderly_stopping','0200607','Cluster stop',' with full journal flushing, is in progress.,','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('system_upgrade_failed','0200809','Upgrade process has failed with reason <field1>.','Field1: upgrade_failure_reason','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('system_rollback_ongoing','0200811','Upgrade process has failed. Rollback is in progress.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_sharedmemory_very_limited','0201003','Shared memory consumption has reached critically low level. <field1> percent is used. Threshold: more than 95 percent is used.','Field1: shared_memory_in_use_ratio','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_sharedmemory_no_free','0201004','Shared memory pool has been depleted. <field1> percent is used','Field1: shared_memory_in_use_ratio','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('data_consistency_error','0201102','Data consistency error was encountered.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_sharedmem_inefficiency_medium','0202002','System shared memory pools are not optimally balanced.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_sharedmem_inefficiency_high','0202003','System shared memory pools are imbalanced.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_encrypt_switch_incomplete','0202303','Data at Rest Encryption is incomplete.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sys_hw_pkg_inconsistent','0203101','Not all Storage Controllers have the same hardware package.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('failed_brick_state','0300102','XMS has detected an X-Brick that is not configured to be part of a cluster.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('slot_error_in_brick','0300206','The state of slot <field1> cannot be determined due to an error: <field2>','Field1: ssd_slot_array[].slot_num, Field2: ssd_slot_array[].slot_error_reason','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sas1_port_down','0400202','Storage Controller SAS port 1 is down.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sas2_port_down','0400302','Storage Controller SAS port 2 is down.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('disconnected_from_node_mgr','0400503','Storage Controller is disconnected from the XMS.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('journal_fault','0400703','Journaling on this Storage Controller has been disabled.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('journal_dumping','0400704','Journal information is in the process of destaging from the Storage Controller memory to persistent media (SSDs).','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('backend_storage_controller_error','0400802','Storage Controller SAS controller state is undetermined.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ram_too_low','0400902','Insufficient RAM: actual is <field1> but expected is <field2>.','Field1: ram, Field2: expected_ram','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_temp_level_5_major','0401105','IPMI reported abnormal temperature.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_temp_level_6_critical','0401106','IPMI reported abnormal temperature.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_fan_level_5_major','0401205','IPMI reported abnormal fan sensor indications.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_fan_level_6_critical','0401206','IPMI reported abnormal fan sensor indications.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_volt_level_5_major','0401305','IPMI reported abnormal voltage levels.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_volt_level_6_critical','0401306','IPMI reported abnormal voltage levels.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_curt_level_5_major','0401405','IPMI reported abnormal current levels.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_curt_level_6_critical','0401406','IPMI reported abnormal current levels.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('eth_port_down','0401602','Storage Controller management port is down.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('eth_port_unknown','0401603','Storage Controller management port state cannot be determined.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ib1_level_5_major','0401705','InfiniBand port 1: link status is not healthy. The port state is <field1>.','Field1: ib1_port_state','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ib1_level_6_critical','0401706','InfiniBand port 1: link status is not healthy. The port state is <field1>.','Field1: ib1_port_state','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_wrong_ib1_port_connection','0401802','Storage Controllers InfiniBand port 1 is connected to the wrong port on the infiniBand Switch.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_wrong_ib1_switch_connected','0401803','Storage Controllers InfinBand port 1 is connected to the wrong InfiniBand Switch.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ib1_port_down','0401902','Storage Controller InfiniBand port 1 is down.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ib1_port_unknown','0401903','Storage Controller InfiniBand port 1 port state cannot be determined.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ib2_level_5_major','0402105','InfiniBand port 2: link status is not healthy. The port state is <field1>.','Field: ib2_port_state','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ib2_level_6_critical','0402106','InfiniBand port 2: link status is not healthy. The port state is <field1>.','Field ib2_port_state','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_wrong_ib2_port_connection','0402202','Storage Controllers InfinBand port 2 is connected to the wrong port on the InfinBand Switch.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_wrong_ib2_switch_connected','0402203','Storage Controllers InfinBand port 2 is connected to the wrong InfiniBand Switch.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ib2_port_down','0402302','Storage Controller InfiniBand port 2 is down.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ib2_port_unknown','0402303','Storage Controller InfiniBand port 2 is unknown.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('upgrade_failed','0402403','Storage Controller upgrade has failed: <field1>. Current version is <field2>.','Field1: upgrade_failure_reason, Field2: sw_version','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_orderly_stop','0402502','Storage Controller has stopped gracefully.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_unorderly_stop','0402503','Storage Controller has stopped.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_failed_stop','0402504','Storage Controller stop process has failed. Cluster is in unrecoverable state and data integrity is suspected.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_orderly_stopping','0402505','Storage Controller is in the process of graceful stop.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_unorderly_stopping','0402506','Storage Controller is in the process of immediate stop.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_user_disabled','0402602','Storage Controller was deactivated (disabled) by user request.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_system_disabled','0402603','Storage Controller has been deactivated by the cluster.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_fru_failed','0402703','Storage Controller is faulty.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_fru_disconnected','0402704','Storage Controller has been removed (physically or logically).','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_fw_invalid','0402803','Storage Controllers software or firmware version is incompatible <field1>. Storage Controller cannot be used.','Field1: fw_failure_detail','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_free_ram_low','0402902','The Storage Controllers memory utilization is high.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_file_descriptors_high','0402912','Excessive number of open file descriptors.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('mgmt_port_half_duplex','0403102','Storage Controller management port is set to half duplex.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_dimm_level_5_major','0403305','Memory card (DIMM) health fault','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_dimm_level_6_critical','0403306','Memory card (DIMM) health fault','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('remote_journal_dumping','0403703','The remote journal information is in the process of destaging from the Storage Controller memory to persistent media (SSDs).','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_eth_10m_rate','0403801','ETH management port is at sub-optimal rate of 10M.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ethport_level_5_major','0403905','Management link health is problematic. Attention is required.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ethport_level_6_critical','0403906','Management link health is faulty. Immediate attention is required.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas1_conn_wrong_lcc','0404002','Storage Controller SAS port 1 is connected to the wrong DAE Controller.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas1_conn_wrong_lcc_port','0404003','Storage Controller SAS port 1 is connected to the wrong port of the DAE Controller.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas1_conn_unknown_dae','0404004','Storage Controller SAS port 1 is not connected to the DAE of this Storage Controllers X-Brick.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas1_level_5_major','0404105','SAS Port 1 link is faulty.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas1_level_6_critical','0404106','SAS Port 1 link is faulty.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas2_level_5_major','0404205','SAS Port 2 link is faulty.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas2_level_6_critical','0404206','SAS Port 2 link is faulty.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_fp_temperature_warning','0404502','Storage Controller temperature is high as reported by front panel sensor.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_fp_temperature_high','0404503','Storage Controller temperature is critically high as reported by front panel sensor.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_ipmiport_invalid_wiring','0404602','Dedicated IPMI link internal cable is connected incorrectly.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('journal_failjover','0404702','The cluster has detected a journal fault in this Storage Controller.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('journal_failback','0404703','The cluster has detected a journal failover in this Storage Controller.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ded_ipmi_port_down','0404902','Storage Controller dedicated IPMI port connected to the peer Storage Controller is down.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas2_conn_wrong_lcc','0405502','Storage Controller SAS port 2 is connected to the wrong DAE Controller.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas2_conn_wrong_lcc_port','0405503','Storage Controller SAS port 2 is connected to the wrong port of the DAE Controller.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_sas2_conn_unknown_dae','0405504','Storage Controller SAS port 2 is not connected to the DAE of this Storage Controllers X-Brick.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_disk_no_free_space','0406103','Not enough disk space. Only <field1> Kbytes is available.','Field1:free_disk_space','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_tech_tunnel_opened','0407002','Technician tunnel to XMS is open. Please close it when maintenance is done.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('disk_empty','0500102','Storage Controller local disk in slot <field1> of type <field2> used as <field3> is empty.','Field1: slot_num, Field2: local_disk_type, Field3: local_disk_purpose, Field1:slot_num','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('disk_unanticipated_disk','0500103','Storage Controller local disk slot <field1> is expected to be empty',' but contains a disk.,','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('disk_unsupported_disk','0500104','Storage Controller local disk in slot <field1> is an unsupported disk model or type.','Field1:slot_num','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('disk_uninitialized','0500106','Storage Controller local disk in slot <field1> is uninitialized.','Field1:slot_num','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('localdisk_user_disabled','0500202','Storage Controller local disk was deactivated (disabled) by user request.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('localdisk_system_disabled','0500203','Cluster has disabled the Storage Controller local disk.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('localdisk_fru_failed','0500303','Storage Controllers local disk has failed.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('localdisk_fru_disconnected','0500304','Storage Controllers local disk is disconnected.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('localdisk_fw_invalid','0500403','Storage Controllers local disk firmware version is incompatible.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('nodepsu_user_disabled','0600201','Storage Controller PSU was manually disabled by user request.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('nodepsu_system_disabled','0600203','Cluster has disabled the Storage Controller PSU.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('nodepsu_fru_failed','0600303','Storage Controllers PSU has failed.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('nodepsu_fru_disconnected','0600304','Storage Controllers PSU is disconnected from the cluster.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('nodepsu_no_input','0600701','Storage Controllers PSU has no input.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('rg_degraded','0800102','An SSD has failed and the DPG resiliency is degraded.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('rg_dual_failure','0800103','DPG has a dual SSD failure and is in degraded protection mode.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('rg_error','0800104','DPG group has too many simultaneous SSD failures.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('rg_double_degrade','0800106','DPG has two simultaneous SSD failures and is in degraded protection mode.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('rg_no_available_rebuilds','0800402','DPG cannot sustain any more SSD failures.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('small_io_ratio_high','0800604','Volume small block I/O ratio has reached <field1> percent.','Field1: small_io_ratio','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('unalign_io_ratio_high','0800704','Volume unaligned block I/O ratio has reached <field1> percent.','Field1:unaligned_io_ratio','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_failed_in_rg','0900103','SSD has failed.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_diag_level_5_major','0900205','Diagnostics detected a major problem in the SSD.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_diag_level_6_critical','0900206','Diagnostics detected a critical problem in the SSD.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_link1_level_5_major','0900305','Cluster diagnostics detected a major problem in link 1 of the SSD.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_link1_level_6_critical','0900306','Cluster diagnostics detected a critical problem in link 1 of the SSD.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_link2_level_5_major','0900405','Cluster diagnostics detected a major problem in link 2 of the SSD.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_link2_level_6_critical','0900406','Cluster diagnostics detected a critical problem in link 2 of the SSD.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_user_disabled','0900602','SSD was manually disabled by user request.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_system_disabled','0900603','The cluster has disabled the SSD. It will no longer be in service.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_fru_failed','0900703','SSD has failed.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_fru_disconnected','0900704','SSD is disconnected.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_fw_invalid','0900803','Firmware version of the SSD is incompatible.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_very_limited_endurance','0901203','Wear level (endurance) of the SSD is very low and has reached a critical level. The remaining wear level for this SSD is <field1> percent.','Field1:percent_endurance_remaining','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ssd_none_remaining_endurance','0901204','SSD endurance level is exhausted and completely worn out. The remaining wear level for this SSD is <field1> percent.','Field1:percent_endurance_remaining','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('tar_not_found','1100202','Target port is not found or missing.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('target_level_5_major','1100405','Target port diagnostics detected a major problem.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('target_level_6_critical','1100406','Target port diagnostics detected a critical problem.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xenv_failover','1200107','Internal sub-process (xenv) state is performing failover.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('module_failover','1300106','Internal sub-process (module) state is performing fail-over.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_level_4_minor','1400104','InfiniBand Switch link state for port <field1> has a problem.','Field1:port_index','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_level_5_major','1400105','InfiniBand Switch link state for port <field1> has a major problem.','Field1:port_index','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_level_6_critical','1400106','InfiniBand Switch link state for port <field1> has a critical problem.','Field1:port_index','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_user_disabled','1400302','The InfiniBand Switch was manually disabled by user request.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_system_disabled','1400303','The cluster has disabled the InfiniBand Switch.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_fru_failed','1400403','InfiniBand Switch has failed.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_fru_disconnected','1400404','InfiniBand Switch is disconnected.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_fw_invalid','1400503','InfiniBand Switch firmware version is incompatible.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_unknown_model','1400505','The InfiniBand Switch model is not supported in this clusters software version.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitch_wrong_connection','1400602','Incorrect connection between Storage Controller(s) and InfiniBand Switch was detected.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('no_ups_load','1500102','No power (load) is being consumed from the BBU.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('med_threshold_ups_load','1500104','Power being consumed from the BBU is excessive. The current power consumption (load) is <field1> percent of the BBUs full load capability.','Field1:ups_load_in_percent','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('high_threshold_ups_load','1500105','BBU is overloaded. The current power consumption (load) is <field1> percent of the BBUs full load capability.','Field1:ups_load_in_percent','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_node_1_disconnected','1500203','Serial communication to the BBU is disconnected from Storage Controller 1',' but is connected from Storage Controller 2.,','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_node_2_disconnected','1500204','Serial communication to the BBU is disconnected from Storage Controller 2',' but is connected from Storage Controller 1.,','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_no_external_power','1500402','There is no external power feed from grid <field1> to the BBU. BBU may be powered off or running on battery.','Field1:power_feed','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_low_bat_failure_true','1500502','BBU charge level is low: <field1> percent. Power input to the BBU is present',' but the battery is insufficiently charged.,Field1:ups_battery_charge_in_percent','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_low_bat_no_input','1500602','BBU charge level is low: <field1> percent. Power input to the BBU is not present.','Field1:ups_battery_charge_in_percent','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_low_bat_run_failure_true','1500702','Battery Backup Unit has low runtime. Current battery runtime value is: <field1> seconds.','Field1:battery_runtime','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_overld_failure_true','1500802','BBU is overloaded. The current power consumption (load) is <field1> percent of the BBUs full load capability.','Field1:ups_load_in_percent','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_bypass_active_failure_true','1501102','Battery Backup Unit bypass mode is activated (there is no protection against power dips or outages).','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_need_bat_replce_failure_true','1501302','The cluster has detected that the Battery Backup Unit should be replaced.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_user_disabled','1501401','The Battery Backup Unit has been manually disabled by user request.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_system_disabled','1501403','Cluster has disabled the Backup Battery Unit.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_fru_failed','1501503','BBU has failed. Failure reason: <field1>','Field1:ups_alarm','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_fru_disconnected','1501504','BBU is disconnected from the cluster.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ups_fw_invalid','1501603','BBU firmware version is incompatible.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sas_sas1_port_down','1600202','DAE Controller SAS Port 1 is down.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('sas_connectivity_down','1600302','DAE Controller SAS connection is down.','','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodcontroller_user_disabled','1600402','The DAE Controller was manually disabled by user request.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodcontroller_system_disabled','1600403','The cluster has disabled the DAE LCC. It will no longer be in service.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodcontroller_fru_failed','1600503','The <field1> DAE Controller has failed.','Field1:location','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodcontroller_fru_disconnected','1600504','The <field1> DAE Controller is disconnected.','Field1:location','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodcontroller_fw_invalid','1600603','Firmware version of the <field1> Controller is incorrect. The cluster will try to use the DAE Controller.','Field1:location','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_lcc_level_5_major','1600915','DAE Controller health status is problematic. Attention is required.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('node_LCC_level_6_critical','1600916','DAE Controller health status is faulty. Immediate attention is required.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodpsu_user_disabled','1700202','The DAE PSU was manually disabled by user request.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodpsu_system_disabled','1700203','The cluster has disabled the DAE PSU. It will no longer be in service.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodpsu_fru_failed','1700303','The <field1> DAE PSU has failed.','Field1:location','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodpsu_fru_disconnected','1700304','The <field1> DAE PSU is disconnected.','Field1:location','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbodpsu_fw_invalid','1700403','Firmware version of the <field1> DAE PSU is incompatible. The PSU cannot be used.','Field1:location','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('dae_psu_ac_lost','1700702','No AC feed to DAE PSU was detected.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('dae_psu_ac_out_of_range','1700703','DAE PSU AC is out of range.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('dae_psu_ac_failed','1700704','DAE PSU AC failure was detected.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitchpsu_user_disabled','1700802','The InfiniBand Switch PSU was manually disabled by user request.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitchpsu_system_disabled','1700803','The cluster has disabled the InfiniBand Switch PSU. It will no longer be in service.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitchpsu_fru_failed','1700903','The <field1> InfiniBand Switch PSU has failed.','Field1:location','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitchpsu_fru_disconnected','1700904','The <field1> InfiniBand Switch PSU is disconnected.','Field1:location','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('ibswitchpsu_no_external_power','1701502','Power input to the InfiniBand Switch PSU has failed.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbod_fru_failed','1800303','DAE has failed.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('jbod_fru_disconnected','1800304','DAE is disconnected from the cluster.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('discovery_chap_initiators_missing_credentials_true','1901102','CHAP is enabled. Add discovery credentials to initiators. Otherwise',' a failure will occur when an initiator is disconnected and then re-connected.,','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xms_disk_low_free_space','2000002','Disk free space level is low. <field1> Kbytes are available.','Field1:free_space','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xms_disk_no_free_space','2000003','Insufficient disk space: <field1> Kbytes are available.','Field1:free_space','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xms_disk_very_low_free_space','2000004','Disk space level is critically low. <field1> Kbytes are available.','Field1:free_space','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xms_memory_low','2000012','XMS memory level is low. <field1> Kbytes are available.','Field1:free_memory','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xms_memory_full','2000013','XMS has insufficient free memory: only <field1> Kbytes are available.','Field1:free_memory','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xms_wrong_cn_true','2000102','XMS certificate contains wrong Common Name.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xms_disk_second_low_free_space','2000202','Disk space level of second partition is low. <field1> Kbytes are available.','Field1:free_disk_space_secondary','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xms_disk_second_very_low_free_space','2000203','Disk space level of second partition is critically low. <field1> Kbytes are available.','Field1:free_disk_space_secondary','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('xms_disk_second_no_free_space','2000204','Not enough disk space for second partition. XMS will block most operations. only <field1> Kbytes are available.','Field1:free_disk_space_secondary','Critical');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('scheduler_last_activation_failed','2500203','Last activation of scheduler has failed. Scheduler snapshot creation and deletion has been suspended.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('scheduler_last_activation_obj_not_found','2500204','Last activation of scheduler has failed. Invalid source object of the scheduler.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('scheduler_last_activation_vsg_max_reached','2500205','The number of volumes in a Volume Snapshot Group has reached the limit.','','Major');

INSERT INTO trapDataXMS (trapName, trapCode, trapMessage, trapFieldValues, trapSeverity) VALUES
('scheduler_last_activation_cluster_volumes_max_reached','2500206','The number of volumes in the cluster has reached the limit.','','Major');

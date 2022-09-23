# The proper term is pseudo_replica_mode, but we use this compatibility alias
# to make the statement usable on server versions 8.0.24 and older.
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 4
#220922 23:47:13 server id 1  end_log_pos 126 CRC32 0x6b2722eb 	Start: binlog v 4, server v 8.0.30 created 220922 23:47:13 at startup
ROLLBACK/*!*/;
BINLOG '
YUgtYw8BAAAAegAAAH4AAAAAAAQAOC4wLjMwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAABhSC1jEwANAAgAAAAABAAEAAAAYgAEGggAAAAICAgCAAAACgoKKioAEjQA
CigAAesiJ2s=
'/*!*/;
# at 126
#220922 23:47:13 server id 1  end_log_pos 157 CRC32 0xb682576a 	Previous-GTIDs
# [empty]
# at 157
#220922 23:47:56 server id 1  end_log_pos 236 CRC32 0x8dcb78cd 	Anonymous_GTID	last_committed=0	sequence_number=1	rbr_only=yes	original_committed_timestamp=1663912076169756	immediate_commit_timestamp=1663912076169756	transaction_length=727
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1663912076169756 (2022-09-22 23:47:56.169756 Central America Standard Time)
# immediate_commit_timestamp=1663912076169756 (2022-09-22 23:47:56.169756 Central America Standard Time)
/*!80001 SET @@session.original_commit_timestamp=1663912076169756*//*!*/;
/*!80014 SET @@session.original_server_version=80030*//*!*/;
/*!80014 SET @@session.immediate_server_version=80030*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 236
#220922 23:47:56 server id 1  end_log_pos 322 CRC32 0x9e8dcf00 	Query	thread_id=8	exec_time=0	error_code=0
SET TIMESTAMP=1663912076/*!*/;
SET @@session.pseudo_thread_id=8/*!*/;
SET @@session.foreign_key_checks=1, @@session.sql_auto_is_null=0, @@session.unique_checks=1, @@session.autocommit=1/*!*/;
SET @@session.sql_mode=1075838976/*!*/;
SET @@session.auto_increment_increment=1, @@session.auto_increment_offset=1/*!*/;
/*!\C utf8mb4 *//*!*/;
SET @@session.character_set_client=255,@@session.collation_connection=255,@@session.collation_server=255/*!*/;
SET @@session.lc_time_names=0/*!*/;
SET @@session.collation_database=DEFAULT/*!*/;
/*!80011 SET @@session.default_collation_for_utf8mb4=255*//*!*/;
BEGIN
/*!*/;
# at 322
#220922 23:47:56 server id 1  end_log_pos 395 CRC32 0x9235c264 	Table_map: `bd2_proyecto1`.`habitacion` mapped to number 88
# at 395
#220922 23:47:56 server id 1  end_log_pos 853 CRC32 0x28788e1e 	Write_rows: table id 88 flags: STMT_END_F

BINLOG '
jEgtYxMBAAAASQAAAIsBAAAAAFgAAAAAAAMADWJkMl9wcm95ZWN0bzEACmhhYml0YWNpb24AAgMP
AsgAAgEBAAID/P8AZMI1kg==
jEgtYx4BAAAAygEAAFUDAAAAAFgAAAAAAAEAAgAC/wABAAAAE1NhbGEgZGUgZXhhbWVuZXMgMQ0A
AgAAABNTYWxhIGRlIGV4YW1lbmVzIDINAAMAAAATU2FsYSBkZSBleGFtZW5lcyAzDQAEAAAAE1Nh
bGEgZGUgZXhhbWVuZXMgNA0ABQAAABNTYWxhIGRlIGltYWdlbmVzIDENAAYAAAAZU2FsYSBkZSBw
cm9jZWRpbWllbnRvcyAxDQAHAAAAGVNhbGEgZGUgcHJvY2VkaW1pZW50b3MgMg0ACAAAABlTYWxh
IGRlIHByb2NlZGltaWVudG9zIDMNAAkAAAAZU2FsYSBkZSBwcm9jZWRpbWllbnRvcyA0DQAKAAAA
ClJlY2VwY2lvbg0ACwAAAAxMYWJvcmF0b3Jpbw0ADAAAAB1Fc3RhY2nDg8KzbiBkZSByZXZpc2nD
g8KzbiAxDQANAAAAHUVzdGFjacODwrNuIGRlIHJldmlzacODwrNuIDINAA4AAAAdRXN0YWNpw4PC
s24gZGUgcmV2aXNpw4PCs24gMw0ADwAAAB1Fc3RhY2nDg8KzbiBkZSByZXZpc2nDg8KzbiA0DR6O
eCg=
'/*!*/;
# at 853
#220922 23:47:56 server id 1  end_log_pos 884 CRC32 0x617e07af 	Xid = 14
COMMIT/*!*/;
# at 884
#220922 23:49:04 server id 1  end_log_pos 941 CRC32 0xc3e79cbf 	Rotate to DESKTOP-65G3EF1-bin.000004  pos: 4
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;

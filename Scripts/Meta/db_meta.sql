use master
go

if db_id ('Meta') is not null
drop database Meta;
go

create database Meta
on primary (name = 'meta_fg1'
, filename = 'd:\disk\data5\meta_fg1.mdf'
, size = 2 MB, filegrowth = 512 KB)
, filegroup meta_fg2 (name = 'meta_fg2'
, filename = 'd:\disk\data6\meta_fg2.ndf'
, size = 2 MB, filegrowth = 512 KB)
log on (name = 'meta_log'
, filename = 'd:\disk\log4\meta_log.ldf'
, size = 512 KB, filegrowth = 128 KB)
collate SQL_Latin1_General_CP1_CI_AS
go

alter database Meta set recovery full
go
alter database Meta set auto_shrink on
go
alter database Meta set auto_create_statistics on
go
alter database Meta set auto_update_statistics on
go


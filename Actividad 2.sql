USE master;
Go

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'dblog')
    DROP DATABASE dblog;
GO

CREATE DATABASE dblog ON PRIMARY( 
    NAME = N'dblog',
    FILENAME = N'E:\base de datos\DB\respaldos\dblog.mdf' ,
	SIZE = 10240KB , FILEGROWTH = 1024KB )
	LOG ON
	( NAME = N'dblog_log',
		FILENAME = N'E:\base de datos\DB\respaldos\dblog_log.ldf' ,
	SIZE = 5120KB , FILEGROWTH = 10%);

GO

ALTER DATABASE dblog SET RECOVERY FULL;
GO

BACKUP DATABASE dblog TO DISK = 'E:\base de datos\DB\respaldos\dblog_full.bak' WITH INIT;
GO

USE dblog;
GO

CREATE TABLE LogData( 
    LogDataID int IDENTITY(1,1) PRIMARY KEY,
    LargeString nvarchar(600),
    LargeInt bigint);
GO

select * from LogData;

INSERT INTO LogData (LargeString,LargeInt) VALUES('This is some testdata',123456);
GO 200

BACKUP DATABASE dblog TO DISK = 'E:\base de datos\DB\respaldos\dblog_diff.trn' WITH DIFFERENTIAL;
GO

CREATE TABLE LogData1(
	LogDataID int IDENTITY(1,1) PRIMARY KEY,
	LargeString nvarchar(600),
	LargeInt bigint
);
GO

select * from LogData1;
GO

INSERT INTO LogData1 (LargeString,LargeInt) VALUES('This is some testdata',12345);
GO 200

BACKUP LOG dblog TO DISK = 'E:\base de datos\DB\respaldos\dblog_log.trn' WITH INIT
GO

USE master;
GO

drop database dblog;
GO

RESTORE DATABASE dblog FROM DISK = 'E:\base de datos\DB\respaldos\dblog_full.bak' WITH NORECOVERY 
GO

RESTORE DATABASE dblog FROM DISK = 'E:\base de datos\DB\respaldos\dblog_diff.trn' WITH NORECOVERY;
GO

RESTORE DATABASE dblog FROM DISK = 'E:\base de datos\DB\respaldos\dblog_log.trn'  
GO
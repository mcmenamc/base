use dblog;
GO

create  OR ALTER  procedure actividad_3
	as begin
	declare @fecha varchar(MAX)
	declare @archivo varchar(MAX)
	set @fecha=CONVERT(varchar(MAX),
	GETDATE(),102)+'_'+SUBSTRING(CONVERT(varchar(10), getdate(),108),1,2)+SUBSTRING(CONVERT(varchar(10),getdate(),108),4,2)+'horas'
	set @archivo= 'E:\base de datos\DB\respaldos\dblog'+@fecha+'.bak';
	BACKUP DATABASE dblog
	TO DISK = @archivo
	WITH FORMAT,
	MEDIANAME = 'D_SQLServerBackups',
	NAME = 'Full Backup of dblog';
	end;
GO

EXEC actividad_3;
GO
use master;

DROP DATABASE dblog;
GO

RESTORE DATABASE dblog FROM DISK = 'E:\base de datos\DB\respaldos\dblog2022.02.23_2328horas.bak'
GO
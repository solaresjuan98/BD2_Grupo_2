SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[TR4](

	@Role nvarchar(max)
)
AS
declare @id UNIQUEIDENTIFIER
set @id=NEWID()

IF @Role = null 
	BEGIN
	SELECT 'Se necesita un ROL valido';
	RETURN;
END
INSERT INTO practica1.Roles
	(Id,RoleName)
values
	(@id, @Role)

RETURN
GO

select *
from practica1.roles
drop procedure tr4

exec tr4 "admin"

create procedure TR1
   
    @FirstName nvarchar(max),
    @LastName nvarchar(max),
    @Email nvarchar(max),
    @DateOfBirth nvarchar(max),
    @Password nvarchar(max),
    @Credits int
as

/*
 ID DEL USUARIO

 */
declare @Id uniqueidentifier
set @Id=NEWID()
declare @UserId uniqueidentifier
/* PARA LA TABLA USUARIOS*/
declare @LastChanges datetime

declare @EmailConfirmed bit
Set @LastChanges=Getdate()
Set  @EmailConfirmed=0;


/*PARA LA TABLA Usuario ROle */
declare @IsLatestVersion bit
declare @Roled uniqueidentifier

Set @Roled=(select Id
from practica1.Roles
where RoleName='Student')

Set  @IsLatestVersion=1;


/*PARA LA TABLA Usuario TFA */
declare @Status bit
declare @LastUpdate datetime

Set @LastUpdate=Getdate()
Set  @Status=1;


Begin

    DECLARE @CorreoConfirm AS int

    SET @CorreoConfirm = (Select count(*)
    FROM practica1.Usuarios
    WHERE Usuarios.Email = @Email)

    IF @CorreoConfirm <> 0
       SELECT('Error correo ya existente')
ELSE

/* Insertar en la tabla Usuario Role*/

    INSERT INTO practica1.Usuarios
        (Id,Firstname,Lastname,Email,DateOfBirth,[Password],LastChanges,EmailConfirmed)
    values(@Id, @FirstName, @LastName , @Email, @DateOfBirth, @Password, @LastChanges, @EmailConfirmed)
    set @UserId=(SELECT TOP 1
        Id
    FROM practica1.Usuarios
    ORDER BY LastChanges DESC )
    print @UserId
    /*Añadir datos a la tabla USUARIO ROLE*/
    Insert into practica1.UsuarioRole
        (RoleId,UserId,IsLatestVersion)
    values
        (@Roled, @UserId, @IsLatestVersion)
           /*Añadir datos a la tabla ProfileStudent */
    Insert into practica1.ProfileStudent
        (UserId,Credits)
    values
        (@UserId, @Credits)
 /*Añadir datos a la tabla TFA */
            Insert into practica1.TFA
        (UserId,[Status],LastUpdate)
    values
        (@UserId, @Status,@LastUpdate)

         /*Añadir datos a la tabla TFA */
            Insert into practica1.Notification
        (UserId,[Message],[Date])
    values
        (@UserId, 'Usuario agregado correctamente',@LastUpdate)


END
GO
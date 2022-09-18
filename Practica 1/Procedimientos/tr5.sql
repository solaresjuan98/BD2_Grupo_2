SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
drop PROCEDURE tr5
create PROCEDURE TR5(
	
	@nombre nvarchar(max),
	@creditos int
)
AS    
	
	IF @nombre = null 
	BEGIN 
		SELECT 'Se necesita un codigo valido';
		RETURN;
	END
    declare @tabla table(codigo int)
    insert into @tabla(codigo) select CodCourse from practica1.Course
    DECLARE @codeCourse INT
    
    DECLARE @codeCourseAUX INT
    
    DECLARE @inc INT
    DECLARE @alv bit


    set @alv=1;

    while (@alv=1) BEGIN
    set @codeCourse=(SELECT FLOOR(RAND()*(1000-1)+1) ) 

    declare @id int = (select top(1) codigo from @tabla order by codigo)
    IF @codeCourse = @id
    BEGIN
    print('ya existente')
    end
    ELSE
    BEGIN

    set @alv= 0

    END 
    delete @tabla where codigo=@id
    
     INSERT INTO practica1.Course(CodCourse,Name,CreditsRequired) values (@codeCourse, @nombre,@creditos)

    
    end
    
GO

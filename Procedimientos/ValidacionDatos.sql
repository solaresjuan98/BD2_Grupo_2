

-- * Procedimiento de validación de datos

/*
    Al momento de una inserción de información es necesario que dichos datos
    sean correctos y acordes a la restricción de los campos y el tipo de datos que
    estén manejando, para ello se le solicita que se cree un procedimiento que
    maneje la actualización de tablas (Constraints) para cerciorarse que se
    ingresen datos correctos.

        ➔ Entidades Implicadas y campos:
            ◆ Usuarios
                ● FirstName, LastName: Validar que solamente sean
                ingresados letras.

            ◆ Course
                ● Name: Validar que solamente sean ingresados letras.
                ● CreditsRequired: Validar que solamente sean ingresados
                números.

*/

CREATE PROCEDURE practica1.TR7

AS

    -- * Tabla usuarios
    -- ? Validar que solo se ingresen letras en los campos 'FirstName', 'LastName'
    
    ALTER TABLE practica1.Usuarios
    ADD CONSTRAINT [constraint_Firstname] CHECK(
        [Firstname] NOT LIKE '%[0-9]%' AND
        [Firstname] NOT LIKE '[,.!?;;@/&¡!¿?#$()=*-_{}]'
    );


    ALTER TABLE practica1.Usuarios
    ADD CONSTRAINT [constraint_Lastname] CHECK(
        [Lastname] NOT LIKE '%[0-9]%' AND
        [Lastname] NOT LIKE '[,.!?;;@/&¡!¿?#$()=*-_{}]'
    );

    -- * Tabla course
    -- ? Valida que solo se ingresen letras en el campo 'Name'
    ALTER TABLE practica1.Course
    ADD CONSTRAINT [constraint_CourseName] CHECK(
        [Name] NOT LIKE '%[0-9]%' AND
        [Name] NOT LIKE '[,.!?;;@/&¡!¿?#$()=*-_{}]'
    );


    -- ? Valida que solo se ingresen numeros
    ALTER TABLE practica1.Course
    ADD CONSTRAINT [constraint_CreditsRequired] CHECK(
        [CreditsRequired] NOT LIKE '%[^0-9]%'
    );    


---
GO 

-- drop PROCEDURE practica1.TR7
    ALTER TABLE practica1.Course
    ADD CONSTRAINT [constraint_Name] CHECK(
        [Name] NOT LIKE '%[0-9]%' AND
        [Name] NOT LIKE '[,.!?;;@/&¡!¿?#$()=*-_{}]'
    );
GO




use BD2


GO

SELECT * FROM practica1.TFA

GO

SELECT TABLE_NAME,
       CONSTRAINT_TYPE,CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='Course'

GO

select * 
  from information_schema.columns 
 where table_name = 'Usuarios'
 order by ordinal_position

 GO
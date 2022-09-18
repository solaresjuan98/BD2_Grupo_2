CREATE FUNCTION practica1.func_loggger ()
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM practica1.HistoryLog
);

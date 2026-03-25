USE master;

IF NOT EXISTS(
	SELECT name FROM sys.databases where name = 'ZombiesDefense'
		COLLATE LATIN1_General_CI_AS
)
BEGIN
	CREATE DATABASE ZombiesDefense
	PRINT('SE CREO LA BASE DE DATOS')
END
ELSE
	BEGIN
		PRINT('Ya se encuentra creada')
	END


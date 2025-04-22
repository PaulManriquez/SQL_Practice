-- Create the database if it doesn't exist
CREATE DATABASE BodegasMueblesTx;
GO

USE BodegasMueblesTx;
GO

-- Create the destination table with appropriate types and constraints
CREATE TABLE dbo.BodegaExistenciaNuevo (
    bodega SMALLINT,
    codigo INT NOT NULL DEFAULT 0,
    existencia INT NOT NULL DEFAULT 0,
    disponible INT NOT NULL DEFAULT 0,
    surtidor SMALLINT NOT NULL DEFAULT 0,
    dcf INT NOT NULL DEFAULT 0,
    devolucion INT NOT NULL DEFAULT 0,
    existenciasubbodega INT NOT NULL DEFAULT 0
);
GO

-- Create a similar temporary table in a separate database (to simulate your procedure's operations)
CREATE TABLE dbo.tmpcorbodexistencianuevo123 (
    bodega SMALLINT,
    codigo INT NOT NULL DEFAULT 0,
    existencia INT NOT NULL DEFAULT 0,
    disponible INT NOT NULL DEFAULT 0,
    surtidor SMALLINT NOT NULL DEFAULT 0,
    dcf INT NOT NULL DEFAULT 0,
    devolucion INT NOT NULL DEFAULT 0,
    existenciasubbodega INT NOT NULL DEFAULT 0
);
GO

--=============================================

-- USE BodegasMueblesTx;
-- GO

-- CREATE PROCEDURE dbo.SP_CORSUBETXTATABLABODEXISTENCIANUEVO
--     --@iBodega SMALLINT,
--     --@cTablaOrigen VARCHAR(100),
--     @cTablaDestino VARCHAR(100)
-- WITH EXECUTE AS OWNER
-- AS
-- BEGIN
--     DECLARE @filePath NVARCHAR(MAX) = '/var/opt/mssql/data/cTablaOrigen.txt';
--                                     --    + CAST(@iBodega AS VARCHAR) + '\' 
--                                     --    + RTRIM(LTRIM(@cTablaOrigen)) + '.txt';

--     DECLARE @sSql NVARCHAR(MAX);

--     -- Attempt to execute the bulk insert
--     BEGIN TRY
--         SET @sSql = 'BULK INSERT dbo.tmpcorbodexistencianuevo123 FROM ''' 
--                      + @filePath + 
--                      ''' WITH 
--                      ( FIELDTERMINATOR = '',''
--                      ,ROWTERMINATOR = ''\n'', 
--                      CODEPAGE = ''65001'' )';
--         EXEC(@sSql);

--         -- Insert data into the destination table from temporary table
--         SET @sSql = 'INSERT INTO dbo.' + RTRIM(LTRIM(@cTablaDestino)) + 
--                     ' (bodega, codigo, existencia, disponible, surtidor, dcf, devolucion, existenciasubbodega)
--                      SELECT bodega, codigo, existencia, disponible, 
--                             surtidor, dcf, devolucion, existenciasubbodega 
--                      FROM dbo.tmpcorbodexistencianuevo123';

--         EXEC(@sSql);

--     END TRY
--     BEGIN CATCH
--         SELECT ERROR_NUMBER() AS ErrorNumber,
--                ERROR_SEVERITY() AS ErrorSeverity,
--                ERROR_STATE() AS ErrorState,
--                ERROR_PROCEDURE() AS ErrorProcedure,
--                ERROR_LINE() AS ErrorLine,
--                ERROR_MESSAGE() AS ErrorMessage;
--     END CATCH
-- END;
-- GO


USE BodegasMueblesTx;
GO
CREATE PROCEDURE dbo.SP_CORSUBETXTATABLABODEXISTENCIANUEVO
    @cTablaDestino VARCHAR(100)
AS
BEGIN
    DECLARE @filePath NVARCHAR(MAX) = '/var/opt/mssql/data/cTablaOrigen.txt';
    DECLARE @sSql NVARCHAR(MAX);

    -- Ensure the procedure is running in the correct database context
    SET @sSql = 'USE BodegasMueblesTx;';

    -- Attempt to execute the BULK INSERT
    BEGIN TRY
        -- Construct the BULK INSERT statement with correct escaping for single quotes
        SET @sSql = @sSql + 'BULK INSERT dbo.tmpcorbodexistencianuevo123 ' 
                     + 'FROM ''' + @filePath + ''' ' 
                     + 'WITH (FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'')';
        
        -- Print the dynamic SQL for debugging
        PRINT @sSql;

        -- Execute the dynamic SQL
        EXEC sp_executesql @sSql;

        -- Insert data into the destination table from temporary table
        SET @sSql = 'INSERT INTO dbo.' + RTRIM(LTRIM(@cTablaDestino)) + 
                    ' (bodega, codigo, existencia, disponible, surtidor, dcf, devolucion, existenciasubbodega) ' 
                    + 'SELECT bodega, codigo, existencia, disponible, surtidor, dcf, devolucion, existenciasubbodega ' 
                    + 'FROM dbo.tmpcorbodexistencianuevo123';

        EXEC sp_executesql @sSql;

    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_SEVERITY() AS ErrorSeverity,
               ERROR_STATE() AS ErrorState,
               ERROR_PROCEDURE() AS ErrorProcedure,
               ERROR_LINE() AS ErrorLine,
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO



--BodegaExistenciaNuevo
EXEC dbo.SP_CORSUBETXTATABLABODEXISTENCIANUEVO 
    --@iBodega = 1,
    --@cTablaOrigen = 'some',
    @cTablaDestino = 'BodegaExistenciaNuevo';

EXEC dbo.SP_CORSUBETXTATABLABODEXISTENCIANUEVO 
    @cTablaDestino = 'BodegaExistenciaNuevo';

SELECT * FROM sys.tables WHERE name = 'tmpcorbodexistencianuevo123';

select * from  dbo.BodegaExistenciaNuevo;   
select * from dbo.tmpcorbodexistencianuevo123;

truncate table dbo.BodegaExistenciaNuevo;
truncate table dbo.tmpcorbodexistencianuevo123;


BULK INSERT BodegasMueblesTx.dbo.tmpcorbodexistencianuevo123
FROM '/var/opt/mssql/data/cTablaOrigen.txt'
WITH(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

SELECT * FROM sys.tables WHERE name = 'tmpcorbodexistencianuevo123';

CREATE TABLE dbo.tmpcorbodexistencianuevo123 (
    bodega SMALLINT,
    codigo VARCHAR(50),
    existencia INT,
    disponible INT,
    surtidor VARCHAR(50),
    dcf DATE,
    devolucion INT,
    existenciasubbodega INT
);


ALTER TABLE dbo.tmpcorbodexistencianuevo123 ALTER COLUMN codigo INT NOT NULL;
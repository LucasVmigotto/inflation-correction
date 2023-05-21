IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'InflationCorrection')
    CREATE DATABASE InflationCorrection;

GO

USE InflationCorrection;

GO

IF OBJECT_ID(N'dbo.ipcae_rates', N'U') IS NULL
    CREATE TABLE [dbo].[ipcae_rates] (
        rate_date DATE NOT NULL,
        rate_value DOUBLE PRECISION NOT NULL
    );

GO

USE InflationCorrection;

GO

BULK INSERT [ipcae_rates]
    FROM '/confs/ipcae.csv'
    WITH(
        FIRSTROW = 2,
        ROWTERMINATOR = '0x0a',
        FIELDTERMINATOR = ','
    )

GO

CREATE TABLE [dbo].[loaded_data] (
  [ID] [int] IDENTITY,
  [DateEvent] [datetime] NOT NULL,
  [DateFirst] [datetime] NOT NULL,
  [DateLast] [datetime] NOT NULL,
  [Repl_ID] [uniqueidentifier] NOT NULL ROWGUIDCOL,
  [TrackData] [image] NOT NULL,
  [Car_ID] [numeric] NULL,
  CONSTRAINT [PK_LoadedData] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [idx_car_id]
  ON [dbo].[loaded_data] ([Car_ID])
  ON [PRIMARY]
GO

CREATE INDEX [idx_load_dada_date]
  ON [dbo].[loaded_data] ([DateEvent])
  INCLUDE ([ID])
  ON [PRIMARY]
GO

DECLARE @value SQL_VARIANT = CAST(N'Идентификатор' COLLATE Ukrainian_CI_AS AS nvarchar(13))
EXEC sys.sp_addextendedproperty N'MS_Description', @value, 'SCHEMA', N'dbo', 'TABLE', N'loaded_data', 'COLUMN', N'ID'
GO

DECLARE @value SQL_VARIANT = CAST(N'Дата события' COLLATE Ukrainian_CI_AS AS nvarchar(12))
EXEC sys.sp_addextendedproperty N'MS_Description', @value, 'SCHEMA', N'dbo', 'TABLE', N'loaded_data', 'COLUMN', N'DateEvent'
GO

DECLARE @value SQL_VARIANT = CAST(N'Первая дата в треке' COLLATE Ukrainian_CI_AS AS nvarchar(19))
EXEC sys.sp_addextendedproperty N'MS_Description', @value, 'SCHEMA', N'dbo', 'TABLE', N'loaded_data', 'COLUMN', N'DateFirst'
GO

DECLARE @value SQL_VARIANT = CAST(N'Последняя дата в треке' COLLATE Ukrainian_CI_AS AS nvarchar(22))
EXEC sys.sp_addextendedproperty N'MS_Description', @value, 'SCHEMA', N'dbo', 'TABLE', N'loaded_data', 'COLUMN', N'DateLast'
GO

DECLARE @value SQL_VARIANT = CAST(N'Ключ репликации' COLLATE Ukrainian_CI_AS AS nvarchar(15))
EXEC sys.sp_addextendedproperty N'MS_Description', @value, 'SCHEMA', N'dbo', 'TABLE', N'loaded_data', 'COLUMN', N'Repl_ID'
GO

DECLARE @value SQL_VARIANT = CAST(N'Загруженные сырые данные' COLLATE Ukrainian_CI_AS AS nvarchar(24))
EXEC sys.sp_addextendedproperty N'MS_Description', @value, 'SCHEMA', N'dbo', 'TABLE', N'loaded_data', 'COLUMN', N'TrackData'
GO

DECLARE @value SQL_VARIANT = CAST(N'Идентификатор автомобиля' COLLATE Ukrainian_CI_AS AS nvarchar(24))
EXEC sys.sp_addextendedproperty N'MS_Description', @value, 'SCHEMA', N'dbo', 'TABLE', N'loaded_data', 'COLUMN', N'Car_ID'
GO
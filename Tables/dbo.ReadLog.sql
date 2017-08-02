CREATE TABLE [dbo].[ReadLog] (
  [id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ReadLog_id] DEFAULT (newid()) ROWGUIDCOL,
  [fleet_type] [int] NULL,
  [fleet_id] [numeric] NULL,
  [date_event] [datetime] NULL,
  [lodaded_data] [int] NULL,
  CONSTRAINT [PK_ReadLog] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[ReadLog]
  ADD CONSTRAINT [FK_ReadLog_loaded_data] FOREIGN KEY ([lodaded_data]) REFERENCES [dbo].[loaded_data] ([ID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Тип транспортного средства', 'SCHEMA', N'dbo', 'TABLE', N'ReadLog', 'COLUMN', N'fleet_type'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Идентифкатор транспорта', 'SCHEMA', N'dbo', 'TABLE', N'ReadLog', 'COLUMN', N'fleet_id'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Дата события', 'SCHEMA', N'dbo', 'TABLE', N'ReadLog', 'COLUMN', N'date_event'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Ссылка на загруженные данные', 'SCHEMA', N'dbo', 'TABLE', N'ReadLog', 'COLUMN', N'lodaded_data'
GO
CREATE TABLE [dbo].[event_visits] (
  [id] [int] IDENTITY,
  [fleet_type] [int] NULL,
  [fleet_id] [numeric] NULL,
  [date_event] [datetime] NULL,
  [points] [nvarchar](max) NULL,
  [exceptedpoints] [nvarchar](max) NULL,
  CONSTRAINT [PK_event_visits] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [evnt_wiz_data]
  ON [dbo].[event_visits] ([date_event])
  ON [PRIMARY]
GO

CREATE INDEX [fi_index]
  ON [dbo].[event_visits] ([fleet_id])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[event_visits]
  ADD CONSTRAINT [FK_event_visits_transport_types_id] FOREIGN KEY ([fleet_type]) REFERENCES [dbo].[transport_types] ([id])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'События посещения', 'SCHEMA', N'dbo', 'TABLE', N'event_visits'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Дата события', 'SCHEMA', N'dbo', 'TABLE', N'event_visits', 'COLUMN', N'date_event'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Json серриализованное значение посещенных точек', 'SCHEMA', N'dbo', 'TABLE', N'event_visits', 'COLUMN', N'points'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Json серриализированное значение для непосещенных точек', 'SCHEMA', N'dbo', 'TABLE', N'event_visits', 'COLUMN', N'exceptedpoints'
GO
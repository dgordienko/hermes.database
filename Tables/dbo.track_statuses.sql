CREATE TABLE [dbo].[track_statuses] (
  [ID] [int] IDENTITY,
  [StatusName] [varchar](50) NULL,
  CONSTRAINT [PK_TrackStatuses] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
GO
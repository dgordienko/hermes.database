CREATE TABLE [dbo].[user_statuses] (
  [id] [int] IDENTITY,
  [status_id] [int] NOT NULL,
  [user_id] [int] NOT NULL,
  [track_id] [int] NOT NULL,
  CONSTRAINT [PK_user_statuses] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[user_statuses]
  ADD CONSTRAINT [FK_user_statuses_processed_tracks] FOREIGN KEY ([track_id]) REFERENCES [dbo].[processed_tracks] ([ID])
GO

ALTER TABLE [dbo].[user_statuses]
  ADD CONSTRAINT [FK_user_statuses_track_statuses] FOREIGN KEY ([status_id]) REFERENCES [dbo].[track_statuses] ([ID])
GO
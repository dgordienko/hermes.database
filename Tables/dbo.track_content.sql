CREATE TABLE [dbo].[track_content] (
  [id] [int] IDENTITY,
  [processed_track] [int] NULL,
  [loaded_data] [nvarchar](500) NULL,
  CONSTRAINT [PK_track_content] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE INDEX [processed_trackcontent_idx]
  ON [dbo].[track_content] ([processed_track])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[track_content]
  ADD CONSTRAINT [FK_track_content_processed_tracks] FOREIGN KEY ([processed_track]) REFERENCES [dbo].[processed_tracks] ([ID])
GO
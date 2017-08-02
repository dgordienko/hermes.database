CREATE TABLE [dbo].[edited_roures] (
  [ID] [int] IDENTITY,
  [processed_track_id] [int] NULL,
  [jsonobject] [varchar](max) NULL,
  CONSTRAINT [PK_edited_roures] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[edited_roures]
  ADD CONSTRAINT [FK_edited_roures_processed_tracks] FOREIGN KEY ([processed_track_id]) REFERENCES [dbo].[processed_tracks] ([ID])
GO
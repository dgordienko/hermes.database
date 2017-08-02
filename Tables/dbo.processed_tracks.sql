CREATE TABLE [dbo].[processed_tracks] (
  [ID] [int] IDENTITY,
  [Car_ID] [numeric] NOT NULL,
  [DateTrack] [datetime] NOT NULL,
  [Dictance] [float] NOT NULL,
  [Duration] [time] NOT NULL,
  [transport_type] [int] NULL CONSTRAINT [DF_processed_tracks_transport_type] DEFAULT (1),
  CONSTRAINT [PK_ProcessedTracks] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
GO

CREATE INDEX [pt_carid]
  ON [dbo].[processed_tracks] ([Car_ID])
  ON [PRIMARY]
GO

CREATE INDEX [pt_datetrack]
  ON [dbo].[processed_tracks] ([DateTrack])
  ON [PRIMARY]
GO
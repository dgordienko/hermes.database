CREATE TABLE [dbo].[source_tracks] (
  [ID] [int] IDENTITY,
  [CAR_ID] [numeric] NULL,
  [TRACK_DATE] [datetime] NULL,
  [TRACK_SOURCE] [image] NULL,
  CONSTRAINT [PK_source_tracks] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO
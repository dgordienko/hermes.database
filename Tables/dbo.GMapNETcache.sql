CREATE TABLE [dbo].[GMapNETcache] (
  [Type] [int] NOT NULL,
  [Zoom] [int] NOT NULL,
  [X] [int] NOT NULL,
  [Y] [int] NOT NULL,
  [Tile] [image] NOT NULL,
  CONSTRAINT [PK_GMapNETcache] PRIMARY KEY CLUSTERED ([Type], [Zoom], [X], [Y])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO
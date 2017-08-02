CREATE TABLE [dbo].[edit_info] (
  [id] [int] IDENTITY,
  [processed_id] [int] NULL,
  [editinfo] [nvarchar](max) NULL,
  [smoothinfo] [nvarchar](max) NULL,
  [edittingdate] [datetime] NULL,
  [editor] [numeric] NULL,
  CONSTRAINT [PK_edit_traks_info] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [processed_id_idx]
  ON [dbo].[edit_info] ([processed_id])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[edit_info]
  ADD CONSTRAINT [FK_edit_info_processed_tracks] FOREIGN KEY ([processed_id]) REFERENCES [dbo].[processed_tracks] ([ID])
GO
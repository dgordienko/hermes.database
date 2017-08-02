CREATE TABLE [dbo].[source_data] (
  [id] [int] IDENTITY,
  [loaded_data_id] [int] NULL,
  [gpx] [image] NULL,
  [fiter_data_key] [varchar](255) NULL,
  CONSTRAINT [PK_source_data] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO
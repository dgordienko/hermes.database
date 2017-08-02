CREATE TABLE [dbo].[custom_markers] (
  [id] [int] IDENTITY,
  [image_uri] [nvarchar](1024) NULL,
  [latitude] [float] NULL,
  [longtitude] [float] NULL,
  [description] [nvarchar](1024) NULL,
  CONSTRAINT [PK_custom_markers] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO
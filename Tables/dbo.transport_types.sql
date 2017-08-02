CREATE TABLE [dbo].[transport_types] (
  [id] [int] IDENTITY,
  [type_name] [nchar](500) NULL,
  CONSTRAINT [PK_transport_types] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO
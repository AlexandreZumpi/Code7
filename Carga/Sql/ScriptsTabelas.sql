USE [TesteDB]

CREATE TABLE [dbo].[tblCliente](
	[CodCliente] [int] IDENTITY(1,1) NOT NULL,
	[DescCliente] [varchar](500) NULL,
	[CodPais] [int] NULL,
	[DDD] [varchar](10) NULL,
	[Fone] [varchar](50) NULL,
	[CodSexo] [int] NULL,
 CONSTRAINT [PK_tblCliente] PRIMARY KEY CLUSTERED 
(
	[CodCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tblPais](
	[CodPais] [int] IDENTITY(1,1) NOT NULL,
	[DescPais] [varchar](50) NULL,
 CONSTRAINT [PK_tblPais] PRIMARY KEY CLUSTERED 
(
	[CodPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[tblPedido]    Script Date: 13/11/2020 15:02:35 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[tblPedido](
	[CodPedido] [int] IDENTITY(1,1) NOT NULL,
	[CodCliente] [int] NULL,
	[QtdPedidos] [int] NULL,
 CONSTRAINT [PK_tblPedidos] PRIMARY KEY CLUSTERED 
(
	[CodPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[tblQuestao](
	[CodQuestao] [int] IDENTITY(1,1) NOT NULL,
	[DescQuestao] [varchar](500) NULL,
 CONSTRAINT [PK_tblQuestao] PRIMARY KEY CLUSTERED 
(
	[CodQuestao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[tblQuestaoOpcao](
	[CodQuestaoOpcao] [int] IDENTITY(1,1) NOT NULL,
	[CodQuestao] [int] NOT NULL,
	[CodOpcao] [int] NOT NULL,
	[DescOpcao] [varchar](50) NULL,
 CONSTRAINT [PK_tblQuestaoOpcao_1] PRIMARY KEY CLUSTERED 
(
	[CodQuestaoOpcao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[tblResposta](
	[CodResposta] [int] IDENTITY(1,1) NOT NULL,
	[CodCliente] [int] NOT NULL,
	[CodQuestaoOpcao] [int] NOT NULL,
 CONSTRAINT [PK_tblResposta_1] PRIMARY KEY CLUSTERED 
(
	[CodResposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[tblSexo](
	[CodSexo] [int] IDENTITY(1,1) NOT NULL,
	[DescSexo] [varchar](50) NULL,
 CONSTRAINT [PK_tblSexo] PRIMARY KEY CLUSTERED 
(
	[CodSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[tblCliente]  WITH CHECK ADD  CONSTRAINT [FK_tblCliente_tblPais] FOREIGN KEY([CodPais])
REFERENCES [dbo].[tblPais] ([CodPais])

ALTER TABLE [dbo].[tblCliente] CHECK CONSTRAINT [FK_tblCliente_tblPais]

ALTER TABLE [dbo].[tblCliente]  WITH CHECK ADD  CONSTRAINT [FK_tblCliente_tblSexo] FOREIGN KEY([CodSexo])
REFERENCES [dbo].[tblSexo] ([CodSexo])

ALTER TABLE [dbo].[tblCliente] CHECK CONSTRAINT [FK_tblCliente_tblSexo]

ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedidos_tblPedidos] FOREIGN KEY([CodPedido])
REFERENCES [dbo].[tblPedido] ([CodPedido])

ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedidos_tblPedidos]

ALTER TABLE [dbo].[tblQuestaoOpcao]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestaoOpcao_tblQuestao] FOREIGN KEY([CodQuestao])
REFERENCES [dbo].[tblQuestao] ([CodQuestao])

ALTER TABLE [dbo].[tblQuestaoOpcao] CHECK CONSTRAINT [FK_tblQuestaoOpcao_tblQuestao]

ALTER TABLE [dbo].[tblResposta]  WITH CHECK ADD  CONSTRAINT [FK_tblResposta_tblCliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[tblCliente] ([CodCliente])

ALTER TABLE [dbo].[tblResposta] CHECK CONSTRAINT [FK_tblResposta_tblCliente]

ALTER TABLE [dbo].[tblResposta]  WITH CHECK ADD  CONSTRAINT [FK_tblResposta_tblQuestaoOpcao] FOREIGN KEY([CodQuestaoOpcao])
REFERENCES [dbo].[tblQuestaoOpcao] ([CodQuestaoOpcao])

ALTER TABLE [dbo].[tblResposta] CHECK CONSTRAINT [FK_tblResposta_tblQuestaoOpcao]


CREATE TABLE Code7Import(
  Arquivo varchar(255) NOT NULL,
  Data datetime NOT NULL
  PRIMARY KEY (Arquivo)
);


INSERT INTO Code7Import(Arquivo, Data) Values('tblCliente.csv', getdate())
INSERT INTO Code7Import(Arquivo, Data) Values('tblPais.csv', getdate())
INSERT INTO Code7Import(Arquivo, Data) Values('tblPedido.csv', getdate())
INSERT INTO Code7Import(Arquivo, Data) Values('tblQuestao.csv', getdate())
INSERT INTO Code7Import(Arquivo, Data) Values('tblQuestaoOpcao.csv', getdate())
INSERT INTO Code7Import(Arquivo, Data) Values('tblResposta.csv', getdate())
INSERT INTO Code7Import(Arquivo, Data) Values('tblSexo.csv', getdate())
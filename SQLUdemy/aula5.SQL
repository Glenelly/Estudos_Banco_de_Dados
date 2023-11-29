/*
Usuário(CódigoUsuário, Nome, CPF, Telefone)

Grupo(CódigoGrupo, CampoRegras, Nome, Descrição, DataCriação)

UsuárioGrupo(CódigoUsuário, CódigoGrupo, DataEntrada, DataSaida)
	CódigoUsuário referencia Usuário
	CódigoGrupo referencia Grupo 

Mensagem(CódigoMensagem, Texto, DataEnvio)

UsuárioMensagemGrupo(CódigoUsuário, CódigoGrupo, CódigoMensagem)
	CódigoUsuário referencia Usuário
	CódigoGrupo referencia Grupo 
	CódigoMensagem referencia mensagem 
*/

CREATE TABLE usuario(
    codigo_usuario INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(30),
    telefone VARCHAR(30)
);

CREATE TABLE grupo(
    codigo_grupo INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    campo_regras VARCHAR(5000),
    descricao VARCHAR(5000),
    data_criacao DATE
);

CREATE TABLE usuario_grupo(
    codigo_usuario INTEGER,
    codigo_grupo INTEGER,
    data_entrada DATE,
    data_saida DATE,
    FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo_usuario),
    FOREIGN KEY (codigo_grupo) REFERENCES grupo(codigo_grupo)
);

CREATE TABLE mensagem(
    codigo_mensagem INTEGER PRIMARY KEY,
    texto VARCHAR(5000),
    data_envio DATE
);

CREATE TABLE usuario_mensagen_grupo(
    codigo_usuario INTEGER,
    codigo_grupo INTEGER,
    codigo_mensagem INTEGER,
    FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo_usuario),
    FOREIGN KEY (codigo_grupo) REFERENCES grupo(codigo_grupo),
    FOREIGN KEY (codigo_mensagem) REFERENCES mensagem(codigo_mensagem)
);
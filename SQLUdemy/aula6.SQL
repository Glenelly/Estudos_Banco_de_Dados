/*
Usuário(CódigoUsuário, DataNascimento, Nome, Gênero, Username)

Postagem(CódigoPostagem, NCurtidas, NComentarios, Conteúdo, NDescurtidas, CódigoUsuário, DataPostagem)
	CódigoUsuário referencia Usuário

Comentários(CódigoComentário, CódigoPostagem, Ncurtidas, NDescurtidas, Conteúdo, Nrespostas, Datacomentário, CódigoUsuário, CódigoComentárioResposta)
	CódigoPostagem referencia Postagem 
	CódigoUsuário referencia Usuário
	CódigoComentárioResposta referencia Comentários 
	
*/

CREATE TABLE usuario(
    codigo_usuario INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    genero VARCHAR(30),
    username VARCHAR(100),
    data_nascimento DATE,
);

CREATE TABLE postagem(
    codigo_postagem INTEGER PRIMARY KEY,
    conteudo_texto VARCHAR (6000),
    numero_curtidas INTEGER,
    numero_comentarios INTEGER,
    numero_descurtidas INTEGER,
    data_postagem DATE,
    codigo_usuario INTEGER,
    FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo_usuario)
);

CREATE TABLE comentarios(
    codigo_comentario INTEGER PRIMARY KEY,
    conteudo_texto VARCHAR (6000),
    numero_curtidas INTEGER,
    numero_descurtidas INTEGER,
    
    numero_respostas INTEGER,
    data_comentario DATE,
    codigo_usuario INTEGER,
    codigo_postagem INTEGER,
    codigo_comentario_resposta INTEGER,
    FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo_usuario),
    FOREIGN KEY (codigo_postagem) REFERENCES postagem(codigo_postagem),
    FOREIGN KEY (codigo_comentario_resposta) REFERENCES comentarios(codigo_comentario)
);
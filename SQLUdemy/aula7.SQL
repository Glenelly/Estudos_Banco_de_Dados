CREATE TABLE pessoa(
    codigo_pessoa INTEGER PRIMARY KEY,
    nome VARCHAR (250)
);

INSERT INTO pessoa (codigo_pessoa, nome) VALUES (1, 'Matheus');
INSERT INTO pessoa (codigo_pessoa, nome) VALUES (2, 'Henrique');
INSERT INTO pessoa (codigo_pessoa, nome) VALUES (3, 'Ana'); 

SELECT * FROM pessoa;

CREATE TABLE postagem(
    codigo_postagem INTEGER PRIMARY KEY,
    conteudo VARCHAR (8000),
    codigo_pessoa INTEGER,
    FOREIGN KEY (codigo_pessoa) REFERENCES pessoa (codigo_pessoa)
);

INSERT INTO postagem (codigo_postagem, conteudo, codigo_pessoa) VALUES (1, 'Hoje eu acordei triste :()', 1);

SELECT * FROM pessoa, postagem WHERE postagem.codigo_pessoa = pessoa.codigo_pessoa;

CREATE TABLE comentario(
    codigo_comentario INTEGER PRIMARY KEY,
    conteudo VARCHAR (8000),
    codigo_pessoa INTEGER,
    postagem_comentada INTEGER,
    comentario_respondido INTEGER,
    FOREIGN KEY (codigo_pessoa) REFERENCES pessoa (codigo_pessoa),
    FOREIGN KEY (postagem_comentada) REFERENCES postagem (codigo_postagem),
    FOREIGN KEY (comentario_respondido) REFERENCES comentario (codigo_comentario)
);

INSERT INTO comentario (codigo_comentario, conteudo, codigo_pessoa, postagem_comentada) VALUES (1, 'O que houve?', 2, 1);

SELECT * FROM postagem comentario WHERE postagem.codigo_postagem = comentario.postagem_comentada;
SELECT * FROM postagem, comentario, pessoa WHERE postagem.codigo_postagem = comentario.postagem_comentada AND pessoa.codigo_pessoa = comentario.codigo_pessoa;

INSERT INTO comentario (codigo_comentario, conteudo, codigo_pessoa, postagem_comentada) VALUES (2, 'O que houve', 2, 1);
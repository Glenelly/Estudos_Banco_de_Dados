/*
(1) -> (N) -> (N)

Autor(CódigoAutor, Nome)

Livro(CodigoLivro, Titulo, AnoLançamento, Edição, Descrição, CódigoAutor)
	CódigoAutor referencia Autor 

Cliente(CódigoCliente, Nome, Identidade, Telefone)

LivroCliente(CódigoCliente, CodigoLivro, Data, Valor)
	CódigoCliente referencia cliente
	CodigoLivro referencia Livro 
*/

CREATE TABLE autor(
    codigo_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE livro(
    codigo_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    ano_lancamento DATE,
    edicao INTEGER, 
    descricao VARCHAR(5000),
    codigo_autor INTEGER,
    FOREIGN KEY (codigo_autor) REFERENCES autor(codigo_autor)
);

CREATE TABLE cliente(
    codigo_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100), 
    identidade VARCHAR(30), 
    telefone VARCHAR (30)
);

CREATE TABLE livro_cliente(
    codigo_livro INTEGER,
    codigo_cliente INTEGER,
    data_ DATE,
    valor_compra NUMERIC(10, 2),
    FOREIGN KEY(codigo_livro) REFERENCES livro(codigo_livro),
    FOREIGN KEY(codigo_cliente) REFERENCES cliente(codigo_cliente)
);

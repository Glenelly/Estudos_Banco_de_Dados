/*
Fabricante(CódigoFabricante, Cidade, Nome, CNPJ)

Vinho(CódigoVinho, DataProdução, Nome, Tipo, CódigoFabricante)
	CódigoFabricante referencia Fabricante

Cliente(CódigoCliente, Telefone, Nome, CPF)

ClienteVinho(CódigoCliente, CódigoVinho, Valor, Data, Quantidade)
	CódigoCliente referencia Cliente 
	CódigoVinho referencia Vinho 
*/

CREATE TABLE fabricante(
    codigo_fabricante SERIAL PRIMARY KEY, 
    nome VARCHAR(100),
    cidade VARCHAR(100),
    cnpj VARCHAR(30)
);

CREATE TABLE vinho(
    codigo_vinho SERIAL PRIMARY KEY, 
    nome VARCHAR(100),
    tipo VARCHAR(50),
    data_producao DATE,
    codigo_fabricante INTEGER,
    FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo_fabricante)
);

CREATE TABLE cliente(
    codigo_cliente SERIAL PRIMARY KEY, 
    nome VARCHAR(100),
    telefone VARCHAR(30),
    cpf VARCHAR(30)
);

CREATE TABLE cliente_vinho(
    codigo_cliente INTEGER,
    codigo_vinho INTEGER,
    data_ DATE,
    valor_compra NUMERIC(10, 2),
    quantidade INTEGER,
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
    FOREIGN KEY (codigo_vinho) REFERENCES vinho(codigo_vinho)
);


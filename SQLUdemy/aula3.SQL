/*
Cliente(CódigoCliente, Nome, CPF, Telefone, Endereço)

Vendedor(CódigoVendedor, CPF, Nome)

Veiculo(CódigoVeiculo, Fabricante, Ano, Modelo)

ClienteVendedorVeiculo(CódigoCliente, CódigoVendedor, CódigoVeiculo, Valor, Data)
	CódigoCliente referencia cliente
	CódigoVendedor referencia vendedor
*/

CREATE TABLE cliente(
    codigo_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    CPF VARCHAR(30), 
    telefone VARCHAR(30), 
    endereco VARCHAR(500)
);

CREATE TABLE vendedor(
    codigo_vendedor SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    CPF VARCHAR(30),
);

CREATE TABLE veiculo(
    codigo_veiculo SERIAL PRIMARY KEY,
    fabricante VARCHAR(100), 
    ano INTEGER, 
    modelo VARCHAR(100)
);

CREATE TABLE ClienteVendedorVeiculo(
    codigo_cliente INTEGER,
    codigo_vendedor INTEGER,
    codigo_veiculo INTEGER,
    data_ DATE,
    valor_compra NUMERIC(10, 2),
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
    FOREIGN KEY (codigo_vendedor) REFERENCES vendedor(codigo_vendedor),
    FOREIGN KEY (codigo_veiculo) REFERENCES veiculo(codigo_veiculo)
);
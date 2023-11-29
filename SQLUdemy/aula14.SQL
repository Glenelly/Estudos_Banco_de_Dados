CREATE TABLE produto(
    nome VARCHAR(100),
    valor NUMERIC(10, 2)
);

INSERT INTO produto (nome, valor) VALUES ('Produto A', 100.00);
INSERT INTO produto (nome, valor) VALUES ('Produto B', 200.00);
INSERT INTO produto (nome, valor) VALUES ('Produto C', 300.00);
SELECT * FROM produto;

BEGIN TRANSACTION; --Inicia a transação 
UPDATE produto SET valor = valor * 1.1; --Incrementa valores dos produtos em 10%
SELECT * FROM produto; --Consulta os dados após as alterações

COMMIT TRANSACTION; --Confirma a transação, Irreversível.
ROLLBACK TRANSACTION; --Cancela a transação, Irreversível.
SELECT * FROM produto;

DROP TABLE produto;
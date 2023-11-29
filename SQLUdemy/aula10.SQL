CREATE TABLE produto(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(250),
    tipo VARCHAR(250),
    valor NUMERIC(6, 2)
);

INSERT INTO produto(nome, tipo, valor) VALUES ('Banana', 'alimentício', 5);
INSERT INTO produto(nome, tipo, valor) VALUES ('Salgadinho', 'alimentício', 7);
INSERT INTO produto(nome, tipo, valor) VALUES ('Iogurte', 'alimentício', 10);
INSERT INTO produto(nome, tipo, valor) VALUES ('Pão', 'alimentício', 6);
INSERT INTO produto(nome, tipo, valor) VALUES ('Arroz', 'alimentício', 12);
INSERT INTO produto(nome, tipo, valor) VALUES ('Massa', 'alimentício', 11);
INSERT INTO produto(nome, tipo, valor) VALUES ('Chocolate', 'alimentício', 8);
INSERT INTO produto(nome, tipo, valor) VALUES ('Refrigerante', 'alimentício', 9);

INSERT INTO produto(nome, tipo, valor) VALUES ('Prato', 'Utensílio doméstico', 10);
INSERT INTO produto(nome, tipo, valor) VALUES ('Copo', 'Utensílio doméstico', 6);
INSERT INTO produto(nome, tipo, valor) VALUES ('Colher', 'Utensílio doméstico', 3);
INSERT INTO produto(nome, tipo, valor) VALUES ('Garfo', 'Utensílio doméstico', 4);
INSERT INTO produto(nome, tipo, valor) VALUES ('Faca', 'Utensílio doméstico', 3.5);
INSERT INTO produto(nome, tipo, valor) VALUES ('Escorredor de Massa', 'Utensílio doméstico', 7);

INSERT INTO produto(nome, tipo, valor) VALUES ('Sabão em pó', 'Produto de Limpeza', 14);
INSERT INTO produto(nome, tipo, valor) VALUES ('Detergente', 'Produto de Limpeza', 3.45);
INSERT INTO produto(nome, tipo, valor) VALUES ('Desinfetante', 'Produto de Limpeza', 9);
INSERT INTO produto(nome, tipo, valor) VALUES ('Amaciante', 'Produto de Limpeza', 19);

INSERT INTO produto(nome, tipo, valor) VALUES ('Sabonete Líquido', 'Produto de Higiene', 16);
INSERT INTO produto(nome, tipo, valor) VALUES ('Papel Higiênico', 'Produto de Higiene', 15);
INSERT INTO produto(nome, tipo, valor) VALUES ('Shampoo', 'Produto de Higiene', 20);
INSERT INTO produto(nome, tipo, valor) VALUES ('Pasta de Dente', 'Produto de Higiene', 7.6);
INSERT INTO produto(nome, tipo) VALUES ('Escova de Dentes', 'Produto de Higiene');

SELECT * FROM produto;

SELECT * FROM produto ORDER BY valor;
SELECT * FROM produto ORDER BY tipo;
SELECT * FROM produto ORDER BY tipo, valor;

SELECT COUNT(*) AS "Quantidade de Produtos" FROM produto;
SELECT COUNT(valor) AS "Quantidade de Produtos" FROM produto;

SELECT tipo AS "Tipo de Produto", COUNT(valor) AS "Quantidade de Produtos" FROM produto GROUP BY tipo ORDER BY tipo;

SELECT DISTINCT(tipo) FROM produto;
SELECT COUNT( DISTINCT(tipo)) AS "Quantidade de tipos de Produtos"  FROM produto;

SELECT nome FROM produto WHERE nome LIKE "C%";
SELECT nome FROM produto WHERE nome LIKE "%en%";
SELECT nome FROM produto WHERE nome LIKE "%ta%";
SELECT nome FROM produto WHERE nome LIKE "%_r%";
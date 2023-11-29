CREATE TABLE marca(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(250) NOT NULL
);

INSERT INTO marca (nome) VALUES ('Ford');
INSERT INTO marca (nome) VALUES ('Fiat');
INSERT INTO marca (nome) VALUES ('Jeep');
INSERT INTO marca (nome) VALUES ('Volvo');

SELECT * FROM marca;

CREATE TABLE automovel(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    valor NUMERIC(10, 2),
    codigo_marca INTEGER,
    FOREIGN KEY (codigo_marca) REFERENCES marca(codigo)
);

INSERT INTO automovel (nome, valor, codigo_marca) VALUES ('KA', 40000, 1);
INSERT INTO automovel (nome, valor, codigo_marca) VALUES ('EcoSport', 70000, 1);
INSERT INTO automovel (nome, valor, codigo_marca) VALUES ('Ranger', 150000, 1);

INSERT INTO automovel (nome, valor, codigo_marca) VALUES ('Mobi', 60000, 2);
INSERT INTO automovel (nome, valor, codigo_marca) VALUES ('Uno', 45000, 2);
INSERT INTO automovel (nome, valor, codigo_marca) VALUES ('Strada', 75000, 2);

INSERT INTO automovel (nome, valor, codigo_marca) VALUES ('Compass', 165000, 3);
INSERT INTO automovel (nome, valor, codigo_marca) VALUES ('Renegate', 80000, 3);
INSERT INTO automovel (nome, valor, codigo_marca) VALUES ('Cherokee', 400000, 3);

INSERT INTO automovel (nome) VALUES ('Gol');
INSERT INTO automovel (nome) VALUES ('Kwid', 50000);
INSERT INTO automovel (nome) VALUES ('Siena');

SELECT * FROM automovel;

SELECT * FROM marca;
SELECT nome FROM marca;

SELECT * FROM automovel;
SELECT nome, valor FROM automovel;

SELECT * FROM marca, automovel;
SELECT * FROM marca, automovel WHERE marca.codigo = automovel.codigo_marca;
SELECT * FROM automovel, marca WHERE marca.codigo = automovel.codigo_marca;

SELECT a.nome AS "Automóvel", valor AS "Valor", m.nome AS "Marca"
FROM marca m, automovel a WHERE m.codigo = a.codigo_marca;

SELECT a.nome AS "Automóvel", valor AS "Valor", m.nome AS "Marca"
FROM marca AS m, automovel AS a WHERE m.codigo = a.codigo_marca;

SELECT * FROM marca INNER JOIN automovel ON marca.codigo = automovel.codigo_marca;

SELECT * FROM marca LEFT OUTER JOIN automovel ON marca.codigo = automovel.codigo_marca
WHERE automovel.codigo_marca IS NULL;

SELECT * FROM marca RIGHT OUTER JOIN automovel ON marca.codigo = automovel.codigo_marca;

SELECT * FROM marca RIGHT OUTER JOIN automovel ON marca.codigo = automovel.codigo_marca 
WHERE marca.codigo IS NULL;

SELECT * FROM marca FULL OUTER JOIN automovel ON marca.codigo = automovel.codigo_marca;

SELECT * FROM marca FULL OUTER JOIN automovel ON marca.codigo = automovel.codigo_marca
WHERE automovel.codigo_marca IS NULL OR marca.codigo IS NULL;

SELECT * FROM automovel;

SELECT max(valor) FROM automovel;
SELECT * FROM automovel WHERE valor = 400000.00;

SELECT * FROM automovel WHERE valor = (SELECT * FROM automovel WHERE valor = 400000.00);

INSERT INTO automovel (nome, codigo_marca) VALUES ('XC60', (SELECT codigo FROM marca
WHERE nome = 'Volvo'));

UPDATE automovel SET valor = valor * 0.9 WHERE codigo_marca = (SELECT codigo FROM marca
WHERE nome = 'Ford');

DELETE FROM automovel WHERE CODIGO_MARCA = (SELECT codigo FROM marca WHERE nome ='Fiat');

SELECT max(valor) FROM (SELECT * FROM automovel WHERE codigo_marca = (SELECT * FROM automovel WHERE nome = 'Jeep')) AS "TabelaTemp";

SELECT * FROM automovel
WHERE valor = (SELECT min(valor) FROM (SELECT * FROM automovel WHERE codigo_marca = 
(SELECT * FROM automovel WHERE nome = 'Ford')) AS "TabelaTemp");

SELECT * FROM marca m, automovel a WHERE m.codigo = a.codigo_marca;

SELECT a.nome AS "Automóvel", valor AS "Valor", m.nome AS "Marca" 
FROM marca m, automovel a WHERE m.codigo = a.codigo_marca;

/*
CREATE VIEW dados_basicos AS SELECT a.nome AS "Automóvel", valor AS "Valor", m.nome AS "Marca" 
FROM marca m, automovel a WHERE m.codigo = a.codigo_marca;

SELECT * FROM dados_basicos;
*/

SELECT a.nome AS "Automóvel", valor AS "Valor", m.nome AS "Marca" 
FROM marca m, automovel a WHERE m.codigo = a.codigo_marca AND a.codigo_marca = 
(SELECT * FROM automovel WHERE nome = 'Ford');

/*
CREATE VIEW dados_basico_ford AS SELECT a.nome AS "Automóvel", valor AS "Valor", m.nome AS "Marca" 
FROM marca m, automovel a WHERE m.codigo = a.codigo_marca AND a.codigo_marca = 
(SELECT * FROM automovel WHERE nome = 'Ford');

SELECT * FROM dados_basico_ford;
*/



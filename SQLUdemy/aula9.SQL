CREATE TABLE departamento(
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR(200) NOT NULL
);

INSERT INTO departamento (nome) VALUES ('Suporte');
INSERT INTO departamento (nome) VALUES ('Marketing');
INSERT INTO departamento (nome) VALUES ('Vendas');

SELECT * FROM departamento;

CREATE TABLE funcionario(
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    salario NUMERIC(8, 2) NOT NULL DEFAULT 1500.50,
    codigo_departamento INTEGER,
    FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

INSERT INTO funcionario (nome) VALUES ('');

UPDATE funcionario SET codigo_departamento = 3 WHERE codigo = 1;
UPDATE funcionario SET codigo_departamento = 2 WHERE codigo = 1;

INSERT INTO funcionario (nome) VALUES ('Gabriel Perreira', 1);
INSERT INTO funcionario (nome) VALUES ('Lucas da Silva', 1, 2000.2);

INSERT INTO funcionario (nome, salario, codigo_departamento) VALUES ('Joana Barbosa', 3000, 2);
INSERT INTO funcionario (nome, salario, codigo_departamento) VALUES ('Pedro Trindade', 2000, 2);

INSERT INTO funcionario (nome, codigo_departamento, salario) VALUES ('Mathias da Lamenha', 3, 2500);
INSERT INTO funcionario (nome, codigo_departamento, salario) VALUES ('Ângelo, Fortunato', 3, 1750);

SELECT * FROM funcionario;
SELECT MAX(salario) FROM funcionario;
SELECT MIN(salario) FROM funcionario;
SELECT AVG(salario) FROM funcionario;
SELECT sum(salario) FROM funcionario;

SELECT * FROM funcionario ORDER BY nome;
SELECT * FROM funcionario ORDER BY nome DESC;
SELECT * FROM funcionario ORDER BY nome ASC;

SELECT * FROM funcionario WHERE salario > 2000 ORDER BY salario ASC;

DELETE FROM funcionario WHERE codigo = 4;


SELECT * FROM funcionario, departamento 
WHERE funcionario.codigo_departamento = departamento.codigo;

SELECT * FROM funcionario, departamento 
WHERE funcionario.codigo_departamento = departamento.codigo 
AND (departamento.nome = 'Vendas' 
OR departamento.nome = 'Marketing');

SELECT departamento.nome AS "Departamento", funcionario.nome AS "Funcionário" , salario 
FROM funcionario, departamento 
WHERE funcionario.codigo_departamento = departamento.codigo;

SELECT departamento.nome AS "Departamento", AVG(salario) FROM funcionario, departamento 
WHERE funcionario.codigo_departamento = departamento.codigo;

SELECT departamento.nome AS "Departamento", AVG(salario) AS "Média Salarial"
FROM funcionario, departamento 
WHERE funcionario.codigo_departamento = departamento.codigo 
GROUP BY departamento.nome
HAVING AVG(funcionario.salario) > 2000;

SELECT * FROM funcionario;

SELECT * FROM funcionario WHERE salario > 2000 AND salario < 3000;

SELECT * FROM funcionario WHERE salario BETWEEN 2000 AND 2500;

SELECT * FROM funcionario , departamento WHERE funcionario.codigo_departamento = departamento.codigo
AND departamento.nome IN ('Vendas', 'Marketing');

SELECT * FROM funcionario , departamento WHERE funcionario.codigo_departamento = departamento.codigo
AND departamento.nome NOT IN ('Suporte');


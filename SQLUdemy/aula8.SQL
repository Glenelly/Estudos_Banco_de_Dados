CREATE TABLE departamento(
    codigo_departamento INTEGER PRIMARY KEY,
    nome_departamento VARCHAR(250)
);

INSERT INTO departamento (codigo_departamento, nome_departamento) VALUES (1 , 'Suporte Técnico');
INSERT INTO departamento (codigo_departamento, nome_departamento) VALUES (2 , 'Contabilidade');
INSERT INTO departamento (codigo_departamento, nome_departamento) VALUES (3 , 'Recursos Humanos');

SELECT * FROM departamento;

CREATE TABLE funcionario(
    codigo_funcionario INTEGER PRIMARY KEY,
    nome_funcionario VARCHAR(250),
    codigo_chefe INTEGER NULL, 
    FOREIGN KEY (codigo_chefe) REFERENCES funcionario(codigo_funcionario)
);

INSERT INTO funcionario (codigo_funcionario, nome_funcionario) VALUES (1, 'Pedro');
INSERT INTO funcionario (codigo_funcionario, nome_funcionario, codigo_chefe) VALUES (2, 'Paula', 1);
INSERT INTO funcionario (codigo_funcionario, nome_funcionario, codigo_chefe) VALUES (3, 'Ana', 1);

SELECT * FROM funcionario;

SELECT chefe.nome_funcionario AS nome_chefe, chefiado.nome_funcionario AS nome_chefiado
FROM funcionario chefe, funcionario chefiado WHERE chefiado.codigo_chefe = chefe.codigo_funcionario;

CREATE TABLE departamento_funcionario(
    codigo_departamento INTEGER,
    codigo_funcionario INTEGER,
    carga_horaria INTEGER,
    FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo_departamento),
    FOREIGN KEY (codigo_funcionario) REFERENCES funcionario(codigo_funcionario)
);

INSERT INTO departamento_funcionario (codigo_funcionario, codigo_departamento, carga_horaria) VALUES (1,1, 10);
INSERT INTO departamento_funcionario (codigo_funcionario, codigo_departamento, carga_horaria) VALUES (1,2, 10);
INSERT INTO departamento_funcionario (codigo_funcionario, codigo_departamento, carga_horaria) VALUES (1,3, 10);
INSERT INTO departamento_funcionario (codigo_funcionario, codigo_departamento, carga_horaria) VALUES (2,2, 40);
INSERT INTO departamento_funcionario (codigo_funcionario, codigo_departamento, carga_horaria) VALUES (3,3, 40);

SELECT * FROM departamento, funcionario, departamento_funcionario
WHERE departamento_funcionario.codigo_departamento=departamento.codigo_departamento
AND departamento_funcionario.codigo_funcionario=funcionario.codigo_funcionario;

SELECT departamento.nome_departamento, funcionario.nome_funcionario, departamento_funcionario.carga_horaria
FROM departamento, funcionario, departamento_funcionario
WHERE departamento_funcionario.codigo_departamento=departamento.codigo_departamento
AND departamento_funcionario.codigo_funcionario=funcionario.codigo_funcionario;

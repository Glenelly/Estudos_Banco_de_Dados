CREATE TABLE departamento(
    nome VARCHAR(100)
);

--ALTER TABLE departamento ADD COLUMN codigo SERIAL;
ALTER TABLE departamento ADD PRIMARY KEY (codigo);
--ALTER TABLE departamento ADD COLUMN descricao TEXT;

SELECT * FROM information_schema.columns WHERE table_name = 'departamento';

INSERT INTO departamento (nome, descricao)
VALUES('Gestão de Recursos Humanos', 'Administração geral das pessoas da empresa'),
      ('Suporte Técnico', 'Mantem os equipamentos da empresa funcionando'),
      ('Contabilidade', 'Controla a parte financeira da empresa');

SELECT * FROM departamento;

DROP TABLE departamento;

CREATE TABLE funcionario(
    codigo SERIAL PRIMARY KEY,
    nomme VARCHAR(100),
    salario NUMERIC(10, 2),
    codigo_departamento INTEGER,
    cpf INTEGER
);

--ALTER TABLE funcionario RENAME COLUMN nomme TO nome;
ALTER TABLE funcionario DROP COLUMN cpf;
ALTER TABLE funcionario ADD CONSTRAINT foreing_key_codigo_departamento FOREIGN KEY 
(codigo_departamento) REFERENCES departamento(codigo);

DROP TABLE funcionario;

SELECT * FROM information_schema.columns WHERE table_name = 'funcionario';

INSERT INTO funcionario (nome, salario, codigo_departamento) VALUES ('Pedro', 5000, 1);
INSERT INTO funcionario (nome, salario, codigo_departamento) VALUES ('Ana', 5000, 1);

INSERT INTO funcionario (nome, salario, codigo_departamento) VALUES ('João', 3000, 2);
INSERT INTO funcionario (nome, salario, codigo_departamento) VALUES ('Juliana', 3000, 2);
INSERT INTO funcionario (nome, salario, codigo_departamento) VALUES ('Carlos', 3000, 2);

INSERT INTO funcionario (nome, salario, codigo_departamento) VALUES ('Gabriel', 7500, 3);
INSERT INTO funcionario (nome, salario, codigo_departamento) VALUES ('Patrícia', 7500, 3);

SELECT * FROM funcionario;

SELECT * FROM funcionario, departamento WHERE funcionario.codigo_departamento = departamento.codigo;

SELECT funcionario.nome AS "Funcionário", salario AS "Salário", departamento.nome AS "Departamento"
FROM funcionario, departamento
WHERE funcionario.codigo_departamento = departamento.codigo;


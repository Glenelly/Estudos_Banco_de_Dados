CREATE TABLE departamento(
    nome VARCHAR(100)
);

--ALTER TABLE departamento ADD COLUMN dodigo SERIAL CONSTRAINT primary_key_codigo PRIMARY KEY;
--ALTER TABLE departamento ADD COLUMN descicao TEXT;
--ALTER TABLE departamento ALTER COLUMN nome SET NOT NULL;
--ALTER TABLE departamento ALTER COLUMN descicao SET NOT NULL;

SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'departamento';

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
ALTER TABLE funcionario ADD CONSTRAINT foreign_key_codigo_departamento FOREIGN KEY
REFERENCES departamento(codigo);



DROP TABLE funcionario;

SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'funcionario'; 

SELECT * FROM information_schema.columns WHERE table_name = 'funcionario'; 



/*
CREATE TABLE Colaborador(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_registro TIMESTAMP
);

INSERT INTO Colaborador (nome) VALUES ('Nome A');
INSERT INTO Colaborador (nome) VALUES ('Nome B');
INSERT INTO Colaborador (nome) VALUES ('Nome C');
SELECT * FROM Colaborador;

--Função para gerar datas (procedimento armazenado)

CREATE OR REPLACE FUNCTION gerar_data_registro()
RETURNS TRIGGER AS $$
BEGIN 
    NEW.data_registro := now();
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

--Gatilho para gerar data antes de inserir um novo registro em Colaborador 
CREATE OR REPLACE TRIGGER trigger_data_colaborador
BEFORE INSERT ON Colaborador FOR EACH ROW
EXECUTE PROCEDURE gerar_data_registro();

INSERT INTO Colaborador (nome) VALUES ('Nome D');
INSERT INTO Colaborador (nome) VALUES ('Nome E');
INSERT INTO Colaborador (nome) VALUES ('Nome F');

SELECT * FROM Colaborador;

CREATE TABLE Auditoria(
    codigo SERIAL PRIMARY KEY,
    nome_antigo VARCHAR(100),
    nome_novo VARCHAR(100), 
    data_registro TIMESTAMP
);

--Gatilho para gerar data de inserir um novo registro em Auditoria
CREATE OR REPLACE TRIGGER trigger_data_auditoria
BEFORE INSERT ON Auditoria FOR EACH ROW 
EXECUTE PROCEDURE gerar_data_registro();

--Função para registrar mudanças em nomes de colaboradores (procedimentos armazenados)
CREATE OR REPLACE FUNCTION gravar_em_auditoria()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Auditoria (nome_antigo, nome_novo) VALUES (OLD.nome, NEW.nome);
    RETURN new;
END;
$$ LANGUAGE 'plpgsql';

--Gatilho que executa a função acima após uma atualização em Colaborador 
CREATE OR REPLACE TRIGGER trigger_auditoria 
AFTER UPDATE ON Colaborador 
FOR EACH ROW
EXECUTE PROCEDURE gravar_em_auditoria();

UPDATE Colaborador SET nome = 'Nome Ff' WHERE nome = 'Nome F';
UPDATE Colaborador SET nome = 'Nome Aa' WHERE nome = 'Nome A';
UPDATE Colaborador SET nome = 'Nome Dd' WHERE nome = 'Nome D';]

SELECT * FROM Colaborador;

SELECT * FROM Auditoria;

DELETE FROM Colaborador;

DELETE FROM Auditoria;
*/
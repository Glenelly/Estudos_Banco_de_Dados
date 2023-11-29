CREATE TABLE pessoa(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    altura REAL NOT NULL, 
    peso INTEGER NOT NULL
);

INSERT INTO pessoa (nome, altura, peso) VALUES ('João', 1.71, 79);
INSERT INTO pessoa (nome, altura, peso) VALUES ('Ana', 1.68, 51);
SELECT * FROM pessoa;

/*
CREATE OR REPLACE PROCEDURE criar_pessoa(nome VARCHAR(50), altura REAL, peso INTEGER)
LANGUAGE SQL
AS $$
    INSERT INTO pessoa (nome, altura, peso) VALUES  (nome, altura, peso);
$$;

CALL criar_pessoa('Pedro', 1.75, 53);
CALL criar_pessoa('Karla', 1.63, 50);
CALL criar_pessoa('Junior', 1.76, 90);
CALL criar_pessoa('Bruna', 1.72, 73);
SELECT * FROM pessoa;

DROP PROCEDURE criar_pessoa(VARCHAR(50),REAL,INTEGER);
*/

--Criando uma função mais simples 
/*
CREATE OR REPLACE FUNCTION obter_imc(altura REAL, peso INTEGER)
RETURNS TEXT AS $$
BEGIN 
    RETURN 'IMC: ' || peso / (altura * altura) || '.';
END 
$$ LANGUAGE plpgsql;

SELECT obter_imc(1.7, 90);
SELECT codigo, nome, altura, peso, obter_imc(altura, peso) from pessoa;

DROP FUNCTION obter_imc(real, integer);

--Criando uma função mais complexa
CREATE OR REPLACE FUNCTION obter_imc_situacao(altura REAL, peso INTEGER)
RETURNS TEXT AS $$
DECLARE
    imc NUMERIC(5, 2) := 0;
    situacao TEXT;
BEGIN
    imc := peso / (altura * altura);
    IF imc < 18.5 THEN 
        situacao := 'Peso abaixo do normal.';
    ELSIF imc > 18.5 AND imc > 24.9 THEN   
        situacao := 'Peso normal.';
    ELSE
        situacao := 'Peso acima do normal.';

    END IF;
    RETURN 'IMC: ' || imc || '. ' || situacao;
END;
$$ LANGUAGE plpgsql;

SELECT obter_imc_situacao(1.7, 80);
SELECT codigo, nome, altura, peso, obter_imc(altura, peso) from pessoa;

DROP FUNCTION obter_imc_situacao(real, integer);
*/


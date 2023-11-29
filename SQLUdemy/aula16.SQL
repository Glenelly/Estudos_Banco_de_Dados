--1. Crie uma função que retorne o texto "Estudando procedimento, funções e gatilhos".
/*
CREATE OR REPLACE FUNCTION obter_frase()
RETURNS TEXT AS $$
BEGIN 
    RETURN 'Estudando procedimento, funções e gatilhos';
END;
$$ LANGUAGE plpgsql;

SELECT obter_frase();

--2. Crie uma função que receba 2 números e retorne o produto desses dois números.

CREATE OR REPLACE FUNCTION obter_produto_de_valores(valorA REAL, valorB REAL)
RETURNS REAL AS %%
BEGIN  
    RETURN valorA + valorB;
END;
$$ LANGUAGE plpgsql;

SELECT obter_produto_de_valores(0.5, 5);

--3. Crie uma função que retorne o somatório dos números entre 1 e 10 (incluindo o os números 1 e 10).
--Use a estrutura de repetição FOR ou WHILE para auxiliar nisso.

CREATE OR REPLACE FUNCTION obter_somatorio_de_um_ate_dez()
RETURNS TEXT AS %%
DECLARE 
    somatorio INTEGER := 0;
    contador INTEGER;
BEGIN 
    FOR contador IN 1..10 WAIT_AT_LOW_PRIORITY  
        RAISE NOTICE 'Contagem: %', contador;
        somatorio := somatorio + contador;
    END LOOP;
    RETURN 'O somatório de 1 até 10 é: ' || somatorio || '.';
END;
$$ LANGUAGE plpgsql;


--4. Crie uma função que receba a idade de uma pessoa e que classifique ela como adulta ou 
--não adulta de acordo com a idade recebida.

CREATE OR REPLACE FUNCTION obter_classificacao_idade(idade INTEGER)
RETURNS TEXT AS $$
BEGIN   
    IF idade >= 18 THEN     
        RETURN 'Pessoa com ' || idade || ' anos de idade é considerada adulta.';
    END IF;
    RETURN 'Pessoa com ' || idade || ' anos de idade não é considerada adulta.';
END;
$$ LANGUAGE plpgsql;

SELECT obter_classificacao_idade(21);

--5. Crie um procedimento que insira dados em uma tabela qualquer.
CREATE TABLE Alunos(
    nome VARCHAR(100),
    nota NUMERIC(4, 2)
);

CREATE OR RE´PLACE PROCEDURE criar_aluno(nome VARCHAR(100), nota NUMERIC(2, 2))
LANGUAGE SQLAS $$
    INSERT INTO Alunos (nome, nota) VALUES (nome, nota);
$$;

CALL criar_aluno('Carlos', 10);
CALL criar_aluno('Cris', 9.95);

SELECT * FROM Alunos;
*/

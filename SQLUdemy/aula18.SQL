/*
1. Para que servem os gatilhos (TRIGGERS)?
    Os gatilhos servem paqra executar ações automáticas antes ou depois (BEFORE OR AFTER)
de eventos (INSERT ou update OU DELETE) que ocorrem sobre uma tabela (ou view).

2. Que tipo de procedimento um gatilho invoca?
    Um gatilho invoca um procedimento armazenado.
Um gatilho invoca, mais especificamente, uma função (função engatilhada).

3. Quais são os eventos que podem ser "observados" pelos gatilhos?
    Os eventos que um gatilho pode "observar" são: INSERT ou UPDATE ou DELETE.

4. Quais são os passos básicos para a criação e utilização de um gatilho?
    Criar uma função engatilhada e depois criar um gatilho que invoque essa função engatilhada.

5. Qual a diferença entre o BEFORE e o AFTER na criação e utilização de gatilhos?
    O BEFORE vai disparar o gatilho antes do evento que ele monitora ser concretizado.
    O AFTER vai disparar o gatilho depois do evento que ele monitora ser concretizado.

6. Qual a diferença entre um procedimento armazenado engatilhado
(função engatilhada) e um gatilho e como eles se relacionam?
    Uma função engatilhada retorna o tipo TRIGGER e executa ações quando invocada por um gatilho.
    Um gatilho "observa" eventos sobre uma tabela (ou view), 
    invocando uma função engatilhada quando os eventos desejados ocorrem.

7. Como obter os dados velhos e os dados novos utilizando um gatilho que está, por exemplo, 
observando atualizações sobre uma tabela?
    É possível usar as palavras reservadas NEW e OLD para obter valores de campos novos e antigos.
    Em uma inserção, só estará disponível o NEW.
    Em uma atualização, o NEW e o OLD estarão desponíveis.
    Em uma remoção, somente o OLD estará disponível.

8. Complemente aquele último gatilho da demonstração prática para que ele atenda a exclusão e a 
inserção de dados (ele estava configurado para observar apenas atualização de dados.)


CREATE OR REPLACE FUNCTION gravar_em_auditoria()
RETURNS TRIGGER AS $$
BEGIN 
    INSERT INTO Auditoria (nome_antigo, nome_novo) VALUES (OLD.nome, NEW.nome);
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE TRIGGER trigger_auditoria
AFTER UPDATE OR INSERT OR DELETE ON Colaborador 
FOR EACH ROW 
EXECUTE PROCEDURE gravar_em_auditoria();

INSERT INTO Colaborador (nome) VALUES ('Nome G'); 
UPDATE Colaborador SET nome = 'Nome Bb' WHERE nome = 'Nome B';
DELETE FROM Colaborador WHERE nome = 'Nome Aa';
SELECT * FROM Auditoria;

/*
9. Crie um gatilho que impeça a criação de colaboradores com nomes repetidos.
*/

CREATE OR REPLACE FUNCTION evitar_repeticao()
RETURNS TRIGGER AS $$
DECLARE 
    res TEXT;
BEGIN
    res := (SELECT nome FROM Colaborador WHERE nome = NEW.nome);
    IF res IS NULL THEN 
        RETURN NEW;
    END IF;

    RAISE EXCEPTION 'Já existe um colaborado com nome "%"!', NEW.nome;
    --RETURN NULL;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE TRIGGER trigger_evitar_repeticao
BEFORE INSERT ON Colaborador FOR EACH ROW 
EXECUTE PROCEDURE evitar_repeticao();

INSERT INTO Colaborador (nome) VALUES ('Nome G'); 
INSERT INTO Colaborador (nome) VALUES ('Nome H'); 

SELECT * FROM Colaborador;

--10. Crie um gatilho que impeça a criação de amis de 10 colaboradores.

CREATE OR REPLACE FUNCTION evitar_mais_do_que_dez()
RETURNS TRIGGER AS $$
DECLARE 
    res INTEGER;
BEGIN 
    res := (SELECT COUNT(*) FROM Colaboradores);
    IF res < 10 THEN 
        RETURN NEW;
    END IF;

    RAISE EXCEPTION 'Não é possível cadastrar mais de 10 colaboradores!';
    --RETURN NULL;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE TRIGGER trigger_evitar_mais_do_que_dez
BEFORE INSERT ON Colaborador FOR EACH ROW
EXECUTE PROCEDURE evitar_mais_do_que_dez();

INSERT INTO Colaborador (nome) VALUES ('Nome I');
INSERT INTO Colaborador (nome) VALUES ('Nome J');
INSERT INTO Colaborador (nome) VALUES ('Nome K');
INSERT INTO Colaborador (nome) VALUES ('Nome L');

SELECT * FROM Colaborador ORDER BY codigo;   
*/
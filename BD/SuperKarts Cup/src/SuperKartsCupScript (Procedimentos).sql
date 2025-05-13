USE `SuperKartsCup`;

SET SQL_SAFE_UPDATES = 0;


DELIMITER $$
-- DROP TRIGGER cria_encomenda;
CREATE TRIGGER cria_encomenda
AFTER INSERT ON Encomenda
FOR EACH ROW
BEGIN
    INSERT INTO Notificacao (descricao, idEncomenda)
    VALUES (
        CONCAT('Nova encomenda criada com ID: ', NEW.idEncomenda, 
               ', Valor: ', NEW.Valor, 
               ', Quantidade: ', NEW.Quantidade),
        NEW.idEncomenda
    );
END$$
DELIMITER ;


DELIMITER $$
-- DROP TRIGGER atualiza_encomenda;
CREATE TRIGGER atualiza_encomenda
AFTER UPDATE ON Encomenda
FOR EACH ROW
BEGIN
    INSERT INTO Notificacao (descricao, idEncomenda)
    VALUES (
        CONCAT('Encomenda com ID ', NEW.idEncomenda, 
               ' foi alterada. Estado atual: ', NEW.Estado, 
               ', Valor: ', NEW.Valor, 
               ', Quantidade: ', NEW.Quantidade),
        NEW.idEncomenda
    );
END$$
DELIMITER ;


DELIMITER $$
-- DROP PROCEDURE AtualizarPontosEquipas();
CREATE PROCEDURE AtualizarPontosEquipas()
BEGIN
    UPDATE Equipas
    SET Equipas.Pontos = (
        SELECT SUM(Classificacao.Pontos)
        FROM Classificacao
        JOIN Pilotos ON Classificacao.numero_Piloto = Pilotos.numero_Piloto
        WHERE Pilotos.Equipas_idEquipas = Equipas.idEquipas
    );
END$$
DELIMITER ;



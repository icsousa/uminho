USE `SuperKartsCup`;

-- DROP VIEW InfoEquipas;
CREATE VIEW InfoEquipas AS
SELECT
	Equipas.idEquipas,
    Equipas.Nome AS NomeEquipa,
    Equipas.morada_rua,
    Equipas.morada_localidade,
    Equipas.morada_porta,
    Equipas.morada_codigoPostal,
    Equipas.contacto_telemovel,
    Equipas.contacto_email,
    Pilotos.Nome AS NomePiloto,
    `Funcionarios da Equipa`.Nome AS NomeFuncionario,
    `Funcionarios da Equipa`.tipo_funcequipa
FROM
    Equipas
INNER JOIN
    Pilotos ON Equipas.idEquipas = Pilotos.Equipas_idEquipas
INNER JOIN
    `Funcionarios da Equipa` ON Equipas.idEquipas = `Funcionarios da Equipa`.Equipas_idEquipas;

-- DROP VIEW ComunicaFuncionarioEquipa;
CREATE VIEW ComunicaFuncionarioEquipa AS
SELECT 
	Comunica.Funcionarios_idFuncionarios,
    Funcionarios.Nome AS NomeFuncionario,
    Comunica.Equipas_idEquipas,
    Equipas.Nome AS NomeEquipa
FROM
	Comunica
INNER JOIN
	Funcionarios ON Comunica.Funcionarios_idFuncionarios = Funcionarios.idFuncionarios
INNER JOIN
	Equipas ON Comunica.Equipas_idEquipas = Equipas.idEquipas;

-- DROP VIEW InfoEncomenda;
CREATE VIEW InfoEncomenda AS
SELECT
	Encomenda.idEncomenda,
    Encomenda.Valor,
    Encomenda.idlembranca,
    Lembrancas.Nome AS NomeLembra,
    Encomenda.Quantidade,
    Encomenda.idfuncionario,
    Funcionarios.Nome AS NomeFuncionario,
    Encomenda.idfornecedor,
    Fornecedor.Nome AS NomeFornecedor,
	Fornecedor.contacto_telemovel AS FornecedorTel,
    Fornecedor.contacto_email AS FornecdorEmail
FROM
	Encomenda
INNER JOIN
	Lembrancas ON Encomenda.idlembranca = Lembrancas.idLembrancas
INNER JOIN
	Funcionarios ON Encomenda.idfuncionario = Funcionarios.idFuncionarios
INNER JOIN
	Fornecedor ON Encomenda.idfornecedor = Fornecedor.idFornecedor;

-- DROP VIEW InfoPiloto;
CREATE VIEW InfoPiloto AS
SELECT DISTINCT
	Pilotos.numero_Piloto,
    Pilotos.Nome AS NomePiloto,
    Pilotos.data_nasc,
    Classificacao.Pontos,
    Corrida.tipo,
    Pilotos.contacto_telemovel,
    Pilotos.contacto_email,
    Pilotos.morada_rua,
    Pilotos.morada_localidade,
    Pilotos.morada_porta,
    Pilotos.morada_codigoPostal,
    Pilotos.Equipas_idEquipas,
    Equipas.Nome AS NomeEquipa,
    Evento.Nome AS NomeEvento
FROM
	Pilotos
INNER JOIN
	Classificacao ON Pilotos.numero_Piloto = Classificacao.numero_Piloto
INNER JOIN
	Corrida ON Classificacao.Corrida_tipo = Corrida.tipo
INNER JOIN
	Evento ON Corrida.idEvento = Evento.idEvento
INNER JOIN
	Equipas ON Pilotos.Equipas_idEquipas = Equipas.idEquipas;

-- DROP VIEW EquipaVencedora;
CREATE VIEW EquipaVencedora AS
SELECT DISTINCT
	Evento.idEvento,
    Evento.Nome AS NomeEvento,
    Equipas.idEquipas,
    Equipas.Nome AS NomeEquipaVencedora,
    Equipas.Pontos
FROM
	Evento
INNER JOIN
	Corrida ON Evento.idEvento = Corrida.idEvento
INNER JOIN
	Classificacao ON Corrida.idEvento = Classificacao.idEvento
INNER JOIN
	Pilotos ON Classificacao.numero_Piloto = Pilotos.numero_Piloto
INNER JOIN
	Equipas ON Pilotos.Equipas_idEquipas = Equipas.idEquipas
WHERE
	Equipas.Pontos = (SELECT MAX(Pontos) FROM Equipas);


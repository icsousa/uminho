USE `SuperKartsCup`;

-- Quais são as equipas registadas para o evento?
SELECT DISTINCT
	Equipas.idEquipas,
    Equipas.Nome AS NomeEquipa
FROM 
	Equipas
INNER JOIN
	Pilotos ON  Equipas.idEquipas = Pilotos.Equipas_idEquipas
INNER JOIN
	Classificacao ON Pilotos.numero_Piloto = Classificacao.numero_Piloto
WHERE
	Classificacao.idEvento = 1
ORDER BY
	Equipas.idEquipas;
	
-- Qual é o histórico de vendas realizadas por um funcionário específico?
SELECT
	Funcionarios.idFuncionarios,
    Funcionarios.Nome AS NomeFuncionario,
	Venda.idVenda,
    Venda.Valor,
	Venda.Data_venda,
	Venda.lembrancas,
    lembrancas.nome AS NomeLembrancas,
	Venda.espectadores,
    Espectadores.Nome AS NomeEspectador
FROM
	Venda
INNER JOIN
	Funcionarios ON Venda.funcionario = Funcionarios.idFuncionarios
INNER JOIN 
	Lembrancas ON Venda.lembrancas = Lembrancas.idLembrancas
INNER JOIN
	Espectadores ON Venda.espectadores = Espectadores.idEspectadores
WHERE
	Funcionarios.Nome = 'Jorge Nuno Pinto da Costa';
    
-- Quais são os artigos disponíveis em stock e suas respetivas quantidades para um evento específico?
SELECT 
	Lembrancas.idLembrancas,
	Lembrancas.Nome,
	Lembrancas.Quantidade,
	Lembrancas.Preço
FROM
	Lembrancas
WHERE
	Lembrancas.Quantidade > 0
	AND Lembrancas.Evento_idEvento = 1;

-- Que árbitros estão designados para uma prova específica de um evento específico?
SELECT
	Arbitro.idArbitro,
	Arbitro.Nome,
    Arbitro.data_nasc,
	Arbitro.morada_rua,
	Arbitro.morada_localidade,
	Arbitro.morada_porta,
	Arbitro.morada_codigoPostal,
	Arbitro.contacto_telemovel,
	Arbitro.contacto_email
FROM
	Arbitro
WHERE
	Arbitro.idEvento  = 1
    AND Arbitro.Corrida_Tipo = 'Clássica';
	
-- Quais são os dados dos fornecedores com encomendas pendentes?
SELECT
	Encomenda.idEncomenda,
	Encomenda.Valor,
	Encomenda.Quantidade,
    Encomenda.idlembranca,
    Lembrancas.Nome AS NomeLembranca,
    Encomenda.idfornecedor,
    fornecedor.Nome,
	fornecedor.tipo_lembranca,
	fornecedor.morada_rua,
	fornecedor.morada_localidade,
	fornecedor.morada_porta,
	fornecedor.morada_codigoPostal,
	fornecedor.contacto_telemovel,
	fornecedor.contacto_email
FROM
	Encomenda
INNER JOIN
	Lembrancas ON Encomenda.idlembranca = Lembrancas.idLembrancas
INNER JOIN
	Fornecedor ON Encomenda.idfornecedor = Fornecedor.idFornecedor
WHERE
	Encomenda.Estado = 1;
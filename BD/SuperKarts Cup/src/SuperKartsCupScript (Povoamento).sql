USE `SuperKartsCup`;

-- DELETE FROM `SuperKartsCup`.`Evento`;
INSERT INTO `SuperKartsCup`.`Evento`
	(idEvento, Nome, Gastos, data_inicio, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email)
    VALUES ('1', 'SuperKarts Cup 21', '30000','2024-09-22', 'Sítio do Escampadinho', 'Portimão', '1', '8500-148', '911111111', 'contact@superkartscup.com');
-- SELECT * FROM `SuperKartsCup`.`Evento`;

-- DELETE FROM `SuperKartsCup`.`Protecao Civil`;
INSERT INTO `SuperKartsCup`.`Protecao Civil`
	(idProtecaocivil, Nome, tipo, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email, Evento_idEvento)
    VALUES 
		('1', 'João Matos', 'Bombeiros', 'Rua da Santa', 'Vizela', '6', '4620-525', '910067097', 'samuraidatemu@gmail.com', '1'),
        ('2', 'Maria Silva', 'Bombeiros', 'Avenida Central', 'Braga', '45', '4710-370', '920123456', 'maria.silva@gmail.com', '1'),
		('3', 'Pedro Costa', 'GNR', 'Rua Nova', 'Porto', '10', '4000-150', '931987654', 'pedro.costa@gmail.com', '1'),
		('4', 'Ana Rocha', 'Bombeiros', 'Travessa do Sol', 'Lisboa', '23', '1200-452', '917234567', 'ana.rocha@gmail.com', '1'),
		('5', 'Tiago Martins', 'GNR', 'Rua do Campo', 'Coimbra', '78', '3000-200', '913456789', 'tiago.martins@gmail.com', '1'),
		('6', 'Clara Mendes', 'Bombeiros', 'Praça das Flores', 'Faro', '12', '8000-072', '925678123', 'clara.mendes@gmail.com', '1'),
		('7', 'Rui Pinto', 'GNR', 'Rua da Esperança', 'Guimarães', '34', '4800-192', '912345678', 'rui.pinto@gmail.com', '1'),
		('8', 'Carla Monteiro', 'Bombeiros', 'Rua da Paz', 'Aveiro', '56', '3800-222', '915678234', 'carla.monteiro@gmail.com', '1'),
		('9', 'Miguel Lopes', 'GNR', 'Rua do Mar', 'Setúbal', '89', '2900-316', '918123456', 'miguel.lopes@gmail.com', '1'),
		('10', 'Joana Santos', 'GNR', 'Rua do Norte', 'Viana do Castelo', '66', '4900-231', '916543210', 'joana.santos@gmail.com', '1');
-- SELECT * FROM `SuperKartsCup`.`Protecao Civil`;

-- DELETE FROM `SuperKartsCup`.`corrida`;
INSERT INTO `SuperKartsCup`.`corrida`
	(tipo, pista, idevento)
    VALUES 
		('Clássica', 'Autódromo Internacional do Algarve',1),
        ('DragRace', 'Autódromo Internacional do Algarve',1),
        ('24', 'Autódromo Internacional do Algarve',1),
        ('Rally', 'Autódromo Internacional do Algarve',1);
-- SELECT * FROM `SuperKartsCup`.`corrida`;

-- DELETE FROM `SuperKartsCup`.`Arbitro`;
INSERT INTO `SuperKartsCup`.`Arbitro`
	(idArbitro, Nome, data_nasc, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email, corrida_tipo,idEvento)
    VALUES 
		(1, 'Artur Soares Dias', '1979-07-14', 'Rua da Pontinha', 'Vilar das Almas', '13', '4990-790', '910000001', 'arturito@gmail.com', 'Clássica',1),
		(2, 'Nuno Almeida', '1982-05-22', 'Rua das Laranjeiras', 'Lisboa', '8', '1200-190', '910000002', 'nuno.almeida@gmail.com', 'Clássica',1),
		(3, 'Tiago Martins', '1980-03-19', 'Rua do Arco', 'Sintra', '21', '2710-120', '910000003', 'tiago.martins@gmail.com', 'Clássica',1),
		(4, 'Hélder Malheiro', '1985-09-25', 'Rua do Mirante', 'Porto', '15', '4000-250', '910000004', 'helder.malheiro@gmail.com', 'Clássica',1),
		(5, 'Fábio Veríssimo', '1983-11-11', 'Rua das Fontes', 'Coimbra', '10', '3000-800', '910000005', 'fabio.verissimo@gmail.com', 'Clássica',1),
		(6, 'João Capela', '1977-08-01', 'Rua do Campo', 'Faro', '5', '8000-150', '910000006', 'joao.capela@gmail.com', 'DragRace',1),
		(7, 'Jorge Sousa', '1984-02-10', 'Rua Nova', 'Braga', '12', '4700-320', '910000007', 'jorge.sousa@gmail.com', 'DragRace',1),
		(8, 'Hugo Miguel', '1986-06-15', 'Rua das Flores', 'Aveiro', '4', '3800-250', '910000008', 'hugo.miguel@gmail.com', 'DragRace',1),
		(9, 'Carlos Xistra', '1980-12-05', 'Rua da Pedra', 'Guimarães', '19', '4800-600', '910000009', 'carlos.xistra@gmail.com', 'DragRace',1),
		(10, 'Bruno Paixão', '1975-04-09', 'Rua do Pinhal', 'Leiria', '6', '2400-300', '910000010', 'bruno.paixao@gmail.com', 'DragRace',1),
		(11, 'Manuel Mota', '1981-01-30', 'Rua da Fonte', 'Setúbal', '7', '2900-150', '910000011', 'manuel.mota@gmail.com', '24',1),
		(12, 'António Nobre', '1989-04-12', 'Rua do Sol', 'Almada', '9', '2800-500', '910000012', 'antonio.nobre@gmail.com', '24',1),
		(13, 'Luís Godinho', '1988-07-22', 'Rua dos Anjos', 'Évora', '17', '7000-600', '910000013', 'luis.godinho@gmail.com', '24',1),
		(14, 'André Narciso', '1990-05-05', 'Rua do Cruzeiro', 'Tomar', '11', '2300-700', '910000014', 'andre.narciso@gmail.com', '24',1),
		(15, 'Rui Costa', '1978-09-14', 'Rua dos Passarinhos', 'Funchal', '14', '9000-800', '910000015', 'rui.costa@gmail.com', '24',1),
		(16, 'Pedro Proença', '1970-11-03', 'Rua das Hortas', 'Lisboa', '2', '1100-150', '910000016', 'pedro.proenca@gmail.com', 'Rally',1),
		(17, 'Duarte Gomes', '1983-03-18', 'Rua do Castelo', 'Porto', '18', '4050-600', '910000017', 'duarte.gomes@gmail.com', 'Rally',1),
		(18, 'Vítor Ferreira', '1979-06-09', 'Rua da Serra', 'Viseu', '20', '3500-700', '910000018', 'vitor.ferreira@gmail.com', 'Rally',1),
		(19, 'Carlos Macedo', '1987-12-24', 'Rua do Vale', 'Guarda', '3', '6300-800', '910000019', 'carlos.macedo@gmail.com', 'Rally',1),
		(20, 'Miguel Ferreira', '1982-08-17', 'Rua do Prado', 'Beja', '22', '7800-900', '910000020', 'miguel.ferreira@gmail.com', 'Rally',1);
-- SELECT * FROM `SuperKartsCup`.`Arbitro`;

-- DELETE FROM `SuperKartsCup`.`Comissarios`;
INSERT INTO `SuperKartsCup`.`Comissarios`
	(idComissarios, Nome, data_nasc, tipo, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email, corrida_tipo,idEvento)
    VALUES 
		(1, 'Ricardo Araujo Pereira', '1974-04-28', 'Pista', 'Rua da Fonte', 'Aguçadoura', '1', '4495-001', '910000021', 'ricardofunny@gmail.com', 'Clássica',1),
		(2, 'Joana Marques', '1985-03-15', 'Técnico', 'Rua do Farol', 'Lisboa', '12', '1100-002', '910000022', 'joana.humorista@gmail.com', 'Clássica',1),
		(3, 'António Zambujo', '1975-09-19', 'Médico', 'Rua das Oliveiras', 'Beja', '34', '7800-003', '910000023', 'zambujo.cantor@gmail.com', 'Clássica',1),
		(4, 'Mariza Reis Nunes', '1973-12-16', 'Controlo de Corrida', 'Rua do Mar', 'Faro', '7', '8000-004', '910000024', 'mariza.fado@gmail.com', 'Clássica',1),
		(5, 'Carlos Daniel', '1972-07-23', 'Técnico', 'Rua do Jornal', 'Porto', '21', '4000-005', '910000025', 'carlos.noticias@gmail.com', 'Clássica',1),
		(6, 'Manuel Luís Goucha', '1954-12-25', 'Médico', 'Rua do Sol', 'Sintra', '3', '2710-006', '910000026', 'mlgoucha@gmail.com', 'DragRace',1),
		(7, 'Cristina Ferreira', '1977-09-09', 'Pista', 'Rua das Flores', 'Mafra', '15', '2640-007', '910000027', 'cristina.tv@gmail.com', 'DragRace',1),
		(8, 'Cláudia Vieira', '1978-06-20', 'Controlo de Corrida', 'Rua da Alegria', 'Coimbra', '25', '3000-008', '910000028', 'claudia.atriz@gmail.com', 'DragRace',1),
		(9, 'José Rodrigues dos Santos', '1964-04-01', 'Técnico', 'Rua da História', 'Almada', '17', '2800-009', '910000029', 'jrs.jornal@gmail.com', 'DragRace',1),
		(10, 'Filomena Cautela', '1984-12-16', 'Pista', 'Rua do Teatro', 'Cascais', '19', '2750-010', '910000030', 'filomena.apresentadora@gmail.com', 'DragRace',1),
		(11, 'Pedro Teixeira', '1980-12-23', 'Controlo de Corrida', 'Rua das Palmeiras', 'Évora', '9', '7000-011', '910000031', 'pedro.ator@gmail.com', '24',1),
		(12, 'Ana Bola', '1952-06-02', 'Técnico', 'Rua do Humor', 'Lisboa', '10', '1200-012', '910000032', 'ana.humorista@gmail.com', '24',1),
		(13, 'Herman José', '1954-03-19', 'Médico', 'Rua das Estrelas', 'Porto', '32', '4100-013', '910000033', 'herman.icone@gmail.com', '24',1),
		(14, 'Daniel Oliveira', '1981-04-01', 'Pista', 'Rua dos Programas', 'Oeiras', '26', '2780-014', '910000034', 'daniel.entrevistas@gmail.com', '24',1),
		(15, 'Tânia Ribas de Oliveira', '1976-06-18', 'Técnico', 'Rua das Crianças', 'Viseu', '8', '3500-015', '910000035', 'tania.apresentadora@gmail.com', '24',1),
		(16, 'José Carlos Malato', '1964-03-06', 'Pista', 'Rua da Rádio', 'Ponte de Lima', '5', '4990-016', '910000036', 'malato.radio@gmail.com', 'Rally',1),
		(17, 'Fátima Lopes', '1969-05-13', 'Técnico', 'Rua do Estilo', 'Setúbal', '11', '2900-017', '910000037', 'fatima.moda@gmail.com', 'Rally',1),
		(18, 'Ana Moura', '1979-09-17', 'Controlo de Corrida', 'Rua da Música', 'Alcobaça', '14', '2460-018', '910000038', 'anamoura.fado@gmail.com', 'Rally',1),
		(19, 'Fernando Mendes', '1963-03-09', 'Médico', 'Rua da Sorte', 'Portalegre', '22', '7300-019', '910000039', 'fernando.preco@gmail.com', 'Rally',1),
		(20, 'Maria Cerqueira Gomes', '1983-05-06', 'Pista', 'Rua das Hortas', 'Braga', '6', '4700-020', '910000040', 'maria.tv@gmail.com', 'Rally',1);
-- SELECT * FROM `SuperKartsCup`.`Comissarios`;

-- DELETE FROM `SuperKartsCup`.`Funcionarios`;
INSERT INTO `SuperKartsCup`.`Funcionarios`
	(idFuncionarios, Nome, data_nasc, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email, evento_idevento)
    VALUES 
		(1, 'Jorge Nuno Pinto da Costa', '1937-12-28', 'Rua da Fruta', 'Porto', '2', '1405-043', '910000003', 'ananas@gmail.com', 1),
        (2, 'Luis Felipe Vieira', '1949-07-22', 'Rua da Farinha', 'Lisboa', '1', '1000-001', '910000004', 'branca@gmail.com', 1),
		(3, 'Ana Sousa', '1985-03-15', 'Rua das Flores', 'Porto', '8', '4050-123', '912345678', 'ana.sousa@gmail.com', 1),
		(4, 'Carlos Oliveira', '1978-06-12', 'Avenida Principal', 'Lisboa', '22', '1000-456', '919876543', 'carlos.oliveira@gmail.com', 1),
		(5, 'Marta Ferreira', '1990-11-03', 'Rua do Sol', 'Faro', '15', '8000-890', '913213214', 'marta.ferreira@gmail.com', 1),
		(6, 'Rui Moreira', '1969-07-28', 'Praça da Liberdade', 'Porto', '3', '4000-123', '914567890', 'rui.moreira@gmail.com', 1),
		(7, 'Joana Lima', '1988-04-25', 'Rua Nova', 'Coimbra', '12', '3000-789', '915678321', 'joana.lima@gmail.com', 1),
		(8, 'Ricardo Costa', '1982-09-14', 'Rua das Amoreiras', 'Lisboa', '21', '1200-678', '916789432', 'ricardo.costa@gmail.com', 1),
		(9, 'Sofia Martins', '1993-01-19', 'Rua da Paz', 'Aveiro', '9', '3800-890', '917890123', 'sofia.martins@gmail.com', 1),
		(10, 'Luís Rodrigues', '1975-10-05', 'Rua da Alegria', 'Setúbal', '7', '2900-234', '918901234', 'luis.rodrigues@gmail.com', 1),
		(11, 'Patrícia Mendes', '1987-08-08', 'Rua do Carmo', 'Braga', '18', '4700-345', '919012345', 'patricia.mendes@gmail.com', 1),
		(12, 'Tiago Almeida', '1995-05-30', 'Rua das Palmeiras', 'Guimarães', '6', '4800-567', '920123456', 'tiago.almeida@gmail.com', 1),
		(13, 'Diana Figueiredo', '1981-12-02', 'Rua da Luz', 'Porto', '20', '4050-678', '921234567', 'diana.figueiredo@gmail.com', 1),
		(14, 'Filipe Nunes', '1976-03-10', 'Avenida da República', 'Lisboa', '1', '1000-890', '922345678', 'filipe.nunes@gmail.com', 1),
		(15, 'Beatriz Vieira', '1992-06-15', 'Rua da Escola', 'Faro', '14', '8000-456', '923456789', 'beatriz.vieira@gmail.com', 1),
		(16, 'André Carvalho', '1984-09-21', 'Rua do Parque', 'Coimbra', '33', '3000-123', '924567890', 'andre.carvalho@gmail.com', 1),
		(17, 'Sara Batista', '1996-02-11', 'Praça Nova', 'Lisboa', '30', '1200-345', '925678901', 'sara.batista@gmail.com', 1),
		(18, 'Leonor Cruz', '1989-07-01', 'Rua da Serra', 'Braga', '27', '4700-890', '926789012', 'leonor.cruz@gmail.com', 1),
		(19, 'Manuel Matos', '1983-11-22', 'Rua do Mercado', 'Setúbal', '5', '2900-678', '927890123', 'manuel.matos@gmail.com', 1),
		(20, 'João Fonseca', '1980-05-07', 'Rua da Fonte', 'Guimarães', '4', '4800-890', '929012345', 'joao.fonseca@gmail.com', 1);
-- SELECT * FROM `SuperKartsCup`.`Funcionarios`;

-- DELETE FROM `SuperKartsCup`.`turno`;
INSERT INTO `SuperKartsCup`.`turno`
	(idturno, idfuncionarios, data_inicio, data_fim)
    VALUES 
		(1, 1, '2024-09-22 06:00:00','2024-09-22 13:00:00'),
        (2, 2, '2024-09-22 06:00:00','2024-09-22 13:00:00'),
        (3, 3, '2024-09-23 06:00:00','2024-09-23 13:00:00'),
        (4, 4, '2024-09-23 06:00:00','2024-09-23 13:00:00'),
        (5, 5, '2024-09-24 06:00:00','2024-09-24 13:00:00'),
        (6, 6, '2024-09-24 06:00:00','2024-09-24 13:00:00'),
        (7, 7, '2024-09-25 06:00:00','2024-09-25 13:00:00'),
        (8, 8, '2024-09-25 06:00:00','2024-09-25 13:00:00'),
        (9, 9, '2024-09-26 06:00:00','2024-09-26 13:00:00'),
        (10, 10, '2024-09-26 06:00:00','2024-09-26 13:00:00'),
        (11, 11, '2024-09-22 13:00:00','2024-09-22 20:00:00'),
        (12, 12, '2024-09-22 13:00:00','2024-09-22 20:00:00'),
        (13, 13, '2024-09-23 13:00:00','2024-09-23 20:00:00'),
        (14, 14, '2024-09-23 13:00:00','2024-09-23 20:00:00'),
        (15, 15, '2024-09-24 13:00:00','2024-09-24 20:00:00'),
        (16, 16, '2024-09-24 13:00:00','2024-09-24 20:00:00'),
        (17, 17, '2024-09-25 13:00:00','2024-09-25 20:00:00'),
        (18, 18, '2024-09-25 13:00:00','2024-09-25 20:00:00'),
        (19, 19, '2024-09-26 13:00:00','2024-09-26 20:00:00'),
        (20, 20, '2024-09-26 13:00:00','2024-09-26 20:00:00'),
        (21, 1, '2024-09-27 06:00:00','2024-09-27 13:00:00');
-- SELECT * FROM `SuperKartsCup`.`turno`;

-- DELETE FROM `SuperKartsCup`.`espectadores`;
INSERT INTO `SuperKartsCup`.`espectadores`
	(idEspectadores, Nome, data_nasc, morada_rua, morada_localidade, morada_porta, morada_codigoPostal)
    VALUES ('1', 'David Beckham', '1975-05-02', 'Rua do Relógio', 'Perre', '7', '4925-001');
-- SELECT * FROM `SuperKartsCup`.`espectadores`;

-- DELETE FROM `SuperKartsCup`.`contacto_espectador`;
INSERT INTO `SuperKartsCup`.`contacto_espectador`
	(idEspectadores, contacto)
    VALUES 
		('1', '917021126'),
        ('1', '967145522');
-- SELECT * FROM `SuperKartsCup`.`contacto_espectador`;

-- DELETE FROM `SuperKartsCup`.`Equipas`;
INSERT INTO `SuperKartsCup`.`Equipas`
	(idEquipas, Nome, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email)
    VALUES 
		(1, 'RedBull Portugal', 'Rua da Tourina', 'Porto', '9', '1405-043', '914001665', 'redbull@contact.com'),
        (2, 'PORSCHE', 'Rua de Merece', 'Calvelo', '1', '4990-580', '910011213', 'porsche@contact.com'),
        (3, 'AUDI', 'Rua da Di', 'Porto', '134', '1405-042', '914076665', 'audi@contact.com'),
        (4, 'Mercedes', 'Rua da Meca', 'Porto', '14', '1405-041', '915643665', 'mercedes@contact.com'),
        (5, 'Ferrari', 'Rua da Fe', 'Porto', '873', '1405-040', '914001543', 'ferrari@contact.com'),
        (6, 'Sauber', 'Rua da Saude', 'Lisboa', '923', '1000-012', '914005435', 'sauber@contact.com'),
        (7, 'Renault', 'Rua da Torre', 'Viseu', '39', '1505-043', '923001665', 'refr@contact.com'),
        (8, 'Lotus', 'Rua da Ponte', 'Porto', '45', '1405-156', '912991665', 'lotus@contact.com'),
        (9, 'McLaren', 'Rua do Mc', 'Braga', '23', '2021-043', '914010556', 'mclaren@contact.com'),
        (10, 'Delta Café', 'Rua da Cafeina', 'Lisboa', '6273', '1000-001', '914001695', 'delta@contact.com');
-- SELECT * FROM `SuperKartsCup`.`Equipas`;

-- DELETE FROM `SuperKartsCup`.`Funcionarios da Equipa`;
INSERT INTO `SuperKartsCup`.`Funcionarios da Equipa`
	(idFuncionariosDaEquipa, Nome, data_nasc, tipo_funcequipa, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email, equipas_idequipas)
    VALUES
		(1, 'Jorge Palma', '1937-12-28', 'Chefe', 'Rua do Pão', 'Porto', '4', '1405-043', '910000014', 'palmas@gmail.com', 1),
		(2, 'Marta Vieira', '1985-05-10', 'Mecânico', 'Rua das Rosas', 'Porto', '10', '1405-100', '920000014', 'martavieira@gmail.com', 1),
		(3, 'Paulo Costa', '1990-07-15', 'Engenheiro', 'Avenida Central', 'Porto', '25', '1405-200', '930000014', 'paulocosta@gmail.com', 1),
		(4, 'Sofia Andrade', '1982-02-20', 'Analista', 'Rua das Flores', 'Porto', '33', '1405-300', '940000014', 'sofiaandrade@gmail.com', 1),
		(5, 'Carlos Nunes', '1979-09-12', 'PitCrew', 'Rua da Torre', 'Porto', '12', '1405-400', '950000014', 'carlosnunes@gmail.com', 1),
		(6, 'Ana Moreira', '1995-11-25', 'Mecânico', 'Rua do Sol', 'Porto', '44', '1405-500', '960000014', 'anamoreira@gmail.com', 1),
		(7, 'João Almeida', '1988-03-30', 'Mecânico', 'Rua do Mar', 'Porto', '7', '1405-600', '970000014', 'joaoalmeida@gmail.com', 1),
		(8, 'Maria Silva', '1992-04-12', 'Engenheiro', 'Rua da Lua', 'Porto', '18', '1405-700', '980000014', 'mariasilva@gmail.com', 1),
		(9, 'Rui Martins', '1986-08-18', 'Analista', 'Rua do Vento', 'Porto', '29', '1405-800', '990000014', 'ruimartins@gmail.com', 1),
		(10, 'Cláudia Sousa', '1991-06-05', 'PitCrew', 'Rua das Ondas', 'Porto', '2', '1405-900', '910000015', 'claudiasousa@gmail.com', 1),
		(11, 'Sergio Godinho', '1945-08-31', 'Chefe', 'Rua da Mala', 'Lisboa', '123', '1000-001', '910000984', 'serjao@gmail.com', 2),
		(12, 'Pedro Pinto', '1980-01-22', 'Mecânico', 'Rua da Alegria', 'Lisboa', '5', '1000-002', '920000984', 'pedropinto@gmail.com', 2),
		(13, 'Helena Lopes', '1987-09-19', 'Engenheiro', 'Rua Nova', 'Lisboa', '8', '1000-003', '930000984', 'helenalopes@gmail.com', 2),
		(14, 'Rafael Santos', '1983-12-15', 'Analista', 'Rua do Campo', 'Lisboa', '15', '1000-004', '940000984', 'rafaelsantos@gmail.com', 2),
		(15, 'Leonor Rocha', '1996-03-08', 'PitCrew', 'Rua do Limoeiro', 'Lisboa', '20', '1000-005', '950000984', 'leonorrocha@gmail.com', 2),
		(16, 'Fábio Castro', '1993-10-29', 'Mecânico', 'Rua do Tejo', 'Lisboa', '13', '1000-006', '960000984', 'fabiocastro@gmail.com', 2),
		(17, 'Carolina Ramos', '1994-07-01', 'Mecânico', 'Rua do Fado', 'Lisboa', '19', '1000-007', '970000984', 'carolinaramos@gmail.com', 2),
		(18, 'Tiago Ferreira', '1989-11-11', 'Engenheiro', 'Rua do Castelo', 'Lisboa', '30', '1000-008', '980000984', 'tiagoferreira@gmail.com', 2),
		(19, 'Beatriz Vieira', '1992-08-25', 'Analista', 'Rua do Jardim', 'Lisboa', '50', '1000-009', '990000984', 'beatrizvieira@gmail.com', 2),
		(20, 'Miguel Correia', '1990-05-17', 'PitCrew', 'Rua da Estrela', 'Lisboa', '9', '1000-010', '910000985', 'miguelcorreia@gmail.com', 2),
		(21, 'André Silva', '1981-05-14', 'Chefe', 'Rua do Vinho', 'Braga', '6', '4700-001', '910001001', 'andresilva@gmail.com', 3),
		(22, 'Juliana Costa', '1993-04-10', 'Mecânico', 'Rua das Palmeiras', 'Braga', '12', '4700-002', '920001001', 'julianacosta@gmail.com', 3),
		(23, 'Filipe Gonçalves', '1985-07-09', 'Engenheiro', 'Rua do Pomar', 'Braga', '18', '4700-003', '930001001', 'filipegoncalves@gmail.com', 3),
		(24, 'Isabel Rocha', '1987-11-30', 'Analista', 'Rua da Montanha', 'Braga', '25', '4700-004', '940001001', 'isabelrocha@gmail.com', 3),
		(25, 'Fernando Mendes', '1989-03-22', 'PitCrew', 'Rua do Campo Verde', 'Braga', '9', '4700-005', '950001001', 'fernandomendes@gmail.com', 3),
		(26, 'Ricardo Teixeira', '1992-12-12', 'Mecânico', 'Rua das Cerejeiras', 'Braga', '14', '4700-006', '960001001', 'ricardoteixeira@gmail.com', 3),
		(27, 'Carla Martins', '1991-02-18', 'Mecânico', 'Rua da Laranja', 'Braga', '19', '4700-007', '970001001', 'carlamartins@gmail.com', 3),
		(28, 'Bruno Almeida', '1990-09-27', 'Engenheiro', 'Rua do Carvalho', 'Braga', '22', '4700-008', '980001001', 'brunoalmeida@gmail.com', 3),
		(29, 'Sónia Ferreira', '1993-06-05', 'Analista', 'Rua da Acácia', 'Braga', '33', '4700-009', '990001001', 'soniaferreira@gmail.com', 3),
		(30, 'Eduardo Campos', '1988-07-23', 'PitCrew', 'Rua da Videira', 'Braga', '3', '4700-010', '910001002', 'eduardocampos@gmail.com', 3),
		(31, 'Patrícia Neves', '1986-08-14', 'Chefe', 'Rua do Cedro', 'Coimbra', '4', '3000-001', '910002001', 'patricianeves@gmail.com', 4),
		(32, 'Guilherme Santos', '1989-10-10', 'Mecânico', 'Rua das Oliveiras', 'Coimbra', '8', '3000-002', '920002001', 'guilhermesantos@gmail.com', 4),
		(33, 'Catarina Oliveira', '1992-01-01', 'Engenheiro', 'Rua da Rocha', 'Coimbra', '20', '3000-003', '930002001', 'catarinaoliveira@gmail.com', 4),
		(34, 'Marcelo Correia', '1984-11-15', 'Analista', 'Rua da Areia', 'Coimbra', '15', '3000-004', '940002001', 'marcelocorreia@gmail.com', 4),
		(35, 'Leonardo Martins', '1993-05-30', 'PitCrew', 'Rua do Marfim', 'Coimbra', '25', '3000-005', '950002001', 'leonardomartins@gmail.com', 4),
		(36, 'Inês Rodrigues', '1991-09-12', 'Mecânico', 'Rua do Sol Nascente', 'Coimbra', '18', '3000-006', '960002001', 'inesrodrigues@gmail.com', 4),
		(37, 'Alexandre Ramos', '1990-02-20', 'Mecânico', 'Rua da Lua Cheia', 'Coimbra', '30', '3000-007', '970002001', 'alexandreramos@gmail.com', 4),
		(38, 'Clara Antunes', '1983-03-25', 'Engenheiro', 'Rua da Aurora', 'Coimbra', '11', '3000-008', '980002001', 'claraantunes@gmail.com', 4),
		(39, 'Renato Vieira', '1995-12-19', 'Analista', 'Rua do Sol Poente', 'Coimbra', '50', '3000-009', '990002001', 'renatovieira@gmail.com', 4),
		(40, 'Diana Ferreira', '1988-06-17', 'PitCrew', 'Rua da Esperança', 'Coimbra', '21', '3000-010', '910002002', 'dianaferreira@gmail.com', 4),
		(41, 'Rafael Moreira', '1985-04-20', 'Chefe', 'Rua do Horizonte', 'Faro', '10', '8000-001', '910003001', 'rafaelmoreira@gmail.com', 5),
		(42, 'Sara Lopes', '1994-12-11', 'Mecânico', 'Rua da Costa', 'Faro', '8', '8000-002', '920003001', 'saralopes@gmail.com', 5),
		(43, 'Vítor Fernandes', '1987-06-15', 'Engenheiro', 'Rua do Pôr-do-Sol', 'Faro', '14', '8000-003', '930003001', 'vitorfernandes@gmail.com', 5),
		(44, 'Mariana Cruz', '1991-03-22', 'Analista', 'Rua da Duna', 'Faro', '20', '8000-004', '940003001', 'marianacruz@gmail.com', 5),
		(45, 'Rogério Oliveira', '1990-11-03', 'PitCrew', 'Rua das Ondas', 'Faro', '6', '8000-005', '950003001', 'rogeriooliveira@gmail.com', 5),
		(46, 'Fátima Neves', '1989-08-09', 'Mecânico', 'Rua do Farol', 'Faro', '11', '8000-006', '960003001', 'fatimaneves@gmail.com', 5),
		(47, 'Diogo Alves', '1993-01-18', 'Mecânico', 'Rua da Praia', 'Faro', '19', '8000-007', '970003001', 'diogoalves@gmail.com', 5),
		(48, 'Paula Nogueira', '1984-09-25', 'Engenheiro', 'Rua do Porto', 'Faro', '21', '8000-008', '980003001', 'paulanogueira@gmail.com', 5),
		(49, 'Victor Cardoso', '1986-10-12', 'Analista', 'Rua da Península', 'Faro', '4', '8000-009', '990003001', 'victorcardoso@gmail.com', 5),
		(50, 'Ana Pires', '1992-05-17', 'PitCrew', 'Rua do Atlântico', 'Faro', '2', '8000-010', '910003002', 'anapires@gmail.com', 5),
		(51, 'Carlos Matos', '1983-07-07', 'Chefe', 'Rua das Estrelas', 'Leiria', '10', '2400-001', '910004001', 'carlosmatos@gmail.com', 6),
		(52, 'Helena Almeida', '1989-03-10', 'Mecânico', 'Rua do Pinhal', 'Leiria', '8', '2400-002', '920004001', 'helenaalmeida@gmail.com', 6),
		(53, 'Fábio Santos', '1986-12-12', 'Engenheiro', 'Rua das Palmeiras', 'Leiria', '14', '2400-003', '930004001', 'fabiosantos@gmail.com', 6),
		(54, 'Marta Freitas', '1994-08-16', 'Analista', 'Rua do Litoral', 'Leiria', '20', '2400-004', '940004001', 'martafreitas@gmail.com', 6),
		(55, 'Tiago Rocha', '1992-11-04', 'PitCrew', 'Rua da Praia Norte', 'Leiria', '6', '2400-005', '950004001', 'tiagorocha@gmail.com', 6),
		(56, 'Joana Correia', '1987-02-19', 'Mecânico', 'Rua do Morro', 'Leiria', '11', '2400-006', '960004001', 'joanacorreia@gmail.com', 6),
		(57, 'Rodrigo Sousa', '1990-10-23', 'Mecânico', 'Rua do Campo Verde', 'Leiria', '19', '2400-007', '970004001', 'rodrigosousa@gmail.com', 6),
		(58, 'Sara Antunes', '1984-05-12', 'Engenheiro', 'Rua do Rio', 'Leiria', '21', '2400-008', '980004001', 'saraantunes@gmail.com', 6),
		(59, 'Bruno Costa', '1991-09-28', 'Analista', 'Rua do Carvalho', 'Leiria', '4', '2400-009', '990004001', 'brunocosta@gmail.com', 6),
		(60, 'Daniela Ribeiro', '1988-01-21', 'PitCrew', 'Rua do Pinhal Norte', 'Leiria', '2', '2400-010', '910004002', 'danielaribeiro@gmail.com', 6),
		(61, 'Ricardo Moura', '1984-07-15', 'Chefe', 'Rua do Campo', 'Aveiro', '12', '3800-001', '910005001', 'ricardomoura@gmail.com', 7),
		(62, 'Tatiana Fonseca', '1989-03-28', 'Mecânico', 'Rua das Estrelas', 'Aveiro', '8', '3800-002', '920005001', 'tatianafonseca@gmail.com', 7),
		(63, 'Diogo Campos', '1990-09-12', 'Engenheiro', 'Rua do Horizonte', 'Aveiro', '14', '3800-003', '930005001', 'diogocampos@gmail.com', 7),
		(64, 'Rita Martins', '1986-05-18', 'Analista', 'Rua da Aurora', 'Aveiro', '21', '3800-004', '940005001', 'ritamartins@gmail.com', 7),
		(65, 'Paulo Antunes', '1988-08-25', 'PitCrew', 'Rua do Pinheiro', 'Aveiro', '9', '3800-005', '950005001', 'pauloantunes@gmail.com', 7),
		(66, 'Andreia Gonçalves', '1992-10-04', 'Mecânico', 'Rua das Palmeiras', 'Aveiro', '15', '3800-006', '960005001', 'andreiagoncalves@gmail.com', 7),
		(67, 'Rodrigo Silva', '1994-02-17', 'Mecânico', 'Rua do Mar', 'Aveiro', '19', '3800-007', '970005001', 'rodrigosilva@gmail.com', 7),
		(68, 'Patrícia Lima', '1987-01-29', 'Engenheiro', 'Rua da Praia', 'Aveiro', '25', '3800-008', '980005001', 'patricialima@gmail.com', 7),
		(69, 'Fábio Mendes', '1993-06-30', 'Analista', 'Rua do Porto', 'Aveiro', '18', '3800-009', '990005001', 'fabiomendes@gmail.com', 7),
		(70, 'Helena Rocha', '1991-11-20', 'PitCrew', 'Rua da Costa', 'Aveiro', '2', '3800-010', '910005002', 'helenarocha@gmail.com', 7),
		(71, 'Vítor Almeida', '1985-04-09', 'Chefe', 'Rua do Monte', 'Viseu', '7', '3500-001', '910006001', 'vitoralmeida@gmail.com', 8),
		(72, 'Joana Lopes', '1989-07-23', 'Mecânico', 'Rua da Serra', 'Viseu', '10', '3500-002', '920006001', 'joanalopes@gmail.com', 8),
		(73, 'Ricardo Batista', '1984-09-15', 'Engenheiro', 'Rua da Figueira', 'Viseu', '15', '3500-003', '930006001', 'ricardobatista@gmail.com', 8),
		(74, 'Mariana Coelho', '1987-12-08', 'Analista', 'Rua do Vale', 'Viseu', '25', '3500-004', '940006001', 'marianacoelho@gmail.com', 8),
		(75, 'Pedro Moreira', '1990-02-14', 'PitCrew', 'Rua do Pinhal', 'Viseu', '12', '3500-005', '950006001', 'pedromoreira@gmail.com', 8),
		(76, 'Carla Sousa', '1993-11-01', 'Mecânico', 'Rua da Videira', 'Viseu', '18', '3500-006', '960006001', 'carlasousa@gmail.com', 8),
		(77, 'Mário Correia', '1992-01-25', 'Mecânico', 'Rua do Carvalho', 'Viseu', '6', '3500-007', '970006001', 'mariocorreia@gmail.com', 8),
		(78, 'Sara Fernandes', '1986-03-21', 'Engenheiro', 'Rua das Hortênsias', 'Viseu', '20', '3500-008', '980006001', 'sarafernandes@gmail.com', 8),
		(79, 'Hugo Santos', '1988-10-13', 'Analista', 'Rua do Limoeiro', 'Viseu', '9', '3500-009', '990006001', 'hugosantos@gmail.com', 8),
		(80, 'Ana Ribeiro', '1991-05-29', 'PitCrew', 'Rua do Lago', 'Viseu', '22', '3500-010', '910006002', 'anaribeiro@gmail.com', 8),
		(81, 'Carlos Silva', '1984-08-22', 'Chefe', 'Rua do Porto', 'Funchal', '8', '9000-001', '910007001', 'carlossilva@gmail.com', 9),
		(82, 'Beatriz Costa', '1990-12-17', 'Mecânico', 'Rua do Campo', 'Funchal', '5', '9000-002', '920007001', 'beatrizcosta@gmail.com', 9),
		(83, 'Rafael Vieira', '1985-11-14', 'Engenheiro', 'Rua da Palmeira', 'Funchal', '9', '9000-003', '930007001', 'rafaelvieira@gmail.com', 9),
		(84, 'Inês Mendes', '1987-09-03', 'Analista', 'Rua da Praia', 'Funchal', '20', '9000-004', '940007001', 'inesmendes@gmail.com', 9),
		(85, 'Tiago Cardoso', '1992-03-22', 'PitCrew', 'Rua do Horizonte', 'Funchal', '18', '9000-005', '950007001', 'tiagocardoso@gmail.com', 9),
		(86, 'Cátia Neves', '1994-05-06', 'Mecânico', 'Rua do Atlântico', 'Funchal', '11', '9000-006', '960007001', 'catianeves@gmail.com', 9),
		(87, 'João Batista', '1989-07-09', 'Mecânico', 'Rua do Marfim', 'Funchal', '14', '9000-007', '970007001', 'joaobatista@gmail.com', 9),
		(88, 'Clara Almeida', '1990-02-19', 'Engenheiro', 'Rua das Ondas', 'Funchal', '22', '9000-008', '980007001', 'claraalmeida@gmail.com', 9),
		(89, 'Nuno Rodrigues', '1988-01-10', 'Analista', 'Rua da Esperança', 'Funchal', '17', '9000-009', '990007001', 'nunorodrigues@gmail.com', 9),
		(90, 'Patrícia Santos', '1993-06-18', 'PitCrew', 'Rua das Acácias', 'Funchal', '7', '9000-010', '910007002', 'patriciasantos@gmail.com', 9),
		(91, 'Filipe Martins', '1985-10-05', 'Chefe', 'Rua da Liberdade', 'Guarda', '6', '6300-001', '910008001', 'filipemartins@gmail.com', 10),
		(92, 'Daniela Ferreira', '1991-02-13', 'Mecânico', 'Rua das Rosas', 'Guarda', '8', '6300-002', '920008001', 'danielaferreira@gmail.com', 10),
		(93, 'Miguel Antunes', '1988-04-12', 'Engenheiro', 'Rua do Carvalho', 'Guarda', '11', '6300-003', '930008001', 'miguelantunes@gmail.com', 10),
		(94, 'Joana Sousa', '1989-07-30', 'Analista', 'Rua do Limoeiro', 'Guarda', '20', '6300-004', '940008001', 'joanasousa@gmail.com', 10),
		(95, 'Vasco Rocha', '1992-09-10', 'PitCrew', 'Rua do Castelo', 'Guarda', '16', '6300-005', '950008001', 'vascorocha@gmail.com', 10),
		(96, 'Mariana Cardoso', '1994-08-01', 'Mecânico', 'Rua do Pinheiro', 'Guarda', '15', '6300-006', '960008001', 'marianacardoso@gmail.com', 10),
		(97, 'Lucas Ramos', '1990-01-05', 'Mecânico', 'Rua da Acácia', 'Guarda', '10', '6300-007', '970008001', 'lucasramos@gmail.com', 10),
		(98, 'Carolina Vieira', '1986-11-20', 'Engenheiro', 'Rua do Horizonte', 'Guarda', '12', '6300-008', '980008001', 'carolinavieira@gmail.com', 10),
		(99, 'Henrique Silva', '1993-03-16', 'Analista', 'Rua do Monte', 'Guarda', '18', '6300-009', '990008001', 'henriquesilva@gmail.com', 10),
		(100, 'Leonor Almeida', '1987-06-09', 'PitCrew', 'Rua do Vale', 'Guarda', '14', '6300-010', '910008002', 'leonoralmeida@gmail.com', 10);
-- SELECT * FROM `SuperKartsCup`.`Funcionarios da Equipa`;

-- DELETE FROM `SuperKartsCup`.`Pilotos`;
INSERT INTO `SuperKartsCup`.`Pilotos`
	(numero_piloto, Nome, data_nasc, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email, equipas_idequipas)
    VALUES 
		(1, 'Max Verstappen', '1997-09-30', 'Rua da Erva', 'Porto', '9', '1405-043', '910001665', 'eusouveloz@gmail.com', 1),
		(23, 'Luis Correia', '2002-01-15', 'Rua das Nuvens', 'Porto', '12', '1405-150', '910002001', 'luis.correia@gmail.com', 1),
		(7, 'Carla Mendes', '2001-11-22', 'Rua do Horizonte', 'Porto', '7', '1405-200', '910002002', 'carla.mendes@gmail.com', 1),
		(3, 'Ivo Costa Sousa', '2004-09-15', 'Rua de Merece', 'Calvelo', '85', '4990-580', '913071038', 'ivoo.c.sousa@gmail.com', 2),
		(5, 'Tiago Pereira', '1998-07-12', 'Rua do Sol', 'Lisboa', '25', '1000-010', '910003001', 'tiago.pereira@gmail.com', 2),
		(6, 'Ana Silva', '1996-04-30', 'Rua das Flores', 'Lisboa', '18', '1000-015', '910003002', 'ana.silva@gmail.com', 2),
		(88, 'João Rodrigues', '2003-06-20', 'Rua Nova', 'Lisboa', '30', '1000-020', '910003003', 'joao.rodrigues@gmail.com', 2),
		(45, 'Beatriz Lima', '1999-05-19', 'Rua do Campo', 'Braga', '10', '4700-003', '910004001', 'beatriz.lima@gmail.com', 3),
		(91, 'Pedro Fernandes', '2000-08-09', 'Rua da Montanha', 'Braga', '5', '4700-008', '910004002', 'pedro.fernandes@gmail.com', 3),
		(14, 'Catarina Duarte', '1997-12-11', 'Rua das Palmeiras', 'Braga', '19', '4700-012', '910004003', 'catarina.duarte@gmail.com', 3),
		(11, 'José Oliveira', '1995-03-05', 'Rua da Videira', 'Braga', '2', '4700-020', '910004004', 'jose.oliveira@gmail.com', 3),
		(12, 'Ricardo Santos', '1994-09-23', 'Rua do Pêssego', 'Coimbra', '11', '3000-001', '910005001', 'ricardo.santos@gmail.com', 4),
		(13, 'Inês Martins', '2000-07-14', 'Rua da Amizade', 'Coimbra', '8', '3000-005', '910005002', 'ines.martins@gmail.com', 4),
		(4, 'Gustavo Almeida', '1998-02-21', 'Rua do Rio', 'Coimbra', '13', '3000-010', '910005003', 'gustavo.almeida@gmail.com', 4),
		(15, 'Mariana Costa', '1996-06-10', 'Rua das Árvores', 'Coimbra', '9', '3000-015', '910005004', 'mariana.costa@gmail.com', 4),
		(41, 'Roberto Mendes', '1982-07-11', 'Rua da Vitória', 'Faro', '3', '8000-001', '910003001', 'robertomendes@gmail.com', 5),
		(42, 'Juliana Nogueira', '1990-05-19', 'Rua das Amendoeiras', 'Faro', '15', '8000-002', '920003001', 'juliananogueira@gmail.com', 5),
		(43, 'Diogo Torres', '1993-08-22', 'Rua do Litoral', 'Faro', '20', '8000-003', '930003001', 'diogotorres@gmail.com', 5),
		(46, 'Fábio Cardoso', '1992-10-07', 'Rua do Mar', 'Faro', '25', '8000-005', '950003001', 'fabiocardoso@gmail.com', 5),
		(36, 'Bruno Lopes', '1983-02-18', 'Rua da Saudade', 'Guimarães', '8', '4800-001', '910004001', 'brunolopes@gmail.com', 6),
		(37, 'Patrícia Silva', '1992-11-25', 'Rua das Laranjeiras', 'Guimarães', '22', '4800-002', '920004001', 'patriciasilva@gmail.com', 6),
		(38, 'Luís Almeida', '1990-09-14', 'Rua do Mosteiro', 'Guimarães', '17', '4800-003', '930004001', 'luisalmeida@gmail.com', 6),
		(30, 'Renato Barbosa', '1989-06-30', 'Rua da Serra', 'Guimarães', '5', '4800-005', '950004001', 'renatobarbosa@gmail.com', 6),
		(51, 'Fernando Sousa', '1979-08-05', 'Rua do Prado', 'Leiria', '6', '2400-001', '910005001', 'fernandosousa@gmail.com', 7),
		(52, 'Carolina Nunes', '1991-01-12', 'Rua do Sol', 'Leiria', '19', '2400-002', '920005001', 'carolinanunes@gmail.com', 7),
		(54, 'Joana Martins', '1985-03-29', 'Rua do Lago', 'Leiria', '11', '2400-004', '940005001', 'joanamartins@gmail.com', 7),
		(55, 'Hugo Campos', '1993-12-20', 'Rua do Miradouro', 'Leiria', '28', '2400-005', '950005001', 'hugocampos@gmail.com', 7),
		(56, 'Raquel Silva', '1990-10-02', 'Rua das Oliveiras', 'Aveiro', '4', '3800-001', '910006001', 'raquelsilva@gmail.com', 8),
		(58, 'Helena Ferreira', '1986-05-07', 'Rua da Ria', 'Aveiro', '29', '3800-003', '930006001', 'helenaferreira@gmail.com', 8),
		(60, 'Ana Martins', '1992-07-01', 'Rua da Praia', 'Aveiro', '21', '3800-005', '950006001', 'anamartins@gmail.com', 8),
		(61, 'Marcos Carvalho', '1984-12-08', 'Rua do Vento', 'Setúbal', '13', '2900-001', '910007001', 'marcoscarvalho@gmail.com', 9),
		(62, 'Clara Lopes', '1991-06-15',  'Rua da Esperança', 'Setúbal', '7', '2900-002', '920007001', 'claralopes@gmail.com', 9),
		(63, 'Tiago Santos', '1990-03-17', 'Rua do Atlântico', 'Setúbal', '5', '2900-003', '930007001', 'tiagosantos@gmail.com', 9),
		(64, 'Mafalda Ramos', '1989-04-10', 'Rua das Conchas', 'Setúbal', '19', '2900-004', '940007001', 'mafalda.ramos@gmail.com', 9),
		(67, 'Francisco Gonçalves', '1988-08-23', 'Rua do Alentejo', 'Évora', '3', '7000-002', '920008001', 'franciscogoncalves@gmail.com', 10),
		(68, 'Maria Rocha', '1992-02-18', 'Rua do Planalto', 'Évora', '22', '7000-003', '930008001', 'maria.rocha@gmail.com', 10),
		(69, 'Susana Costa', '1988-01-20', 'Rua da Aldeia', 'Évora', '19', '7000-004', '940008001', 'susanacosta@gmail.com', 10),
		(70, 'Leonor Almeida', '1991-05-27', 'Rua do Girassol', 'Évora', '15', '7000-005', '950008001', 'leonor.almeida@gmail.com', 10);
-- SELECT * FROM `SuperKartsCup`.`Pilotos`;

-- DELETE FROM `SuperKartsCup`.`Classificacao`;
INSERT INTO `SuperKartsCup`.`Classificacao` 
	(idEvento, Corrida_tipo, Posicao, numero_Piloto, Pontos)
	VALUES 
		(1,'Clássica', 1, 3, 10),  
		(1,'Clássica', 2, 1, 8),  
		(1,'Clássica', 3, 45, 7),
        (1,'Clássica', 4, 12, 6),  
		(1,'Clássica', 5, 41, 5),  
		(1,'Clássica', 6, 36, 4),
        (1,'Clássica', 7, 51, 3),  
		(1,'Clássica', 8, 56, 2),  
		(1,'Clássica', 9, 61, 1),
        (1,'Clássica', 10, 67, 0),
        (1,'DragRace', 1, 13, 9),  
		(1,'DragRace', 2, 5, 7),  
		(1,'DragRace', 3, 23, 3),
        (1,'DragRace', 4, 91, 3),  
		(1,'DragRace', 5, 68, 0),  
		(1,'DragRace', 6, 52, 0),
        (1,'DragRace', 7, 62, 0),  
		(1,'DragRace', 8, 41, 0),  
		(1,'DragRace', 9, 37, 0),
        (1,'DragRace', 10, 58, 0),
        (1,'24', 1, 1, 9),  
		(1,'24', 2, 88, 8),  
		(1,'24', 3, 14, 7),
        (1,'24', 4, 4, 7),  
		(1,'24', 5, 46, 5),  
		(1,'24', 6, 38, 4),
        (1,'24', 7, 54, 3),  
		(1,'24', 8, 60, 2),  
		(1,'24', 9, 63, 1),
        (1,'24', 10, 69, 0),
        (1,'Rally', 1, 6, 9),  
		(1,'Rally', 2, 11, 8),  
		(1,'Rally', 3, 70, 7),
        (1,'Rally', 4, 15, 6),  
		(1,'Rally', 5, 30, 5),  
		(1,'Rally', 6, 46, 4),
        (1,'Rally', 7, 55, 3),  
		(1,'Rally', 8, 56, 2),  
		(1,'Rally', 9, 64, 1),
        (1,'Rally', 10, 7, 0);
-- SELECT * FROM `SuperKartsCup`.`Classificacao`;

-- DELETE FROM `SuperKartsCup`.`material de corrida`;
INSERT INTO `SuperKartsCup`.`material de corrida`
	(idMaterialDeCorrida, Nome, Quantidade, stock_minimo, equipas_idequipas)
    VALUES 
		('1', 'Pneus', '40', '4', '1'),
        ('2', 'Gasolina', '10', '1', '1'),
        ('3', 'Pneus', '40', '4', '2'),
        ('4', 'Gasolina', '10', '1', '2'),
        ('5', 'Pneus', '40', '4', '3'),
        ('6', 'Gasolina', '10', '1', '3'),
        ('7', 'Pneus', '40', '4', '4'),
        ('8', 'Gasolina', '10', '1', '4'),
        ('9', 'Pneus', '40', '4', '5'),
        ('10', 'Gasolina', '10', '1', '5'),
        ('11', 'Pneus', '40', '4', '6'),
        ('12', 'Gasolina', '10', '1', '6'),
        ('13', 'Pneus', '40', '4', '7'),
        ('14', 'Gasolina', '10', '1', '7'),
        ('15', 'Pneus', '40', '4', '8'),
        ('16', 'Gasolina', '10', '1', '8'),
        ('17', 'Pneus', '40', '4', '9'),
        ('18', 'Gasolina', '10', '1', '9'),
        ('19', 'Pneus', '40', '4', '10'),
        ('20', 'Gasolina', '10', '1', '10');
-- SELECT * FROM `SuperKartsCup`.`material de corrida`;

-- DELETE FROM `SuperKartsCup`.`Patrocinadores`;
INSERT INTO `SuperKartsCup`.`Patrocinadores`
	(idPatrocinadores, Nome, TipoMaterial, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email)
    VALUES 
		('1', 'Pneus Malheiro', 'Pneus', 'Rua da Borracha', 'Porto', '799', '1405-043', '910020023', 'penusmalheiro@gmail.com'),
        ('2', 'Repsol', 'Gasolina', 'Rua do Negro', 'Lisboa', '867', '1000-001', '963133789', 'repsol@gmail.com');
-- SELECT * FROM `SuperKartsCup`.`Patrocinadores`;

-- DELETE FROM `SuperKartsCup`.`lembrancas`;
INSERT INTO `SuperKartsCup`.`lembrancas`
	(idLembrancas, Nome, Quantidade, Preço, evento_idevento)
    VALUES ('1', 'Camisola', '100', '25', '1');
-- SELECT * FROM `SuperKartsCup`.`lembrancas`;

-- DELETE FROM `SuperKartsCup`.`venda`;
INSERT INTO `SuperKartsCup`.`venda`
	(idVenda, Valor, Data_venda, funcionario, lembrancas, espectadores)
    VALUES ('1', '75', '2024-11-03 11:32:42', '1', '1', '1');
-- SELECT * FROM `SuperKartsCup`.`venda`;

-- DELETE FROM `SuperKartsCup`.`fornecedor`;
INSERT INTO `SuperKartsCup`.`fornecedor`
	(idFornecedor, Nome, tipo_lembranca, morada_rua, morada_localidade, morada_porta, morada_codigoPostal, contacto_telemovel, contacto_email)
    VALUES ('1', 'GUCCI', 'Camisola', 'Rua da Italia', 'Porto', '66', '1405-043', '910888666', 'guxiguxi@gmail.com');
-- SELECT * FROM `SuperKartsCup`.`fornecedor`;

-- DELETE FROM `SuperKartsCup`.`encomenda`;
INSERT INTO `SuperKartsCup`.`encomenda`
	(idEncomenda, Valor, Quantidade, Estado, idfuncionario, idfornecedor, idlembranca)
    VALUES ('1', '500', '100', '1', '2', '1', '1');
-- SELECT * FROM `SuperKartsCup`.`encomenda`;

-- DELETE FROM `SuperKartsCup`.`oferecido`;
INSERT INTO `SuperKartsCup`.`oferecido`
	(idmaterialdecorrida, idPatrocinadores)
    VALUES 
		('1', '1'),
        ('2', '2'),
        ('3', '1'),
        ('4', '2'),
        ('5', '1'),
        ('6', '2'),
        ('7', '1'),
        ('8', '2'),
        ('9', '1'),
        ('10', '2'),
        ('11', '1'),
        ('12', '2'),
        ('13', '1'),
        ('14', '2'),
        ('15', '1'),
        ('16', '2'),
        ('17', '1'),
        ('18', '2'),
        ('19', '1'),
        ('20', '2');
-- SELECT * FROM `SuperKartsCup`.`oferecido`;

-- DELETE FROM `SuperKartsCup`.`comunica`;
INSERT INTO `SuperKartsCup`.`comunica`
	(funcionarios_idfuncionarios, equipas_idequipas)
    VALUES 
		('1', '1'),
        ('2', '2'),
        ('3', '3'),
        ('4', '4'),
        ('5', '5'),
        ('6', '6'),
        ('7', '7'),
        ('8', '8'),
        ('9', '9'),
        ('10', '10');
-- SELECT * FROM `SuperKartsCup`.`comunica`;

-- DELETE FROM `SuperKartsCup`.`gereF`;
INSERT INTO `SuperKartsCup`.`gereF`
	(funcionarios_idfuncionariogere,funcionarios_idfuncionarios)
    VALUES 
		('2', '1');
-- SELECT * FROM `SuperKartsCup`.`gereF`;
-- DROP DATABASE `SuperKartsCup` ;
CREATE DATABASE `SuperKartsCup`;

USE `SuperKartsCup` ;

-- DROP TABLE `SuperKartsCup`.`Evento`;
CREATE TABLE `SuperKartsCup`.`Evento` (
	`idEvento` INT NOT NULL AUTO_INCREMENT,
	`Gastos` INT NOT NULL,
	`Nome` VARCHAR(45) NOT NULL,
	`Data_Inicio` DATE NOT NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NOT NULL,
		PRIMARY KEY (`idEvento`)
);

-- DROP TABLE `SuperKartsCup`.`Funcionarios`;
CREATE TABLE `SuperKartsCup`.`Funcionarios` (
	`idFuncionarios` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`data_nasc` DATE NOT NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NOT NULL,
	`Evento_idEvento` INT NOT NULL,
		PRIMARY KEY (`idFuncionarios`),
		FOREIGN KEY (`Evento_idEvento`)
			REFERENCES `SuperKartsCup`.`Evento` (`idEvento`)
);

-- DROP TABLE `SuperKartsCup`.`Espectadores`;
CREATE TABLE `SuperKartsCup`.`Espectadores` (
	`idEspectadores` INT NOT NULL AUTO_INCREMENT,
	`data_nasc` DATE NOT NULL,
	`Nome` VARCHAR(45) NOT NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
		PRIMARY KEY (`idEspectadores`)
);

-- DROP TABLE `SuperKartsCup`.`Lembrancas`;
CREATE TABLE `SuperKartsCup`.`Lembrancas` (
	`idLembrancas` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`Quantidade` INT NOT NULL,
	`Preço` DECIMAL(5,2) NOT NULL,
	`Evento_idEvento` INT NOT NULL,
		PRIMARY KEY (`idLembrancas`),
		FOREIGN KEY (`Evento_idEvento`)
			REFERENCES `SuperKartsCup`.`Evento` (`idEvento`)
);

-- DROP TABLE `SuperKartsCup`.`Venda`;
CREATE TABLE `SuperKartsCup`.`Venda` (
	`idVenda` INT NOT NULL AUTO_INCREMENT,
	`Valor` DECIMAL(5,2) NOT NULL,
	`Data_venda` DATETIME NOT NULL,
	`funcionario` INT NOT NULL,
	`lembrancas` INT NOT NULL,
	`espectadores` INT NOT NULL,
		PRIMARY KEY (`idVenda`),
		FOREIGN KEY (`funcionario`)
			REFERENCES `SuperKartsCup`.`Funcionarios` (`idFuncionarios`),
		FOREIGN KEY (`espectadores`)
			REFERENCES `SuperKartsCup`.`Espectadores` (`idEspectadores`),
		FOREIGN KEY (`lembrancas`)
			REFERENCES `SuperKartsCup`.`Lembrancas` (`idLembrancas`)
);

-- DROP TABLE `SuperKartsCup`.`Fornecedor`;
CREATE TABLE `SuperKartsCup`.`Fornecedor` (
	`idFornecedor` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`tipo_lembranca` VARCHAR(45) NOT NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NOT NULL,
		PRIMARY KEY (`idFornecedor`)
);

-- DROP TABLE `SuperKartsCup`.`Encomenda`;
CREATE TABLE `SuperKartsCup`.`Encomenda` (
	`idEncomenda` INT NOT NULL AUTO_INCREMENT,
	`Valor` DECIMAL(5,2) NOT NULL,
	`Quantidade` INT NOT NULL,
	`Estado` TINYINT NOT NULL,
	`idfuncionario` INT NOT NULL,
	`idfornecedor` INT NOT NULL,
	`idlembranca` INT NOT NULL,
		PRIMARY KEY (`idEncomenda`),
		FOREIGN KEY (`idfuncionario`)
			REFERENCES `SuperKartsCup`.`Funcionarios` (`idFuncionarios`),
		FOREIGN KEY (`idfornecedor`)
			REFERENCES `SuperKartsCup`.`Fornecedor` (`idFornecedor`),
		FOREIGN KEY (`idlembranca`)
			REFERENCES `SuperKartsCup`.`Lembrancas` (`idLembrancas`)
);

-- DROP TABLE `SuperKartsCup`.`Corrida`;
CREATE TABLE `SuperKartsCup`.`Corrida` (
	`tipo` ENUM('Clássica', 'DragRace', '24', 'Rally') NOT NULL,
	`Pista` VARCHAR(45) NOT NULL,
	`idEvento` INT NOT NULL,
		PRIMARY KEY (`tipo`, `idEvento`),
		FOREIGN KEY (`idEvento`)
			REFERENCES `SuperKartsCup`.`Evento` (`idEvento`)
);

-- DROP TABLE `SuperKartsCup`.`Equipas`;
CREATE TABLE `SuperKartsCup`.`Equipas` (
	`idEquipas` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NOT NULL,
    `Pontos` INT DEFAULT 0,
		PRIMARY KEY (`idEquipas`)
);

-- DROP TABLE `SuperKartsCup`.`Pilotos`;
CREATE TABLE `SuperKartsCup`.`Pilotos` (
	`numero_Piloto` INT NOT NULL,
	`Nome` VARCHAR(45) NOT NULL,
	`data_nasc` DATE NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NULL,
	`Equipas_idEquipas` INT NOT NULL,
		PRIMARY KEY (`numero_Piloto`),
		FOREIGN KEY (`Equipas_idEquipas`)
			REFERENCES `SuperKartsCup`.`Equipas` (`idEquipas`)
);

-- DROP TABLE `SuperKartsCup`.`Classificacao`;
CREATE TABLE `SuperKartsCup`.`Classificacao` (
	`Corrida_tipo` ENUM('Clássica', 'DragRace', '24', 'Rally') NOT NULL,
	`Posicao` INT NOT NULL,
	`numero_Piloto` INT NOT NULL,
    `idEvento` INT NOT NULL,
	`Pontos` INT NOT NULL,
		PRIMARY KEY (`Corrida_tipo`,`Posicao`, `idEvento`),
		FOREIGN KEY (`Corrida_tipo`,`idEvento`)
			REFERENCES `SuperKartsCup`.`Corrida` (`tipo`,`idEvento`),
		FOREIGN KEY (`numero_Piloto`)
			REFERENCES `SuperKartsCup`.`Pilotos` (`numero_Piloto`)
);

-- DROP TABLE `SuperKartsCup`.`Funcionarios da Equipa`;
CREATE TABLE `SuperKartsCup`.`Funcionarios da Equipa` (
	`idFuncionariosDaEquipa` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`data_nasc` DATE NULL,
	`tipo_funcequipa` ENUM('Chefe', 'Mecânico', 'Engenheiro', 'Analista', 'PitCrew') NOT NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NULL,
	`Equipas_idEquipas` INT NOT NULL,
		PRIMARY KEY (`idFuncionariosDaEquipa`),
		FOREIGN KEY (`Equipas_idEquipas`)
			REFERENCES `SuperKartsCup`.`Equipas` (`idEquipas`)
    );

-- DROP TABLE `SuperKartsCup`.`Protecao Civil`;
CREATE TABLE `SuperKartsCup`.`Protecao Civil` (
	`idProtecaoCivil` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`tipo` ENUM('Bombeiros', 'GNR') NOT NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NOT NULL,
	`Evento_idEvento` INT NOT NULL,
		PRIMARY KEY (`idProtecaoCivil`),
		FOREIGN KEY (`Evento_idEvento`)
			REFERENCES `SuperKartsCup`.`Evento` (`idEvento`)
);

-- DROP TABLE `SuperKartsCup`.`Arbitro`;
CREATE TABLE `SuperKartsCup`.`Arbitro` (
	`idArbitro` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`data_nasc` DATE NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NOT NULL,
	`Corrida_tipo` ENUM('Clássica', 'DragRace', '24', 'Rally') NOT NULL,
    `idEvento` INT NOT NULL,
		PRIMARY KEY (`idArbitro`,`Corrida_tipo`,`idEvento`),
		FOREIGN KEY (`Corrida_tipo`,`idEvento`)
			REFERENCES `SuperKartsCup`.`Corrida` (`tipo`,`idEvento`)
);

-- DROP TABLE `SuperKartsCup`.`Comissarios`;
CREATE TABLE `SuperKartsCup`.`Comissarios` (
	`idComissarios` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`data_nasc` DATE NULL,
	`tipo` ENUM('Pista', 'Técnico', 'Médico', 'Controlo de Corrida') NOT NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NOT NULL,
	`Corrida_tipo` ENUM('Clássica', 'DragRace', '24', 'Rally') NOT NULL,
    `idEvento` INT NOT NULL,
		PRIMARY KEY (`idComissarios`,`Corrida_tipo`,`idEvento`),
		FOREIGN KEY (`Corrida_tipo`,`idEvento`)
			REFERENCES `SuperKartsCup`.`Corrida` (`tipo`,`idEvento`)
);

-- DROP TABLE `SuperKartsCup`.`Material de Corrida`;
CREATE TABLE `SuperKartsCup`.`Material de Corrida` (
	`idMaterialDeCorrida` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`Quantidade` INT NOT NULL,
	`stock_minimo` INT NOT NULL,
	`Equipas_idEquipas` INT NOT NULL,
		PRIMARY KEY (`idMaterialDeCorrida`),
		FOREIGN KEY (`Equipas_idEquipas`)
			REFERENCES `SuperKartsCup`.`Equipas` (`idEquipas`)
);

-- DROP TABLE `SuperKartsCup`.`Patrocinadores`;
CREATE TABLE `SuperKartsCup`.`Patrocinadores` (
	`idPatrocinadores` INT NOT NULL AUTO_INCREMENT,
	`Nome` VARCHAR(45) NOT NULL,
	`TipoMaterial` VARCHAR(45) NOT NULL,
	`morada_rua` VARCHAR(45) NOT NULL,
	`morada_localidade` VARCHAR(45) NOT NULL,
	`morada_porta` INT NOT NULL,
	`morada_codigoPostal` VARCHAR(45) NOT NULL,
	`contacto_telemovel` INT NOT NULL,
	`contacto_email` VARCHAR(45) NOT NULL,
		PRIMARY KEY (`idPatrocinadores`)
);

-- DROP TABLE `SuperKartsCup`.`comunica`;
CREATE TABLE `SuperKartsCup`.`comunica` (
	`Funcionarios_idFuncionarios` INT NOT NULL,
	`Equipas_idEquipas` INT NOT NULL,
		PRIMARY KEY (`Funcionarios_idFuncionarios`, `Equipas_idEquipas`),
		FOREIGN KEY (`Funcionarios_idFuncionarios`)
			REFERENCES `SuperKartsCup`.`Funcionarios` (`idFuncionarios`),
		FOREIGN KEY (`Equipas_idEquipas`)
			REFERENCES `SuperKartsCup`.`Equipas` (`idEquipas`)
);

-- DROP TABLE `SuperKartsCup`.`gereF`;
CREATE TABLE `SuperKartsCup`.`gereF` (
	`Funcionarios_idFuncionarioGere` INT NOT NULL,
	`Funcionarios_idFuncionarios` INT NOT NULL,
		PRIMARY KEY (`Funcionarios_idFuncionarioGere`, `Funcionarios_idFuncionarios`),
		FOREIGN KEY (`Funcionarios_idFuncionarioGere`)
			REFERENCES `SuperKartsCup`.`Funcionarios` (`idFuncionarios`),
		FOREIGN KEY (`Funcionarios_idFuncionarios`)
			REFERENCES `SuperKartsCup`.`Funcionarios` (`idFuncionarios`)
);

-- DROP TABLE `SuperKartsCup`.`Turno`;
CREATE TABLE `SuperKartsCup`.`Turno` (
	`idTurno` INT NOT NULL AUTO_INCREMENT,
	`idFuncionarios` INT NOT NULL,
	`data_inicio` DATETIME NOT NULL,
	`data_fim` DATETIME NOT NULL,
		PRIMARY KEY (`idTurno`, `idFuncionarios`),
		FOREIGN KEY (`idFuncionarios`)
			REFERENCES `SuperKartsCup`.`Funcionarios` (`idFuncionarios`)
);

-- DROP TABLE `SuperKartsCup`.`Notificacao`;
CREATE TABLE `SuperKartsCup`.`Notificacao` (
	`idNotificacao` INT NOT NULL AUTO_INCREMENT,
	`descricao` VARCHAR(250) NOT NULL,
	`data_notificacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`idEncomenda` INT NOT NULL,
		PRIMARY KEY (`idNotificacao`, `idEncomenda`),
		FOREIGN KEY (`idEncomenda`)
			REFERENCES `SuperKartsCup`.`Encomenda` (`idEncomenda`)
);

-- DROP TABLE `SuperKartsCup`.`Contacto_Espectador`;
CREATE TABLE `SuperKartsCup`.`Contacto_Espectador` (
	`idEspectadores` INT NOT NULL,
	`contacto` VARCHAR(200) NOT NULL,
		PRIMARY KEY (`idEspectadores`,`contacto`),
		FOREIGN KEY (`idEspectadores`)
			REFERENCES `SuperKartsCup`.`Espectadores` (`idEspectadores`)
);

-- DROP TABLE `SuperKartsCup`.`oferecido`;
CREATE TABLE `SuperKartsCup`.`oferecido` (
	`idmaterialdecorrida` INT NOT NULL,
    `idPatrocinadores` INT NOT NULL,
		PRIMARY KEY (`idmaterialdecorrida`,`idPatrocinadores`),
        FOREIGN KEY (`idmaterialdecorrida`)
			REFERENCES `SuperKartsCup`.`Material de Corrida` (`idMaterialDeCorrida`),
		FOREIGN KEY (`idPatrocinadores`)
			REFERENCES `SuperKartsCup`.`Patrocinadores` (`idPatrocinadores`)
);
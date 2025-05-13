USE `SuperKartsCup`;

-- DROP USER 'Gerente'@'%';
CREATE USER 'Gerente'@'%' IDENTIFIED BY 'Sr.Roberto';

GRANT ALL PRIVILEGES ON `SuperKartsCup`.* TO 'Gerente'@'%';

-- DROP USER 'Funcionario'@'%';
CREATE USER 'Funcionario'@'%' IDENTIFIED BY 'funcionario2024';

GRANT SELECT, INSERT, UPDATE ON `SuperKartsCup`.`Venda` TO 'Funcionario'@'%';
GRANT SELECT, INSERT, UPDATE ON `SuperKartsCup`.`Encomenda` TO 'Funcionario'@'%';
GRANT SELECT, INSERT ON `SuperKartsCup`.`Turno` TO 'Funcionario'@'%';
GRANT SELECT ON `SuperKartsCup`.* TO 'Funcionario'@'%';

-- DROP USER 'Arbitro'@'%';
CREATE USER 'Arbitro'@'%' IDENTIFIED BY 'arbitro2024';

GRANT SELECT ON `SuperKartsCup`.`Arbitro` TO 'Arbitro'@'%';
GRANT SELECT, INSERT, UPDATE ON `SuperKartsCup`.`Classificacao` TO 'Arbitro'@'%';
GRANT SELECT ON `SuperKartsCup`.`Corrida` TO 'Arbitro'@'%';
GRANT SELECT ON `SuperKartsCup`.`Comissarios` TO 'Arbitro'@'%';
GRANT SELECT ON `SuperKartsCup`.`Equipas` TO 'Arbitro'@'%';
GRANT SELECT ON `SuperKartsCup`.`Pilotos` TO 'Arbitro'@'%';
GRANT EXECUTE ON PROCEDURE AtualizarPontosEquipas TO 'Arbitro'@'%';

-- DROP USER 'Comissario'@'%';
CREATE USER 'Comissario'@'%' IDENTIFIED BY 'comissario2024';

GRANT SELECT ON `SuperKartsCup`.`Comissarios` TO 'Comissario'@'%';
GRANT SELECT ON `SuperKartsCup`.`Classificacao` TO 'Comissario'@'%';
GRANT SELECT ON `SuperKartsCup`.`Arbitro` TO 'Comissario'@'%';
GRANT SELECT ON `SuperKartsCup`.`Corrida` TO 'Comissario'@'%';
GRANT SELECT ON `SuperKartsCup`.`Equipas` TO 'Comissario'@'%';
GRANT SELECT ON `SuperKartsCup`.`Pilotos` TO 'Comissario'@'%';
GRANT SELECT ON `SuperKartsCup`.`Funcionarios da Equipa` TO 'Comissario'@'%';
GRANT SELECT ON `SuperKartsCup`.`Material de Corrida` TO 'Comissario'@'%';

-- DROP USER 'Chefe de Equipa'@'%';
CREATE USER 'Chefe de Equipa'@'%' IDENTIFIED BY 'chefe2024';

GRANT SELECT ON `SuperKartsCup`.`Classificacao` TO 'Chefe de Equipa'@'%';
GRANT SELECT ON `SuperKartsCup`.`Corrida` TO 'Chefe de Equipa'@'%';
GRANT SELECT ON `SuperKartsCup`.`Equipas` TO 'Chefe de Equipa'@'%';
GRANT SELECT, INSERT, UPDATE ON `SuperKartsCup`.`Pilotos` TO 'Chefe de Equipa'@'%';
GRANT SELECT, INSERT, UPDATE ON `SuperKartsCup`.`Funcionarios da Equipa` TO 'Chefe de Equipa'@'%';
GRANT SELECT ON `SuperKartsCup`.`Material de Corrida` TO 'Chefe de Equipa'@'%';

-- DROP USER 'Piloto'@'%';
CREATE USER 'Piloto'@'%' IDENTIFIED BY 'piloto2024';

GRANT SELECT ON `SuperKartsCup`.`Pilotos` TO 'Piloto'@'%';
GRANT SELECT ON `SuperKartsCup`.`Classificacao` TO 'Piloto'@'%';
GRANT SELECT ON `SuperKartsCup`.`Corrida` TO 'Piloto'@'%';
GRANT SELECT ON `SuperKartsCup`.`Equipas` TO 'Piloto'@'%';
GRANT SELECT ON `SuperKartsCup`.`Funcionarios da Equipa` TO 'Piloto'@'%';
GRANT SELECT ON `SuperKartsCup`.`Material de Corrida` TO 'Piloto'@'%';

-- DROP USER 'Funcionario de Equipa'@'%';
CREATE USER 'Funcionario de Equipa'@'%' IDENTIFIED BY 'funcionariodeequipa2024';

GRANT SELECT ON `SuperKartsCup`.`Pilotos` TO 'Funconario de Equipa'@'%';
GRANT SELECT ON `SuperKartsCup`.`Classificacao` TO 'Funcionario de Equipa'@'%';
GRANT SELECT ON `SuperKartsCup`.`Corrida` TO 'Funcionario de Equipa'@'%';
GRANT SELECT ON `SuperKartsCup`.`Equipas` TO 'Funcionario de Equipa'@'%';
GRANT SELECT ON `SuperKartsCup`.`Funcionarios da Equipa` TO 'Funcionario de Equipa'@'%';
GRANT SELECT, UPDATE ON `SuperKartsCup`.`Material de Corrida` TO 'Funcionario de Equipa'@'%';

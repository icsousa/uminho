USE `SuperKartsCup`;

CREATE INDEX idx_evento_data_inicio ON Evento (Data_Inicio);

CREATE INDEX idx_funcionarios_nome ON Funcionarios (Nome);

CREATE INDEX idx_pilotos_nome ON Pilotos (Nome);

CREATE INDEX idx_equipas_nome ON Equipas (Nome);

CREATE INDEX idx_encomenda_estado ON Encomenda (Estado);
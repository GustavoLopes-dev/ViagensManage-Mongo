CREATE TABLE Motorista (  
    Id INT PRIMARY KEY, -- Identificador único do motorista  
    CNH CHAR(11), -- Número da Carteira Nacional de Habilitação do motorista  
    Nome CHAR(80), -- Nome completo do motorista  
    CPF CHAR(11) UNIQUE, -- CPF do motorista (únicas)  
    Email CHAR(50) -- Endereço de e-mail do motorista  
) 
;

CREATE TABLE Passageiro (  
    CPF CHAR(11) PRIMARY KEY, -- CPF do passageiro (chave primária)  
    Nome CHAR(80), -- Nome completo do passageiro  
    Email CHAR(50), -- Endereço de e-mail do passageiro  
    Telefone CHAR(11), -- Número de telefone do passageiro  
    Bairro CHAR(40), -- Bairro de residência do passageiro  
    MeiodePagamento CHAR(20) -- Meio de pagamento preferido do passageiro  
) 
;

CREATE TABLE Carro (  
    Codigo INT PRIMARY KEY, -- Identificador único do carro (chave primária)  
    Placa CHAR(7), -- Placa do carro  
    Marca CHAR(20), -- Marca do carro  
    Modelo CHAR(40), -- Modelo do carro  
    Ano INT, -- Ano de fabricação do carro  
    CPF_Motorista CHAR(11), -- CPF do motorista associado ao carro  
    FOREIGN KEY (CPF_Motorista) REFERENCES Motorista(CPF) -- Chave estrangeira para vincular a um motorista  
) 
;

CREATE TABLE Viagem (  
    Id CHAR(10) PRIMARY KEY, -- Identificador único da viagem (chave primária)  
    CodigoCarro INT, -- Código do carro utilizado na viagem  
    CPF_Passageiro CHAR(11), -- CPF do passageiro que fez a viagem  
    TipoCorrida CHAR(10), -- Tipo de corrida: 'Interurbana' ou 'Urbana'  
    BairroPartida CHAR(30), -- Bairro de partida da viagem (pode ser nulo para corridas interurbanas)  
    CidadeDestino CHAR(30), -- Cidade de destino da viagem (pode ser nulo para corridas urbanas)  
    Kms INT, -- Distância percorrida na viagem  
    Valor INT, -- Valor da viagem  
    FOREIGN KEY (CodigoCarro) REFERENCES Carro(Codigo), -- Chave estrangeira para vincular a um carro  
    FOREIGN KEY (CPF_Passageiro) REFERENCES Passageiro(CPF) -- Chave estrangeira para vincular a um passageiro  
) 
;

INSERT INTO Motorista (Id, CNH, Nome, CPF, Email) VALUES (1, '12345678901', 'Dominic Toretto', '12345678900', 'toretto@email.com');
INSERT INTO Motorista (Id, CNH, Nome, CPF, Email) VALUES (2, '98765432109', 'Relampago McQueen', '98765432100', 'mcqueen@email.com');
INSERT INTO Motorista (Id, CNH, Nome, CPF, Email) VALUES (3, '65432198707', 'Brian O Conner', '65432198700', 'eobrian@email.com');

INSERT INTO Passageiro (CPF, Nome, Email, Telefone, Bairro, MeiodePagamento) VALUES ('11122233344', 'Brenda Meeks', 'brendameeks@email.com', '11123456789', 'Centro', 'Credito');
INSERT INTO Passageiro (CPF, Nome, Email, Telefone, Bairro, MeiodePagamento) VALUES ('22233344455', 'Fogell McLovin', 'mclovin@email.com', '11234567890', 'Moinhos', 'Dinheiro');
INSERT INTO Passageiro (CPF, Nome, Email, Telefone, Bairro, MeiodePagamento) VALUES ('33344455566', 'Regina George', 'reginageorge@email.com', '11345678901', 'Floresta', 'Debito');
INSERT INTO Passageiro (CPF, Nome, Email, Telefone, Bairro, MeiodePagamento) VALUES ('44455566677', 'Elle Woods', 'ellewoods@email.com', '11456789012', 'Cascata', 'Credito');
INSERT INTO Passageiro (CPF, Nome, Email, Telefone, Bairro, MeiodePagamento) VALUES ('55566677788', 'Jenna Rink', 'jennar_30@email.com', '11567890123', 'Partenon', 'Dinheiro');

INSERT INTO Carro (Codigo, Placa, Marca, Modelo, Ano, CPF_Motorista) VALUES (101, 'ABC1234', 'Toyota', 'Corolla', 2020, '12345678900');
INSERT INTO Carro (Codigo, Placa, Marca, Modelo, Ano, CPF_Motorista) VALUES (102, 'MCQ2006', 'Chevrolet', 'Corvete C6', 2018, '98765432100');
INSERT INTO Carro (Codigo, Placa, Marca, Modelo, Ano, CPF_Motorista) VALUES (103, 'DEF9012', 'Volkswagen', 'Gol', 2019, '65432198700');

INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000001', 101, '11122233344', 'Urbana', 'Centro', NULL, 10, 20);
INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000002', 102, '22233344455', 'Urbana', 'Moinhos', NULL, 15, 25);
INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000003', 103, '33344455566', 'Urbana', 'Floresta', NULL, 12, 22);
INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000004', 101, '44455566677', 'Urbana', 'Floresta', NULL, 8, 18);
INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000005', 102, '55566677788', 'Urbana', 'Cascata', NULL, 20, 30);
INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000006', 103, '11122233344', 'Urbana', 'Partenon', NULL, 25, 35);
INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000007', 101, '22233344455', 'Interurb', 'Moinhos', 'Canoas', 50, 100);
INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000008', 102, '33344455566', 'Interurb', 'Moinhos', 'Gravatai', 70, 120);
INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000009', 103, '44455566677', 'Interurb', 'Floresta', 'Canoas', 60, 110);
INSERT INTO Viagem (Id, CodigoCarro, CPF_Passageiro, TipoCorrida, BairroPartida, CidadeDestino, Kms, Valor) VALUES ('000010', 101, '55566677788', 'Interurb', 'Partenon', 'Canoas', 80, 130);
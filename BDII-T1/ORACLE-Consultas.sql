-- CONSULTAS

--BUSCA 01 - LIVE SQL ORACLE
SELECT DISTINCT CodigoCarro 
FROM Viagem 
WHERE BairroPartida = 'Floresta'

--BUSCA 02 - LIVE SQL ORACLE
SELECT p.Nome AS Nome_Passageiro, v.CodigoCarro 
FROM Passageiro p 
INNER JOIN Viagem v ON p.CPF = v.CPF_Passageiro 
INNER JOIN Carro c ON v.CodigoCarro = c.Codigo 
WHERE v.BairroPartida = p.Bairro

--BUSCA 03 - LIVE SQL ORACLE
SELECT p.CPF, p.Nome, SUM(v.Kms) AS Total_Quilometros 
FROM Passageiro p 
INNER JOIN Viagem v ON p.CPF = v.CPF_Passageiro 
GROUP BY p.CPF, p.Nome
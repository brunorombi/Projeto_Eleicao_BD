CREATE DATABASE eleitor;

-- Usar o banco de dados "eleitor" para criar as tabelas dentro dele
USE eleitor;

-- Apagar tabelas
Drop table HistoricoVotacao;
Drop table Eleitor;
Drop table Candidato;
Drop table Partido;
Drop table SecaoEleitoral;
Drop table ZonaEleitoral;


-- Criar a tabela "ZonaEleitoral"
CREATE TABLE ZonaEleitoral (
Numero numeric (2,0) PRIMARY KEY, -- RN06
Nome varchar(255) NOT NULL,
Endereco varchar(255) NOT NULL
);
-- Criar a tabela "SecaoEleitoral"
CREATE TABLE SecaoEleitoral (
Numero numeric (3,0) PRIMARY KEY, -- RN05
Municipio varchar(255) NOT NULL,
NumeroZona numeric (2,0) NOT NULL, -- FK zona eleitoral - RN09 e RN10
FOREIGN KEY (NumeroZona) REFERENCES ZonaEleitoral (Numero)
);
-- Criar a tabela "Partido"
CREATE TABLE Partido (
Numero numeric (2,0) PRIMARY KEY, -- chave primária
Nome varchar(255) NOT NULL UNIQUE, -- RN03
Sigla varchar(10) NOT NULL UNIQUE -- RN04
);
-- Criar a tabela "Candidato"
CREATE TABLE Candidato (
Numero numeric (5,0) PRIMARY KEY, -- RN15
Nome varchar(255) NOT NULL,
NumeroPartido numeric (2,0) NOT NULL, -- FK número partido - RN07 e RN08
FOREIGN KEY (NumeroPartido) REFERENCES Partido (Numero)
);
-- Criar a tabela "Eleitor"
CREATE TABLE Eleitor (
Titulo numeric (12,0) PRIMARY KEY, -- RN01
Nome varchar(255) NOT NULL,
Nacionalidade varchar(255) NOT NULL CHECK (Nacionalidade = 'Brasileira'), -- RN16
DataNascimento date NOT NULL CHECK (DATEDIFF(year, DataNascimento, GETDATE()) >= 16), -- RN02
Endereco varchar(255) NOT NULL,
NumeroZona numeric (2,0) NOT NULL, -- FK zona eleitoral - RN13 e RN14
NumeroSecao numeric (3,0) NOT NULL, -- FK seção eleitoral - RN11 e RN12
FOREIGN KEY (NumeroZona) REFERENCES ZonaEleitoral (Numero),
FOREIGN KEY (NumeroSecao) REFERENCES SecaoEleitoral (Numero)
);
-- Criar a tabela "HistoricoVotacao"
CREATE TABLE HistoricoVotacao (
Registro numeric (4,0) NOT NULL, -- código numérico de quatro dígitos
Titulo numeric (12,0) NOT NULL, -- FK título eleitor - RN17
Ano int NOT NULL,
NumeroCandidato numeric (5,0) NOT NULL, -- FK candidato
NumeroPartido numeric (2,0) NOT NULL, -- FK partido
PRIMARY KEY (Registro, Titulo), -- chave primária composta - RN17
FOREIGN KEY (Titulo) REFERENCES Eleitor (Titulo),
FOREIGN KEY (NumeroCandidato) REFERENCES Candidato (Numero),
FOREIGN KEY (NumeroPartido) REFERENCES Partido (Numero)
);

-- Inserir dados na tabela "ZonaEleitoral"
INSERT INTO ZonaEleitoral VALUES (01, 'Zona Central', 'Rua da República, 100');
INSERT INTO ZonaEleitoral VALUES (02, 'Zona Sul', 'Avenida Paulista, 200');
INSERT INTO ZonaEleitoral VALUES (03, 'Zona Norte', 'Rua Voluntários da Pátria, 300');
INSERT INTO ZonaEleitoral VALUES (04, 'Zona Leste', 'Avenida Radial Leste, 400');
INSERT INTO ZonaEleitoral VALUES (05, 'Zona Oeste', 'Avenida Francisco Matarazzo, 500');
INSERT INTO ZonaEleitoral VALUES (06, 'Zona Sudeste', 'Avenida Rio Branco, 600');
INSERT INTO ZonaEleitoral VALUES (07, 'Zona Nordeste', 'Rua da Conceição, 700');
INSERT INTO ZonaEleitoral VALUES (08, 'Zona Noroeste', 'Avenida Amazonas, 800');
INSERT INTO ZonaEleitoral VALUES (09, 'Zona Sudoeste', 'Rua das Flores, 900');
INSERT INTO ZonaEleitoral VALUES (10, 'Zona Centro-Oeste', 'Avenida Cuiabá, 1000');
INSERT INTO ZonaEleitoral VALUES (11, 'Zona Centro-Sul', 'Rua Belo Horizonte, 1100');
INSERT INTO ZonaEleitoral VALUES (12, 'Zona Litorânea', 'Avenida Beira-Mar, 1200');
INSERT INTO ZonaEleitoral VALUES (13, 'Zona Interior', 'Rua das Montanhas, 1300');
INSERT INTO ZonaEleitoral VALUES (14, 'Zona Metropolitana', 'Avenida Metrópole, 1400');
INSERT INTO ZonaEleitoral VALUES (15, 'Zona Rural', 'Estrada do Sertão, 1500');

-- Inserir dados na tabela "SecaoEleitoral"
INSERT INTO SecaoEleitoral VALUES (101, 'São Paulo', 01);
INSERT INTO SecaoEleitoral VALUES (102, 'São Paulo', 01);
INSERT INTO SecaoEleitoral VALUES (201, 'São Paulo', 02);
INSERT INTO SecaoEleitoral VALUES (202, 'São Paulo', 02);
INSERT INTO SecaoEleitoral VALUES (301, 'São Paulo', 03);
INSERT INTO SecaoEleitoral VALUES (401, 'São Paulo', 04);
INSERT INTO SecaoEleitoral VALUES (402, 'São Paulo', 04);
INSERT INTO SecaoEleitoral VALUES (501, 'São Paulo', 05);
INSERT INTO SecaoEleitoral VALUES (502, 'São Paulo', 05);
INSERT INTO SecaoEleitoral VALUES (601, 'São Paulo', 06);
INSERT INTO SecaoEleitoral VALUES (701, 'São Paulo', 07);
INSERT INTO SecaoEleitoral VALUES (801, 'São Paulo', 08);
INSERT INTO SecaoEleitoral VALUES (901, 'São Paulo', 09);
INSERT INTO SecaoEleitoral VALUES (100, 'São Paulo', 10);
INSERT INTO SecaoEleitoral VALUES (110, 'São Paulo', 11);
-- Inserir dados na tabela "Partido"
INSERT INTO Partido VALUES (13, 'Partido dos Trabalhadores', 'PT');
INSERT INTO Partido VALUES (11, 'Partido Progressista', 'PP');
INSERT INTO Partido VALUES (12, 'Partido Democrático Trabalhista', 'PDT');
INSERT INTO Partido VALUES (45, 'Partido da Social Democracia Brasileira', 'PSDB');
INSERT INTO Partido VALUES (40, 'Partido Socialista Brasileiro', 'PSB');
INSERT INTO Partido VALUES (15, 'Partido Verde', 'PV');
INSERT INTO Partido VALUES (25, 'Partido da Mobilização Nacional', 'PMN');
INSERT INTO Partido VALUES (35, 'Partido Trabalhista Brasileiro', 'PTB');
INSERT INTO Partido VALUES (55, 'Partido Social Cristão', 'PSC');
INSERT INTO Partido VALUES (65, 'Partido dos Aposentados da Nação', 'PAN');
INSERT INTO Partido VALUES (75, 'Partido da Causa Operária', 'PCO');
INSERT INTO Partido VALUES (85, 'Partido Socialismo e Liberdade', 'PSOL');
INSERT INTO Partido VALUES (95, 'Partido Comunista do Brasil', 'PCdoB');
INSERT INTO Partido VALUES (10, 'Partido Novo', 'NOVO');
INSERT INTO Partido VALUES (51, 'Partido Renovador Trabalhista Brasileiro', 'PRTB');


-- Inserir dados na tabela "Candidato"
INSERT INTO Candidato VALUES (13231, 'João Silva', 13);
INSERT INTO Candidato VALUES (11234, 'Maria Santos', 11);
INSERT INTO Candidato VALUES (12057, 'José Oliveira', 12);
INSERT INTO Candidato VALUES (45, 'Ana Souza', 45);
INSERT INTO Candidato VALUES (409, 'Pedro Costa', 40);
INSERT INTO Candidato VALUES (13331, 'Rafaela Pereira', 15);
INSERT INTO Candidato VALUES (12567, 'Paulo Santos', 25);
INSERT INTO Candidato VALUES (35890, 'Larissa Oliveira', 35);
INSERT INTO Candidato VALUES (558, 'Pedro Almeida', 55);
INSERT INTO Candidato VALUES (652, 'Marta Silva', 65);
INSERT INTO Candidato VALUES (754, 'Luiz Vieira', 75);
INSERT INTO Candidato VALUES (857, 'Isabel Pereira', 85);
INSERT INTO Candidato VALUES (958, 'Carlos Ribeiro', 95);
INSERT INTO Candidato VALUES (1050, 'Joana Mendes', 10);
INSERT INTO Candidato VALUES (1152, 'Rodrigo Fernandes', 51);

-- Inserir dados na tabela "Eleitor"
INSERT INTO Eleitor VALUES (123456789012, 'Carlos Lima', 'Brasileira', '2000-01-01', 'Rua A, 10', 01, 101);
INSERT INTO Eleitor VALUES (234567890123, 'Lucia Alves', 'Brasileira', '1999-02-02', 'Rua B, 20', 01, 102);
INSERT INTO Eleitor VALUES (345678901234, 'Ricardo Dias', 'Brasileira', '1998-03-03', 'Rua C, 30', 02, 201);
INSERT INTO Eleitor VALUES (456789012345, 'Julia Martins', 'Brasileira', '1997-04-04', 'Rua D, 40', 02, 202);
INSERT INTO Eleitor VALUES (567890123456, 'Bruno Fernandes', 'Brasileira', '1996-05-05', 'Rua E, 50', 03, 301);
INSERT INTO Eleitor VALUES (678901234567, 'Mariana Rocha', 'Brasileira', '1995-06-06', 'Rua F, 60', 04, 401);
INSERT INTO Eleitor VALUES (789012345678, 'Felipe Costa', 'Brasileira', '1994-07-07', 'Rua G, 70', 04, 402);
INSERT INTO Eleitor VALUES (890123456789, 'Camila Pereira', 'Brasileira', '1993-08-08', 'Rua H, 80', 05, 501);
INSERT INTO Eleitor VALUES (901234567890, 'Lucas Almeida', 'Brasileira', '1992-09-09', 'Rua I, 90', 05, 502);
INSERT INTO Eleitor VALUES (123456789001, 'Mariano Oliveira', 'Brasileira', '1991-10-10', 'Rua J, 100', 06, 601);
INSERT INTO Eleitor VALUES (234567890112, 'Helena Ribeiro', 'Brasileira', '1990-11-11', 'Rua K, 110', 07, 701);
INSERT INTO Eleitor VALUES (345678901223, 'Gustavo Fernandes', 'Brasileira', '1989-12-12', 'Rua L, 120', 08, 801);
INSERT INTO Eleitor VALUES (456789012334, 'Cecília Pereira', 'Brasileira', '1988-01-13', 'Rua M, 130', 09, 901);
INSERT INTO Eleitor VALUES (567890123445, 'Rafael Silva', 'Brasileira', '1987-02-14', 'Rua N, 140', 10, 100);
INSERT INTO Eleitor VALUES (678901234556, 'Larissa Alves', 'Brasileira', '1986-03-15', 'Rua O, 150', 11, 110);


-- Inserir dados na tabela "HistoricoVotacao"
INSERT INTO HistoricoVotacao VALUES (0001, 123456789012, 2022, 13231, 13);
INSERT INTO HistoricoVotacao VALUES (0002, 234567890123, 2019, 11234, 11);
INSERT INTO HistoricoVotacao VALUES (0003, 345678901234, 2018, 12057, 12);
INSERT INTO HistoricoVotacao VALUES (0004, 456789012345, 2002, 45, 45);
INSERT INTO HistoricoVotacao VALUES (0005, 567890123456, 2003, 409, 40);
INSERT INTO HistoricoVotacao VALUES (0006, 678901234567, 1993, 13331, 15);
INSERT INTO HistoricoVotacao VALUES (0007, 789012345678, 2022, 12567, 25);
INSERT INTO HistoricoVotacao VALUES (0008, 890123456789, 2022, 35890, 35);
INSERT INTO HistoricoVotacao VALUES (0009, 901234567890, 2022, 558, 55);
INSERT INTO HistoricoVotacao VALUES (0010, 123456789001, 2021, 652, 65);
INSERT INTO HistoricoVotacao VALUES (0011, 234567890112, 2022, 754, 75);
INSERT INTO HistoricoVotacao VALUES (0012, 345678901223, 2022, 857, 85);
INSERT INTO HistoricoVotacao VALUES (0013, 456789012334, 2022, 958, 95);
INSERT INTO HistoricoVotacao VALUES (0014, 567890123445, 2012, 1050, 10);
INSERT INTO HistoricoVotacao VALUES (0015, 678901234556, 2006, 1152, 51);

-- Exibir tabelas
Select * from HistoricoVotacao;
Select * from Eleitor;
Select * from Candidato;
Select * from Partido;
Select * from SecaoEleitoral;
Select * from ZonaEleitoral;

--Lista e filtro

-- Primeira consulta
--1) Crie uma linha com o nome 'candidato com nome e numero: ' e mostre o nome e numero da tabela candidato
Select 'candidato com nome e numero: ', nome, numero from candidato;

--2) Crie uma linha chamada 'dados principais' e me mostre o nome, titulo, numeroZona, numeroSecao da tabela eleitor

Select 'dados principais: ', nome, titulo, numeroZona, numeroSecao from eleitor;

-- Segunda consulta
--3) Crie uma linha chamadada 'Zona eleitoral', cabeçalho chamado Zona, e me mostre o numero, nome, endereço da tabela zonaEleitoral

Select 'Zona eleitoral: ' AS Zona, numero, nome, endereco from zonaEleitoral;

--4) Crie uma linha chamada 'Eleitor: ', um cabeçalho chamado Identificação e me mostre o nome, titulo e nacionalidade da tabela eleitor

Select 'Eleitor: ' AS Identificação, nome, titulo, Nacionalidade from eleitor;

-- Terceira consulta
--5) Me mostre a tabela titulo e selecione ela multiplicada por 2

Select 'Eleitor: ' AS Eleitor, 'Nome: ' AS Nome, nome, 'Titulo' AS Titulo, titulo, 'Titulo * 2' AS 'Titulo * 2', 'Título' = titulo * 2 from eleitor;

--6) Crie uma coluna chamada 'Anos ativos' e me mostre quantos anos fazem desde que cada um votou

Select 'Historico: ' AS Historico, 'Titulo: ' AS Titulo, titulo, 'Anos: ' AS 'Tempo', 2023 - Ano from HistoricoVotacao;

-- Quarta consulta
--7) Arredonde para baixo o numeroZona

Select 'Número: ' AS Número, NumeroZona, FLOOR(NumeroZona) AS 'Arredondar para baixo' from SecaoEleitoral;

--8) Me diga se o numero do partido é positivo, negativo ou zero

Select 'Número: ' AS Número, NumeroPartido, SIGN(NumeroPartido) AS 'Positivo, Negativo ou Zero' from HistoricoVotacao;

-- Quinta consulta
--9) Coloque os nomes dos eleitores em minúsculo
SELECT 'Identificação: ' AS Identificação, 'Nome em minúsculas: ' AS 'Nome em minúsculas', LOWER(Nome) from Eleitor;
--10) Mostre o nome e nacionalidade dos eleitores em uma linha, mostre apenas as duas primeiras letras da nacionalidade em maiúscula
SELECT 'Identificação: ' AS Identificação, CONCAT(nome, ' ', UPPER(SUBSTRING(NACIONALIDADE, 1, 2))) AS 'Nome e Nacionalidade' FROM Eleitor;

-- Sexta consulta
--11) Me mostre quantos as tem os eleitores
SELECT 'Nome: ' AS Nome, Idade = DATEDIFF(YEAR, DataNascimento, GETDATE()) FROM Eleitor;
--12) Me mostre os mêses que cada eleitor faz aniversário
SELECT 'Nome: ' AS Nome, 'Mes Aniversario' AS 'Mês de Aniversário', DATEPART(MM, DataNascimento) FROM Eleitor;

-- Sétima consulta
--13) Me mostre apenas o primeiro nome dos eleitores, e me mostre também a data de nascimento deles, em Char e estilo 102, tudo em uma linha
SELECT Descrição = 'O eleitor ' + SUBSTRING(Nome, 1, CHARINDEX(' ', Nome) - 1) + ' nasceu na data: ' + CONVERT(char(10), DataNascimento, 102) FROM Eleitor;
--14) Faça o mesmo, porem me mostre agora o numero da seção em char, estilo 106
SELECT Descrição = 'O eleitor ' + SUBSTRING(Nome, 1, CHARINDEX(' ', Nome) - 1) + ' tem o numero da seção: ' + CONVERT(char(3), NumeroSecao, 106) FROM Eleitor;

-- Oitava consulta
--15) Me mostre todos os candidatos menos os que nao tem o numero do partido 15 e 45
Select * from Candidato where numeroPartido not in (15, 45);
--16) Me mostre os candidatos que possuem o numero do partido  15 e 45
Select * from Candidato where numeroPartido in (15, 45);
--17) Me mostre os candidatos que nao começam com a letra J
Select * from Candidato where Nome NOT like ('J%');
--18) Me mostre os candidatos que nao começam com M e nao começam com A
Select * from Candidato where Nome NOT like ('M%') AND Nome not like ('A%');
--19) Me mostre os partidos que tem o numero diferente de 45
SELECT * FROM Partido WHERE Numero != 45;
--20) Me mostre os partidos que tem o numero maior que 12
SELECT * FROM Partido WHERE Numero > 12;
--21) Me mostre o historico de votaçao onde o ano esta entre 2015 e 2023
SELECT * FROM HistoricoVotacao where ano between 2015 AND 2023;
--22) Me mostre o historico de votação onde numero do partido esta entre 10 e 20
SELECT * FROM HistoricoVotacao where NumeroPartido between 10 AND 20;

--Joins

--Pergunta: Quais os nomes dos Candidatos com o números deles, Nomes e números dos partidos?

select Candidato.Nome, Candidato.Numero as 'Número do candidato',
Partido.Numero as 'Número do partido', Partido.Nome
from Candidato inner join Partido
on Candidato.NumeroPartido = Partido.Numero;

--Pergunta: Qual o nome do eleitor, Zona eleitoral e Seção Eleitoral?

select Eleitor.Nome,
SecaoEleitoral.Municipio,
ZonaEleitoral.Endereco
From Eleitor inner join ZonaEleitoral
on Eleitor.NumeroZona = ZonaEleitoral.Numero
inner join SecaoEleitoral
on Eleitor.NumeroSecao = SecaoEleitoral.Numero


--Pergunta: Qual o registro e o ano do último voto do eleitor?

SELECT Eleitor.Nome, HistoricoVotacao.Registro, HistoricoVotacao.Ano
FROM Eleitor
LEFT JOIN HistoricoVotacao
ON Eleitor.Titulo = HistoricoVotacao.Titulo;

		--Pergunta: Qual o nome dos candidatos e dos seus eleitores?

		Select Candidato.Nome as 'Nome do candidato', Eleitor.Nome as 'Nome do Eleitor'
		From Candidato
		Right join HistoricoVotacao
		On HistoricoVotacao.NumeroCandidato = Candidato.Numero
		Right join Eleitor
		on Eleitor.Titulo = HistoricoVotacao.Titulo;


		--Pergunta: Qual o número do título dos  eleitores, Seção eleitoral e Zona eleitoral, onde a zona eleitoral é menor que 3? 

		Select Eleitor.Titulo, SecaoEleitoral.Numero, ZonaEleitoral.Numero
		From Eleitor 
		FULL JOIN SecaoEleitoral
		on Eleitor.NumeroSecao = SecaoEleitoral.Numero
		FULL JOIN ZonaEleitoral
		on SecaoEleitoral.NumeroZona = ZonaEleitoral.Numero
		where ZonaEleitoral.Numero  < 03;


		--Mostre os Eleitores junto ao registro em crescente baseada nos números do registro.

		Select HistoricoVotacao.Registro, Eleitor.Nome
		From HistoricoVotacao
		FULL JOIN Eleitor
		on HistoricoVotacao.Titulo = Eleitor.Titulo
		order by HistoricoVotacao.Titulo;

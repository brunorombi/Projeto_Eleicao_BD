# Projeto Eleição
# Sistema de Informação sobre o Eleitor Brasileiro

## Introdução

O projeto de banco de dados do Sistema de Informação sobre o Eleitor Brasileiro é responsável por armazenar e gerenciar informações relacionadas aos eleitores, candidatos, partidos políticos, locais de votação e resultados das eleições no Brasil.

Neste projeto, exploramos como um banco de dados é projetado com base em regras de negócio e implementado para atender às demandas de um sistema eleitoral básico. Isso envolve a criação de tabelas para armazenar dados sobre eleitores elegíveis, candidatos, partidos políticos, zonas e seções eleitorais, bem como o histórico de votação.

## Definição dos Dados para Armazenamento

### Zona Eleitoral
- Número
- Nome
- Endereço

### Seção Eleitoral
- Número
- Município
- Número da Zona Eleitoral (FK - Chave Estrangeira)

### Eleitores
- Título de Eleitor (PK - Chave Primária)
- Nome
- Nacionalidade
- Data de Nascimento
- Endereço
- Número da Zona Eleitoral (FK)
- Número da Seção Eleitoral (FK)

### Histórico de Votação
- Número de Registro (PK)
- Ano de Eleição
- Número do Candidato (FK)
- Número do Partido (FK)
- Título de Eleitor (FK)

### Candidato
- Número do Candidato (PK)
- Nome
- Número do Partido (FK)

### Partido
- Número do Partido (PK)
- Nome
- Sigla

## Regras de Negócio

1. Um eleitor é identificado por um código numérico de doze dígitos.
2. Para ser um eleitor, é necessário ter mais de dezesseis anos.
3. Não existem nomes de partidos repetidos.
4. Não existem siglas de partidos repetidas.
5. Uma seção eleitoral é identificada por um código de três dígitos.
6. Uma zona eleitoral é identificada por um código de dois dígitos.
7. Um candidato deve pertencer a um único partido.
8. Um partido pode ter vários candidatos.
9. Uma seção eleitoral pertence a uma única zona eleitoral.
10. Uma zona eleitoral pode pertencer a várias seções eleitorais.
11. Uma seção eleitoral pode ter vários eleitores.
12. Um eleitor deve ter apenas uma seção eleitoral.
13. Um eleitor deve ter uma zona eleitoral.
14. Uma zona eleitoral pode ter vários eleitores.
15. Um candidato é identificado por um código numérico de cinco dígitos.
16. Um eleitor deve possuir nacionalidade brasileira.
17. O histórico de votação é identificado por um código numérico de quatro dígitos mais o título de eleitor, número do candidato e o partido.

## Modelos de Banco de Dados

### Modelo Conceitual
![Modelo Conceitual](https://github.com/brunorombi/Projeto_Eleicao_BD/assets/113005942/69147ea6-6a86-4bcd-9f5a-53f4ace665b5)

### Modelo Lógico Relacional
![Modelo Relacional](https://github.com/brunorombi/Projeto_Eleicao_BD/assets/113005942/05d068b4-3f8e-45fc-9693-501ecf7b175a)



### Modelo Físico
O modelo físico está presente no arquivo chamado "eleitor.sql".



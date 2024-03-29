--Coment�rios:--
/*Professor, os inserts das tabelas de liga��o n:n, que s�o as ultimas criadas com os creates tables, os primeiros inserts nos id's 1 e 2 podem dar
erro se executado depois de alguns comandos em outras tables por elas serem tabelas de liga��o e s� possuirem FK's.*/

--DROP TABLES--
DROP TABLE T_VEC_AMIGOS_PERFIL;
DROP TABLE T_VEC_PERFIL_VACINACAO;
DROP TABLE T_VEC_PERFIL;
DROP TABLE T_VEC_ENDERECO_USUARIO;
DROP TABLE T_VEC_CADASTRO;
DROP TABLE T_VEC_VACINACAO;
DROP TABLE T_VEC_AMIGOS_USUARIO;
DROP TABLE T_VEC_PLANO_SAUDE;
--DDL:--
CREATE TABLE T_VEC_PLANO_SAUDE(
    ID_PLANO_SAUDE NUMERIC(9) NOT NULL,
    NM_PLANO_SAUDE VARCHAR(150),
    NR_CNPJ_PLANO_SAUDE NUMERIC(14),
    PRIMARY KEY(ID_PLANO_SAUDE)
);
CREATE TABLE T_VEC_AMIGOS_USUARIO(
    ID_AMIGOS_USUARIO NUMERIC(9) NOT NULL,
    NM_AMIGOS VARCHAR(150),
    NR_AMIGOS NUMERIC(4),
    PRIMARY KEY(ID_AMIGOS_USUARIO)
);
CREATE TABLE T_VEC_VACINACAO(
    ID_VACINACAO NUMERIC(9),
    ST_VACINA VARCHAR(2),
    NM_VACINA VARCHAR(100),
    PRIMARY KEY(ID_VACINACAO),
    CHECK(ST_VACINA IN ('S','N'))
);
CREATE TABLE T_VEC_CADASTRO(
    ID_USUARIO NUMERIC(9) NOT NULL,
    NM_USUARIO VARCHAR(250) NOT NULL,
    NR_SENHA VARCHAR(15) NOT NULL,
    NM_EMAIL VARCHAR(100) NOT NULL,
    NR_CPF VARCHAR(14) NOT NULL,
    NR_DDD NUMERIC(2) NOT NULL,
    NR_DDI NUMERIC(2) NOT NULL,
    NR_TELEFONE NUMERIC(9) NOT NULL,
    PRIMARY KEY(ID_USUARIO)
);
CREATE TABLE T_VEC_ENDERECO_USUARIO(
    ID_ENDERECO_USUARIO NUMERIC(9) NOT NULL,
    NM_RUA VARCHAR(150) NOT NULL,
    NR_RUA NUMERIC(5) NOT NULL,
    NR_CEP NUMERIC(8),
    NM_CIDADE VARCHAR(100) NOT NULL,
    NM_ESTADO VARCHAR(2) NOT NULL,
    COMPL_ENDERECO VARCHAR(255),
    NM_BAIRRO VARCHAR(150) NOT NULL,
    PRIMARY KEY(ID_ENDERECO_USUARIO)
);
CREATE TABLE T_VEC_PERFIL(
    ID_PERFIL NUMERIC(9) NOT NULL,
    ST_PERFIL VARCHAR(2) NOT NULL,
    ID_USUARIO NUMERIC(9) NOT NULL,
    ID_ENDERECO_USUARIO NUMERIC(9) NOT NULL,
    ID_PLANO_SAUDE NUMERIC(9) NOT NULL,
    PRIMARY KEY(ID_PERFIL),
    FOREIGN KEY(ID_ENDERECO_USUARIO) REFERENCES T_VEC_ENDERECO_USUARIO(ID_ENDERECO_USUARIO),
    FOREIGN KEY(ID_PLANO_SAUDE) REFERENCES T_VEC_PLANO_SAUDE(ID_PLANO_SAUDE),
    CHECK(ST_PERFIL IN ('S','N'))
);
CREATE TABLE T_VEC_PERFIL_VACINACAO(
    ID_PERFIL NUMERIC(9) NOT NULL,
    ID_VACINACAO NUMERIC(9) NOT NULL,
    FOREIGN KEY(ID_PERFIL) REFERENCES T_VEC_PERFIL(ID_PERFIL),
    FOREIGN KEY(ID_VACINACAO) REFERENCES T_VEC_VACINACAO(ID_VACINACAO)
);
CREATE TABLE T_VEC_AMIGOS_PERFIL(
    ID_PERFIL NUMERIC(9) NOT NULL,
    ID_AMIGOS_USUARIO NUMERIC(9) NOT NULL,
    FOREIGN KEY(ID_PERFIL) REFERENCES T_VEC_PERFIL(ID_PERFIL),
    FOREIGN KEY(ID_AMIGOS_USUARIO) REFERENCES T_VEC_AMIGOS_USUARIO(ID_AMIGOS_USUARIO)
);

--DML'S:--
--T_VEC_PLANO_SAUDE--
insert into T_VEC_PLANO_SAUDE (ID_PLANO_SAUDE, NM_PLANO_SAUDE, NR_CNPJ_PLANO_SAUDE) values (1, 'BCM Cosmetique SAS', '48087523875274');
insert into T_VEC_PLANO_SAUDE (ID_PLANO_SAUDE, NM_PLANO_SAUDE, NR_CNPJ_PLANO_SAUDE) values (2, 'REMEDYREPACK INC.', '34247739801234');
insert into T_VEC_PLANO_SAUDE (ID_PLANO_SAUDE, NM_PLANO_SAUDE, NR_CNPJ_PLANO_SAUDE) values (3, 'Mondelez Global LLC', '86073882074321');
insert into T_VEC_PLANO_SAUDE (ID_PLANO_SAUDE, NM_PLANO_SAUDE, NR_CNPJ_PLANO_SAUDE) values (4, 'Space Brands Limited', '31162307495242');
insert into T_VEC_PLANO_SAUDE (ID_PLANO_SAUDE, NM_PLANO_SAUDE, NR_CNPJ_PLANO_SAUDE) values (5, 'State of Florida DOH Central Pharmacy', '36417163576342');
insert into T_VEC_PLANO_SAUDE (ID_PLANO_SAUDE, NM_PLANO_SAUDE, NR_CNPJ_PLANO_SAUDE) values (6, 'GlaxoSmithKline LLC', '84780858666576');
UPDATE T_VEC_PLANO_SAUDE SET NM_PLANO_SAUDE = 'Amil' WHERE ID_PLANO_SAUDE = 1;
UPDATE T_VEC_PLANO_SAUDE SET NM_PLANO_SAUDE = 'Notre-dame' WHERE ID_PLANO_SAUDE = 2;
DELETE FROM T_VEC_PLANO_SAUDE WHERE ID_PLANO_SAUDE = 1;
DELETE FROM T_VEC_PLANO_SAUDE WHERE ID_PLANO_SAUDE = 2;
--T_VEC_AMIGOS_USUARIO--
insert into T_VEC_AMIGOS_USUARIO (ID_AMIGOS_USUARIO, NM_AMIGOS, NR_AMIGOS) values (1, 'Star Bridgeman', '122');
insert into T_VEC_AMIGOS_USUARIO (ID_AMIGOS_USUARIO, NM_AMIGOS, NR_AMIGOS) values (2, 'Ally Fulk', '524');
insert into T_VEC_AMIGOS_USUARIO (ID_AMIGOS_USUARIO, NM_AMIGOS, NR_AMIGOS) values (3, 'Orren Kienl', '129');
insert into T_VEC_AMIGOS_USUARIO (ID_AMIGOS_USUARIO, NM_AMIGOS, NR_AMIGOS) values (4, 'Mortimer Sleet', '421');
insert into T_VEC_AMIGOS_USUARIO (ID_AMIGOS_USUARIO, NM_AMIGOS, NR_AMIGOS) values (5, 'Octavia Georg', '31');
insert into T_VEC_AMIGOS_USUARIO (ID_AMIGOS_USUARIO, NM_AMIGOS, NR_AMIGOS) values (6, 'Diarmid Elgey', '192');
UPDATE T_VEC_AMIGOS_USUARIO SET NM_AMIGOS = 'Silvana' WHERE ID_AMIGOS_USUARIO = 1;
UPDATE T_VEC_AMIGOS_USUARIO SET NM_AMIGOS = 'Pedro' WHERE ID_AMIGOS_USUARIO = 2;
DELETE FROM T_VEC_AMIGOS_USUARIO WHERE ID_AMIGOS_USUARIO = 1;
DELETE FROM T_VEC_AMIGOS_USUARIO WHERE ID_AMIGOS_USUARIO = 2;
--T_VEC_VACINACAO--
insert into T_VEC_VACINACAO (ID_VACINACAO, ST_VACINA, NM_VACINA) values (1, 'S', 'Ultra-TechneKow');
insert into T_VEC_VACINACAO (ID_VACINACAO, ST_VACINA, NM_VACINA) values (2, 'S', 'Levemir');
insert into T_VEC_VACINACAO (ID_VACINACAO, ST_VACINA, NM_VACINA) values (3, 'N', 'Omnipaque');
insert into T_VEC_VACINACAO (ID_VACINACAO, ST_VACINA, NM_VACINA) values (4, 'N', 'Prednisone');
insert into T_VEC_VACINACAO (ID_VACINACAO, ST_VACINA, NM_VACINA) values (5, 'S', 'Ideal Flawless');
insert into T_VEC_VACINACAO (ID_VACINACAO, ST_VACINA, NM_VACINA) values (6, 'N', 'TOPIRAMATE');
UPDATE T_VEC_VACINACAO SET NM_VACINA = 'Covid' WHERE ID_VACINACAO = 1;
UPDATE T_VEC_VACINACAO SET NM_VACINA = 'Febre Amarela' WHERE ID_VACINACAO = 2;
DELETE FROM T_VEC_VACINACAO WHERE ID_VACINACAO = 1;
DELETE FROM T_VEC_VACINACAO WHERE ID_VACINACAO = 2;
--T_VEC_CADASTRO--
insert into T_VEC_CADASTRO (ID_USUARIO, NM_USUARIO, NR_SENHA, NM_EMAIL, NR_CPF, NR_DDD, NR_DDI, NR_TELEFONE) values (1, 'Gabriel Dreini', 'tL2~@2lw}M90hzM', 'gdreini0@gmail.com', '98165040813214', 55, 11, 570963638);
insert into T_VEC_CADASTRO (ID_USUARIO, NM_USUARIO, NR_SENHA, NM_EMAIL, NR_CPF, NR_DDD, NR_DDI, NR_TELEFONE) values (2, 'Aggie de Clerk', 'zM2=)n\JGFX.i#', 'ade1@gmail.com', '86051757374212', 55, 11, 442163838);
insert into T_VEC_CADASTRO (ID_USUARIO, NM_USUARIO, NR_SENHA, NM_EMAIL, NR_CPF, NR_DDD, NR_DDI, NR_TELEFONE) values (3, 'Luke Darycott', 'yD7,>vnu', 'ldarycott2@gmail.com', '50260205342343', 55, 13, 638657621);
insert into T_VEC_CADASTRO (ID_USUARIO, NM_USUARIO, NR_SENHA, NM_EMAIL, NR_CPF, NR_DDD, NR_DDI, NR_TELEFONE) values (4, 'Kaycee Poplee', 'yF8=7!HEEH$&', 'kpoplee3@gmail.com', '78479262968547', 55, 11, 190500268);
insert into T_VEC_CADASTRO (ID_USUARIO, NM_USUARIO, NR_SENHA, NM_EMAIL, NR_CPF, NR_DDD, NR_DDI, NR_TELEFONE) values (5, 'Michael Thow', 'wF0!@)c}|UkBD', 'mthow4@gmail.com', '94978116919806', 55, 13, 418141557);
insert into T_VEC_CADASTRO (ID_USUARIO, NM_USUARIO, NR_SENHA, NM_EMAIL, NR_CPF, NR_DDD, NR_DDI, NR_TELEFONE) values (6, 'Viviyan Robens', 'uN3\"n3w', 'vrobens5@gmail.com', '43516505322458', 55, 11, 465118145);
UPDATE T_VEC_CADASTRO SET NM_USUARIO = 'Lucas Lima' WHERE ID_USUARIO = 1;
UPDATE T_VEC_CADASTRO SET NM_USUARIO = 'Murilo Caumo Murgia' WHERE ID_USUARIO = 2;
DELETE FROM T_VEC_CADASTRO WHERE ID_USUARIO = 1;
DELETE FROM T_VEC_CADASTRO WHERE ID_USUARIO = 2;
--T_VEC_ENDERECO_USUARIO--
insert into T_VEC_ENDERECO_USUARIO (ID_ENDERECO_USUARIO, NM_RUA, NR_RUA, NR_CEP, NM_CIDADE, NM_ESTADO, COMPL_ENDERECO, NM_BAIRRO) values (1, 'Becker', 37, 34741709, 'Navashino', 'RU', 'AV', 'Place');
insert into T_VEC_ENDERECO_USUARIO (ID_ENDERECO_USUARIO, NM_RUA, NR_RUA, NR_CEP, NM_CIDADE, NM_ESTADO, COMPL_ENDERECO, NM_BAIRRO) values (2, 'Welch', 5151, 25054190, 'Jirny', 'CZ', 'AV', 'Way');
insert into T_VEC_ENDERECO_USUARIO (ID_ENDERECO_USUARIO, NM_RUA, NR_RUA, NR_CEP, NM_CIDADE, NM_ESTADO, COMPL_ENDERECO, NM_BAIRRO) values (3, 'Mockingbird', 655, 32020098, 'Kokot�w', 'PL', 'AV', 'Way');
insert into T_VEC_ENDERECO_USUARIO (ID_ENDERECO_USUARIO, NM_RUA, NR_RUA, NR_CEP, NM_CIDADE, NM_ESTADO, COMPL_ENDERECO, NM_BAIRRO) values (4, 'Havey', 761, 89247564, 'Gualeguay', 'AR', 'AV', 'Trail');
insert into T_VEC_ENDERECO_USUARIO (ID_ENDERECO_USUARIO, NM_RUA, NR_RUA, NR_CEP, NM_CIDADE, NM_ESTADO, COMPL_ENDERECO, NM_BAIRRO) values (5, 'Badeau', 11, 64212567, 'Catarina', 'NI', 'AV', 'Drive');
insert into T_VEC_ENDERECO_USUARIO (ID_ENDERECO_USUARIO, NM_RUA, NR_RUA, NR_CEP, NM_CIDADE, NM_ESTADO, COMPL_ENDERECO, NM_BAIRRO) values (6, 'Lien', 82395, 1234567, 'Al Kh?rijah', 'EG', 'AV', 'Center');
UPDATE T_VEC_ENDERECO_USUARIO SET NM_RUA = 'Rua Engenheiro Armando de Arruda' WHERE ID_ENDERECO_USUARIO = 1;
UPDATE T_VEC_ENDERECO_USUARIO SET NM_RUA = 'Rua Parnaiba Paoliello' WHERE ID_ENDERECO_USUARIO = 2;
DELETE FROM T_VEC_ENDERECO_USUARIO WHERE ID_ENDERECO_USUARIO = 1;
DELETE FROM T_VEC_ENDERECO_USUARIO WHERE ID_ENDERECO_USUARIO = 2;
--T_VEC_PERFIL--
insert into T_VEC_PERFIL (ID_PERFIL, ST_PERFIL, ID_USUARIO, ID_ENDERECO_USUARIO, ID_PLANO_SAUDE) values (1, 'S', 1, 1, 1);
insert into T_VEC_PERFIL (ID_PERFIL, ST_PERFIL, ID_USUARIO, ID_ENDERECO_USUARIO, ID_PLANO_SAUDE) values (2, 'S', 2, 2, 2);
insert into T_VEC_PERFIL (ID_PERFIL, ST_PERFIL, ID_USUARIO, ID_ENDERECO_USUARIO, ID_PLANO_SAUDE) values (3, 'S', 3, 3, 3);
insert into T_VEC_PERFIL (ID_PERFIL, ST_PERFIL, ID_USUARIO, ID_ENDERECO_USUARIO, ID_PLANO_SAUDE) values (4, 'S', 4, 4, 4);
insert into T_VEC_PERFIL (ID_PERFIL, ST_PERFIL, ID_USUARIO, ID_ENDERECO_USUARIO, ID_PLANO_SAUDE) values (5, 'N', 5, 5, 5);
insert into T_VEC_PERFIL (ID_PERFIL, ST_PERFIL, ID_USUARIO, ID_ENDERECO_USUARIO, ID_PLANO_SAUDE) values (6, 'N', 6, 6, 6);
UPDATE T_VEC_PERFIL SET ST_PERFIL = 'N' WHERE ID_PERFIL = 1;
UPDATE T_VEC_PERFIL SET ST_PERFIL = 'N' WHERE ID_PERFIL = 2;
DELETE FROM T_VEC_PERFIL WHERE ID_PERFIL = 1;
DELETE FROM T_VEC_PERFIL WHERE ID_PERFIL = 2;
--T_VEC_PERFIL_VACINACAO--
insert into T_VEC_PERFIL_VACINACAO (ID_PERFIL, ID_VACINACAO) values (1, 1);
insert into T_VEC_PERFIL_VACINACAO (ID_PERFIL, ID_VACINACAO) values (2, 2);
insert into T_VEC_PERFIL_VACINACAO (ID_PERFIL, ID_VACINACAO) values (3, 3);
insert into T_VEC_PERFIL_VACINACAO (ID_PERFIL, ID_VACINACAO) values (4, 4);
insert into T_VEC_PERFIL_VACINACAO (ID_PERFIL, ID_VACINACAO) values (5, 5);
insert into T_VEC_PERFIL_VACINACAO (ID_PERFIL, ID_VACINACAO) values (6, 6);
UPDATE T_VEC_PERFIL_VACINACAO SET ID_VACINACAO = 2 WHERE ID_PERFIL = 3;
UPDATE T_VEC_PERFIL_VACINACAO SET ID_VACINACAO = 3 WHERE ID_PERFIL = 4;
DELETE FROM T_VEC_PERFIL_VACINACAO WHERE ID_PERFIL = 3;
DELETE FROM T_VEC_PERFIL_VACINACAO WHERE ID_PERFIL = 4;
--T_VEC_AMIGOS_PERFIL--
insert into T_VEC_AMIGOS_PERFIL (ID_PERFIL, ID_AMIGOS_USUARIO) values (1, 1);
insert into T_VEC_AMIGOS_PERFIL (ID_PERFIL, ID_AMIGOS_USUARIO) values (2, 2);
insert into T_VEC_AMIGOS_PERFIL (ID_PERFIL, ID_AMIGOS_USUARIO) values (3, 3);
insert into T_VEC_AMIGOS_PERFIL (ID_PERFIL, ID_AMIGOS_USUARIO) values (4, 4);
insert into T_VEC_AMIGOS_PERFIL (ID_PERFIL, ID_AMIGOS_USUARIO) values (5, 5);
insert into T_VEC_AMIGOS_PERFIL (ID_PERFIL, ID_AMIGOS_USUARIO) values (6, 6);
UPDATE T_VEC_AMIGOS_PERFIL SET ID_AMIGOS_USUARIO = 2 WHERE ID_PERFIL = 3;
UPDATE T_VEC_AMIGOS_PERFIL SET ID_AMIGOS_USUARIO = 3 WHERE ID_PERFIL = 4;
DELETE FROM T_VEC_AMIGOS_PERFIL WHERE ID_PERFIL = 3;
DELETE FROM T_VEC_AMIGOS_PERFIL WHERE ID_PERFIL = 4;

--DQL/DRS:--
/*Select utilizando classifica��o de dados*/
SELECT * FROM T_VEC_CADASTRO ORDER BY NM_USUARIO ASC;
/*Select utilizando uma fun��o n�merica simples*/
SELECT MIN(NR_RUA) FROM T_VEC_ENDERECO_USUARIO;
SELECT * FROM T_VEC_ENDERECO_USUARIO;
/*Select utilizando uma fun��o de grupo*/
SELECT NM_BAIRRO FROM T_VEC_ENDERECO_USUARIO GROUP BY NM_BAIRRO;
/*Select utilizando sub consulta*/
SELECT NM_USUARIO FROM T_VEC_CADASTRO WHERE ID_USUARIO IN (
    SELECT ID_USUARIO FROM T_VEC_CADASTRO WHERE NR_DDI <12);
/*Select utilizando Inner Join*/
SELECT T_VEC_ENDERECO_USUARIO.NM_RUA, T_VEC_CADASTRO.NM_USUARIO FROM T_VEC_ENDERECO_USUARIO
INNER JOIN T_VEC_CADASTRO ON T_VEC_CADASTRO.ID_USUARIO = T_VEC_ENDERECO_USUARIO.ID_ENDERECO_USUARIO;
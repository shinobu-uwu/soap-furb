CREATE DATABASE prova_3_matheus_reinert;
USE prova_3_matheus_reinert;
-- 1. Criação das tabelas com as respectivas colunas e restrições
CREATE TABLE categoria
(
    cd_categoria INTEGER PRIMARY KEY AUTO_INCREMENT,
    ds_categoria VARCHAR(50) NOT NULL
);
CREATE TABLE hotel
(
    cd_hotel   INTEGER PRIMARY KEY AUTO_INCREMENT,
    nm_hotel   VARCHAR(50) NOT NULL,
    ds_website VARCHAR(50) NOT NULL,
    ds_email   VARCHAR(50) NOT NULL
);
CREATE TABLE quarto
(
    nr_quarto    INTEGER AUTO_INCREMENT,
    cd_hotel     INTEGER     NOT NULL,
    cd_categoria INTEGER,
    ds_quarto    VARCHAR(50) NOT NULL,
    nr_ocupantes INTEGER     NOT NULL,
    PRIMARY KEY (nr_quarto, cd_hotel),
    FOREIGN KEY (cd_hotel) REFERENCES hotel (cd_hotel),
    FOREIGN KEY (cd_categoria) REFERENCES categoria (cd_categoria)
);
CREATE TABLE funcionario
(
    cd_funcionario INTEGER PRIMARY KEY AUTO_INCREMENT,
    cd_hotel       INTEGER,
    nm_funcionario VARCHAR(50) NOT NULL,
    ds_email       VARCHAR(50),
    FOREIGN KEY (cd_hotel) REFERENCES hotel (cd_hotel)
);

-- 2. Construa um conjunto de sentenças SQL para:
-- a) Alterar a coluna “DS_EMAIL” da tabela “FUNCIONARIO” para aceitar valores até 100 posições;
ALTER TABLE funcionario
    MODIFY ds_email VARCHAR(100);

-- b) Criar uma restrição para a coluna “DS_CATEGORIA” da tabela “CATEGORIA” para que não permita a inclusão de valores repetidos;
ALTER TABLE categoria
    ADD UNIQUE (ds_categoria);

-- 3. Inclusão de registros para, no mínimo: 03 (três) hotéis, 10 (dez) quartos em 03 (três) diferentes
-- categorias de quarto. Ainda, inclusão de 05 (cinco) funcionários ligados em, no mínimo, 02 (dois) diferentes hotéis;
INSERT INTO categoria (ds_categoria)
VALUES ('Suíte');
INSERT INTO categoria (ds_categoria)
VALUES ('Presidencial');
INSERT INTO categoria (ds_categoria)
VALUES ('Com banheira');

INSERT INTO hotel (nm_hotel, ds_website, ds_email)
VALUES ('Marambaia', 'https://marambaia.com.br', 'hall@marambaia.com.br');
INSERT INTO hotel (nm_hotel, ds_website, ds_email)
VALUES ('Grand Hotel', 'https://grandhotel.com.br', 'recepcao@grandhotel.com.br');
INSERT INTO hotel (nm_hotel, ds_website, ds_email)
VALUES ('Hotel glória', 'https://gloria.com.br', 'recepcao@gloria.com.br');

INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (1, 2, 'Muito bom', 4);
INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (1, 1, 'Paredes a prova de som', 4);
INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (1, 3, 'É... ruim', 4);
INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (1, 1, '9.5/10', 4);
INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (2, 3, 'Sei lá', 4);
INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (2, 2, 'Acabou', 4);
INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (2, 3, 'as ideias professor', 4);
INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (3, 2, 'Mais ou menos', 4);
INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (3, 1, 'Podia ser melhor', 4);
INSERT INTO quarto (cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (3, 2, 'Não sei', 4);

INSERT INTO funcionario (cd_hotel, nm_funcionario, ds_email)
VALUES (1, 'Matheus', 'mreiner@furb.br');
INSERT INTO funcionario (cd_hotel, nm_funcionario, ds_email)
VALUES (1, 'Fulaninho de tal', 'fulano@furb.br');
INSERT INTO funcionario (cd_hotel, nm_funcionario, ds_email)
VALUES (3, 'José', 'jose@furb.br');
INSERT INTO funcionario (cd_hotel, nm_funcionario, ds_email)
VALUES (2, 'Alexandre', 'alexandre@furb.br');
INSERT INTO funcionario (cd_hotel, nm_funcionario, ds_email)
VALUES (2, 'Matheus 2', 'matheus@furb.br');

-- 4. Exibir o nome de todos os funcionários com o respectivo hotel em que está lotado, ordenados pelo nome do hotel,
-- seguido pelo nome do funcionário (ordenação crescente);
SELECT f.nm_funcionario, h.nm_hotel
FROM funcionario f
         JOIN hotel h on f.cd_hotel = h.cd_hotel
ORDER BY h.nm_hotel, f.nm_funcionario;

-- 5. Listar os nomes dos hotéis e a descrição da(s) categoria(s) de quarto que oferece o mesmo oferece. 
-- O resultado desta questão poderá apresentar linhas repetidas (nome do hotel) caso apresente mais de uma categoria associada;
SELECT h.nm_hotel, GROUP_CONCAT(c.ds_categoria)
FROM hotel h
         JOIN quarto q on h.cd_hotel = q.cd_hotel
         JOIN categoria c on q.cd_categoria = c.cd_categoria
GROUP BY h.nm_hotel;

-- 6. Recuperar as categorias (descrição) com a respectiva quantidade de quartos associados a cada categoria listada;
SELECT c.ds_categoria, COUNT(*)
FROM categoria c
         JOIN quarto q on c.cd_categoria = q.cd_categoria
GROUP BY c.ds_categoria;

-- 7. Exibir o nome de cada hotel com a respectiva quantidade de quartos associada a cada hotel listado, 
-- ordenando pelo maior número de quartos, seguido pelo nome do hotel (de A -> Z);
SELECT h.nm_hotel, COUNT(*)
FROM hotel h
         JOIN quarto q on h.cd_hotel = q.cd_hotel
GROUP BY h.nm_hotel
ORDER BY COUNT(*) DESC, h.nm_hotel;

CREATE TABLE IF NOT EXISTS Marca
(
    cd_marca INTEGER,
    ds_marca VARCHAR(30) NOT NULL
);

ALTER TABLE Marca ADD PRIMARY KEY (cd_marca);

CREATE TABLE IF NOT EXISTS Modelo
(
    cd_modelo INTEGER,
    cd_marca  INTEGER,
    ds_modelo VARCHAR(50) NOT NULL
);

ALTER TABLE Modelo ADD PRIMARY KEY (cd_modelo);
ALTER TABLE Modelo ADD FOREIGN KEY (cd_marca) REFERENCES Marca (cd_marca);

CREATE TABLE IF NOT EXISTS Localidade
(
    cd_localidade INTEGER,
    nm_localidade VARCHAR(50)
);

ALTER TABLE Localidade ADD PRIMARY KEY (cd_localidade);

CREATE TABLE IF NOT EXISTS Proprietario
(
    cd_proprietario INTEGER,
    cd_localidade   INTEGER,
    nm_proprietario VARCHAR(50),
    ds_logradouro   VARCHAR(50),
    ds_complemento  VARCHAR(50),
    ds_bairro       VARCHAR(50),
    nr_telefone     VARCHAR(15),
    ds_email        VARCHAR(50),
    sg_uf           VARCHAR(2)
);

ALTER TABLE Proprietario ADD PRIMARY KEY (cd_proprietario);
ALTER TABLE Proprietario ADD FOREIGN KEY (cd_localidade) REFERENCES Localidade (cd_localidade);

CREATE TABLE IF NOT EXISTS Combustivel
(
    cd_combustivel INTEGER,
    ds_combustivel VARCHAR(50)
);

ALTER TABLE Combustivel ADD PRIMARY KEY (cd_combustivel);

CREATE TABLE IF NOT EXISTS Veiculo
(
    nr_placa        CHAR(7),
    cd_proprietario INTEGER,
    cd_modelo       INTEGER,
    nr_ano_fab      INTEGER,
    nr_ano_mod      INTEGER,
    qt_km_rodado    INTEGER,
    qt_portas       INTEGER,
    ds_observacao   VARCHAR(100)
);
ALTER TABLE Veiculo ADD FOREIGN KEY (cd_proprietario) REFERENCES Proprietario (cd_proprietario);
ALTER TABLE Veiculo ADD FOREIGN KEY (cd_modelo) REFERENCES Modelo (cd_modelo);

ALTER TABLE Veiculo ADD PRIMARY KEY (nr_placa);

CREATE TABLE IF NOT EXISTS Veiculo_Combustivel
(
    nr_placa       CHAR(7),
    cd_combustivel INTEGER
);

ALTER TABLE Veiculo_Combustivel ADD PRIMARY KEY (nr_placa, cd_combustivel);
ALTER TABLE Veiculo_Combustivel ADD FOREIGN KEY (nr_placa) REFERENCES Veiculo (nr_placa);
ALTER TABLE Veiculo_Combustivel ADD FOREIGN KEY (cd_combustivel) REFERENCES Combustivel (cd_combustivel);

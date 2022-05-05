CREATE TABLE IF NOT EXISTS Marca
(
    cd_marca INTEGER PRIMARY KEY,
    ds_marca VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Modelo
(
    cd_modelo INTEGER PRIMARY KEY,
    cd_marca  INTEGER,
    FOREIGN KEY (cd_marca) REFERENCES Marca (cd_marca),
    ds_modelo VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Localidade
(
    cd_localidade INTEGER PRIMARY KEY,
    nm_localidade VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Proprietario
(
    cd_proprietario INTEGER PRIMARY KEY,
    cd_localidade   INTEGER,
    FOREIGN KEY (cd_localidade) REFERENCES Localidade (cd_localidade),
    nm_proprietario VARCHAR(50),
    ds_logradouro   VARCHAR(50),
    ds_complemento  VARCHAR(50),
    ds_bairro       VARCHAR(50),
    nr_telefone     VARCHAR(15),
    ds_email        VARCHAR(50),
    sg_uf           VARCHAR(2)
);

CREATE TABLE IF NOT EXISTS Combustivel
(
    cd_combustivel INTEGER PRIMARY KEY,
    ds_combustivel VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Veiculo
(
    nr_placa        CHAR(7) PRIMARY KEY,
    cd_proprietario INTEGER,
    cd_modelo       INTEGER,
    nr_ano_fab      INTEGER,
    nr_ano_mod      INTEGER,
    qt_km_rodado    INTEGER,
    qt_portas       INTEGER,
    ds_observacao   VARCHAR(100),
    FOREIGN KEY (cd_proprietario) REFERENCES Proprietario (cd_proprietario),
    FOREIGN KEY (cd_modelo) REFERENCES Modelo (cd_modelo)
);

CREATE TABLE IF NOT EXISTS Veiculo_Combustivel
(
    nr_placa       CHAR(7),
    cd_combustivel INTEGER,
    PRIMARY KEY (nr_placa, cd_combustivel),
    FOREIGN KEY (nr_placa) REFERENCES Veiculo (nr_placa),
    FOREIGN KEY (cd_combustivel) REFERENCES Combustivel (cd_combustivel)
);

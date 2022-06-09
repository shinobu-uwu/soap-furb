-- Listar os nomes dos proprietários com a respectiva localidade (nome) em que residem;
SELECT P.nm_proprietario, L.nm_localidade
FROM Proprietario AS P
         JOIN Localidade L on P.cd_localidade = L.cd_localidade;

-- Listar todos os modelos da marca "FIAT" ordenados pelo descrição do modelo;
SELECT ds_modelo
FROM Modelo
         LEFT JOIN Marca on Modelo.cd_marca = Modelo.cd_marca
WHERE Marca.ds_marca = 'FIAT'
ORDER BY Modelo.ds_modelo;

-- Listar todas as marcas (descrição) disponíveis com o respetivo modelo (descrição), ordenando em ordem crescente de marca, seguida de modelo;
SELECT Marca.ds_marca, Modelo.ds_modelo
FROM Marca
         JOIN Modelo on Marca.cd_marca = Modelo.cd_marca
ORDER BY Marca.ds_marca, Modelo.ds_modelo;

-- Listar a placa, o ano modelo e a descrição da cor de todos os veículos cadastrados, ordenando pelo ano modelo, seguido da descrição da cor;
SELECT Veiculo.nr_placa, Veiculo.nr_ano_mod, Cor.ds_cor
FROM Veiculo
         JOIN Cor on Cor.cd_cor = Veiculo.cd_cor
ORDER BY Veiculo.nr_ano_mod, Cor.ds_cor;

-- Listar os seguintes dados do veículo: placa, nome do proprietário e nome da localidade que o mesmo reside, desde que sua UF seja "SC";
SELECT Veiculo.nr_placa, Proprietario.nm_proprietario, Localidade.nm_localidade
FROM Veiculo
         JOIN Proprietario ON Veiculo.cd_proprietario = Proprietario.cd_proprietario
         JOIN Localidade ON Proprietario.cd_localidade = Localidade.cd_localidade
WHERE Proprietario.sg_uf = 'SC';

-- Listar os dados dos veículos com placa, descrição da marca, descrição do modelo, ano do modelo e a(s) respectiva(s) descrição(ões) do(s) combustível(is) que é movido;
SELECT Veiculo.nr_placa,
       GROUP_CONCAT(DISTINCT Marca.ds_marca),
       Modelo.ds_modelo,
       Veiculo.nr_ano_mod,
       GROUP_CONCAT(Combustivel.ds_combustivel)
FROM Veiculo
         LEFT JOIN Modelo ON Veiculo.cd_modelo = Modelo.cd_modelo
         LEFT JOIN Marca ON Modelo.cd_marca = Marca.cd_marca
         LEFT JOIN Veiculo_Combustivel ON Veiculo.nr_placa = Veiculo_Combustivel.nr_placa
         LEFT JOIN Combustivel ON Veiculo_Combustivel.cd_combustivel = Combustivel.cd_combustivel
GROUP BY Veiculo.nr_placa;

-- Listar os veículos (com placa, descrição da marca, descrição do modelo) que possuem como acessório "Direção hidráulica";
SELECT Veiculo.nr_placa, Marca.ds_marca, Modelo.ds_modelo
FROM Veiculo
         JOIN veiculo_acessorio ON Veiculo.nr_placa = veiculo_acessorio.nr_placa
         LEFT JOIN Acessorio on veiculo_acessorio.cd_acessorio = Acessorio.cd_acessorio
         LEFT JOIN Modelo ON Veiculo.cd_modelo = Modelo.cd_modelo
         LEFT JOIN Marca ON Modelo.cd_marca = Marca.cd_marca
WHERE Acessorio.ds_acessorio = 'Direção hidráulica';

-- Listar dados completos dos veículos: placa, descrição da marca, descrição do modelo, descrição da cor, ano modelo, ano fabricação, quantidade de km rodado, quantidade de portas, descrição dos acessórios e descrição do combustível que o move.
SELECT Veiculo.nr_placa,
       Marca.ds_marca,
       Modelo.ds_modelo,
       Cor.ds_cor,
       Veiculo.nr_ano_mod,
       Veiculo.nr_ano_fab,
       Veiculo.qt_km_rodado,
       Veiculo.qt_portas,
       Acessorio.ds_acessorio,
       Combustivel.ds_combustivel
FROM Veiculo
         LEFT JOIN Modelo ON Veiculo.cd_modelo = Modelo.cd_modelo
         LEFT JOIN Marca ON Modelo.cd_marca = Marca.cd_marca
         LEFT JOIN Cor on Veiculo.cd_cor = Cor.cd_cor
         LEFT JOIN veiculo_acessorio ON Veiculo.nr_placa = veiculo_acessorio.nr_placa
         LEFT JOIN Acessorio ON veiculo_acessorio.cd_acessorio = Acessorio.cd_acessorio
         LEFT JOIN Veiculo_Combustivel ON Veiculo.nr_placa = Veiculo_Combustivel.nr_placa
         LEFT JOIN Combustivel ON Veiculo_Combustivel.cd_combustivel = Combustivel.cd_combustivel;
-- Mostrar o nome de todos os modelos disponíveis
SELECT ds_modelo
FROM Modelo;

-- Mostrar o nome de todas as marcas disponíveis
SELECT ds_marca
FROM Marca;

-- Listar os proprietários que moram em SC ou PR
SELECT nm_proprietario
FROM Proprietario
WHERE sg_uf = 'SC'
   or sg_uf = 'PR';

-- Mostrar os proprietários que não possuem email mas possuem telefone cadastrado
SELECT nm_proprietario
FROM Proprietario
WHERE ds_email IS NULL
  and nr_telefone IS NOT NULL;

-- Mostrar quais proprietários possuem 'Silva' no nome
SELECT nm_proprietario
FROM Proprietario
WHERE nm_proprietario LIKE '%Silva%';

-- Listar as informações do(s) veículo(s) que apresenta(m) ano de fabricação diferente do ano modelo;
SELECT *
FROM Veiculo
WHERE nr_ano_fab != nr_ano_mod;

-- Listar o número da placa, o ano do modelo, a quantidade de km rodados e a quantidade de portas dos veículos fabricados após ano de 2000, inclusive ano 2000;
SELECT nr_placa, nr_ano_mod, qt_km_rodado, qt_portas
FROM Veiculo
where nr_ano_fab >= 2000;

-- Listar o número da placa do(s) veículo(s) que não possui(em) uma informação adicional cadastrada (coluna observação);
SELECT nr_placa
FROM Veiculo
WHERE ds_observacao IS NULL;

-- Listar os dados do(s) veículo(s) que apresenta(m) quatro portas ou mais, ordenados pelo ano do modelo descendente;
SELECT nr_placa, nr_ano_mod, qt_km_rodado
FROM Veiculo
WHERE qt_portas >= 4
ORDER BY nr_ano_mod DESC;

-- Listar todos os acessórios ordenados pela descrição;
SELECT *
FROM Acessorio
ORDER BY ds_acessorio;

-- Listar o número da placa do veículo, ano de fabricação e modelo do(s) veículos fabricados a partir de 2010,
-- com km rodada menor de 10000, com 4 portas ou mais e que não possui(am) observações;
SELECT nr_placa, nr_ano_fab, nr_ano_mod
FROM Veiculo
WHERE nr_ano_fab >= 2010
  AND qt_km_rodado < 10000
  AND qt_portas >= 4
  AND ds_observacao IS NULL;

-- Listar o nome do(s) proprietário(s) que residem em um bairro em que o nome tenha a palavra "Novo" ou "Nova" e que a UF seja de "SC";
SELECT nm_proprietario
FROM Proprietario
WHERE (ds_bairro LIKE '%Novo%' or ds_bairro LIKE '%Nova%')
  and sg_uf = 'SC';

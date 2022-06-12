-- a)     Listar a média de km rodados entre os veículos cadastrados;
SELECT AVG(qt_km_rodado)
FROM Veiculo;

-- b)     Listar o ano de fabricação do(s) veículo(s) mais novo e ano de fabricação do(s) veículo(s) mais antigo cadastrado na base de dados;
SELECT MAX(nr_ano_fab), MIN(nr_ano_fab)
FROM Veiculo;

-- c)     Listar o ano modelo do veículo com a respectiva quantidade de veículos correspondente ao ano listado;
SELECT nr_ano_mod, COUNT(nr_placa)
FROM Veiculo
GROUP BY nr_ano_mod;

-- d)     Listar a descrição do combustível com a respectiva quantidade de veículos que apresentam o combustível, ordenando pelo maior número de veículos descendente;
SELECT C.ds_combustivel AS Combustível, COUNT(V.nr_placa) AS Veículos
FROM Combustivel C
         JOIN Veiculo_Combustivel VC ON C.cd_combustivel = VC.cd_combustivel
         JOIN Veiculo V ON V.nr_placa = VC.nr_placa
GROUP BY C.ds_combustivel
ORDER BY Veículos DESC;

-- e)     Listar a descrição do modelo com a respectiva quantidade de veículo(s) correspondente ao modelo listado;
SELECT ds_modelo as Modelo, COUNT(V.nr_placa) AS Veículos
FROM Modelo M
         JOIN Veiculo V ON M.cd_modelo = V.cd_modelo
GROUP BY M.ds_modelo;

-- f)      Listar todas as marcas (descrição) disponíveis com o respetivo modelo (descrição), bem como a quantidade de veículo associada a marca e modelo listado;
SELECT ds_marca AS Marca, ds_modelo, COUNT(V.nr_placa) AS Modelo
FROM Veiculo V
         JOIN Modelo MO ON MO.cd_modelo = V.cd_modelo
         JOIN Marca MA ON MA.cd_marca = MO.cd_marca
GROUP BY ds_marca, ds_modelo;

-- g)     Listar a descrição do acessório com a respectiva quantidade de veículo que possuem o referido acessório listado.
SELECT ds_acessorio AS Acessório, COUNT(V.nr_placa) AS Veículos
FROM Veiculo V
         JOIN veiculo_acessorio VA ON V.nr_placa = VA.nr_placa
         JOIN Acessorio A ON A.cd_acessorio = VA.cd_acessorio
GROUP BY ds_acessorio;

-- h)     Listar o nome da localidade com a respectiva quantidade de proprietários vinculado(s) a cada localidade, restringindo ao estado de "SC";
SELECT nm_localidade AS Localidade, COUNT(P.cd_proprietario) AS Veículos
FROM Proprietario P
         JOIN Localidade L ON L.cd_localidade = P.cd_localidade
WHERE P.sg_uf = 'SC'
GROUP BY nm_localidade;

-- i)      Listar dados dos veículos: placa, descrição da marca, descrição do modelo e quantidade de acessórios associado a cada veículo listado, sendo que os veículos devem apresentar dois ou mais acessórios.
SELECT V.nr_placa AS Placa, MA.ds_marca AS Marca, MO.ds_modelo AS Modelo, COUNT(A.cd_acessorio) AS Acessórios
FROM Veiculo V
         JOIN Modelo MO ON MO.cd_modelo = V.cd_modelo
         JOIN Marca MA ON MA.cd_marca = MO.cd_marca
         JOIN veiculo_acessorio VA ON V.nr_placa = VA.nr_placa
         JOIN Acessorio A ON A.cd_acessorio = VA.cd_acessorio
GROUP BY V.nr_placa
HAVING Acessórios >= 2;


-- j)     Listar dados dos veículos: placa, descrição da marca, descrição do modelo e quantidade de combustíveis associados a cada veículo listado.
SELECT V.nr_placa AS Placa, MA.ds_marca AS Marca, MO.ds_modelo AS Modelo, COUNT(C.cd_combustivel) AS Combustíveis
FROM Veiculo V
         JOIN Modelo MO ON MO.cd_modelo = V.cd_modelo
         JOIN Marca MA ON MA.cd_marca = MO.cd_marca
         JOIN Veiculo_Combustivel VC ON V.nr_placa = VC.nr_placa
         JOIN Combustivel C ON C.cd_combustivel = VC.cd_combustivel
GROUP BY V.nr_placa, MA.ds_marca, MO.ds_modelo;

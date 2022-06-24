-- a)     Listar a descrição da marca e a descrição do modelo de todos os veículos com data de 
--        fabricação acima da média de fabricação (ano) entre os veículos cadastrados;
SELECT MA.ds_marca, MO.ds_modelo
FROM Marca MA
         JOIN Modelo MO ON MA.cd_marca = MO.cd_marca
         JOIN Veiculo V ON MO.cd_modelo = V.cd_modelo
WHERE V.nr_ano_fab > (SELECT AVG(nr_ano_fab) FROM Veiculo);

-- b)     Listar a placa e a descrição do modelo do(s) veículo(s) mais novo(s) cadastrado(s) - considerar o ano modelo;
SELECT V.nr_placa, M.ds_modelo
FROM Veiculo V
         JOIN Modelo M on M.cd_modelo = V.cd_modelo
WHERE nr_ano_mod = (SELECT MAX(nr_ano_mod) FROM Veiculo);

-- c)     Listar dados dos veículos: placa, descrição da marca, descrição do modelo que são movidos por mais de um combustível;
SELECT V.nr_placa, MA.ds_marca, MO.ds_modelo
FROM Veiculo V
         JOIN Modelo MO ON MO.cd_modelo = V.cd_modelo
         JOIN Marca MA ON MA.cd_marca = MO.cd_marca
WHERE V.nr_placa in (SELECT V.nr_placa
                     FROM Veiculo V
                              JOIN Veiculo_Combustivel VC ON V.nr_placa = VC.nr_placa
                     GROUP BY V.nr_placa
                     HAVING COUNT(VC.nr_placa) >= 2);

-- d)     Listar a descrição da marca que possui o maior número de veículos cadastrado;

-- e)     Listar a descrição do(s) modelo(s) que possui(em) o maior número de veículos cadastrado;

-- f)     Listar a descrição do acessório mais popular (que mais é encontrado) entre os veículos cadastrados 
--        fabricados entre os anos de 2015 e 2018;
SELECT ds_acessorio
FROM (SELECT C.cd_acessorio, MAX(C.count_veiculos)
      FROM (SELECT A.cd_acessorio, COUNT(V.nr_placa) count_veiculos
            FROM Acessorio A
                     JOIN veiculo_acessorio va on A.cd_acessorio = va.cd_acessorio
                     JOIN Veiculo V on V.nr_placa = va.nr_placa
            WHERE V.nr_ano_fab >= 2015
              AND V.nr_ano_fab <= 2018
            GROUP BY A.cd_acessorio) C) M,
     Acessorio A
WHERE A.cd_acessorio = M.cd_acessorio;

-- g)      Listar qual(is) acessórios não estão associados a veículos fabricados anterior ao ano de 2015;
SELECT ds_acessorio
FROM Acessorio
WHERE Acessorio.cd_acessorio NOT IN (SELECT DISTINCT A.cd_acessorio
                                     FROM Acessorio A
                                              JOIN veiculo_acessorio va on A.cd_acessorio = va.cd_acessorio
                                              JOIN Veiculo V on va.nr_placa = V.nr_placa
                                     WHERE V.nr_ano_fab < 2015);
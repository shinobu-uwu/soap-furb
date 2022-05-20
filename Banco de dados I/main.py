import random

acessorios = ['Farol de milha', 'Banco de couro', 'Cinzeiro', 'Rádio', 'Suporte de celular', 'Porta-copo', 'Pingente',
              'Espelho para pontos cegos', 'Gel de limpeza', 'Aspirador de pó portátil']
localidades = ['Zona sul', 'Zona norte', 'Zona lest', 'Zona oeste', 'Centro']
cores = ['Amarelo', 'Prata', 'Preto', 'Cinza', 'Branco', 'Vermelho', 'Azul', 'Verde', 'Marrom']
marcas = ['Abarth', 'Audi', 'Bentley', 'BMW', 'Cadillac', 'Chevrolet', 'Citroen', 'Ferrari', 'Fiat', 'Ford', 'Honda']
modelos = {
    'Abarth': ['124 Spider', '595'],
    'Audi': ['A1', 'A3', 'e-tron'],
    'Bentley': ['Bentayga', 'Continental GT', 'Flying Spur'],
    'BMW': ['X6', 'X1', 'Serie 1'],
    'Cadillac': ['ATS', 'CT6', 'CTS'],
    'Chevrolet': ['Aveo', 'Captiva'],
    'Citroen': ['Berlingo', 'C-Elysée', 'C-Zero'],
    'Ferrari': ['F8 Tributo', 'SF90 Stradale', '812 Superfast'],
    'Fiat': ['500X', '500', '500L'],
    'Ford': ['Fiesta', 'Mustang', 'Bronco'],
    'Honda': ['Jazz', 'Civic', 'CR-V']
}
combustiveis = ['Álcool', 'Gasolina', 'Diesel']
anos = [2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020]
quantidades_mil = [10_000, 20_000, 30_000, 40_000, 50_000, 60_000, 70_000]
quantidade_portas = [4, 6, 8]
observacoes = ['Muito rápido', 'Para Rally', 'Perfeito para a família']
placas = ['MXU2656', 'NAO7547', 'NBI5403', 'JHP2228', 'IND4426', 'MTZ2532', 'HRI1923', 'MZO3602', 'MVG1346',
          'HZC3547']
provedores = ['gmail.com', 'outlook.com', 'bol.com.br', 'yahoo.com']
nomes = ['Jacinto Pinto', 'Paulo Brificado', 'Vanessa Souza', 'Lurdes dos Santos', 'Pedro Rocha', 'Amanda Nunes',
         'Lilian Reinert', 'Harry Potter', 'Vernon Dursley', 'Geralt de Rivia']
ruas = ['Rua 15 de novembro', 'Rua 7 de setembro', 'Rua Coronel Vidal Ramos', 'Rua Paraguai', 'Rua Uruguai',
        'Rua Venezuela', 'Rua Chile', 'Rua dos Alfeneiros', 'Rua Equador', 'Rua Colômbia']
bairros = ['Centro', 'Centro', 'Jardim Blumenau', 'Ponta Aguda', 'Ponta Aguda',
           'Ponta Aguda', 'Ponta Aguda', 'Ponta Aguda', 'Ponta Aguda', 'Ponta Aguda']
complementos = ['', '', 'ap 202', 'ap 1001', '', '']
telefones = ['(68) 2277-6616', '(48) 2284-7544', '(82) 2434-2262', '(92) 3856-4636', '(86) 2727-3882', '(81) 2716-3178',
             '(49) 2492-6426', '(94) 2144-8274', '(11) 3675-6825', '(27) 3426-7745']

insert = ""
for cor in cores:
    insert += f"INSERT INTO Cor (ds_cor) VALUES ('{cor}');\n"
for combustivel in combustiveis:
    insert += f"INSERT INTO Combustivel (ds_combustivel) VALUES ('{combustivel}');\n"
for i, marca in enumerate(marcas, 1):
    insert += f"INSERT INTO Marca (ds_marca) VALUES ('{marca}');\n"
    for modelo in modelos[marca]:
        insert += f"INSERT INTO Modelo (cd_marca, ds_modelo) VALUES ({i}, '{modelo}');\n"
for localidade in localidades:
    insert += f"INSERT INTO Localidade (nm_localidade) VALUES ('{localidade}');\n"
for acessorio in acessorios:
    insert += f"INSERT INTO Acessorio (ds_acessorio) VALUES ('{acessorio}');\n"

for i, placa in enumerate(placas, 1):
    ano_fab = random.choice(anos)
    ano_mod = random.choice(anos)
    while ano_fab < ano_mod:
        ano_mod = random.choice(anos)
    nome = nomes[i - 1].lower().replace(' ', '.') + random.choice(provedores)

    insert += f"INSERT INTO Proprietario (cd_localidade, nm_proprietario, ds_logradouro, ds_complemento, ds_bairro, nr_telefone, ds_email, sg_uf) VALUES ({i}, '{nomes[i - 1]}', '{ruas[i - 1]}', '{random.choice(complementos)}', '{bairros[i - 1]}', '{telefones[i - 1]}', '{nome}', 'SC');\n"
    insert += f"INSERT INTO Veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) VALUES ('{placa}', {random.randint(0, len(cores))}, {i}, {i}, {ano_fab}, {ano_mod}, {random.choice(quantidades_mil)}, {random.choice(quantidade_portas)}, '{random.choice(observacoes)}');\n"

    for j in range(random.randint(1, len(combustiveis))):
        insert += f"INSERT INTO Veiculo_Combustivel (nr_placa, cd_combustivel) VALUES ('{placa}', {random.randint(1, len(combustiveis))});\n"
    for j in range(random.randint(0, len(acessorios))):
        insert += f"INSERT INTO veiculo_acessorio (nr_placa, cd_acessorio) VALUES ('{placa}', {random.randint(1, len(acessorios))});\n"

print(insert)

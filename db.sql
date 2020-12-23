CREATE TABLE tipos (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(50),
  PRIMARY KEY(id)
);

CREATE TABLE imoveis (
  id BIGINT AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  detalhes MEDIUMTEXT NOT NULL,
  endereco MEDIUMTEXT NOT NULL,
  video VARCHAR(255),
  preco FLOAT,
  lat FLOAT,
  lon FLOAT,
  mostraposicao TINYINT,
  pisos INT,
  banheiros INT,
  salas INT,
  quartos INT,
  suites INT,
  garagem INT,
  tipo BIGINT,
  PRIMARY KEY(id)
);

CREATE TABLE tags (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(50),
  css VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE fotos (
  id bigint AUTO_INCREMENT,
  imovel_id bigint NOT NULL,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE plantas (
  id bigint AUTO_INCREMENT,
  imovel_id bigint NOT NULL,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE imoveis_tags (
  imovel_id bigint,
  tag_id bigint,
  PRIMARY KEY(imovel_id, tag_id),
  CONSTRAINT fk_imovel FOREIGN KEY (imovel_id) REFERENCES imoveis(id),
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags(id)
);

INSERT INTO tipos VALUES
  (DEFAULT, 'Casa'),
  (DEFAULT, 'Apartamento'),
  (DEFAULT, 'Terreno'),
  (DEFAULT, 'Sítio'),
  (DEFAULT, 'Fazenda');
  
INSERT INTO tags VALUES
  (DEFAULT, 'Churrasqueira', 'background-color : red'),
  (DEFAULT, 'Campo de Futebol', 'background-color : green'),
  (DEFAULT, 'Piscina', 'background-color : blue'),
  (DEFAULT, 'Segurança 24h', 'background-color : gray');

INSERT INTO imoveis VALUES
  (DEFAULT, 'Casa modelo 01', 'Descrição da casa modelo 01', 'Detalhe','Endereço completo proximo a tal local, Av.Brasil', 'QH2-TGUlwu4', 100000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 1),
  (DEFAULT, 'Casa modelo 02', 'Descrição da casa modelo 02', 'Detalhe', 'Endereço completo proximo a tal local, Av.Joao', 'QH2-TGUlwu4', 200000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 2),
  (DEFAULT, 'Casa modelo 03', 'Descrição da casa modelo 03', 'Detalhe', 'Endereço completo proximo a tal local, Av.Rui', 'QH2-TGUlwu4', 180000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 3),
  (DEFAULT, 'Casa modelo 04', 'Descrição da casa modelo 04', 'Detalhe', 'Endereço completo proximo a tal local, Av.Jokei', 'QH2-TGUlwu4', 299000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 1),
  (DEFAULT, 'Casa modelo 05', 'Descrição da casa modelo 05', 'Detalhe', 'Endereço completo proximo a tal local, Av.Keneddy', 'QH2-TGUlwu4', 530000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 2),
  (DEFAULT, 'Casa modelo 06', 'Descrição da casa modelo 06', 'Detalhe', 'Endereço completo proximo a tal local, Av.Joel loreira', 'QH2-TGUlwu4', 182000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 3),
  (DEFAULT, 'Casa modelo 07', 'Descrição da casa modelo 07', 'Detalhe', 'Endereço completo proximo a tal local, Av. 23 de março', 'QH2-TGUlwu4', 99000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 1),
  (DEFAULT, 'Casa modelo 08', 'Descrição da casa modelo 08', 'Detalhe', 'Endereço completo proximo a tal local, Av. Campo sales', 'QH2-TGUlwu4', 435000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 2),
  (DEFAULT, 'Casa modelo 09', 'Descrição da casa modelo 09', 'Detalhe', 'Endereço completo proximo a tal local, Av.Brasil', 'QH2-TGUlwu4', 298000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 3),
  (DEFAULT, 'Casa modelo 10', 'Descrição da casa modelo 10', 'Detalhe', 'Endereço completo proximo a tal local, Av.Brasil', 'QH2-TGUlwu4', 175000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 1),
  (DEFAULT, 'Casa modelo 11', 'Descrição da casa modelo 11', 'Detalhe', 'Endereço completo proximo a tal local, Av.Brasil', 'QH2-TGUlwu4', 123456, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 2),
  (DEFAULT, 'Casa modelo 12', 'Descrição da casa modelo 12', 'Detalhe', 'Endereço completo proximo a tal local, Av.Brasil', 'QH2-TGUlwu4', 1000000, '-5.0774737','-42.7853417', 0, 1, 2, 2, 1, 2, 1, 3);

INSERT INTO imoveis_tags VALUES
  (1, 1), (1, 2), (1, 3), (1, 4),
  (2, 1), (2, 2), (2, 3), (2, 4),
  (3, 1), (3, 2), (3, 3), (3, 4),
  (4, 1), (4, 2), (4, 3), (4, 4),
  (5, 1), (5, 2), (5, 3), (5, 4),
  (6, 1), (6, 2), (6, 3), (6, 4),
  (7, 1), (7, 2), (7, 3), (7, 4),
  (8, 1), (8, 2), (8, 3), (8, 4),
  (9, 1), (9, 2), (9, 3), (9, 4),
  (10, 1), (10, 2), (10, 3), (10, 4),
  (11, 1), (11, 2), (11, 3), (11, 4),
  (12, 1), (12, 2), (12, 3), (12, 4);

INSERT INTO fotos VALUES
  (DEFAULT, 1, 'casa_01_01.png'), (DEFAULT, 1, 'casa_01_02.png'),
  (DEFAULT, 2, 'casa_02_01.png'), (DEFAULT, 2, 'casa_02_02.png'),
  (DEFAULT, 3, 'casa_03_01.png'), (DEFAULT, 3, 'casa_03_02.png'),
  (DEFAULT, 4, 'casa_04_01.png'), (DEFAULT, 4, 'casa_04_02.png'),
  (DEFAULT, 5, 'casa_05_01.png'), (DEFAULT, 5, 'casa_05_02.png'),
  (DEFAULT, 6, 'casa_06_01.png'), (DEFAULT, 6, 'casa_06_02.png'),
  (DEFAULT, 7, 'casa_07_01.png'), (DEFAULT, 7, 'casa_07_02.png'),
  (DEFAULT, 8, 'casa_08_01.png'), (DEFAULT, 8, 'casa_08_02.png'),
  (DEFAULT, 9, 'casa_09_01.png'), (DEFAULT, 9, 'casa_09_02.png'),
  (DEFAULT, 10, 'casa_10_01.png'), (DEFAULT, 10, 'casa_10_02.png'),
  (DEFAULT, 11, 'casa_11_01.png'), (DEFAULT, 11, 'casa_11_02.png'),
  (DEFAULT, 12, 'casa_12_01.png'), (DEFAULT, 12, 'casa_12_02.png');

INSERT INTO plantas VALUES
  (DEFAULT, 1, 'planta_01_01.png'),
  (DEFAULT, 2, 'planta_02_01.png'),
  (DEFAULT, 3, 'planta_03_01.png'),
  (DEFAULT, 4, 'planta_04_01.png'),
  (DEFAULT, 5, 'planta_05_01.png'),
  (DEFAULT, 6, 'planta_06_01.png'),
  (DEFAULT, 7, 'planta_07_01.png'),
  (DEFAULT, 8, 'planta_08_01.png'),
  (DEFAULT, 9, 'planta_09_01.png'),
  (DEFAULT, 10, 'planta_10_01.png'),
  (DEFAULT, 11, 'planta_11_01.png'),
  (DEFAULT, 12, 'planta_12_01.png');
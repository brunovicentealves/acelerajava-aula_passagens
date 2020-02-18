create database passagens;

show databases;

use passagens;
show tables;
CREATE TABLE localidade (
  id_localidade      int(08)      NOT NULL AUTO_INCREMENT,
  sigla_localidade   varchar(03)  NOT NULL,
  nome_localidade    varchar(100) NOT NULL,
  PRIMARY KEY (id_localidade)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE viajante (
  id_viajante        int(12)      NOT NULL AUTO_INCREMENT,
  nome_viajante      varchar(100) NOT NULL,
  rg_viajante        varchar(20)  NOT NULL,
  cpf_viajante       varchar(11)  NOT NULL,
  telefone_viajante  varchar(12)  NOT NULL,
  email_viajante     varchar(100) NOT NULL,
  PRIMARY KEY (id_viajante)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
show tables;
CREATE TABLE veiculo (
  id_veiculo int(12)      NOT NULL AUTO_INCREMENT,
  nome_veiculo     		varchar(100) NOT NULL,
  placa      				varchar(10) NOT NULL,
  valor_diaria      		double(8,2) NOT NULL,
  capacidade_pessoas   	int(2) NOT NULL,
  PRIMARY KEY (id_veiculo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
show tables;
CREATE TABLE meio_pagamento (
  id_meio_pagamento     int(03)      NOT NULL AUTO_INCREMENT,
  nome_meio_pagamento   varchar(100) NOT NULL,
  tipo_meio_pagamento   varchar(02)  NOT NULL,
  PRIMARY KEY (id_meio_pagamento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
show tables;
CREATE TABLE voo (
  id_voo                int(10)      NOT NULL AUTO_INCREMENT,
  id_localidade_origem  int(08)      NOT NULL,
  id_localidade_destino int(08)      NOT NULL,
  capacidade_aeronave   int(04)      NOT NULL,
  preco                 double(8,2)  NOT NULL,
  qtd_milhas            int(08)      NOT NULL,
  PRIMARY KEY (id_voo),
  KEY FK_ORIGEM (id_localidade_origem),
  KEY FK_DESTINO (id_localidade_destino),
  CONSTRAINT FK_LOCAL_ORIGEM FOREIGN KEY (id_localidade_origem) REFERENCES localidade (id_localidade),
  CONSTRAINT FK_LOCAL_DESTINO FOREIGN KEY (id_localidade_destino) REFERENCES localidade (id_localidade)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
show tables;
CREATE TABLE reserva (
  id_reserva                int(20)      NOT NULL AUTO_INCREMENT,
  id_viajante  				int(08)      NOT NULL,
  id_voo 					int(10)      NOT NULL,
  id_meio_pagamento         int(03)      NOT NULL,
  data_reserva              datetime     NOT NULL,
  localizador               varchar(12)  NOT NULL,
  poltrona                  varchar(04)  NOT NULL,
  checkin                   datetime,
  id_veiculo 				int(12),
  ini_reserva_veiculo       datetime,
  fim_reserva_veiculo       datetime,
  PRIMARY KEY (id_reserva),
  KEY FK_VIAJANTE (id_viajante),
  CONSTRAINT FK_VIAJANTE FOREIGN KEY (id_viajante) REFERENCES viajante (id_viajante),
  KEY FK_VOO (id_voo),
  CONSTRAINT FK_VOO FOREIGN KEY (id_voo) REFERENCES voo (id_voo),
  KEY FK_MEIO_PAGAMENTO (id_meio_pagamento),
  CONSTRAINT FK_MEIO_PAGAMENTO FOREIGN KEY (id_meio_pagamento) REFERENCES meio_pagamento (id_meio_pagamento),
  KEY FK_VEICULO (id_veiculo),
  CONSTRAINT FK_VEICULO FOREIGN KEY (id_veiculo) REFERENCES veiculo (id_veiculo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
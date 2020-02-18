USE passagens;

INSERT INTO localidade(sigla_localidade,nome_localidade) VALUES ('POA','Porto Alegre');
INSERT INTO localidade(sigla_localidade,nome_localidade) VALUES ('FLN','Florianópolis');
INSERT INTO localidade(sigla_localidade,nome_localidade) VALUES ('GRU','Guarulhos');
INSERT INTO localidade(sigla_localidade,nome_localidade) VALUES ('CGN','São Paulo');
INSERT INTO localidade(sigla_localidade,nome_localidade) VALUES ('CWB','Curitiba');
INSERT INTO localidade(sigla_localidade,nome_localidade) VALUES ('REC','Recife');
INSERT INTO localidade(sigla_localidade,nome_localidade) VALUES ('BSB','Brasília');
INSERT INTO localidade(sigla_localidade,nome_localidade) VALUES ('FOR','Fortaleza');
select * from localidade;
select * from viajante;

INSERT INTO viajante (nome_viajante,rg_viajante,cpf_viajante,telefone_viajante,email_viajante) values (
	 'bruno vicente alves'
    ,'8112315544'
    ,'1234567890'
    ,'51-912345478'
    ,'bruno.alves@tbsa.com'
);

INSERT INTO viajante (nome_viajante,rg_viajante,cpf_viajante,telefone_viajante,email_viajante) values (
	 'Maria Selestina'
    ,'76554854758'
    ,'56965896859'
    ,'51-696959303'
    ,'maria@hotmail.com'
);


INSERT INTO viajante (nome_viajante,rg_viajante,cpf_viajante,telefone_viajante,email_viajante) values (
	 'Pedro Alburquerque'
    ,'569550968'
    ,'605695064'
    ,'51-91545454'
    ,'pedro@gmail.com'
);

INSERT INTO viajante (nome_viajante,rg_viajante,cpf_viajante,telefone_viajante,email_viajante) values (
	 'Douglas Pinheiro'
    ,'694596945'
    ,'0450450545'
    ,'51-84767676'
    ,'pinheiro@hotmail.com'
);

select * from veiculo;
Insert into veiculo (nome_veiculo,placa,valor_diaria,capacidade_pessoas ) values (
  'Sandero'
 ,'iwb-0567'
 ,80.0
 ,5
);

Insert into veiculo (nome_veiculo,placa,valor_diaria,capacidade_pessoas ) values (
  'Logan'
 ,'iwb-0566'
 ,76.0
 ,5
);

Insert into veiculo (nome_veiculo,placa,valor_diaria,capacidade_pessoas ) values (
  'Duster'
 ,'iwb-0547'
 ,44.0
 ,5
);

INSERT INTO meio_pagamento (nome_meio_pagamento,tipo_meio_pagamento) VALUES ('VISA','CC');
INSERT INTO meio_pagamento (nome_meio_pagamento,tipo_meio_pagamento) VALUES ('Mastercard','CC');
INSERT INTO meio_pagamento (nome_meio_pagamento,tipo_meio_pagamento) VALUES ('AMEX','CC');
INSERT INTO meio_pagamento (nome_meio_pagamento,tipo_meio_pagamento) VALUES ('Milhas','FD');
INSERT INTO meio_pagamento (nome_meio_pagamento,tipo_meio_pagamento) VALUES ('Itaú','DB');
select * from meio_pagamento;
delete from meio_pagamento where id_meio_pagamento <= 5;

INSERT INTO voo (id_localidade_origem ,id_localidade_destino,capacidade_aeronave,preco,qtd_milhas) values (
  (select id_localidade from localidade where sigla_localidade = 'POA'),
  (select id_localidade from localidade where sigla_localidade = 'FLN'),
  120,
  250.0,
  100
);

INSERT INTO voo (id_localidade_origem ,id_localidade_destino,capacidade_aeronave,preco,qtd_milhas) values (
  (select id_localidade from localidade where sigla_localidade = 'POA'),
  (select id_localidade from localidade where sigla_localidade = 'GRU'),
  120,
  350.0,
  250
);

INSERT INTO voo (id_localidade_origem ,id_localidade_destino,capacidade_aeronave,preco,qtd_milhas) values (
  (select id_localidade from localidade where sigla_localidade = 'POA'),
  (select id_localidade from localidade where sigla_localidade = 'CGN'),
  160,
  500.0,
  300
);

INSERT INTO voo (id_localidade_origem ,id_localidade_destino,capacidade_aeronave,preco,qtd_milhas) values (
  (select id_localidade from localidade where sigla_localidade = 'POA'),
  (select id_localidade from localidade where sigla_localidade = 'CWB'),
  90,
  280.0,
  180
);

INSERT INTO voo (id_localidade_origem ,id_localidade_destino,capacidade_aeronave,preco,qtd_milhas) values (
  (select id_localidade from localidade where sigla_localidade = 'FLN'),
  (select id_localidade from localidade where sigla_localidade = 'BSB'),
  180,
  600.0,
  300
);

SELECT * FROM VOO;
SELECT * FROM VIAJANTE;
SELECT * FROM RESERVA;

INSERT INTO reserva (id_viajante, id_voo, id_meio_pagamento, data_reserva, localizador, poltrona, checkin, id_veiculo, ini_reserva_veiculo, fim_reserva_veiculo) VALUES (
   1,
   4,
   6,
   '2019-12-18 13:17:17',
   'A83J57',
   '5C',
   null,
   2,
   '2020-02-01 14:00:00',
   '2020-02-08 08:00:00'
   );
  
INSERT INTO reserva (id_viajante, id_voo, id_meio_pagamento, data_reserva, localizador, poltrona, checkin, id_veiculo, ini_reserva_veiculo, fim_reserva_veiculo) VALUES (
   (select id_viajante from viajante where nome_viajante = 'Pedro Alburquerque'),
   (select id_voo from voo, localidade ori, localidade des where ori.id_localidade = voo.id_localidade_origem and des.id_localidade = voo.id_localidade_destino
   and ori.sigla_localidade = 'POA' and des.sigla_localidade = 'GRU'),
   8,
   '2020-01-01 20:00:00',
   'QU7A088',
   '23B',
   null,
   4,
   null,
   null
);


INSERT INTO reserva (id_viajante, id_voo, id_meio_pagamento, data_reserva, localizador, poltrona, checkin, id_veiculo, ini_reserva_veiculo, fim_reserva_veiculo) VALUES (
   (select id_viajante from viajante where nome_viajante = 'Maria Selestina'),
   (select id_voo from voo, localidade ori, localidade des where ori.id_localidade = voo.id_localidade_origem and des.id_localidade = voo.id_localidade_destino
   and ori.sigla_localidade = 'POA' and des.sigla_localidade = 'CWB'),
   7,
   '2020-11-01 16:00:00',
   'VKH2',
   '33A',
   null,
   2,
   null,
   null
);

select * from reserva;
create schema practica_dff authorization jlenehmz;

create table practica_dff.grupo_empre (
id_grupo varchar (20) not null,
des_grupo varchar (50) not null,
constraint pk_grupo_empre primary key (id_grupo)
);

create table practica_dff.coches (
id_coche varchar(20) not null,
marca varchar(50) not null,
modelo varchar (50) not null,
id_grupo varchar (20) not null,
constraint pk_coches primary key (id_coche),
constraint fk_grupo_empre foreign key (id_grupo)
references practica_dff.grupo_empre (id_grupo)
);

create table practica_dff.color (
id_color varchar (15) not null,
des_color varchar (50) not null,
constraint pk_color primary key (id_color)
);

create table practica_dff.moneda (
cod_moneda varchar (10) not null,
des_moneda varchar (20) not null,
constraint pk_moneda primary key (cod_moneda)
);

create table practica_dff.aseguradora (
id_aseg varchar (20) not null,
des_aseg varchar (50) not null,
constraint pk_aseguradora primary key (id_aseg)
);

create table practica_dff.flota (
id_flota varchar (20) not null,
matricula varchar (10) not null,
kms integer null,
fec_compra date not null,
id_coche varchar (20) not null,
id_color varchar (15) not null,
constraint pk_flota primary key (id_flota),
constraint fk_coche foreign key (id_coche)
references practica_dff.coches (id_coche),
constraint fk_color foreign key (id_color)
references practica_dff.color (id_color)
);

create table practica_dff.poliza (
id_poliza varchar(20) not null,
id_aseg varchar (20) not null,
id_flota varchar (20) not null,
constraint pk_poliza primary key (id_poliza),
constraint fk_aseg foreign key (id_aseg)
references practica_dff.aseguradora (id_aseg),
constraint fk_flota foreign key (id_flota)
references practica_dff.flota (id_flota)
);

create table practica_dff.revisiones (
id_revi varchar(20) not null,
fec_revi date not null,
kms_revi integer not null,
imp_revi integer not null,
id_flota varchar (20) not null,
cod_moneda varchar (10) not null,
constraint pk_revisiones primary key (id_revi),
constraint fk_flota foreign key (id_flota)
references practica_dff.flota (id_flota),
constraint fk_moneda foreign key (cod_moneda)
references practica_dff.moneda (cod_moneda)
);

INSERT INTO practica_dff.grupo_empre VALUES('GRP1','Renault Nissan');
INSERT INTO practica_dff.grupo_empre VALUES('GRP2','BMW Group');
INSERT INTO practica_dff.grupo_empre VALUES('GRP3','FCA');
INSERT INTO practica_dff.grupo_empre VALUES('GRP4','Ford');
INSERT INTO practica_dff.grupo_empre VALUES('GRP5','PSA');
INSERT INTO practica_dff.grupo_empre VALUES('GRP6','Hyundai');

INSERT INTO practica_dff.coches VALUES('C0001','Kia','Sportage','GRP6');
INSERT INTO practica_dff.coches VALUES('C0002','Peugeot','308','GRP5');
INSERT INTO practica_dff.coches VALUES('C0003','Ford','Mondeo','GRP4');
INSERT INTO practica_dff.coches VALUES('C0004','BMW','Serie 2','GRP2');
INSERT INTO practica_dff.coches VALUES('C0005','Hyundai','Tucson XRT','GRP6');
INSERT INTO practica_dff.coches VALUES('C0006','Ford','Fiesta','GRP4');
INSERT INTO practica_dff.coches VALUES('C0007','Alfa Romero','Giulietta','GRP3');
INSERT INTO practica_dff.coches VALUES('C0008','Renault','Clio','GRP1');
INSERT INTO practica_dff.coches VALUES('C0009','BMW','Serie 2','GRP2');
INSERT INTO practica_dff.coches VALUES('C0010','Nissan','Qashqai','GRP1');
INSERT INTO practica_dff.coches VALUES('C0011','Renault','Kadjar','GRP1');
INSERT INTO practica_dff.coches VALUES('C0012','Fiat','Pulse','GRP3');
INSERT INTO practica_dff.coches VALUES('C0013','Mini','Cooper','GRP2');
INSERT INTO practica_dff.coches VALUES('C0014','Lancia','Thema','GRP3');
INSERT INTO practica_dff.coches VALUES('C0015','Peugeot','2008','GRP5');
INSERT INTO practica_dff.coches VALUES('C0016','Opel','Corsa','GRP5');

INSERT INTO practica_dff.color VALUES('C410','blanco');
INSERT INTO practica_dff.color VALUES('C480','negro');
INSERT INTO practica_dff.color VALUES('C484','rojo');
INSERT INTO practica_dff.color VALUES('C421','gris');
INSERT INTO practica_dff.color VALUES('C459','azul oscuro');
INSERT INTO practica_dff.color VALUES('C450','azul claro');
INSERT INTO practica_dff.color VALUES('C455','verde oscuro');
INSERT INTO practica_dff.color VALUES('C452','verde claro');

INSERT INTO practica_dff.moneda VALUES('CNY','Yuan chino');
INSERT INTO practica_dff.moneda VALUES('EUR','Euro');
INSERT INTO practica_dff.moneda VALUES('USD','Dólar');
INSERT INTO practica_dff.moneda VALUES('JPY','Yen japonés');
INSERT INTO practica_dff.moneda VALUES('GBP','Libra esterlina');

INSERT INTO practica_dff.aseguradora VALUES('CS_001','AXA');
INSERT INTO practica_dff.aseguradora VALUES('CS_002','Direct_Seguros');
INSERT INTO practica_dff.aseguradora VALUES('CS_003','Allianz Direct');
INSERT INTO practica_dff.aseguradora VALUES('CS_004','MAPFRE');
INSERT INTO practica_dff.aseguradora VALUES('CS_005','Génesis');
INSERT INTO practica_dff.aseguradora VALUES('CS_006','Verti');
INSERT INTO practica_dff.aseguradora VALUES('CS_007','Reale Seguros');

INSERT INTO practica_dff.flota VALUES('FLO0001','5874HLP','30915','08/10/2020','C0001','C410');
INSERT INTO practica_dff.flota VALUES('FLO0002','3156LPM','26354','03/26/2021','C0002','C480');
INSERT INTO practica_dff.flota VALUES('FLO0003','8851GTR','852','06/30/2022','C0003','C484');
INSERT INTO practica_dff.flota VALUES('FLO0004','2023GTY','59324','05/19/2018','C0004','C421');
INSERT INTO practica_dff.flota VALUES('FLO0005','0321LNN','1246','03/07/2022','C0005','C459');
INSERT INTO practica_dff.flota VALUES('FLO0006','9864NKT','36879','04/13/2020','C0006','C480');
INSERT INTO practica_dff.flota VALUES('FLO0007','0357DTR','84239','11/25/2019','C0007','C455');
INSERT INTO practica_dff.flota VALUES('FLO0008','8953MYT','52784','09/01/2021','C0008','C410');
INSERT INTO practica_dff.flota VALUES('FLO0009','8642TGF','98652','03/18/2018','C0009','C484');
INSERT INTO practica_dff.flota VALUES('FLO0010','7456BTD','30264','04/23/2021','C0010','C410');
INSERT INTO practica_dff.flota VALUES('FLO0011','0210RTS','49623','09/03/2019','C0011','C484');
INSERT INTO practica_dff.flota VALUES('FLO0012','8863NMV','87536','02/21/2018','C0012','C480');
INSERT INTO practica_dff.flota VALUES('FLO0013','8462BNM','9221','04/01/2022','C0013','C421');
INSERT INTO practica_dff.flota VALUES('FLO0014','5624HGT','64320','05/23/2018','C0014','C459');
INSERT INTO practica_dff.flota VALUES('FLO0015','9650LPB','63257','02/15/2019','C0015','C480');
INSERT INTO practica_dff.flota VALUES('FLO0016','0358DWQ','54912','01/25/2020','C0016','C421');

INSERT INTO practica_dff.poliza VALUES('POL0001','CS_001','FLO0001');
INSERT INTO practica_dff.poliza VALUES('POL0002','CS_006','FLO0002');
INSERT INTO practica_dff.poliza VALUES('POL0003','CS_004','FLO0003');
INSERT INTO practica_dff.poliza VALUES('POL0004','CS_002','FLO0004');
INSERT INTO practica_dff.poliza VALUES('POL0005','CS_007','FLO0005');
INSERT INTO practica_dff.poliza VALUES('POL0006','CS_003','FLO0006');
INSERT INTO practica_dff.poliza VALUES('POL0007','CS_006','FLO0007');
INSERT INTO practica_dff.poliza VALUES('POL0008','CS_001','FLO0008');
INSERT INTO practica_dff.poliza VALUES('POL0009','CS_005','FLO0009');
INSERT INTO practica_dff.poliza VALUES('POL0010','CS_007','FLO0010');
INSERT INTO practica_dff.poliza VALUES('POL0011','CS_002','FLO0011');
INSERT INTO practica_dff.poliza VALUES('POL0012','CS_006','FLO0012');
INSERT INTO practica_dff.poliza VALUES('POL0013','CS_005','FLO0013');
INSERT INTO practica_dff.poliza VALUES('POL0014','CS_003','FLO0014');
INSERT INTO practica_dff.poliza VALUES('POL0015','CS_004','FLO0015');
INSERT INTO practica_dff.poliza VALUES('POL0016','CS_001','FLO0016');

INSERT INTO practica_dff.revisiones VALUES('REV0001','11/16/2022','28631','325','FLO0001','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0002','12/12/2022','26354','462','FLO0002','USD');
INSERT INTO practica_dff.revisiones VALUES('REV0003','05/25/2020','29104','532','FLO0004','GBP');
INSERT INTO practica_dff.revisiones VALUES('REV0004','09/13/2022','28651','610','FLO0006','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0005','11/30/2021','68254','653','FLO0007','GBP');
INSERT INTO practica_dff.revisiones VALUES('REV0006','06/22/2022','47632','351','FLO0008','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0007','03/30/2020','54365','326','FLO0009','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0008','10/10/2022','26315','656','FLO0010','USD');
INSERT INTO practica_dff.revisiones VALUES('REV0009','09/29/2021','39651','354','FLO0011','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0010','02/28/2020','44256','635','FLO0012','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0011','05/15/2020','32647','253','FLO0014','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0012','03/04/2021','30264','345','FLO0015','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0013','11/10/2022','50961','325','FLO0016','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0014','02/06/2022','30210','532','FLO0004','GBP');
INSERT INTO practica_dff.revisiones VALUES('REV0015','05/17/2022','40258','635','FLO0012','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0016','06/18/2022','36544','523','FLO0009','EUR');
INSERT INTO practica_dff.revisiones VALUES('REV0017','07/27/2022','22987','262','FLO0014','EUR');

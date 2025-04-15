CREATE DATABASE IF NOT EXISTS transportes;
USE transportes;

CREATE TABLE tipo_servicio (
    id_tipo_servicio INT PRIMARY KEY,
    descripcion VARCHAR(100)
);
-- 1 carga genera
-- 2 refrigerado
-- 3 peligroso
CREATE TABLE titular (
    id_titular int primary key,
    apellido varchar(50),
    nombre varchar(50),
    mail varchar(50),
    telefono varchar(50),
    dni bigint
);


CREATE TABLE conductor (
    id_conductor INT PRIMARY KEY,
    id_titular INT,
    nombre VARCHAR(100),
    dni BIGINT,
    carnet_venc date
    );
ALTER TABLE conductor
ADD FOREIGN KEY (id_titular) REFERENCES titular(id_titular);


CREATE TABLE vehiculo (
    id_vehiculo INT PRIMARY KEY,
    id_titular INT,
    id_conductor INT,
    patente VARCHAR(20),
    año INT,
    capacidad INT,
    tipo_transporte VARCHAR(50),
    km INT,
    seguro VARCHAR(100)
    );
alter table vehiculo
add FOREIGN KEY (id_titular) REFERENCES titular(id_titular),
add FOREIGN KEY (id_conductor) REFERENCES conductor(id_conductor);


CREATE TABLE servicios (
    id_servicio INT PRIMARY KEY,
    id_vehiculo INT,
    id_tipo_servicio int,
    cap_carga INT,
    valor_recorrido DECIMAL(10,2)
    );
alter table servicios
add FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo),
add FOREIGN KEY (id_tipo_servicio) REFERENCES tipo_servicio(id_tipo_servicio);

CREATE TABLE empresa (
    id_empresa INT PRIMARY KEY,
    id_servicio INT,
    nombre VARCHAR(100),
    cuit BIGINT,
    req_capacidad VARCHAR(50)
    );
alter table empresa
add FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio);

INSERT INTO empresa VALUES (1, 9, 'Bonet LLC', 91172261064, 0);
INSERT INTO empresa VALUES (2, 7, 'Pablo-Morera', 22061242507, 1);
INSERT INTO empresa VALUES (3, 5, 'Pla and Sons', 77438548327, 0);
INSERT INTO empresa VALUES (4, 3, 'Santos-Ramirez', 16224401671, 1);
INSERT INTO empresa VALUES (5, 5, 'Toro, Lledó and Ferrera', 1443053512, 1);
INSERT INTO empresa VALUES (6, 4, 'Menendez PLC', 25166492629, 1);
INSERT INTO empresa VALUES (7, 10, 'Bautista PLC', 55557611676, 0);
INSERT INTO empresa VALUES (8, 9, 'Trujillo, Cobo and Jaén', 17659579712, 0);
INSERT INTO empresa VALUES (9, 4, 'Milla, Roldán and Caro', 13103887861, 1);
INSERT INTO empresa VALUES (10, 8, 'Lamas Ltd', 3632405160, 1);
INSERT INTO conductor VALUES (1, 1, 'Emiliana Solano Asensio', 28774345,'2028-08-12');
INSERT INTO conductor VALUES (2, 2, 'Armando de Valenzuela', 69171545,'2026-10-04');
INSERT INTO conductor VALUES (3, 9, 'Tatiana Pedraza Salom', 30394788, '2027-04-24');
INSERT INTO conductor VALUES (4, 6, 'Graciano Blázquez', 59390825, '2025-12-03');
INSERT INTO conductor VALUES (5, 4, 'Fortunata Expósito Arce', 52061986, '2027-04-12');
INSERT INTO conductor VALUES (6, 4, 'Aura Hervás Abella', 28076677, '2027-03-10');
INSERT INTO conductor VALUES (7, 2, 'Jordana Esther Puente Iñiguez', 25214229, '2027-11-08');
INSERT INTO conductor VALUES (8, 5, 'Goyo Guijarro-Castelló', 73632255, '2027-05-18');
INSERT INTO conductor VALUES (9, 4, 'Apolonia Robles', 57277258, '2025-09-01');
INSERT INTO conductor VALUES (10, 7, 'Leandro Cantón Sanchez', 8365266, '2026-02-18');
INSERT INTO tipo_servicio VALUES (1,'CARGAS GENERALES');
INSERT INTO tipo_servicio VALUES (2,'REFRIGERADO');
INSERT INTO tipo_servicio VALUES (3,'CARGAS PELIGROSAS');
INSERT INTO servicios VALUES (1, 6, 1, 2215, 2220.48);
INSERT INTO servicios VALUES (2, 7, 1, 12293, 9706.87);
INSERT INTO servicios VALUES (3, 10, 3, 18002, 6212.96);
INSERT INTO servicios VALUES (4, 9, 1, 1712, 7420.24);
INSERT INTO servicios VALUES (5, 9, 1, 8348, 5429.32);
INSERT INTO servicios VALUES (6, 10, 2, 9900, 9197.75);
INSERT INTO servicios VALUES (7, 7, 1, 7505, 1945.43);
INSERT INTO servicios VALUES (8, 8, 2, 15555, 4203.31);
INSERT INTO servicios VALUES (9, 7, 3, 17981, 691.15);
INSERT INTO servicios VALUES (10, 4, 1, 19322, 9438.51);
INSERT INTO titular VALUES (3, 'Manjón', 'Aníbal', 'vidalbibiana@yahoo.com', '+5411155233444', 69251816);
INSERT INTO titular VALUES (2, 'Ribera', 'Julio César', 'oliveranicolas@hotmail.com', '+5411156789123', 9883410);
INSERT INTO titular VALUES (1, 'Crespi', 'Olga', 'adoraciongarmendia@soria-corral.com', '+5411155455666', 73111051);
INSERT INTO titular VALUES (4, 'Vizcaíno', 'Carmina', 'cuadradosocorro@carreras-berenguer.es', '+5411154321456', 49737307);
INSERT INTO titular VALUES (5, 'Bauzà', 'Alicia', 'lazaro29@rossello.com', '+54114862314', 59201152);
INSERT INTO titular VALUES (6, 'Oller', 'Nacho', 'venceslasvalderrama@bonet-pou.es', '+54223156098234', 46608315);
INSERT INTO titular VALUES (7, 'Asenjo', 'Óscar', 'renebautista@morillo-izaguirre.com', '+5422387890456', 95831936);
INSERT INTO titular VALUES (8, 'Jaén', 'Luis Ángel', 'joveileana@sotelo.org', '+54223155123456', 77652486);
INSERT INTO titular VALUES (9, 'Cerezo', 'Andrea', 'adela97@gmail.com', '+54223156078546', 44295564);
INSERT INTO titular VALUES (10, 'Gallardo', 'María Teresa', 'fermin94@hotmail.com', '+54223155879056', 2569287);
INSERT INTO vehiculo VALUES (1, 6, 8, '4527 RKD', 2016, 7320, 'Furgón', 128306, 'Torrents LLC');
INSERT INTO vehiculo VALUES (2, 10, 6, '1093 LSS', 2023, 16463, 'Acoplado', 375254, 'Jáuregui Inc');
INSERT INTO vehiculo VALUES (3, 9, 9, '5644 GJB', 2024, 4466, 'Furgón', 348328, 'Mayol-Torrents');
INSERT INTO vehiculo VALUES (4, 6, 1, '4529 BWX', 2016, 5411, 'Furgón', 57599, 'Gaya-Riera');
INSERT INTO vehiculo VALUES (5, 7, 4, '8161 YTJ', 2016, 1558, 'Acoplado', 29314, 'Torrecilla-Beltran');
INSERT INTO vehiculo VALUES (6, 6, 1, '5003 GTW', 2019, 16600, 'Acoplado', 180395, 'Aranda-Seguí');
INSERT INTO vehiculo VALUES (7, 2, 1, '7577 PKL', 2024, 13647, 'Acoplado', 296649, 'Caballero Group');
INSERT INTO vehiculo VALUES (8, 5, 10, '1980 MSF', 2023, 16651, 'Camión', 30055, 'Abad PLC');
INSERT INTO vehiculo VALUES (9, 2, 4, 'B 3573 EZ', 2019, 1147, 'Camión', 376858, 'Gaya, Garay and Díez');
INSERT INTO vehiculo VALUES (10, 8, 8, 'V 6056 WG', 2023, 13892, 'Acoplado', 333379, 'Morales, Roca and Canals');

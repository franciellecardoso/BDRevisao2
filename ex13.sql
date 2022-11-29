create database exercicio13 
go
use exercicio13

create table empresa(
id int identity not null primary key,
nome varchar(50))

create table carro(
id int identity(1001,1) not null primary key,
marca varchar(50),
modelo varchar(50), 
idEmpresa int
foreign key (idEmpresa) references empresa(id))

create table viagem(
idCarro int not null,
distanciaPercorrida decimal(7,2),
data datetime not null
primary key (idCarro, data)
foreign key (idCarro) references carro(id))

insert into empresa(nome) values
('Empresa 1'),
('Empresa 2'),
('Empresa 3'),
('Empresa 4'),
('Empresa 5'),
('Empresa 6')

insert into carro(idEmpresa, marca, modelo) values
(1,'Fiat', 'Uno'),
(1,'Renault', 'Sandero'),
(1,'Chevrolet','Celta'),
(1,'Fiat', 'Palio'),
(1,'Peugeot','307'),
(1,'Renault', 'Duster'),
(2,'Fiat', 'Bravo'),
(2,'Renault', 'Logan'),
(4,'Peugeot','207'),
(4,'Renault', 'Duster'),
(6,'Chevrolet','Celta'),
(6,'Fiat', 'Doblo'),
(6,'Volksvagen', 'Jetta')

INSERT INTO viagem VALUES
(1006,97,'2016-05-01'),
(1005,2090,'2016-05-02'),
(1005,3387,'2016-05-03'),
(1005,487,'2016-05-04'),
(1004,3141,'2016-05-05'),
(1006,1895,'2016-05-06'),
(1005,3050,'2016-05-07'),
(1003,1974,'2016-05-08'),
(1005,1779,'2016-05-09'),
(1006,1727,'2016-05-10'),
(1002,641,'2016-05-11'),
(1004,1577,'2016-05-12'),
(1003,2697,'2016-05-13'),
(1005,832,'2016-05-14'),
(1002,2033,'2016-05-15'),
(1003,1930,'2016-05-16'),
(1005,2606,'2016-05-17'),
(1002,1424,'2016-05-18'),
(1005,2484,'2016-05-19'),
(1005,2711,'2016-05-20'),
(1003,3049,'2016-05-21'),
(1003,2446,'2016-05-22'),
(1003,1307,'2016-05-23'),
(1003,778,'2016-05-24'),
(1003,2202,'2016-05-25'),
(1004,2571,'2016-05-26'),
(1005,2736,'2016-05-27'),
(1003,3128,'2016-05-28'),
(1002,2513,'2016-05-29'),
(1006,1201,'2016-05-30'),
(1002,3319,'2016-05-31'),
(1006,2755,'2016-06-01'),
(1004,864,'2016-06-02'),
(1004,1833,'2016-06-03'),
(1004,1265,'2016-06-04'),
(1006,1670,'2016-06-05'),
(1006,3037,'2016-06-06'),
(1004,3134,'2016-06-07'),
(1002,358,'2016-06-08'),
(1003,2531,'2016-06-09'),
(1004,1515,'2016-06-10'),
(1005,3461,'2016-06-11'),
(1001,2963,'2016-06-12'),
(1003,2240,'2016-06-13'),
(1004,3403,'2016-06-14'),
(1001,621,'2016-06-15'),
(1005,1264,'2016-06-16'),
(1006,1121,'2016-06-17'),
(1005,88,'2016-06-18'),
(1006,2721,'2016-06-19'),
(1001,1146,'2016-06-20'),
(1005,515,'2016-06-21'),
(1005,3060,'2016-06-22'),
(1006,641,'2016-06-23'),
(1004,2037,'2016-06-24'),
(1006,2595,'2016-06-25'),
(1001,3064,'2016-06-26'),
(1002,2551,'2016-06-27'),
(1005,1380,'2016-06-28'),
(1001,611,'2016-06-29'),
(1002,2759,'2016-06-30'),
(1001,537,'2016-07-01'),
(1003,2581,'2016-07-02'),
(1004,3289,'2016-07-03'),
(1005,3335,'2016-07-04'),
(1004,3273,'2016-07-05'),
(1005,1736,'2016-07-06'),
(1006,2259,'2016-07-07'),
(1006,2269,'2016-07-08'),
(1002,2881,'2016-07-09'),
(1005,888,'2016-07-10'),
(1003,476,'2016-07-11'),
(1006,2944,'2016-07-12'),
(1002,373,'2016-07-13'),
(1005,1885,'2016-07-14'),
(1005,3416,'2016-07-15'),
(1004,1370,'2016-07-16'),
(1005,560,'2016-07-17'),
(1002,657,'2016-07-18'),
(1006,297,'2016-07-19'),
(1001,1661,'2016-07-20'),
(1005,2218,'2016-07-21'),
(1003,381,'2016-07-22'),
(1005,3284,'2016-07-23'),
(1004,771,'2016-07-24'),
(1002,1583,'2016-07-25'),
(1005,1841,'2016-07-26'),
(1005,2210,'2016-07-27'),
(1001,1512,'2016-07-28'),
(1004,1913,'2016-07-29'),
(1003,1065,'2016-07-30'),
(1006,3109,'2016-07-31'),
(1005,3393,'2016-08-01'),
(1003,1791,'2016-08-02'),
(1004,2652,'2016-08-03'),
(1002,1588,'2016-08-04'),
(1004,3154,'2016-08-05'),
(1005,2322,'2016-08-06'),
(1005,2750,'2016-08-07'),
(1006,460,'2016-08-08'),
(1004,465,'2016-08-09'),
(1006,2459,'2016-08-10'),
(1006,2354,'2016-08-11'),
(1006,1320,'2016-08-12'),
(1001,1478,'2016-08-13'),
(1003,2736,'2016-08-14'),
(1004,1908,'2016-08-15'),
(1005,1823,'2016-08-16'),
(1002,3202,'2016-08-17'),
(1001,2952,'2016-08-18'),
(1002,339,'2016-08-19'),
(1006,1092,'2016-08-20'),
(1003,1607,'2016-08-21'),
(1002,991,'2016-08-22'),
(1001,2123,'2016-08-23'),
(1001,1963,'2016-08-24'),
(1001,3359,'2016-08-25'),
(1006,119,'2016-08-26'),
(1003,1635,'2016-08-27'),
(1001,364,'2016-08-28'),
(1001,2672,'2016-08-29'),
(1005,324,'2016-08-30'),
(1002,1402,'2016-08-31'),
(1004,2902,'2016-09-01'),
(1004,1842,'2016-09-02'),
(1001,1113,'2016-09-03'),
(1005,373,'2016-09-04'),
(1002,157,'2016-09-05'),
(1002,1816,'2016-09-06'),
(1001,2413,'2016-09-07'),
(1003,1702,'2016-09-08'),
(1002,1871,'2016-09-09'),
(1006,3234,'2016-09-10'),
(1006,3165,'2016-09-11'),
(1004,360,'2016-09-12'),
(1004,1491,'2016-09-13'),
(1006,2653,'2016-09-14'),
(1002,886,'2016-09-15'),
(1001,1567,'2016-09-16'),
(1002,2642,'2016-09-17'),
(1006,1839,'2016-09-18'),
(1002,3418,'2016-09-19'),
(1004,1959,'2016-09-20'),
(1001,540,'2016-09-21'),
(1003,2510,'2016-09-22'),
(1002,2916,'2016-09-23'),
(1001,1519,'2016-09-24'),
(1006,241,'2016-09-25'),
(1003,728,'2016-09-26'),
(1003,1511,'2016-09-27'),
(1004,1738,'2016-09-28'),
(1002,646,'2016-09-29'),
(1003,253,'2016-09-30'),
(1006,2714,'2016-10-01'),
(1001,2114,'2016-10-02'),
(1004,725,'2016-10-03'),
(1010,348,'2016-09-01'),
(1008,194,'2016-09-02'),
(1012,1250,'2016-09-03'),
(1007,1291,'2016-09-04'),
(1009,1879,'2016-09-05'),
(1007,2466,'2016-09-06'),
(1010,900,'2016-09-07'),
(1011,2743,'2016-09-08'),
(1011,769,'2016-09-09'),
(1010,3284,'2016-09-10'),
(1009,811,'2016-09-11'),
(1010,434,'2016-09-12'),
(1007,1271,'2016-09-13'),
(1008,1492,'2016-09-14'),
(1008,3047,'2016-09-15'),
(1007,2305,'2016-09-16'),
(1007,2886,'2016-09-17'),
(1008,3226,'2016-09-18'),
(1011,1542,'2016-09-19'),
(1007,2150,'2016-09-20'),
(1011,1897,'2016-09-21'),
(1011,3022,'2016-09-22'),
(1007,3495,'2016-09-23'),
(1011,365,'2016-09-24'),
(1007,3265,'2016-09-25'),
(1011,2938,'2016-09-26'),
(1012,2136,'2016-09-27'),
(1008,891,'2016-09-28'),
(1011,833,'2016-09-29'),
(1009,1528,'2016-09-30'),
(1008,952,'2016-10-01'),
(1007,2310,'2016-10-02'),
(1008,1657,'2016-10-03'),
(1007,2007,'2016-10-04'),
(1007,2657,'2016-10-05'),
(1007,1509,'2016-10-06'),
(1010,737,'2016-10-07'),
(1008,2156,'2016-10-08'),
(1008,3263,'2016-10-09'),
(1007,1329,'2016-10-10'),
(1007,140,'2016-10-11'),
(1010,1701,'2016-10-12'),
(1009,3300,'2016-10-13'),
(1010,1324,'2016-10-14'),
(1011,1936,'2016-10-15'),
(1010,2961,'2016-10-16'),
(1007,781,'2016-10-17'),
(1012,3296,'2016-10-18'),
(1007,174,'2016-10-19'),
(1012,2894,'2016-10-20'),
(1009,2965,'2016-10-21'),
(1010,452,'2016-10-22'),
(1012,2077,'2016-10-23'),
(1009,2581,'2016-10-24'),
(1011,1503,'2016-10-25'),
(1008,1382,'2016-10-26'),
(1012,3379,'2016-10-27'),
(1010,351,'2016-10-28'),
(1007,553,'2016-10-29'),
(1011,1660,'2016-10-30'),
(1008,1045,'2016-10-31'),
(1008,1919,'2016-11-01'),
(1010,922,'2016-11-02'),
(1010,2983,'2016-11-03'),
(1012,1229,'2016-11-04'),
(1010,3083,'2016-11-05'),
(1010,1318,'2016-11-06'),
(1011,3018,'2016-11-07'),
(1011,2227,'2016-11-08'),
(1011,3304,'2016-11-09'),
(1011,2078,'2016-11-10'),
(1008,3388,'2016-11-11'),
(1007,1136,'2016-11-12'),
(1007,2043,'2016-11-13'),
(1009,2224,'2016-11-14'),
(1007,1413,'2016-11-15'),
(1008,496,'2016-11-16'),
(1008,3370,'2016-11-17'),
(1008,1524,'2016-11-18'),
(1008,2996,'2016-11-19'),
(1007,502,'2016-11-20'),
(1010,2314,'2016-11-21'),
(1007,1946,'2016-11-22'),
(1007,1042,'2016-11-23'),
(1007,141,'2016-11-24'),
(1011,1967,'2016-11-25'),
(1012,585,'2016-11-26'),
(1010,737,'2016-11-27'),
(1010,504,'2016-11-28'),
(1011,2351,'2016-11-29'),
(1008,1046,'2016-11-30'),
(1008,3117,'2016-12-01'),
(1008,229,'2016-12-02'),
(1008,3079,'2016-12-03'),
(1011,339,'2016-12-04'),
(1010,2335,'2016-12-05'),
(1007,3139,'2016-12-06'),
(1011,1632,'2016-12-07'),
(1010,3253,'2016-12-08'),
(1010,265,'2016-12-09'),

--Exerc�cios
--Apresentar marca e modelo de carro e a soma total da dist�ncia percorrida pelos carros,
--em viagens, de uma dada empresa, ordenado pela dist�ncia percorrida
SELECT DISTINCT 
       c.marca,
       c.modelo,
	   AVG(v.distanciaPercorrida) AS distancia_percorrida_total
FROM carro c, empresa e, viagem v
WHERE c.idEmpresa = e.id
      AND c.id = v.idCarro 
GROUP BY c.marca, c.modelo
ORDER BY AVG(v.distanciaPercorrida) ASC

--Consultar Nomes das empresas que n�o tem carros cadastrados
SELECT e.nome
FROM carro c RIGHT OUTER JOIN empresa e
ON c.idEmpresa = e.id
WHERE c.idEmpresa IS NULL

--Consultar Marca e modelos dos carros que n�o fizeram viagens
SELECT e.nome
FROM carro c RIGHT OUTER JOIN empresa e
ON c.idEmpresa = e.id
WHERE c.idEmpresa IS NULL

--Consultar quantas viagens foram feitas por cada carro (marca e modelo) de cada empresa
--em ordem ascendente de nome de empresa e descendente de quantidade
SELECT  
       e.nome,
       c.marca,
       c.modelo, 
	   COUNT(v.distanciaPercorrida) AS qtd_viagens
FROM viagem v, carro c, empresa e
WHERE v.idCarro = c.id
      AND c.idEmpresa = e.id
GROUP BY c.marca, c.modelo, e.nome, c.idEmpresa
ORDER BY e.nome ASC, COUNT(c.idEmpresa) DESC

--Consultar o nome da empresa, a marca e o modelo do carro, a dist�ncia percorrida
--e o valor total ganho por viagem, sabendo que para dist�ncias inferiores a 1000 km, o valor � R$10,00
--por km e para viagens superiores a 1000 km, o valor � R$15,00 por km.
SELECT 
       e.nome,
       c.marca,
	   c.modelo,
	   v.distanciaPercorrida,
	   CASE WHEN v.distanciaPercorrida < 1000.00
	   THEN CAST((v.distanciaPercorrida * 10.00) AS DECIMAL(7, 2))
       ELSE CAST((v.distanciaPercorrida * 15.00) AS DECIMAL(7, 2))
	   END AS valor_total
FROM empresa e, carro c, viagem v
WHERE e.id = c.idEmpresa
      AND c.id = v.idCarro

select * from carro
select * from empresa
select * from viagem

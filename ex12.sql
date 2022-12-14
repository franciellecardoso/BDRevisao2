CREATE DATABASE ex12

GO
USE ex12

GO
CREATE TABLE plano (
codigoPlano                     INT                    NOT NULL,
nomePlano                       VARCHAR(20)            NOT NULL,
valorPlano                      DECIMAL(7,2)           NOT NULL
PRIMARY KEY(codigoPlano)
)

GO
CREATE TABLE servico (
codigoServišo              INT                    NOT NULL,
nomeServišo                VARCHAR(20)            NOT NULL,
valorServišo               DECIMAL(7,2)           NOT NULL
PRIMARY KEY(codigoServišo)
)

GO
CREATE TABLE cliente (
codigoCliente              INT        IDENTITY(1234, 1234)              NOT NULL,
nomeCliente                VARCHAR(20)                                  NOT NULL,
dataInicio                 DATE                                         NOT NULL
PRIMARY KEY(codigoCliente)
)

GO
CREATE TABLE contratos(
codigo_cliente             INT                               NOT NULL,
codigo_plano               INT                               NOT NULL,
codigo_servišo             INT                               NOT NULL,
status                     VARCHAR(6)                        NOT NULL,
data                       DATE                              NOT NULL
PRIMARY KEY (codigo_cliente, codigo_plano, codigo_servišo, status)
FOREIGN KEY (codigo_cliente)   REFERENCES cliente(codigoCliente),
FOREIGN KEY (codigo_plano)     REFERENCES plano (codigoPlano),
FOREIGN KEY (codigo_servišo)   REFERENCES servico(codigoServišo)
)

--dados plano
INSERT INTO plano (codigoPlano, nomePlano, valorPlano)
VALUES            (1, '100 Minutos', 80),
                  (2, '150 Minutos', 130),
				  (3, '200 Minutos', 160),
				  (4, '250 Minutos', 220),
				  (5, '300 Minutos', 260),
				  (6, '600 Minutos', 350)

--dados servico
INSERT INTO servico (codigoServišo, nomeServišo, valorServišo)
VALUES              (1, '100 SMS', 10),
                    (2, 'SMS Ilimitado', 30),
					(3, 'Internet 500 MB', 40),
					(4, 'Internet 1 GB', 60),
					(5, 'Internet 2 GB', 70)

--dados cliente
INSERT INTO cliente (nomeCliente, dataInicio)
VALUES              ('Cliente A', '15/10/2012'),
                    ('Cliente B', '20/11/2012'),
					('Cliente C', '25/11/2012'),
					('Cliente D', '01/12/2012'),
					('Cliente E', '18/12/2012'),
					('Cliente F', '20/01/2013'),
					('Cliente G', '25/01/2013')

--dados contratos
INSERT INTO contratos (codigo_cliente, codigo_plano, codigo_servišo, status, data)
VALUES                (1234, 3, 1, 'E', '15/10/2012'),
                      (1234, 3, 2, 'E', '15/10/2012'),
					  (1234, 3, 2, 'A', '16/10/2012'),
					  (1234, 3, 1, 'A', '16/10/2012'),
					  (2468, 4, 4, 'E', '20/11/2012'),
					  (2468, 4, 4, 'A', '21/11/2012'),
					  (6170, 6, 2, 'E', '18/12/2012'),
					  (6170, 6, 5, 'E', '19/12/2012'),
					  (6170, 6, 2, 'A', '20/12/2012'),
					  (6170, 6, 5, 'A', '21/12/2012'),
					  (1234, 3, 1, 'D', '10/01/2013'),
					  (1234, 3, 3, 'D', '10/01/2013'),
					  (1234, 2, 1, 'E', '10/01/2013'),
					  (1234, 2, 1, 'A', '11/01/2013'),
					  (2468, 4, 4, 'D', '25/01/2013'),
					  (7404, 2, 1, 'E', '20/01/2013'),
					  (7404, 2, 5, 'E', '20/01/2013'),
					  (7404, 2, 5, 'A', '21/01/2013'),
					  (7404, 2, 1, 'A', '22/01/2013'),
					  (8638, 6, 5, 'E', '25/01/2013'),
					  (8638, 6, 5, 'A', '26/01/2013'),
					  (7404, 2, 5, 'D', '03/02/2013')

--Status de contrato A(Ativo), D(Desativado), E(Espera)
--Um plano sˇ Ú vßlido se existe pelo menos um servišo associado a ele
/* - Consultar o nome do cliente, o nome do plano, 
   a quantidade de estados de contrato (sem repetiš§es) 
   por contrato, dos planos cancelados, ordenados pelo nome do cliente
 */
SELECT DISTINCT 
       c.nomeCliente,
       p.nomePlano,
	   COUNT(cont.status) AS qtd_cancelados
FROM cliente c, plano p, contratos cont
WHERE c.codigoCliente = cont.codigo_cliente
      AND cont.codigo_plano = p.codigoPlano
	  AND cont.status = 'D'
GROUP BY c.nomeCliente, p.nomePlano

/* - Consultar o nome do cliente, o nome do plano, a quantidade de estados 
   de contrato (sem repetiš§es) por contrato, dos planos nŃo cancelados, 
   ordenados pelo nome do cliente
 */
SELECT DISTINCT c.nomeCliente,
       p.nomePlano,
	   COUNT(cont.status) qtd_nao_cancelados

FROM cliente c, plano p, contratos cont
WHERE c.codigoCliente = cont.codigo_cliente
      AND cont.codigo_plano = p.codigoPlano
	  AND cont.status NOT LIKE 'D'
GROUP BY c.nomeCliente, p.nomePlano

/* - Consultar o nome do cliente, o nome do plano, e o valor da conta de cada 
   contrato que estß ou esteve ativo, sob as seguintes condiš§es:
   - A conta Ú o valor do plano, somado Ó soma dos valores de todos os servišos
   - Caso a conta tenha valor superior a R$400.00, deverß ser incluÝdo um desconto de 8%
   - Caso a conta tenha valor entre R$300,00 a R$400.00, deverß ser incluÝdo um desconto de 5%
   - Caso a conta tenha valor entre R$200,00 a R$300.00, deverß ser incluÝdo um desconto de 3%
   - Contas com valor inferiores a R$200,00 nŃo tem desconto
 */
SELECT DISTINCT
        c.nomeCliente,
        p.nomePlano,

	    CASE WHEN SUM(p.valorPlano + s.valorServišo) > 400.00
		THEN SUM(p.valorPlano + s.valorServišo) - (0.08 * SUM(p.valorPlano + s.valorServišo))
		
     	WHEN SUM(p.valorPlano + s.valorServišo) > 300.00 AND SUM(p.valorPlano + s.valorServišo) <= 400.00
		THEN SUM(p.valorPlano + s.valorServišo) - (0.05 * SUM(p.valorPlano + s.valorServišo))
		
		WHEN SUM(p.valorPlano + s.valorServišo) > 200.00 AND SUM(p.valorPlano + s.valorServišo) <= 300.00
		THEN SUM(p.valorPlano + s.valorServišo) - (0.03 * SUM(p.valorPlano + s.valorServišo))
		
		WHEN SUM(p.valorPlano + s.valorServišo) <= 200.00
		THEN SUM(p.valorPlano + s.valorServišo) 
		END AS conta
FROM cliente c, plano p, contratos cont, servico s
WHERE c.codigoCliente = cont.codigo_cliente
       AND cont.codigo_plano = p.codigoPlano
	   AND cont.codigo_servišo = s.codigoServišo
GROUP BY c.nomeCliente, p.nomePlano, p.valorPlano, s.valorServišo

 /* - Consultar o nome do cliente, o nome do servišo, e a durašŃo, 
      em meses (atÚ a data de hoje) do servišo, dos cliente que nunca 
	  cancelaram nenhum plano
  */
SELECT DISTINCT
       c.nomeCliente,
	   p.nomePlano,
       s.nomeServišo,
	   DATEDIFF(MONTH, cont.data, GETDATE()) AS duracao_meses
FROM cliente c, servico s, contratos cont, plano p
WHERE c.codigoCliente = cont.codigo_cliente
      AND cont.codigo_servišo = s.codigoServišo
	  AND cont.codigo_plano = p.codigoPlano
	  AND cont.status NOT LIKE 'D'


SELECT * FROM plano
SELECT * FROM cliente
SELECT * FROM servico
SELECT * FROM contratos
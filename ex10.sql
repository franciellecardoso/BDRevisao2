CREATE DATABASE ex10

GO
USE ex10

GO
CREATE TABLE medicamento (
codigo                   INT   IDENTITY(1, 1)             NOT NULL,
nome                     VARCHAR(50)                      NOT NULL,
apresentacao             VARCHAR(50)                      NOT NULL,
unidade_cadastro         VARCHAR(30)                      NOT NULL,
pre�o_proposto           DECIMAL(7, 3)                    NOT NULL
PRIMARY KEY(codigo)
)

GO 
CREATE TABLE cliente (
CPF                      VARCHAR(11)        NOT NULL,
nome                     VARCHAR(30)        NOT NULL,
rua                      VARCHAR(30)        NOT NULL,
N                        INT                NOT NULL,
bairro                   VARCHAR(30)        NOT NULL,
telefone                 INT                NOT NULL
PRIMARY KEY(CPF)
)

GO
CREATE TABLE venda (
nota_fiscal              INT                NOT NULL,
CPF_cliente              VARCHAR(11)        NOT NULL,
codigo_medicamento       INT                NOT NULL,
quantidade               INT                NOT NULL,
valor_total              DECIMAL(7, 3)      NOT NULL,
data                     DATE               NOT NULL
PRIMARY KEY(nota_fiscal, CPF_cliente, codigo_medicamento)
FOREIGN KEY(CPF_cliente)          REFERENCES  cliente(CPF),
FOREIGN KEY(codigo_medicamento)   REFERENCES  medicamento(codigo)
)

--Dados medicamento
INSERT INTO medicamento (nome, apresentacao, unidade_cadastro, pre�o_proposto)
VALUES                  ('Acetato de medroxiprogesterona', '150 mg/ml', 'Ampola', 6.7),
                        ('Aciclovir', '200mg/comp.', 'Comprimido', 0.28),
						('�cido Acetilsalic�lico', '500mg/comp.', 'Comprimido', 0.035),
						('�cido Acetilsalic�lico', '100mg/comp.', 'Comprimido', 0.03),
						('�cido F�lico', '5mg/comp.', 'Comprimido', 0.054),
						('Albendazol', '400mg/comp. mastig�vel', 'Comprimido', 0.56),
						('Amiodarona', '100mg/comp.', 'Comprimido', 0.08),
						('Amiodarona', '200mg/comp.', 'Comprimido', 0.2),
						('Amitriptilina(Cloridrato)', '25mg/comp.', 'Comprimido', 0.22),
						('Amoxicilina', '500mg/c�ps.', 'C�psula', 0.190)  
						    
--Dados cliente
INSERT INTO cliente VALUES
            ('34390898700', 'Maria Z�lia', 'Anhaia', 65, 'Barra Funda', 92103762),
			('21345986290', 'Roseli Silva', 'Xv. De Novembro', 987, 'Centro', 82198763),
			('86927981825', 'Carlos Campos', 'Volunt�rios da P�tria', 1276, 'Santana', 98172361),
			('31098120900', 'Jo�o Perdizes', 'Carlos de Campos', 90, 'Pari', 61982371)

--Dados venda
INSERT INTO venda VALUES 
            (31501, '86927981825', 10, 3, 0.57, '2020-11-01'),
			(31501, '86927981825', 2, 10, 2.8, '2020-11-01'),
			(31501, '86927981825', 5, 30, 6.6, '2020-11-01'),
			(31501, '86927981825', 8, 30, 6.6, '2020-11-01'),
			(31502, '34390898700', 8, 15, 3, '2020-11-01'),
			(31502, '34390898700', 2, 10, 2.8, '2020-11-01'),
			(31502, '34390898700', 9, 10, 2.2, '2020-11-01'),
			(31503, '31098120900', 1, 20, 134, '2020-11-02')

--Consultar
--Nome, apresenta��o, unidade e valor unit�rio dos rem�dios que ainda n�o foram vendidos. 
--Caso a unidade de cadastro seja comprimido, mostrar Comp.
SELECT DISTINCT 
       m.codigo,
	   m.nome,
       m.apresentacao,
	   CASE WHEN m.unidade_cadastro LIKE '%omprimido'
	   THEN 'Comp.'
	   ELSE m.unidade_cadastro
	   END AS unidade_cadastro,
	   m.pre�o_proposto
FROM medicamento m LEFT OUTER JOIN venda v
ON  m.codigo = v.codigo_medicamento
WHERE v.codigo_medicamento IS NULL
      AND m.unidade_cadastro LIKE '%omprimido'


--Nome dos clientes que compraram Amiodarona
SELECT c.nome
FROM cliente c, venda v, medicamento m
WHERE c.CPF = v.CPF_cliente
      AND v.codigo_medicamento = m.codigo
	  AND m.nome = 'Amiodarona'

--CPF do cliente, endere�o concatenado, nome do medicamento  
--(como nome de rem�dio), apresenta��o do rem�dio, unidade, pre�o proposto, 
--quantidade vendida e valor total dos rem�dios vendidos a Maria Z�lia
SELECT DISTINCT
       c.CPF,
       c.rua + ', ' + c.bairro + ', ' + CAST(c.N AS VARCHAR(5)) AS endere�o,
	   m.nome,
	   m.apresentacao,
	   m.unidade_cadastro,
	   m.pre�o_proposto,
	   v.quantidade,
	   v.valor_total       
FROM cliente c, medicamento m, venda v
WHERE c.CPF = v.CPF_cliente
      AND v.codigo_medicamento = m.codigo
	  AND c.nome LIKE 'Maria Z%'

--Data de compra, convertida, de Carlos Campos
SELECT DISTINCT v.data
FROM cliente c, venda v
WHERE c.CPF = v.CPF_cliente
     AND nome = 'Carlos Campos'

--Alterar o nome da  Amitriptilina(Cloridrato) para Cloridrato de Amitriptilina
UPDATE medicamento
SET nome = 'Cloridrato de Amitriptilina'
WHERE nome = 'Amitriptilina(Cloridrato)'


SELECT * FROM medicamento
SELECT * FROM cliente
SELECT * FROM venda


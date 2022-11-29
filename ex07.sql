CREATE DATABASE ex07

GO
USE ex07

GO
CREATE TABLE cliente (
RG                VARCHAR(9)             NOT NULL,
CPF               VARCHAR(11)            NOT NULL,
nome              VARCHAR(35)            NOT NULL,
logradouro        VARCHAR(40)	         NOT NULL,
numero            INT                    NOT NULL
PRIMARY KEY(RG)         
)

GO
CREATE TABLE pedido (
nota_fiscal       INT                    NOT NULL,
valor             DECIMAL(7, 2)          NOT NULL,
data              DATE                   NOT NULL,
RG_cliente        VARCHAR(9)             NOT NULL
PRIMARY KEY(nota_fiscal, RG_cliente)
FOREIGN KEY(RG_cliente)   REFERENCES   cliente(RG)
)

GO
CREATE TABLE fornecedor (
codigo            INT                    NOT NULL,
nome              VARCHAR(35)            NOT NULL,
logradouro        VARCHAR(40)	         NOT NULL,
numero            INT                    NULL,
pais              VARCHAR(4)             NOT NULL,
area              INT                    NOT NULL,
telefone          VARCHAR(11)            NULL, 
CNPJ              VARCHAR(13)            NULL,
cidade            VARCHAR(20)            NULL,
transporte        VARCHAR(20)            NULL,
moeda             VARCHAR(5)             NOT NULL
PRIMARY KEY(codigo)            
)

GO
CREATE TABLE mercadoria (
codigo            INT                   NOT NULL,
descricao         VARCHAR(30)           NOT NULL,
pre�o             DECIMAL(7, 2)         NOT NULL,
Qtd               INT                   NOT NULL,
codigo_fornecedor INT                   NOT NULL
PRIMARY KEY(codigo)
FOREIGN KEY(codigo_fornecedor)  REFERENCES fornecedor(codigo)
)

--Dados cliente
INSERT INTO cliente (RG, CPF, nome, logradouro, numero)
VALUES              ('29531844', '34519878040', 'Luiz Andr�', 'R. Astorga', 500)

INSERT INTO cliente (RG, CPF, nome, logradouro, numero)
VALUES              ('13514996x', '84984285630', 'Maria Luiza', 'R. Piau�', 174)

INSERT INTO cliente (RG, CPF, nome, logradouro, numero)
VALUES              ('121985541', '23354997310', 'Ana Barbara', 'Av. Jaceguai', 1141)

INSERT INTO cliente (RG, CPF, nome, logradouro, numero)
VALUES              ('23987746x', '43587669920', 'Marcos Alberto', 'R. Quinze', 22)

--Dados pedido
INSERT INTO pedido (nota_fiscal, valor, data, RG_cliente)
VALUES             (1001, 754, '2018-04-01', '121985541')

INSERT INTO pedido (nota_fiscal, valor, data, RG_cliente)
VALUES             (1002, 350, '2018-04-02', '121985541')

INSERT INTO pedido (nota_fiscal, valor, data, RG_cliente)
VALUES             (1003, 30, '2018-04-02', '29531844')

INSERT INTO pedido (nota_fiscal, valor, data, RG_cliente)
VALUES             (1004, 1500, '2018-04-03', '13514996x')

--Dados fornecedor
INSERT INTO fornecedor VALUES
            (1, 'Clone', 'Av. Na��es Unidas, 12000', 12000, 'BR', 55, '1141487000', NULL, 'S�o Paulo', NULL, 'R$'),
			(2, 'Logitech', '28th Street, 100', 100, 'USA', 1, '2127695100', NULL, NULL, 'Avi�o', 'US$'),
			(3, 'LG', 'Rod. Castello Branco', NULL, 'BR', 55, '800664400', '4159978100001', 'Sorocaba', NULL, 'R$'),
			(4, 'PcChips', 'Ponte da Amizade', NULL, 'PY', 595, NULL, NULL, NULL, 'Navio', 'US$')

--Dados mercadoria
INSERT INTO mercadoria (codigo, descricao, pre�o, Qtd, codigo_fornecedor)
VALUES                 (10, 'Mouse', 24, 30, 1)

INSERT INTO mercadoria (codigo, descricao, pre�o, Qtd, codigo_fornecedor)
VALUES                 (11, 'Teclado', 50, 20, 1)

INSERT INTO mercadoria (codigo, descricao, pre�o, Qtd, codigo_fornecedor)
VALUES                 (12, 'Cx. De Som', 30, 8, 2)

INSERT INTO mercadoria (codigo, descricao, pre�o, Qtd, codigo_fornecedor)
VALUES                 (13, 'Monitor 17', 350, 4, 3)

INSERT INTO mercadoria (codigo, descricao, pre�o, Qtd, codigo_fornecedor)
VALUES                 (14, 'Notebook', 1500, 7, 4)

--Consultar 10% de desconto no pedido 1003
SELECT CAST(valor - (valor * 0.10) AS DECIMAL(7, 2)) AS valor_com_desconto
FROM pedido
WHERE nota_fiscal = 1003

--Consultar 5% de desconto em pedidos com valor maior de R$700,00
SELECT CAST(valor - (valor * 0.05) AS DECIMAL(7, 2)) AS valor_com_desconto
FROM pedido
WHERE valor > 700

--Consultar e atualizar aumento de 20% no valor de marcadorias com estoque menor de 10
SELECT *
FROM mercadoria
WHERE Qtd < 10

UPDATE mercadoria
SET pre�o = pre�o + (pre�o * 0.20)
WHERE Qtd < 10

SELECT *
FROM mercadoria
WHERE Qtd < 10

--Data e valor dos pedidos do Luiz
SELECT CONVERT(CHAR(10), data, 103) AS data,
       valor
FROM pedido
WHERE RG_cliente IN 
(
  SELECT RG
  FROM cliente
  WHERE nome LIKE 'Luiz%'
)

--CPF, Nome e endere�o concatenado do cliente de nota 1004
SELECT SUBSTRING(CPF, 1, 3) + '.' + SUBSTRING(CPF, 4, 3) + '.' + SUBSTRING(CPF, 7, 3) + '-' + SUBSTRING(CPF, 10, 2)AS CPF,
       nome,
	   logradouro + ', ' + CAST(numero AS VARCHAR(5)) AS endere�o_concatenado
FROM cliente
WHERE RG IN 
(
  SELECT RG_cliente
  FROM pedido
  WHERE nota_fiscal = 1004
)

--Pa�s e meio de transporte da Cx. De som
SELECT pais,
       transporte
FROM fornecedor 
WHERE codigo IN 
(
  SELECT codigo_fornecedor
  FROM mercadoria
  WHERE descricao LIKE 'Cx%'
)

--Nome e Quantidade em estoque dos produtos fornecidos pela Clone
SELECT descricao,
       Qtd
FROM mercadoria
WHERE codigo_fornecedor IN 
(
  SELECT codigo
  FROM fornecedor
  WHERE nome = 'Clone'
)

--Endere�o concatenado e telefone dos fornecedores do monitor. 
--(Telefone brasileiro (XX)XXXX-XXXX ou XXXX-XXXXXX (Se for 0800), 
--Telefone Americano (XXX)XXX-XXXX)
SELECT CASE WHEN numero IS NULL
	   THEN logradouro
	   ELSE logradouro + ', ' + CAST(numero AS VARCHAR(5)) 
	   END AS endere�o_concatenado,

	   CASE WHEN pais = 'USA'
	   THEN '(' + SUBSTRING(telefone, 1, 3) + ')'+ SUBSTRING(telefone, 3, 3) + '-' + SUBSTRING(telefone, 7, 4) 
	   WHEN pais = 'BR' AND '0' + SUBSTRING(telefone, 1, 3) = '0800' 
	   THEN SUBSTRING(telefone, 1, 4) + '-' + SUBSTRING(telefone, 5, 5) 
       END AS telefone
FROM fornecedor
WHERE codigo IN 
(
  SELECT codigo_fornecedor
  FROM mercadoria
  WHERE descricao LIKE '%onitor%'
)

--Tipo de moeda que se compra o notebook
SELECT moeda
FROM fornecedor
WHERE codigo IN 
(
  SELECT codigo_fornecedor
  FROM mercadoria
  WHERE descricao LIKE '%otebook'
)

--Considerando que hoje � 03/02/2019, h� quantos dias foram feitos os pedidos e, 
--criar uma coluna que escreva Pedido antigo para pedidos feitos h� mais de 6 meses 
--e pedido recente para os outros
ALTER TABLE pedido
ADD pedido_periodo   VARCHAR(20)   NULL

UPDATE pedido
SET pedido_periodo = 'Pedido antigo'
WHERE DATEDIFF(MONTH, data, '03/02/2019') > 6

UPDATE pedido
SET pedido_periodo = 'Pedido recente'
WHERE DATEDIFF(MONTH, data, '03/02/2019') < 6

--Nome e Quantos pedidos foram feitos por cada cliente
SELECT DISTINCT c.nome,
       COUNT(RG_cliente) AS qtd_pedidos
FROM pedido p, cliente c 
WHERE c.RG = p.RG_cliente OR p.RG_cliente IS NULL  
GROUP BY c.nome, p.RG_cliente

--RG,CPF,Nome e Endere�o dos cliente cadastrados que N�o Fizeram pedidos
SELECT CASE WHEN LEN(c.RG) = 8
       THEN SUBSTRING(c.RG, 1, 7) + '-' + SUBSTRING(c.RG, 7, 1)
	   ELSE  SUBSTRING(c.RG, 1, 8) + '-' + SUBSTRING(c.RG, 9, 1)
	   END AS RG,
       SUBSTRING(c.CPF, 1, 3) + '.' + SUBSTRING(c.CPF, 4, 3) + '.' + SUBSTRING(c.CPF, 7, 3) + '-' + SUBSTRING(c.CPF, 10, 2)AS CPF,
	   c.nome,
	   c.logradouro + ', ' + CAST(c.numero AS VARCHAR(5)) AS endere�o
FROM cliente c LEFT OUTER JOIN pedido p
ON c.RG = p.RG_cliente
WHERE RG_cliente IS NULL

SELECT * FROM cliente
SELECT * FROM pedido
SELECT * FROM mercadoria
SELECT * FROM fornecedor


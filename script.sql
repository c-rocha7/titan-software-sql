CREATE TABLE `produtos` (
    `cod_prod` INT,
    `loj_prod` INT,
    `desc_prod` CHAR(40),
    `dt_inclu_prod` DATE,
    `preco_prod` DECIMAL(8,3),
    PRIMARY KEY (`cod_prod`, `loj_prod`)
);

INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) VALUES
(102, 1, 'LEITE INTEGRAL ITAMBÉ', '2021-06-15', 50.50),
(103, 1, 'LIVRO DE CÓDIGOS', '2019-03-20', 35.00),
(104, 2, 'LIMPADOR MULTIUSO', '2022-08-10', 12.99),
(105, 2, 'LIVRO DE PROGRAMACAO', '2023-02-05', 65.00),
(106, 2, 'LEITE CONDENSADO MOCOCA', '2018-12-10', 50.00),
(107, 3, 'LIXO ORGANICO', '2020-07-01', 5.99),
(108, 3, 'LIVRO DE CÓDIGOS', '2021-07-20', 25.00),
(109, 3, 'LEITE INTEGRAL ITAMBÉ', '2020-05-30', 55.90),
(110, 3, 'LIMPADOR MULTIUSO', '2019-11-25', 15.00);

INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) VALUES
    (170, 2, 'LEITE CONDENSADO MOCOCA', '2010-12-30', 45.40);

SELECT * FROM produtos WHERE loj_prod IN (1, 2);

SELECT MIN(dt_inclu_prod) AS menor_data_inclusao, MAX(dt_inclu_prod) AS maior_data_inclusao FROM produtos;

SELECT COUNT(*) AS total_registros FROM produtos;

SELECT * FROM produtos WHERE desc_prod LIKE 'L%';

SELECT loj_prod, SUM(preco_prod) AS total_precos FROM produtos GROUP BY loj_prod;

SELECT loj_prod, SUM(preco_prod) AS total_precos FROM produtos GROUP BY loj_prod HAVING SUM(preco_prod) > 100000;


CREATE TABLE produtos (
    cod_prod INT(8) PRIMARY KEY, 
    loj_prod INT(8), 
    desc_prod CHAR(40), 
    dt_inclu_prod DATE, 
    preco_prod DECIMAL(8,3)
);

CREATE TABLE estoque (
    cod_prod INT(8), 
    loj_prod INT(8), 
    qtd_prod DECIMAL(15,3), 
    PRIMARY KEY (cod_prod, loj_prod)
);

CREATE TABLE lojas (
    loj_prod INT(8) PRIMARY KEY, 
    desc_loj CHAR(40)
);

INSERT INTO lojas (loj_prod, desc_loj) VALUES
(1, 'LOJA 1'),
(2, 'LOJA 2'),
(3, 'LOJA 3');

INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) VALUES
(101, 1, 'LEITE CONDENSADO MOCOCA', '2020-01-01', 45.40),
(102, 1, 'LEITE INTEGRAL ITAMBÉ', '2021-06-15', 50.50),
(103, 1, 'LIVRO DE CÓDIGOS', '2019-03-20', 35.00),
(104, 2, 'LIMPADOR MULTIUSO', '2022-08-10', 12.99),
(105, 2, 'LIVRO DE PROGRAMACAO', '2023-02-05', 65.00),
(106, 2, 'LEITE CONDENSADO MOCOCA', '2018-12-10', 50.00),
(107, 3, 'LIXO ORGANICO', '2020-07-01', 5.99),
(108, 3, 'LIVRO DE CÓDIGOS', '2021-07-20', 25.00),
(109, 3, 'LEITE INTEGRAL ITAMBÉ', '2020-05-30', 55.90),
(110, 3, 'LIMPADOR MULTIUSO', '2019-11-25', 15.00);

INSERT INTO estoque (cod_prod, loj_prod, qtd_prod) VALUES
(101, 1, 150.000),
(102, 1, 200.000),
(104, 2, 75.000),
(105, 2, 100.000),
(106, 2, 180.000),
(107, 3, 50.000),
(108, 3, 120.000),
(109, 3, 140.000),
(110, 3, 90.000);

SELECT l.loj_prod, l.desc_loj, p.cod_prod, p.desc_prod, p.preco_prod, e.qtd_prod FROM produtos p JOIN estoque e ON p.cod_prod = e.cod_prod AND p.loj_prod = e.loj_prod JOIN lojas l ON p.loj_prod = l.loj_prod WHERE p.loj_prod = 1;

SELECT p.cod_prod, p.desc_prod FROM produtos p LEFT JOIN estoque e ON p.cod_prod = e.cod_prod AND p.loj_prod = e.loj_prod WHERE e.cod_prod IS NULL;

SELECT e.cod_prod, e.qtd_prod FROM estoque e LEFT JOIN produtos p ON e.cod_prod = p.cod_prod AND e.loj_prod = p.loj_prod WHERE p.cod_prod IS NULL;

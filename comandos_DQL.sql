-- a) Crie uma consulta SQL por meio do comando SELECT que exiba informa��es das categorias de produto e respectivos produtos de cada categoria.  
--    Exiba as seguintes informa��es: c�digo e nome da categoria, c�digo e descri��o do produto, valor unit�rio, tipo de embalagem e percentual do lucro de cada produto. 
--    Caso exista alguma categoria sem produto, favor exibir a categoria e deixar os dados do produto em branco. 
--    Classifique a consulta por ordem de nome de categoria e nome de produto, ambos de forma ascendente.

SELECT 
    cp.cd_categoria AS "Codigo da Categoria",
    cp.ds_categoria AS "Nome da Categoria",
    mp.cd_produto AS "Codigo do Produto",
    mp.ds_produto AS "Descricao do Produto",
    mp.vl_unitario AS "Valor Unitario",
    mp.tp_embalagem AS "Tipo da Embalagem",
    mp.vl_perc_lucro AS "Percentual de Lucro"
FROM 
    mc_categoria_prod cp
LEFT OUTER JOIN 
    mc_produto mp ON cp.cd_categoria = mp.cd_categoria
ORDER BY 
    cp.ds_categoria ASC,
    mp.ds_produto ASC;
    
-- b) Crie uma instru��o SQL que exiba os dados dos clientes pessoas f�sicas. 
--    Exiba as seguintes informa��es: c�digo e nome do cliente, e-mail, telefone, login, data de nascimento, dia da semana da data de nascimento, anos de vida, sexo biol�gico e CPF.

SELECT
    c.nr_cliente AS "C�digo do Cliente",
    c.nm_cliente AS "Nome do Cliente",
    c.ds_email AS "E-mail",
    c.nr_telefone AS "Telefone",
    c.nm_login AS "Login",
    cf.dt_nascimento AS "Data de Nascimento",
    TO_CHAR(cf.dt_nascimento, 'Day') AS "Dia da Semana",
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM cf.dt_nascimento) AS "Anos de Vida",
    cf.fl_sexo_biologico AS "Sexo Biol�gico",
    cf.nr_cpf AS "CPF"
FROM
    mc_cliente c
JOIN
    mc_cli_fisica cf ON c.nr_cliente = cf.nr_cliente;


-- c) Exiba as seguintes informa��es da tabela de visualiza��o dos v�deos dos produtos: 
--    c�digo do produto, nome do produto, data e hora de visualiza��o do produto. 
--    Exiba essas informa��es classificadas pela data e hora mais recente.

SELECT
    vv.cd_produto AS "Codigo do Produto",
    p.ds_produto AS "Nome do Produto",
    vv.dt_visualizacao,
    vv.nr_hora_visualizacao AS "Hora da Visualizacao"

FROM
    mc_sgv_visualizacao_video vv
INNER JOIN
    mc_produto p ON vv.cd_produto = p.cd_produto
ORDER BY
    vv.dt_visualizacao DESC,
    vv.nr_hora_visualizacao DESC;


SET SERVEROUTPUT ON;

DECLARE
    sac mc_sgv_sac%ROWTYPE;
    prod mc_produto%ROWTYPE;
    cli mc_cliente%ROWTYPE;
    v_vl_unit_prod NUMBER;
    v_sg_estado VARCHAR2(2);
    v_nm_estado VARCHAR2(25);
    v_vl_perc_icms_estado NUMBER;
    v_vl_icms_produto NUMBER;
    v_results VARCHAR2(4000);
    
    CURSOR cursor_sac IS 
    SELECT S.nr_sac, S.dt_abertura_sac, S.hr_abertura_sac, S.tp_sac, P.cd_produto, P.ds_produto, P.vl_unitario, P.vl_perc_lucro, C.nr_cliente, 
    C.nm_cliente, (p.vl_perc_lucro/100)*p.vl_unitario AS VL_UNITARIO_LUCRO_PRODUTO
    FROM mc_sgv_sac S LEFT JOIN mc_produto P ON (S.cd_produto = P.cd_produto) LEFT JOIN mc_cliente C ON (C.nr_cliente = S.nr_cliente)
    FOR UPDATE;
    
BEGIN
    OPEN cursor_sac;
    
    LOOP
        FETCH cursor_sac INTO sac.nr_sac, sac.dt_abertura_sac, sac.hr_abertura_sac, sac.tp_sac, prod.cd_produto, prod.ds_produto, prod.vl_unitario, prod.vl_perc_lucro,
        cli.nr_cliente, cli.nm_cliente, v_vl_unit_prod;
        
        EXIT WHEN cursor_sac%NOTFOUND;
        
        -- OBTENCAO DO ESTADO DO CLIENTE
        SELECT E.sg_estado, E.nm_estado INTO v_sg_estado, v_nm_estado FROM mc_end_cli EC INNER JOIN mc_logradouro L ON (EC.cd_logradouro_cli = L.cd_logradouro) 
        INNER JOIN mc_bairro B ON (B.cd_bairro = L.cd_bairro) INNER JOIN mc_cidade C ON (B.cd_cidade = C.cd_cidade) INNER JOIN mc_estado E ON (C.sg_estado = E.sg_estado)
        WHERE EC.nr_cliente = cli.nr_cliente;
        
        -- OBTENCAO DO ICMS DO PRODUTO
        v_vl_perc_icms_estado := fun_mc_gera_aliquota_media_icms_estado(v_sg_estado);
        v_vl_icms_produto := (v_vl_perc_icms_estado/100)*prod.vl_unitario;
        UPDATE mc_sgv_ocorrencia_sac SET vl_icms_produto = v_vl_icms_produto
        WHERE nr_ocorrencia_sac = sac.nr_sac;
             
        -- EXIBICAO DOS CAMPOS PEDIDOS
        
        v_results := 'Numero SAC: ' || sac.nr_sac || chr(10);
        v_results := v_results || 'Data de abertura: ' || sac.dt_abertura_sac || chr(10);
        v_results := v_results || 'Hora de abertura: ' || sac.hr_abertura_sac || chr(10);
        
        -- TRANDFORMACAO DO STATUS DO TIPO DE CLASSIFICAO        
        CASE sac.tp_sac
            WHEN 'S' THEN
                v_results := v_results || 'Tipo do SAC: SUGESTAO' || chr(10);
            WHEN 'D' THEN
                v_results := v_results || 'Tipo do SAC: DUVIDA' || chr(10);
            WHEN 'E' THEN
                v_results := v_results || 'Tipo do SAC: ELOGIO' || chr(10);
            ELSE
                v_results := v_results || 'Classificacao invalida' || chr(10);
        END CASE;
        
        -- CONTINUACAO DA EXIBICAO
        
        v_results := v_results || 'Codigo do produto: ' || prod.cd_produto || chr(10);
        v_results := v_results || 'Descricao do produto: ' || prod.ds_produto || chr(10);
        v_results := v_results || 'Valor unitario: ' || prod.vl_unitario || chr(10);
        v_results := v_results || 'Percentual lucro: ' || prod.vl_perc_lucro || chr(10);
        v_results := v_results || 'Numero do cliente: ' || cli.nr_cliente || chr(10);
        v_results := v_results || 'Nome do cliente: ' || cli.nm_cliente || chr(10);
        v_results := v_results || 'Valor do lucro unitario sobre o produto: ' || v_vl_unit_prod || chr(10);
        v_results := v_results || 'Estado do cliente: ' || v_nm_estado || ' ' || v_sg_estado || chr(10);
        v_results := v_results || 'Valor ICMS do produto: ' || v_vl_icms_produto;
        v_results := v_results || '____' || chr(10);
        
        DBMS_OUTPUT.PUT_LINE(v_results);
        
    END LOOP;
    
    COMMIT;
    
    CLOSE cursor_sac;
END;
/
SELECT 
    uf."sig_uf" AS "Estado",                    -- Sigla do estado
    SUM(prod."qtd_producao_mil_t") AS "Produção Total (Mil Toneladas)"
    -- Soma a quantidade total de produção em mil toneladas para cada estado
FROM 
    T_PRODUCAO prod                             -- Tabela principal com dados de produção
JOIN 
    T_UF uf ON prod."idt_uf" = uf."idt_uf"      -- Junção com T_UF para obter a sigla do estado
JOIN 
    T_PRODUTO produto ON prod."idt_produto" = produto."idt_produto"
    -- Junção com T_PRODUTO para acessar o nome do produto
JOIN 
    T_ANO_AGRICOLA ano ON prod."idt_ano_agricola" = ano."idt_ano_agricola"
    -- Junção com T_ANO_AGRICOLA para obter o ano de início e fim da safra
WHERE 
    produto."nom_produto" LIKE '%MILHO%'        -- Filtra registros que contenham "MILHO" no nome do produto
    AND ano."num_ano_inicio" = 2021             -- Ano de início da safra igual a 2021
    AND ano."num_ano_fim" = 2022                -- Ano de fim da safra igual a 2022
GROUP BY 
    uf."sig_uf"                                 -- Agrupa o resultado por estado
ORDER BY 
    "Produção Total (Mil Toneladas)" DESC;      -- Ordena do maior para o menor valor de produção

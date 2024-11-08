-- Título: Produção Total de MILHO por Estado com Soma de Todos os Estados
-- Descrição: Este script calcula a produção total de MILHO em mil toneladas para cada estado,
--            somando todos os anos disponíveis. Inclui uma linha final com a soma total de todos os estados.
-- Data: 08/11/2024
-- Hora: 17:10

-- Exibe o título do output
SELECT 'Produção Total de MILHO por Estado com Soma de Todos os Estados' AS "Título" FROM dual;

SELECT 
    uf."sig_uf" AS "Estado",                                      -- Sigla do estado para identificação
    'MILHO' AS "Cultura",                                         -- Nome da cultura para identificar o produto
    MIN(ano."num_ano_inicio") AS "Primeiro Ano",                  -- Primeiro ano da série de dados
    MAX(ano."num_ano_fim") AS "Último Ano",                       -- Último ano da série de dados
    ROUND(SUM(prod."qtd_producao_mil_t"), 0) AS "Produção (Mil Toneladas)"
    -- Soma a quantidade total de produção em mil toneladas para MILHO em cada estado e arredonda para zero casas decimais
FROM 
    T_PRODUCAO prod                                               -- Tabela principal contendo os dados de produção
JOIN 
    T_UF uf ON prod."idt_uf" = uf."idt_uf"                        -- Junção com T_UF para obter a sigla do estado
JOIN 
    T_PRODUTO produto ON prod."idt_produto" = produto."idt_produto"
    -- Junção com T_PRODUTO para acessar o nome do produto
JOIN 
    T_ANO_AGRICOLA ano ON prod."idt_ano_agricola" = ano."idt_ano_agricola"
    -- Junção com T_ANO_AGRICOLA para obter o ano de início e fim da safra
WHERE 
    produto."nom_produto" LIKE '%MILHO%'                          -- Filtra registros que contenham "MILHO" no nome do produto
GROUP BY 
    uf."sig_uf"                                                   -- Agrupa o resultado por estado

UNION ALL

SELECT 
    NULL AS "Estado",                                             -- Estado deixado vazio para o total
    'Total produção - MILHO' AS "Cultura",                        -- Identificação de que esta linha é o total de produção de MILHO
    MIN(ano."num_ano_inicio") AS "Primeiro Ano",                  -- Primeiro ano da série de dados
    MAX(ano."num_ano_fim") AS "Último Ano",                       -- Último ano da série de dados
    ROUND(SUM(prod."qtd_producao_mil_t"), 0) AS "Produção (Mil Toneladas)"
    -- Soma total da produção de MILHO em todos os estados e anos, sem decimais
FROM 
    T_PRODUCAO prod
JOIN 
    T_UF uf ON prod."idt_uf" = uf."idt_uf"
JOIN 
    T_PRODUTO produto ON prod."idt_produto" = produto."idt_produto"
JOIN 
    T_ANO_AGRICOLA ano ON prod."idt_ano_agricola" = ano."idt_ano_agricola"
WHERE 
    produto."nom_produto" LIKE '%MILHO%'                          -- Filtra registros que contenham "MILHO" no nome do produto
ORDER BY 
    "Produção (Mil Toneladas)" DESC NULLS LAST;                   -- Ordena pela produção total, com o total geral no final

-- Título: Produção Total de MILHO por Ano
-- Descrição: Este script calcula a produção total de MILHO em mil toneladas para todos os estados combinados,
--            somando os valores de produção para cada ano agrícola.
-- Data: 08/11/2024
-- Hora: 16:00

SELECT 
    ano."num_ano_inicio" AS "Ano Início",                         -- Ano de início do ano agrícola
    ano."num_ano_fim" AS "Ano Fim",                               -- Ano de fim do ano agrícola
    'MILHO' AS "Cultura",                                         -- Nome da cultura para identificar os dados
    ROUND(SUM(prod."qtd_producao_mil_t"), 2) AS "Produção Total de MILHO (Mil Toneladas)"
    -- Soma a quantidade total de produção em mil toneladas para MILHO em todos os estados e arredonda para 2 casas decimais
FROM 
    T_PRODUCAO prod                                               -- Tabela principal contendo os dados de produção
JOIN 
    T_PRODUTO produto ON prod."idt_produto" = produto."idt_produto"
    -- Junção com T_PRODUTO para obter o nome do produto
JOIN 
    T_ANO_AGRICOLA ano ON prod."idt_ano_agricola" = ano."idt_ano_agricola"
    -- Junção com T_ANO_AGRICOLA para obter o ano de início e fim da safra
WHERE 
    produto."nom_produto" LIKE '%MILHO%'                          -- Filtra registros que contenham "MILHO" no nome do produto
GROUP BY 
    ano."num_ano_inicio", ano."num_ano_fim"                       -- Agrupa por ano agrícola (início e fim)
ORDER BY 
    "Ano Início" ASC;                                             -- Ordena os resultados em ordem cronológica

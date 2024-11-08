-- Título: Evolução da Área Plantada de MILHO por Ano com Percentual de Crescimento/Perda
-- Descrição: Este script calcula a área plantada de MILHO em mil hectares para todos os estados combinados,
--            somando os valores de área plantada para cada ano agrícola. Inclui uma coluna de variação percentual
--            ano a ano e uma linha final com a soma de todos os anos. Os valores de área plantada são inteiros.
-- Data: 08/11/2024
-- Hora: 17:00

-- Exibe o título do output
SELECT 'Evolução da Área Plantada de MILHO por Ano com Percentual de Crescimento/Perda' AS "Título" FROM dual;

-- Cálculo da área plantada por ano com variação percentual e sem decimais
SELECT 
    ano."num_ano_inicio" AS "Ano Início",                                 -- Ano de início do ano agrícola
    ano."num_ano_fim" AS "Ano Fim",                                       -- Ano de fim do ano agrícola
    'MILHO' AS "Cultura",                                                 -- Nome da cultura para identificar os dados
    ROUND(SUM(prod."qtd_area_plantada_mil_ha"), 0) AS "Área Plantada (Mil Hectares)", 
    -- Soma a quantidade total de área plantada em mil hectares para MILHO em todos os estados e arredonda para zero casas decimais

    CASE 
        WHEN LAG(SUM(prod."qtd_area_plantada_mil_ha")) OVER (ORDER BY ano."num_ano_inicio") IS NULL THEN 'N/A'
        ELSE 
            CASE 
                WHEN SUM(prod."qtd_area_plantada_mil_ha") - LAG(SUM(prod."qtd_area_plantada_mil_ha")) OVER (ORDER BY ano."num_ano_inicio") > 0 
                THEN '+' || ROUND(
                    (SUM(prod."qtd_area_plantada_mil_ha") - LAG(SUM(prod."qtd_area_plantada_mil_ha")) OVER (ORDER BY ano."num_ano_inicio"))
                    / LAG(SUM(prod."qtd_area_plantada_mil_ha")) OVER (ORDER BY ano."num_ano_inicio") * 100, 2) || ' %'
                ELSE '-' || ROUND(
                    (LAG(SUM(prod."qtd_area_plantada_mil_ha")) OVER (ORDER BY ano."num_ano_inicio") - SUM(prod."qtd_area_plantada_mil_ha"))
                    / LAG(SUM(prod."qtd_area_plantada_mil_ha")) OVER (ORDER BY ano."num_ano_inicio") * 100, 2) || ' %'
            END
    END AS "Variação %"
    -- Calcula a variação percentual ano a ano com sinal "+" para crescimento e "-" para perda
FROM 
    T_PRODUCAO prod                                                       -- Tabela principal contendo os dados de produção
JOIN 
    T_PRODUTO produto ON prod."idt_produto" = produto."idt_produto"
    -- Junção com T_PRODUTO para obter o nome do produto
JOIN 
    T_ANO_AGRICOLA ano ON prod."idt_ano_agricola" = ano."idt_ano_agricola"
    -- Junção com T_ANO_AGRICOLA para obter o ano de início e fim da safra
WHERE 
    produto."nom_produto" LIKE '%MILHO%'                                  -- Filtra registros que contenham "MILHO" no nome do produto
GROUP BY 
    ano."num_ano_inicio", ano."num_ano_fim"                               -- Agrupa por ano agrícola (início e fim)

UNION ALL

-- Linha final com a soma total da área plantada de todos os anos
SELECT 
    NULL AS "Ano Início",                                                 -- Ano de início deixado vazio para o total
    NULL AS "Ano Fim",                                                    -- Ano de fim deixado vazio para o total
    'Total área plantada - MILHO' AS "Cultura",                           -- Identificação de que esta linha é o total de área plantada de MILHO
    ROUND(SUM(prod."qtd_area_plantada_mil_ha"), 0) AS "Área Plantada Total de MILHO (Mil Hectares)",
    NULL AS "Variação %"                                                  -- Sem variação percentual na linha total
    -- Soma total da área plantada de MILHO em todos os anos, sem decimais
FROM 
    T_PRODUCAO prod
JOIN 
    T_PRODUTO produto ON prod."idt_produto" = produto."idt_produto"
JOIN 
    T_ANO_AGRICOLA ano ON prod."idt_ano_agricola" = ano."idt_ano_agricola"
WHERE 
    produto."nom_produto" LIKE '%MILHO%'                                  -- Filtra registros que contenham "MILHO" no nome do produto
ORDER BY 
    "Ano Início" ASC NULLS LAST;                                          -- Ordena por ano e coloca o total no final
